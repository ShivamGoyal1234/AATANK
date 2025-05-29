local useMarkers = Config.TargetScript == 0

local nearShops = {}
local nearChangingRooms = {}
local nearJobChangingRooms = {}

local isRenderingMarkers = false
local hideAllMarkers = false

local MARKER_HELP_TYPES = {
    SHOP = 'R_CLO_OPEN',
    JOB = 'R_CLO_OPEN_JOB',
    CHANGING = 'R_CLO_OPEN_CHANGING',
}

local function openShop(shop)
    if not shop.config then
        shop.config = {}
    end

    if not shop.config.modifiers then
        shop.config.modifiers = {}
    end

    if Config.EveryShopHasEverything then
        shop.config.modifiers[SHOP_MODIFIERS.HAS_EVERYTHING] = true
    end

    if Config.IdModeHasEverything then
        shop.config.modifiers[SHOP_MODIFIERS.ID_MODE_HAS_EVERYTHING] = true
    end
 
    SetPedInShopHeading(shop.pos)
    RequestOpenClothingShopUI(shop.type, shop.config)
end

local function openJobChangingRoom(room)
    room.config = {
        structure = SHOP_CONFIG_ALIAS.CLOTHING.structure,
        modifiers = {
            [SHOP_MODIFIERS.IS_EVERYTHING_FREE] = true,
            [SHOP_MODIFIERS.JOB_CHANGING_ROOM] = true,
        }
    }

    if Config.JobChangingRoomActsAsPersonalChangingRoom then
        room.config.modifiers[SHOP_MODIFIERS.CHANGING_ROOM] = true
    end

    SetPedInShopHeading(room.pos)
    RequestOpenClothingShopUI(room.type, room.config)
end

local function getPositionGround(pos)
    local found, z = GetGroundZFor_3dCoord(pos.x, pos.y, pos.z, false)

    if found then
        return vector3(pos.x, pos.y, z + 0.05)
    else
        return pos.xyz
    end
end

local function drawShopMarker(position, playerCoords, type, onMarkerInteract)
    local realDistCoords = position + vector3(0.0, 0.0, 1.0)
    local realDist = #(realDistCoords - playerCoords)

    if realDist < Config.Checkpoint.scale.x / 2 then
        DisplayHelpTextThisFrame(type, false)

        if IsControlJustPressed(0, 38) then
            onMarkerInteract()
        end
    end

    DrawMarker(
        Config.Checkpoint.type,
        position,
        0.0, 0.0, 0.0,
        0.0, 0.0, 0.0,
        Config.Checkpoint.scale.x, Config.Checkpoint.scale.y, Config.Checkpoint.scale.z,
        Config.Checkpoint.color[1], Config.Checkpoint.color[2], Config.Checkpoint.color[3],
        Config.Checkpoint.color[4],
        false, false, false, false, nil, nil, false
    )
end

local function renderMarkers()
    if isRenderingMarkers then
        return
    end

    if not useMarkers then
        return
    end

    if #nearShops == 0 and #nearJobChangingRooms == 0 and #nearChangingRooms == 0 then
        return
    end

    isRenderingMarkers = true

    local coords = GetEntityCoords(PlayerPed)

    CreateThread(function()
        while isRenderingMarkers do
            coords = GetEntityCoords(PlayerPed)

            Wait(500)
        end
    end)

    CreateThread(function()
        while isRenderingMarkers do
            local myJob, _ = GetPlayersJobName()

            for _, k in ipairs(nearShops) do
                local shop = Config.ClothingShops[k]
                local hasJob = false

                for _, job in ipairs(shop.jobs or {}) do
                    if job == myJob then
                        hasJob = true
                        break
                    end
                end
                
                if not shop.jobs or #shop.jobs == 0 or hasJob then
                    shop.posGround = shop.posGround or getPositionGround(shop.pos)
                    Config.ClothingShops[k].posGround = shop.posGround

                    drawShopMarker(shop.posGround, coords, MARKER_HELP_TYPES.SHOP, function()
                        openShop(shop)
                    end)
                end
            end

            if #nearJobChangingRooms ~= 0 then
                for _, k in ipairs(nearJobChangingRooms) do
                    local room = Config.JobChangingRooms[k]

                    for _, job in pairs(room.jobs) do
                        if job == myJob then
                            room.posGround = room.posGround or getPositionGround(room.pos)
                            Config.JobChangingRooms[k].posGround = room.posGround

                            drawShopMarker(
                                room.posGround, coords, MARKER_HELP_TYPES.JOB, function()
                                    openJobChangingRoom(room)
                                end)
                            break
                        end
                    end
                end
            end

            for _, k in ipairs(nearChangingRooms) do
                local room = Config.ChangingRooms[k]
                room.posGround = room.posGround or getPositionGround(room.pos)
                Config.ChangingRooms[k].posGround = room.posGround

                drawShopMarker(room.posGround, coords, MARKER_HELP_TYPES.CHANGING, function()
                    SetPedInShopHeading(room.pos)
                    TriggerEvent('rcore_clothing:openChangingRoom')
                end)
            end

            Wait(0)
        end
    end)
end

function SetPedInShopHeading(coords)
    local ped = PlayerPedId()

    ClearPedTasksImmediately(ped)
    SetEntityHeading(ped, coords.w)
end

function StartRenderingMarkers()
    hideAllMarkers = false
    renderMarkers()
end

function StopRenderingMarkers()
    isRenderingMarkers = false
    hideAllMarkers = true
end

CreateThread(function()
    if not useMarkers or (#Config.ClothingShops == 0 and #Config.JobChangingRooms == 0 and #Config.ChangingRooms == 0) then
        return
    end

    AddTextEntry('R_CLO_OPEN', '~INPUT_PICKUP~ ' .. _U("interact.shop"))
    AddTextEntry('R_CLO_OPEN_JOB', '~INPUT_PICKUP~ ' .. _U("interact.job_changing_room"))
    AddTextEntry('R_CLO_OPEN_CHANGING', '~INPUT_PICKUP~ ' .. _U("interact.changing_room"))

    while true do
        nearShops = {}
        nearJobChangingRooms = {}
        nearChangingRooms = {}

        local coords = GetEntityCoords(PlayerPed)

        for k, v in pairs(Config.ClothingShops) do
            local dist = #(coords - v.pos.xyz)

            if dist < 20.0 then
                table.insert(nearShops, k)
            end
        end

        for k, v in pairs(Config.JobChangingRooms) do
            local dist = #(coords - v.pos.xyz)

            if dist < 20.0 then
                table.insert(nearJobChangingRooms, k)
            end
        end

        for k, v in pairs(Config.ChangingRooms) do
            local dist = #(coords - v.pos.xyz)

            if dist < 20.0 then
                table.insert(nearChangingRooms, k)
            end
        end

        if (#nearShops > 0 or #nearJobChangingRooms > 0 or #nearChangingRooms > 0) and not hideAllMarkers then
            renderMarkers()
        else
            isRenderingMarkers = false
        end

        Wait(5000)
    end
end)

RegisterNetEvent('rcore_clothing:target', function(data)
    if not data then
        return
    end

    if data.eventAction == "open_clothing_shop" then
        local shop = Config.ClothingShops[data.shopIndex]
        
        openShop(shop)
    elseif data.eventAction == "open_job_changing_room" then
        local room = Config.JobChangingRooms[data.shopIndex]
        openJobChangingRoom(room)
    elseif data.eventAction == "open_changing_room" then
        local room = Config.ChangingRooms[data.shopIndex]
        SetPedInShopHeading(room.pos)
        TriggerEvent('rcore_clothing:openChangingRoom')
    end
end)

CreateThread(function()
    if useMarkers then
        return
    end

    Wait(1000)

    for index, shop in ipairs(Config.ClothingShops) do
        CreateTargetZone(vec3(shop.pos.x, shop.pos.y, shop.pos.z + 1.0), 1.5, 3.0, 35.0, { {
            num = 1,
            type = "client",
            event = "rcore_clothing:target",
            icon = 'fas fa-tshirt',
            label = _U("interact.shop"),
            targeticon = 'fas fa-tshirt',
            canInteract = function(entity, distance, data)
                local myJob, _ = GetPlayersJobName()

                if not shop.jobs or #shop.jobs == 0 then
                    return true
                end

                for _, job in pairs(shop.jobs) do
                    if job == myJob then
                        return true
                    end
                end

                return false
            end,
            drawColor = { 255, 255, 255, 255 },
            successDrawColor = { 30, 144, 255, 255 },
            eventAction = "open_clothing_shop",
            color = Config.Checkpoint.color,
            shopIndex = index,
        } })
    end

    for index, room in ipairs(Config.JobChangingRooms) do
        CreateTargetZone(vec3(room.pos.x, room.pos.y, room.pos.z + 1.0), 1.5, 3.0, 35.0, { {
            num = 1,
            type = "client",
            event = "rcore_clothing:target",
            icon = 'fas fa-tshirt',
            label = _U("interact.job_changing_room"),
            targeticon = 'fas fa-tshirt',
            canInteract = function(entity, distance, data)
                local myJob, _ = GetPlayersJobName()

                for _, job in pairs(room.jobs) do
                    if job == myJob then
                        return true
                    end
                end

                return false
            end,
            drawColor = { 255, 255, 255, 255 },
            successDrawColor = { 30, 144, 255, 255 },
            eventAction = "open_job_changing_room",
            color = Config.Checkpoint.color,
            shopIndex = index,
        } })
    end

    for index, room in ipairs(Config.ChangingRooms) do
        CreateTargetZone(vec3(room.pos.x, room.pos.y, room.pos.z + 1.0), 1.5, 3.0, 35.0, { {
            num = 1,
            type = "client",
            event = "rcore_clothing:target",
            icon = 'fas fa-tshirt',
            label = _U("interact.changing_room"),
            targeticon = 'fas fa-tshirt',
            canInteract = function(entity, distance, data)
                return true
            end,
            drawColor = { 255, 255, 255, 255 },
            successDrawColor = { 30, 144, 255, 255 },
            eventAction = "open_changing_room",
            color = Config.Checkpoint.color,
            shopIndex = index,
        } })
    end
end)

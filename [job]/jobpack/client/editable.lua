-----------------------------------------------------------------------------------------
-- OUTFIT STUFF'S --
-----------------------------------------------------------------------------------------

function getComponentIdByName(name)
    if name == "t-shirt" then
        return 8
    elseif name == "torso2" or name == "torso" then
        return 11
    elseif name == "pants" then
        return 4
    elseif name == "shoes" then
        return 6
    elseif name == "arms" then
        return 3
    end
end

function clothingAction(outfit)
    if GetResourceState("17mov_CharacterSystem") == "started" then
        if outfit ~= nil then
            if Config.Framework.Framework == "esx" then
                local newOutfit = {}
                for k, v in pairs(outfit) do
                    if k == "t-shirt" then
                        newOutfit["tshirt_1"] = v.item
                        newOutfit["tshirt_2"] = v.texture
                    elseif k == "torso2" then
                        newOutfit["torso_1"] = v.item
                        newOutfit["torso_2"] = v.texture
                    elseif k == "arms" then
                        newOutfit["arms"] = v.item
                        newOutfit["arms_2"] = v.texture
                    elseif k == "pants" then
                        newOutfit["pants_1"] = v.item
                        newOutfit["pants_2"] = v.texture
                    elseif k == "shoes" then
                        newOutfit["shoes_1"] = v.item
                        newOutfit["shoes_2"] = v.texture
                    end
                end

                TriggerEvent('skinchanger:loadClothes', nil, newOutfit)
            else
                local newOutfit = { outfitData = outfit }
                TriggerEvent('qb-clothing:client:loadOutfit', newOutfit)
            end
        else
            if Config.Framework.Framework == "esx" then
                wFramework.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                    TriggerEvent('skinchanger:loadSkin', skin)
                end)
            else
                TriggerServerEvent('qb-clothes:loadPlayerSkin')
            end
        end
    elseif GetResourceState("rcore_clothing") == "started" then
        if outfit ~= nil then
            if Config.Framework.Framework == "esx" then
                local newOutfit = {
                    ["model"] = GetEntityModel(PlayerPedId()) == GetHashKey("mp_m_freemode_01") and "mp_m_freemode_01" or "mp_f_freemode_01"
                }

                for k, v in pairs(outfit) do
                    if k == "t-shirt" then
                        newOutfit["tshirt_1"] = v.item
                        newOutfit["tshirt_2"] = v.texture
                    elseif k == "torso2" then
                        newOutfit["torso_1"] = v.item
                        newOutfit["torso_2"] = v.texture
                    elseif k == "arms" then
                        newOutfit["arms"] = v.item
                        newOutfit["arms_2"] = v.texture
                    elseif k == "pants" then
                        newOutfit["pants_1"] = v.item
                        newOutfit["pants_2"] = v.texture
                    elseif k == "shoes" then
                        newOutfit["shoes_1"] = v.item
                        newOutfit["shoes_2"] = v.texture
                    end
                end

                TriggerEvent('skinchanger:loadSkin2', PlayerPedId(), newOutfit)
            else 
                local newOutfit = { outfitData = outfit }
                TriggerEvent('qb-clothing:client:loadOutfit', newOutfit)
            end
        else
            TriggerServerEvent('rcore_clothing:reloadSkin')
        end
    elseif GetResourceState("qb-clothing") == "started" then
        if outfit ~= nil then
            local newOutfit = { outfitData = outfit }
            TriggerEvent('qb-clothing:client:loadOutfit', newOutfit)
        else
            TriggerServerEvent('qb-clothes:loadPlayerSkin')
        end
    elseif GetResourceState("esx_skin") == "started" or GetResourceState('codem-appearance') == 'started' then
        if outfit ~= nil then
            TriggerEvent('skinchanger:getSkin', function(skin)
                TriggerEvent('skinchanger:loadClothes', skin, outfit)
            end)
        else
            TriggerEvent('skinchanger:getSkin', function(skin)
                TriggerEvent('skinchanger:loadSkin', skin)
            end)
        end
    elseif GetResourceState('illenium-appearance') == 'started' then
        if outfit ~= nil then
            if Config.Framework.Framework == "esx" then
                outfit.model = GetEntityModel(PlayerPedId()) == GetHashKey("mp_m_freemode_01") and "mp_m_freemode_01" or "mp_f_freemode_01"
                for k, v in pairs(outfit) do
                    if k ~= "model" then
                        v.component_id = getComponentIdByName(k)
                        v.drawable = v.item
                        v.item = nil
                    end
                end

                local newOutfit = { ["components"] = outfit }
                TriggerEvent('skinchanger:loadSkin2', PlayerPedId(), newOutfit)
            else 
                local newOutfit = { outfitData = outfit }
                TriggerEvent('qb-clothing:client:loadOutfit', newOutfit)
            end
        else
            TriggerEvent('illenium-appearance:client:reloadSkin')
        end
    elseif GetResourceState('fivem-appearance') == 'started' then
        if outfit ~= nil then
            local newOutfit = {}
            for k, v in pairs(outfit) do
                newOutfit[#newOutfit + 1] = {
                    component_id = getComponentIdByName(k),
                    drawable = v.item,
                    texture = v.texture
                }
            end

            exports["fivem-appearance"]:setPedComponents(PlayerPedId(), newOutfit)
        else
            lib.callback('wais:getAppearance', false, function(appearance)
                exports["fivem-appearance"]:setPlayerAppearance(appearance)
            end)
        end       
    elseif GetResourceState("bl_appearance") == "started" then
        if outfit ~= nil then
            for k, v in pairs(outfit) do
                exports.bl_appearance:SetPedDrawable(PlayerPedId(), {
                    index = getComponentIdByName(k),
                    value = v.item,
                    texture = v.texture
                })
            end
        else
            local skin = exports.bl_appearance:GetPlayerPedAppearance()
            exports.bl_appearance:SetPlayerPedAppearance(skin)
        end
    end

    takeJobOutfit = outfit ~= nil and true or false
    return true
end

-----------------------------------------------------------------------------------------
-- OX_LIB THING'S --
-----------------------------------------------------------------------------------------

function showCenterTextUI()
    if isDead then return end

    lib.showTextUI(Lang('open_job_menu'), {
        position = "left-center",
        icon = 'briefcase',
        style = {
            color = 'white'
        }
    })
end

function hideCenterTextUI()
    lib.hideTextUI()
end

function skillCheck(job)
    return lib.skillCheck({ 'medium',  'hard',  'medium',  'easy'}, {'w', 'a', 's', 'd'})
end

-----------------------------------------------------------------------------------------
-- GET ITEM STUFF'S --
-----------------------------------------------------------------------------------------

function DoesPlayerHaveItem(name)
    local p = promise:new()    
    PlayerData = Config.Framework.Framework == "esx" and wFramework.GetPlayerData() or (Config.Framework.Framework == "qbcore" and wFramework.Functions.GetPlayerData() or exports.qbx_core:GetPlayerData())
    local founded = false
    local qsState = GetResourceState("qs-inventory") == "started" or GetResourceState("qs-inventory") == "starting"
    local oxState = GetResourceState("ox_inventory") == "started" or GetResourceState("ox_inventory") == "starting"
    local ak47 = GetResourceState("ak47_inventory") == "started" or GetResourceState("ak47_inventory") == "starting"
    local inventory = (qsState and exports['qs-inventory']:getUserInventory() or oxState and exports["ox_inventory"]:GetPlayerItems() or ak47 and exports['ak47_inventory']:GetPlayerItems() or false) or (Config.Framework.Framework == "esx" and PlayerData.inventory or PlayerData.items)
    
    if next(inventory) == nil then
        print("The item was not found because the inventory used could not be detected.")
        p:resolve(founded)
        return Citizen.Await(p)
    end

    for k, v in pairs(inventory) do
        if v.name == name then
            founded = true
            break
        end
    end
    
    p:resolve(founded)
    return Citizen.Await(p)
end

-----------------------------------------------------------------------------------------
-- TARGET STUFF'S --
-----------------------------------------------------------------------------------------

CreateThread(function()
    if GetResourceState("ox_target"):find("start") then
        target = "ox"
    elseif GetResourceState("qb-target"):find("start") then
        target = "qb"
    end
end)

function AddTargetEntity(entity, options, localEntity, distance)
    while target == nil do Wait(0) end
    local targetRef = nil

    if target == "ox" then
        local newOptions = {}
        for i = 1, #options, 1 do
            newOptions[i] = {
                name = options[i].name,
                icon = options[i].icon,
                label = options[i].label,
                onSelect = options[i].action,
                distance = distance or 3.0
            }
        end

        targetRef = not localEntity and exports.ox_target:addEntity(entity, newOptions) or exports.ox_target:addLocalEntity(entity, newOptions)
    elseif target == "qb" then
        targetRef = exports['qb-target']:AddTargetEntity(entity, {
            options = options,
            distance = distance or 3.0,
        })
    end

    if targetRef ~= nil then
        targets[#targets + 1] = targetRef
    end
    return targetRef
end

function AddBoxZone(name, coords, size, distance, debug, options)
    while target == nil do Wait(0) end
    local targetRef = nil

    if target == "ox" then
        local newOptions = {}
        for i = 1, #options, 1 do
            newOptions[i] = {
                name = options[i].name,
                icon = options[i].icon,
                label = options[i].label,
                onSelect = options[i].action,
                distance = distance or 3.0
            }
        end

        targetRef = exports.ox_target:addBoxZone({
            name = name,
            coords = coords,
            size = vec3(size, size, size),
            debug = debug,
            options = newOptions
        })
    elseif target == "qb" then
        targetRef = exports['qb-target']:AddBoxZone(name, coords, size, size, { 
            name = name, 
            debugPoly = debug, 
            minZ = coords.z - 1.0, 
            maxZ = coords.z + 0.25, 
        }, {
            options = options,
            distance = distance,
        })
    end

    targets[#targets + 1] = targetRef
    return targetRef
end

function RemoveBoxZone(id)
    if target == "ox" then
        exports.ox_target:removeZone(id)
    elseif target == "qb" then
        exports['qb-target']:RemoveZone(id)
    end
end

-----------------------------------------------------------------------------------------
-- GET JOB'S --
-----------------------------------------------------------------------------------------

RegisterNetEvent('wais:set:sideJob', function(job)
    setSideJob(job)
end)

function getPlayerJob()
    local job = nil
    if Config.SideJob then
        job = sideJob
    else
        PlayerData = Config.Framework.Framework == "esx" and wFramework.GetPlayerData() or (Config.Framework.Framework == "qbcore" and wFramework.Functions.GetPlayerData() or exports.qbx_core:GetPlayerData())
        while PlayerData.job == nil do
            PlayerData = Config.Framework.Framework == "esx" and wFramework.GetPlayerData() or (Config.Framework.Framework == "qbcore" and wFramework.Functions.GetPlayerData() or exports.qbx_core:GetPlayerData())
            Wait(500)
        end
        job = PlayerData.job.name
    end

    while job == nil do Wait(500) end
    return job
end

function setSideJob(job)
    Config.Notification(Lang('job'), Lang('job_taked'), 'success', 5000)
    sideJob = job
    initJobs()
end

-----------------------------------------------------------------------------------------
-- SELECT JOB --
-----------------------------------------------------------------------------------------

function selectJob(job)
    -- You can put your own queries or content here. 
    -- If you want to use the level system, you can add the user level query here.

    if Config.SideJob then
        TriggerEvent('wais:set:sideJob', job)
    else
        TriggerServerEvent('wais:setJob', job)
    end

    SetNewWaypoint(Config.Jobs[job].menu.job_menu.x, Config.Jobs[job].menu.job_menu.y)
end

RegisterNetEvent('wais:jobcar:removekeys', function(vehData)
    for k, v in pairs(vehData) do
        Config.RemoveKeys(v.plate, GetDisplayNameFromVehicleModel(v.model))
    end
end)
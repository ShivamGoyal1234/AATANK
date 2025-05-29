local animPrefix = 'cellphone_'
local playerPhones = {}
local playerState = LocalPlayer.state

-- Position adjustment variables
local phoneOffsetX = 0.0
local phoneOffsetY = 0.0
local phoneOffsetZ = 0.0
local phoneRotX = 0.0
local phoneRotY = 0.0

Animation = {
    OpenPhone = function()
        if Config.BoomerPhoneAddon then
            local expExist, ysOpen = pcall(function() return exports['yboomer-phone']:IsOpen() end)
            if expExist and ysOpen then return end
        end

        PhoneModelSync()

        DoPhoneAnimation(animPrefix .. 'text_in')
    end,
    ClosePhone = function()
        CreateThread(function()
            if Config.BoomerPhoneAddon then
                local expExist, ybOpen, softOpen = pcall(function() return exports['yboomer-phone']:IsOpen() end)
                if expExist and ybOpen and not softOpen then
                    exports['yboomer-phone']:OpenPhoneAnimation()
                end
            end
        end)

        DoPhoneAnimation(animPrefix .. 'text_out')

        Animation.Reset()
    end,
    TextToCall = function()
        DoPhoneAnimation(animPrefix .. 'text_to_call')
    end,
    CallToText = function()
        DoPhoneAnimation(animPrefix .. 'call_to_text')
    end,
    PocketToCall = function()
        DoPhoneAnimation(animPrefix .. 'call_listen_base')
    end,
    CallToPocket = function()
        DoPhoneAnimation(animPrefix .. 'call_out')

        Animation.Reset()
    end,
    Selfie = function()
        DoPhoneAnimation('selfie', 'self')
    end,
    SelfieIn = function()
        DoPhoneAnimation('selfie_in', 'self')
    end,
    SelfieOut = function()
        DoPhoneAnimation('selfie_out', 'self')
    end,
    InCar = function()
        DoPhoneAnimation('cellphone_text_read_base')
    end,
    Reset = function(immediately)
        SetTimeout(immediately and 0 or 500, function()
            StopAnimTask(PlayerPedId(), PhoneData.AnimationData.lib, PhoneData.AnimationData.anim, 2.5)

            ClearPedTasks(PlayerPedId())

            DeletePhone()
        end)

        PhoneData.AnimationData.lib = nil
        PhoneData.AnimationData.anim = nil
    end,
}

exports('OpenPhoneAnimation', Animation.OpenPhone)
exports('ClosePhoneAnimation', Animation.ClosePhone)

local function checkAnimationLoop()
    CreateThread(function()
        while PhoneData.AnimationData.lib ~= nil and PhoneData.AnimationData.anim ~= nil do
            local ped = PlayerPedId()
            if not IsEntityPlayingAnim(ped, PhoneData.AnimationData.lib, PhoneData.AnimationData.anim, 3) then
                lib.playAnim(ped, PhoneData.AnimationData.lib, PhoneData.AnimationData.anim, 3.0, 3.0, -1, 50, 0, false, false, false)
            end
            Wait(1250)
        end
    end)
end

local function isEntityAPhone(model)
    return
        model == `prop_y24-black`
        or model == `prop_yflip-gold`
        or model == `prop_yflip-mint`
        or model == `prop_y24-silver`
        or model == `prop_y24-violet`
        or model == `prop_y24-yellow`
        or model == `prop_yphone-blue`
        or model == `prop_yfold-black`
        or model == `prop_yphone-black`
        or model == `prop_yphone-white`
        or model == `prop_yflip-graphite`
        or model == `prop_yflip-lavender`
        or model == `prop_yphone-natural`
        or model == `prop_yfold-black-open`
        or model == `prop_yphone-fold-black`
        or model == `prop_yphone-fold-black-open`
end

local function createPhoneProp(ped, model)
    -- First, delete any existing phone props attached to this ped
    local playerPed = ped
    for _, v in pairs(GetGamePool('CObject')) do
        if IsEntityAttachedToEntity(playerPed, v) then
            local phoneModel = GetEntityModel(v)
            if isEntityAPhone(phoneModel) then
                SetEntityAsMissionEntity(v, false, false)
                DeleteObject(v)
                DeleteEntity(v)
            end
        end
    end

    -- Now create the new phone prop
    local coords = GetEntityCoords(playerPed)
    local phone = CreateObject(model, coords.x, coords.y, coords.z, false, false, false)

    local zRot = (string.find(model, "fold") and not PhoneFolded) and 200.0 or 180.0

    AttachEntityToEntity(phone, playerPed, GetPedBoneIndex(playerPed, 28422), phoneOffsetX, phoneOffsetY, phoneOffsetZ, phoneRotX, phoneRotY, zRot, true, true, false, true, 2, true)
    SetModelAsNoLongerNeeded(model)

    return phone
end

local function deletePhoneProp(serverId)
    local playerId = GetPlayerFromServerId(serverId)
    if playerId ~= -1 then
        for _, v in pairs(GetGamePool('CObject')) do
            if IsEntityAttachedToEntity(GetPlayerPed(playerId), v) then
                local phoneModel = GetEntityModel(v)
                if isEntityAPhone(phoneModel) then
                    SetEntityAsMissionEntity(v, false, false)
                    DeleteObject(v)
                    DeleteEntity(v)
                end
            end
        end
    end
end

CreateThread(function()
    while true do
        local coords = GetEntityCoords(GetPlayerPed(-1))
        for serverId, v in pairs(playerPhones) do
            local playerId = GetPlayerFromServerId(serverId)
            if v and playerId ~= -1 then
                local distance = #(GetEntityCoords(GetPlayerPed(playerId)) - coords)
                if v.spawn and distance > 150.0 then
                    playerPhones[serverId].spawn = false
                    deletePhoneProp(serverId)
                elseif not v.spawn and distance <= 150.0 then
                    createPhoneProp(GetPlayerPed(playerId), playerPhones[serverId].value)
                    playerPhones[serverId].spawn = true
                end
            end
        end

        Wait(1500)
    end
end)

AddStateBagChangeHandler('phoneProp', '', function(bagName, key, value, reserved, replicated)
    -- if replicated then return end
    local player = GetPlayerFromStateBagName(bagName)
    if player == 0 then return end

    local ped = GetPlayerPed(player)
    local serverId = GetPlayerServerId(player)

    if not value then
        playerPhones[serverId] = nil
        return deletePhoneProp(serverId)
    end

    local phoneEntity = createPhoneProp(ped, value)
    playerPhones[serverId] = { value = value, spawn = true, entityId = phoneEntity }
end)

RegisterNetEvent('onPlayerDropped', function(serverId)
    local playerProp = playerPhones[serverId]
    if not playerProp then return end

    if playerProp.entityId and DoesEntityExist(playerProp.entityId) then
        SetEntityAsMissionEntity(playerProp.entityId, false, false)
        DeleteObject(playerProp.entityId)
        DeleteEntity(playerProp.entityId)
    else
        for _, obj in pairs(GetGamePool('CObject')) do
            local phoneModel = GetEntityModel(obj)
            if isEntityAPhone(phoneModel) and not IsEntityAttachedToAnyPed(obj) then
                SetEntityAsMissionEntity(obj, false, false)
                DeleteObject(obj)
                DeleteEntity(obj)
            end
        end
    end

    playerPhones[serverId] = nil
end)

-- Prop sync
function PhoneModelSync()
    if Config.BoomerPhoneAddon then
        local expExist, ysOpen = pcall(function() return exports['yboomer-phone']:IsOpen() end)
        if expExist and ysOpen then return end
    end

    DeletePhone()

    local hash = GetPhoneModelHash()
    if hash then
        playerState:set('phoneProp', hash, true)
    end
end

function DeletePhone()
    playerState:set('phoneProp', nil, true)
end

function DoPhoneAnimation(anim, extraDict, override)
    if Config.BoomerPhoneAddon then
        local expExist, ysOpen = pcall(function() return exports['yboomer-phone']:IsOpen() end)
        if expExist and ysOpen then return end
    end

    debugPrint('DoPhoneAnimation', anim, extraDict, override)

    local ped = PlayerPedId()
    local AnimationLib = 'cellphone@'
    local AnimationStatus = anim

    if IsPedInAnyVehicle(ped, false) then
        AnimationLib = 'anim@cellphone@in_car@ds'
    end

    if extraDict then
        if override then
            AnimationLib = extraDict
        else
            AnimationLib = AnimationLib .. extraDict
        end
    end

    lib.playAnim(ped, AnimationLib, AnimationStatus, 3.0, 3.0, -1, 50, 0, false, false, false)

    PhoneData.AnimationData.lib = AnimationLib
    PhoneData.AnimationData.anim = AnimationStatus

    checkAnimationLoop()
end

AddEventHandler("onResourceStop", function(resourceName)
    if GetCurrentResourceName() == resourceName then
        for _, v in pairs(GetGamePool('CObject')) do
            if IsEntityAttachedToAnyPed(v) then
                local phoneModel = GetEntityModel(v)
                if isEntityAPhone(phoneModel) then
                    SetEntityAsMissionEntity(v, false, false)
                    DeleteObject(v)
                    DeleteEntity(v)
                end
            end
        end
    end
end)

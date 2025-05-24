if Config.Framework:upper() ~= 'QBOX' then return end

local QBOX = exports['qbx_core']

GPT.Editable = {}

GPT.Editable.Notify = function(text, type)
    type = type or 'inform'
    lib.notify({
        title = 'GPT',
        description = text,
        type = type
    })
end

GPT.Editable.GetPlayerIdentifier = function()
    local playerData = exports['qbx_core']:GetPlayerData()
    return playerData.citizenid
end

GPT.Editable.SpawnVehicle = function(model, coords, heading, cb)
    local vehicleModel = type(model) == 'number' and model or joaat(model)
    lib.requestModel(vehicleModel)
    local vehicle = CreateVehicle(vehicleModel, coords, heading, true, true)
    local id = NetworkGetNetworkIdFromEntity(vehicle)
    SetNetworkIdCanMigrate(id, true)
    SetEntityAsMissionEntity(vehicle, true, true)
    SetVehicleHasBeenOwnedByPlayer(vehicle, true)
    SetVehicleNeedsToBeHotwired(vehicle, false)
    SetModelAsNoLongerNeeded(vehicleModel)
    SetVehRadioStation(vehicle, 'OFF')

    RequestCollisionAtCoord(coords)
    while not HasCollisionLoadedAroundEntity(vehicle) do
        Wait(0)
    end

    if cb then
        cb(vehicle)
    end
end

GPT.Editable.SetVehProperties = function(vehicle, properties)
    lib.setVehicleProperties(vehicle, properties)
end

GPT.Editable.IsPointClear = function(coords, dist)
    local vehicles = lib.getNearbyVehicles(vector3(coords.x, coords.y, coords.z), dist, false)
    return #vehicles == 0
end

GPT.Editable.FormatPlate = function(plateFormat)
    return plateFormat:format(math.random(111111, 999999)) -- example 'PD123456'
end

GPT.Editable.GetPlayerJob = function()
    local playerJob = exports['qbx_core']:GetPlayerData().job
    return {
        name = playerJob.name,
        grade = tonumber(playerJob.grade.level),
        label = playerJob.label,
    }
end

lib.addKeybind({
    name = 'Dispatch',
    description = locale('dispatch'),
    defaultKey = 'DELETE',
    onPressed = function(self)
        OpenDispatch()
    end,
})

local hasWeapon = false
lib.onCache('weapon', function(value)
    if value then
        hasWeapon = true
        Citizen.CreateThread(function()
            while hasWeapon do
                local sleep = 500
                if IsPedArmed(cache.ped, 1 | 2 | 4) then
                    sleep = 250
                    if IsPlayerFreeAiming(cache.playerId) then
                        sleep = 100
                        if IsPedShooting(cache.ped) then
                            TriggerServerEvent('piotreq_gpt:ShotAlert')
                            sleep = 2500
                        end
                    end
                end
                Wait(sleep)
            end
        end)
    else
        hasWeapon = false
    end
end)
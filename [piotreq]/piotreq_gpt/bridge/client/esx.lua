if Config.Framework:upper() ~= 'ESX' then return end

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
    return LocalPlayer.state.identifier
end

GPT.Editable.SpawnVehicle = function(model, coords, heading, cb)
    ESX.Game.SpawnVehicle(model, coords, heading, cb)
end

GPT.Editable.SetVehProperties = function(vehicle, properties)
    ESX.Game.SetVehicleProperties(vehicle, properties)
end

GPT.Editable.IsPointClear = function(coords, dist)
    return ESX.Game.IsSpawnPointClear(vector3(coords.x, coords.y, coords.z), dist or 4.0)
end

GPT.Editable.FormatPlate = function(plateFormat)
    return plateFormat:format(math.random(111111, 999999)) -- example 'PD123456'
end

GPT.Editable.GetPlayerJob = function()
    local playerJob = ESX.PlayerData.job
    return {
        name = playerJob.name,
        grade = tonumber(playerJob.grade),
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
                        if IsPedShooting(cache.ped) and not IsPedCurrentWeaponSilenced(cache.ped) then
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
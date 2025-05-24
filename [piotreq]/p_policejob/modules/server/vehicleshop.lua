while not Config.VehicleShop do Citizen.Wait(100) end
if not Config.VehicleShop.Enabled then return end

local GeneratePlate = function()
    local request = 'SELECT plate FROM owned_vehicles WHERE plate = ?'
    if Config.Framework ~= 'ESX' then
        request = 'SELECT plate FROM player_vehicles WHERE plate = ?'
    end
    local newPlate = ''
    local chars = 'ABCDEFGIHJKLMNOPRSTXWYUZ1234567890'
    repeat
        for i = 1, 8 do
            local random = math.random(1, chars:len())
            newPlate = newPlate..chars:sub(random, random)
        end
    until(not MySQL.single.await(request, {newPlate}))
    return newPlate
end

RegisterNetEvent('p_policejob/server_vehicleshop/setBucket', function(state)
    local _source = source
    SetPlayerRoutingBucket(_source, state and (_source + 1) or 0)
end)

RegisterNetEvent('p_policejob/server_vehicleshop/buyVehicle', function(data)
    local _source = source
    local xPlayer = Core.GetPlayerFromId(_source)
    local playerJob = Core.GetPlayerJob(xPlayer)
    local shopData = Config.VehicleShop.Shops[data.shopName]
    if not shopData then return end
    local allowedData = shopData.allowedJobs[playerJob.name]
    if not allowedData or not allowedData.vehicles[playerJob.grade] then return end
    local vehPrice = allowedData.vehicles[playerJob.grade][data.vehName]
    if not vehPrice then return end
    local plyMoney = Core.GetPlayerMoney(_source)
    if plyMoney < vehPrice then
        Core.ShowNotification(_source, locale('not_enough_money'), 'errors')
        return
    end

    Core.RemovePlayerMoney(_source, vehPrice)
    local newPlate = GeneratePlate()
    local mods = {
        engineHealth = 1000.0, bodyHealth = 1000.0,
        fuelLevel = 100.0, model = joaat(data.vehName),
        plate = newPlate
    }
    if Config.Framework == 'ESX' then
        if GetResourceState('piotreq_gpt') ~= 'missing' then
            local newVIN = exports['piotreq_gpt']:GenerateVIN()
            local id = MySQL.insert.await('INSERT INTO owned_vehicles (owner, plate, vehicle, stored, type, job, vin) VALUES (@owner, @plate, @vehicle, @stored, @type, @job, @vin)', {
                ['@owner'] = xPlayer.identifier,
                ['@plate'] = newPlate,
                ['@vehicle'] = json.encode(mods),
                ['@stored'] = 1,
                ['@type'] = 'car',
                ['@job'] = playerJob.name,
                ['@vin'] = newVIN
            })
            if id then
                Core.ShowNotification(_source, locale('vehicle_bought', vehPrice), 'success')
            end
        else
            local id = MySQL.insert.await('INSERT INTO owned_vehicles (owner, plate, vehicle, stored, type, job) VALUES (@owner, @plate, @vehicle, @stored, @type, @job)', {
                ['@owner'] = xPlayer.identifier,
                ['@plate'] = newPlate,
                ['@vehicle'] = json.encode(mods),
                ['@stored'] = 1,
                ['@type'] = 'car',
                ['@job'] = playerJob.name
            })
            if id then
                Core.ShowNotification(_source, locale('vehicle_bought', vehPrice), 'success')
            end
        end
    else
        if GetResourceState('piotreq_gpt') ~= 'missing' then
            local newVIN = exports['piotreq_gpt']:GenerateVIN()
            local id = MySQL.insert.await('INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, fuel, engine, body, state, job, vin) VALUES (@license, @citizenid, @vehicle, @hash, @mods, @plate, @fuel, @engine, @body, @state, @job, @vin)', {
                ['@license'] = xPlayer.PlayerData.license,
                ['@citizenid'] = xPlayer.identifier,
                ['@vehicle'] = data.vehName,
                ['@hash'] = GetHashKey(data.vehName),
                ['@mods'] = json.encode(mods),
                ['@plate'] = newPlate,
                ['@fuel'] = 100.0,
                ['@engine'] = 1000.0,
                ['@body'] = 1000.0,
                ['@state'] = 1,
                ['@job'] = playerJob.name,
                ['@vin'] = newVIN
            })
            if id then
                Core.ShowNotification(_source, locale('vehicle_bought', vehPrice), 'success')
            end
        else
            local id = MySQL.insert.await('INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, fuel, engine, body, state, job) VALUES (@license, @citizenid, @vehicle, @hash, @mods, @plate, @fuel, @engine, @body, @state, @job)', {
                ['@license'] = xPlayer.PlayerData.license,
                ['@citizenid'] = xPlayer.identifier,
                ['@vehicle'] = data.vehName,
                ['@hash'] = GetHashKey(data.vehName),
                ['@mods'] = json.encode(mods),
                ['@plate'] = newPlate,
                ['@fuel'] = 100.0,
                ['@engine'] = 1000.0,
                ['@body'] = 1000.0,
                ['@state'] = 1,
                ['@job'] = playerJob.name
            })
            if id then
                Core.ShowNotification(_source, locale('vehicle_bought', vehPrice), 'success')
            end
        end
    end
end)
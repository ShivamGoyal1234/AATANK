if Config.Framework:upper() ~= 'ESX' then return end

Core.setPlayerData = function(playerId, key, value)
    local xPlayer = ESX.GetPlayerFromId(playerId)
    xPlayer.set(key, value)
end

Core.ShowNotification = function(playerId, text, type)
    TriggerClientEvent('ox_lib:notify', playerId, {title = 'Police', description = text, type = type or 'inform'})
end

Core.GetPlayerByCitizenId = function(citizenid)
    local row = MySQL.single.await('SELECT identifier FROM users WHERE '..Config.SSN..' = ?', {citizenid})
    return row and row.identifier or nil
end

Core.GetPlayerId = function(playerId)
    local xPlayer = ESX.GetPlayerFromId(playerId)
    if not xPlayer then return nil end
    return xPlayer.identifier
end

Core.FetchPlayerBadge = function(identifier) -- FOR GPS SYSTEM
    if Config.GPS.UseCallSign then
        local xPlayer = Core.GetPlayerFromIdentifier(identifier)
        return xPlayer.get('callsign') or locale('no_data')
    else
        local row = MySQL.single.await('SELECT badge FROM users WHERE identifier = ? LIMIT 1', {identifier})
        return row and row.badge or locale('no_data')
    end
end

Core.GetPlayerFromId = function(playerId)
    return ESX.GetPlayerFromId(playerId)
end

Core.GetPlayerFromIdentifier = function(identifier)
    return ESX.GetPlayerFromIdentifier(identifier)
end

Core.PayFine = function(xPlayer, fine, reason, job)
    TriggerEvent('esx_addonaccount:getSharedAccount', 'society_'..job, function(account)
        if account then
            account.addMoney(fine)
        end
    end)
    xPlayer.removeAccountMoney('bank', fine)
end

Core.GetPlayerJob = function(xPlayer)
    local xPlayer = type(xPlayer) == 'number' and Core.GetPlayerFromId(xPlayer) or xPlayer
    if not xPlayer then return nil end
    local playerJob = xPlayer.job
    return {
        name = playerJob.name,
        grade = tonumber(playerJob.grade),
        label = playerJob.label
    }
end

Core.GetPlayerName = function(xPlayer, separate)
    local xPlayer = type(xPlayer) == 'number' and Core.GetPlayerFromId(xPlayer) or xPlayer
    if not xPlayer then return 'Unknown' end
    if separate then
        return xPlayer.get('firstName'), xPlayer.get('lastName')
    else
        return xPlayer.get('firstName')..' '..xPlayer.get('lastName')
    end
end

Core.GetPlayerBadge = function(xPlayer)
    local xPlayer = type(xPlayer) == 'number' and Core.GetPlayerFromId(xPlayer) or xPlayer
    if not xPlayer then return 'Unknown' end
    local result = MySQL.single.await('SELECT badge FROM users WHERE identifier = ?', {xPlayer.identifier})
    return result and result.badge or 'Unknown'
end

Core.GetPlayers = function()
    return ESX.GetExtendedPlayers()
end

RegisterNetEvent('esx:playerLoaded', function(player)
    TriggerEvent('p_policejob/server/playerLoaded', player)
end)

Core.GetPlayerEvidenceData = function(identifier)
    local result = MySQL.single.await('SELECT blood, blood_type, finger FROM users WHERE identifier = ? LIMIT 1', {identifier})
    return result
end

Core.UpdatePlayerBlood = function(serial, type, identifier)
    MySQL.update('UPDATE users SET blood = ?, blood_type = ? WHERE identifier = ?', {
        serial, type, identifier
    })
end

Core.UpdatePlayerFinger = function(serial, identifier)
    MySQL.update('UPDATE users SET finger = ? WHERE identifier = ?', {serial, identifier})
end

Core.GetIdentifierFromFinger = function(serial)
    local row = MySQL.single.await('SELECT identifier FROM users WHERE finger = ?', {serial})
    return row and row.identifier or nil
end

Core.GetIdentifierFromBlood = function(serial)
    local row = MySQL.single.await('SELECT identifier FROM users WHERE blood = ?', {serial})
    return row and row.identifier or nil
end

Core.GetPlayerJail = function(citizenid)
    local row = MySQL.single.await('SELECT jail FROM users WHERE identifier = ?', {citizenid})
    return row and row.jail or 0
end

Core.UpdatePlayerJail = function(jail, citizenid)
    MySQL.update('UPDATE users SET jail = ? WHERE identifier = ?', {jail, citizenid})
end

Core.UpdatePlayersJail = function(data)
    MySQL.prepare('UPDATE users SET jail = ? WHERE identifier = ?', data)
end

Core.GetPlayerGroup = function(playerId)
    local xPlayer = ESX.GetPlayerFromId(playerId)
    return xPlayer.getGroup()
end

Core.GetPlayerJobVehicles = function(identifier, jobName)
    local result = MySQL.query.await('SELECT * FROM owned_vehicles WHERE owner = ? AND job = ? AND stored = 1', {identifier, jobName})
    return result
end

lib.callback.register('p_policejob/server_garage/takeOutVehicle', function(source, vehicleData)
    local xPlayer = Core.GetPlayerFromId(source)
    local result = MySQL.single.await(
        'SELECT * FROM owned_vehicles WHERE owner = ? AND JSON_UNQUOTE(JSON_EXTRACT(vehicle, "$.model")) = ? AND JSON_UNQUOTE(JSON_EXTRACT(vehicle, "$.plate")) = ?',
    {xPlayer.identifier, vehicleData.model, vehicleData.plate})
    if not result then return false end

    MySQL.update(
        'UPDATE owned_vehicles SET stored = 0 WHERE owner = ? AND JSON_UNQUOTE(JSON_EXTRACT(vehicle, "$.model")) = ? AND JSON_UNQUOTE(JSON_EXTRACT(vehicle, "$.plate")) = ?',
    {xPlayer.identifier, vehicleData.model, vehicleData.plate})
    return json.decode(result.vehicle)
end)

RegisterNetEvent('p_policejob/server_garage/storeVehicle', function(data)
    local _source = source
    local xPlayer = Core.GetPlayerFromId(_source)
    local entity = utils.getEntityFromNetId(data.netId)
    if not entity or entity == 0 then
        return
    end

    local state = Entity(entity).state
    if state.isPoliceVehicle then
        DeleteEntity(entity)
    end
    local result = MySQL.single.await(
        'SELECT * FROM owned_vehicles WHERE owner = ? AND JSON_UNQUOTE(JSON_EXTRACT(vehicle, "$.model")) = ? AND JSON_UNQUOTE(JSON_EXTRACT(vehicle, "$.plate")) = ?',
    {xPlayer.identifier, data.model, data.plate})
    if not result then return end

    DeleteEntity(entity)
    MySQL.update(
        'UPDATE owned_vehicles SET stored = 1, vehicle = ? WHERE owner = ? AND JSON_UNQUOTE(JSON_EXTRACT(vehicle, "$.model")) = ? AND JSON_UNQUOTE(JSON_EXTRACT(vehicle, "$.plate")) = ?',
    {json.encode(data.properties), xPlayer.identifier, data.model, data.plate})
    Core.ShowNotification(_source, locale('vehicle_stored'), 'success')
end)

SetTimeout(2000, function()
    if Config.RadioList.Enabled then
        RegisterNetEvent('esx:onPlayerDeath', function()
            local _source = source
            playerRadioDeath(_source, true)
        end)
        
        RegisterNetEvent('esx:onPlayerSpawn', function()
            local _source = source
            playerRadioDeath(_source, false)
        end)
    end
end)

Core.GetPlayerMoney = function(playerId)
    local xPlayer = ESX.GetPlayerFromId(playerId)
    if not xPlayer then return 0 end
    return xPlayer.getAccount('bank').money
end

Core.RemovePlayerMoney = function(playerId, amount)
    local xPlayer = ESX.GetPlayerFromId(playerId)
    if not xPlayer then return end
    xPlayer.removeAccountMoney('bank', amount)
end
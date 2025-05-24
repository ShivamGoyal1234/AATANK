if Config.Framework:upper() ~= 'QBOX' then return end

RegisterNetEvent('p_policejob/server/toggleDuty', function(state)
    local _source = source
    local xPlayer = exports['qbx_core']:GetPlayer(_source)
    xPlayer.Functions.SetJobDuty(state)
    Core.ShowNotification(_source, state and locale('duty_on') or locale('duty_off'), 'success')
    if GetResourceState('piotreq_gpt') == 'started' then
        exports['piotreq_jobcore']:SwitchDuty(_source, {duty = state and 1 or 0})
    end
    
    local copsCount = 0
    local players = exports['qbx_core']:GetQBPlayers()
    for i = 1, #players do
        local player = players[i]
        if Config.Jobs[player.PlayerData.job.name] and player.PlayerData.job.onduty then
            copsCount = copsCount + 1
        end
    end
    TriggerEvent('police:SetCopCount', copsCount)
end)

Core.setPlayerData = function(playerId, key, value)
    local xPlayer = exports['qbx_core']:GetPlayer(playerId)
    xPlayer.Functions.SetMetaData(key, value)
end

lib.callback.register('p_policejob/server/getPlayerSkin', function(source)
    local src = source
    local Player = exports['qbx_core']:GetPlayer(src)
    local result = MySQL.query.await('SELECT * FROM playerskins WHERE citizenid = ? AND active = ?', { Player.PlayerData.citizenid, 1 })
    if result and result[1] then
        return result[1].skin
    end

    return nil
end)

Core.ShowNotification = function(playerId, text, type)
    TriggerClientEvent('ox_lib:notify', playerId, {title = 'Police', description = text, type = type or 'inform'})
end

Core.GetPlayerByCitizenId = function(citizenid)
    local row = MySQL.single.await('SELECT citizenid FROM players WHERE '..Config.SSN..' = ?', {citizenid})
    return row and row.citizenid or nil
end

Core.GetPlayerId = function(playerId)
    local xPlayer = exports['qbx_core']:GetPlayer(playerId)
    if not xPlayer then return nil end
    return xPlayer.PlayerData.citizenid
end

Core.FetchPlayerBadge = function(identifier) -- FOR GPS SYSTEM
    if Config.GPS.UseCallSign then
        local xPlayer = Core.GetPlayerFromIdentifier(identifier)
        return xPlayer.Functions.GetMetaData('callsign') or locale('no_data')
    else
        local row = MySQL.single.await('SELECT badge FROM players WHERE citizenid = ? LIMIT 1', {identifier})
        return row and row.badge or locale('no_data')
    end
end

Core.GetPlayerFromId = function(playerId)
    local xPlayer = exports['qbx_core']:GetPlayer(playerId)
    if not xPlayer then return nil end

    xPlayer.identifier = xPlayer.PlayerData.citizenid
    xPlayer.source = xPlayer.PlayerData.source
    return xPlayer
end

Core.GetPlayerFromIdentifier = function(identifier)
    local xPlayer = exports['qbx_core']:GetPlayerByCitizenId(identifier)
    if not xPlayer then return nil end
    xPlayer.source = xPlayer.PlayerData.source
    xPlayer.identifier = xPlayer.PlayerData.citizenid
    return xPlayer
end

Core.PayFine = function(xPlayer, fine, reason, job)
    if not xPlayer then return nil end
    xPlayer.Functions.RemoveMoney('bank', fine)
end

Core.GetPlayerJob = function(xPlayer)
    local xPlayer = type(xPlayer) == 'number' and Core.GetPlayerFromId(xPlayer) or xPlayer
    if not xPlayer then return nil end
    local playerJob = xPlayer.PlayerData.job
    return {
        name = playerJob.name,
        grade = tonumber(playerJob.grade.level),
        label = playerJob.label
    }
end

Core.GetPlayerName = function(xPlayer, separate)
    local xPlayer = type(xPlayer) == 'number' and Core.GetPlayerFromId(xPlayer) or xPlayer
    if not xPlayer then return nil end
    if separate then
        return xPlayer.PlayerData.charinfo.firstname, xPlayer.PlayerData.charinfo.lastname
    else
        return xPlayer.PlayerData.charinfo.firstname..' '..xPlayer.PlayerData.charinfo.lastname
    end
end

Core.GetPlayerBadge = function(xPlayer)
    local xPlayer = type(xPlayer) == 'number' and Core.GetPlayerFromId(xPlayer) or xPlayer
    if not xPlayer then return nil end
    return xPlayer.Functions.GetMetaData('callsign') or locale('no_data')
end

Core.GetPlayers = function()
    return exports['qbx_core']:GetQBPlayers()
end

RegisterNetEvent('QBCore:Server:PlayerLoaded', function(player)
    TriggerEvent('p_policejob/server/playerLoaded', player.PlayerData.source)
end)

Core.GetPlayerEvidenceData = function(identifier)
    local Player = exports['qbx_core']:GetPlayerByCitizenId(identifier)
    local result = MySQL.single.await('SELECT blood FROM players WHERE citizenid = ? LIMIT 1', {identifier})
    return {
        blood = result.blood or nil,
        blood_type = Player.PlayerData.metadata['bloodtype'] or nil,
        finger = Player.PlayerData.metadata['finger'] or nil
    }
end

Core.UpdatePlayerBlood = function(serial, type, identifier)
    MySQL.update('UPDATE players SET blood = ?, blood_type = ? WHERE citizenid = ?', {
        serial, type, identifier
    })
end

Core.UpdatePlayerFinger = function(serial, identifier)
    MySQL.update('UPDATE players SET finger = ? WHERE citizenid = ?', {serial, identifier})
end

Core.GetIdentifierFromFinger = function(serial)
    local row = MySQL.single.await('SELECT citizenid FROM players WHERE finger = ?', {serial})
    return row and row.citizenid or nil
end

Core.GetIdentifierFromBlood = function(serial)
    local row = MySQL.single.await('SELECT citizenid FROM players WHERE blood = ?', {serial})
    return row and row.citizenid or nil
end

Core.GetPlayerJail = function(citizenid)
    local row = MySQL.single.await('SELECT jail FROM players WHERE citizenid = ?', {citizenid})
    return row and row.jail or 0
end

Core.UpdatePlayerJail = function(jail, citizenid)
    MySQL.update('UPDATE players SET jail = ? WHERE citizenid = ?', {jail, citizenid})
end

Core.UpdatePlayersJail = function(data)
    MySQL.prepare('UPDATE players SET jail = ? WHERE citizenid = ?', data)
end

Core.GetPlayerGroup = function(playerId)
    return exports['qbx_core']:HasPermission(playerId, 'admin') and 'admin' or 'user'
end

lib.callback.register('p_policejob/getGroup', function(playerId)
    return Core.GetPlayerGroup(playerId)
end)

Core.GetPlayerJobVehicles = function(identifier, jobName)
    local result = MySQL.query.await('SELECT * FROM player_vehicles WHERE citizenid = ? AND job = ? AND state = 1', {identifier, jobName})
    return result
end

lib.callback.register('p_policejob/server_garage/takeOutVehicle', function(source, vehicleData)
    local xPlayer = Core.GetPlayerFromId(source)
    local result = MySQL.single.await(
        'SELECT * FROM player_vehicles WHERE citizenid = ? AND plate = ?',
    {xPlayer.identifier, vehicleData.plate})
    if not result then return false end

    if result.hash and tonumber(result.hash) ~= tonumber(joaat(vehicleData.model)) then
        return false
    end

    MySQL.update(
        'UPDATE player_vehicles SET state = 0, hash = ? WHERE citizenid = ? AND plate = ?',
    {joaat(vehicleData.model), xPlayer.identifier, vehicleData.plate})
    
    local mods = result.mods and json.decode(result.mods) or {}
    mods.plate = result.plate
    return mods
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
        'SELECT * FROM player_vehicles WHERE citizenid = ? AND hash = ? AND plate = ?',
    {xPlayer.identifier, tostring(joaat(data.model)), data.plate})
    if not result then return end

    DeleteEntity(entity)
    MySQL.update(
        'UPDATE player_vehicles SET state = 1, mods = ? WHERE citizenid = ? AND hash = ? AND plate = ?',
    {json.encode(data.properties), xPlayer.identifier, tostring(joaat(data.model)), data.plate})
    Core.ShowNotification(_source, locale('vehicle_stored'), 'success')
end)

-- RegisterNetEvent('qbx_medical:server:onPlayerDied', function()
--     local _source = source
--     playerRadioDeath(_source, true)
-- end)

SetTimeout(2000, function()
    if Config.RadioList.Enabled then
        RegisterNetEvent('hospital:server:SetDeathStatus', function(state)
            local _source = source
            playerRadioDeath(_source, state)
        end)
    end
end)

Core.GetPlayerMoney = function(playerId)
    local xPlayer = exports['qbx_core']:GetPlayer(playerId)
    if not xPlayer then return nil end
    return xPlayer.PlayerData.money['bank']
end

Core.RemovePlayerMoney = function(playerId, amount)
    local xPlayer = exports['qbx_core']:GetPlayer(playerId)
    if not xPlayer then return nil end
    xPlayer.Functions.RemoveMoney('bank', amount)
end
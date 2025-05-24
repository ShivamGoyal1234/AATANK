if Config.Framework ~= 'QB' then
    return
end

QBCore = exports['qb-core']:GetCoreObject()

Core.GetPlayers = function()
    return QBCore.Functions.GetPlayers()
end

Core.GetPlayerFromId = function(playerId)
    local Player = QBCore.Functions.GetPlayer(playerId)
    if not Player then return end
    Player.identifier = Player.PlayerData.citizenid
    Player.source = playerId
    return Player
end

Core.ShowNotification = function(playerId, text)
    TriggerClientEvent('QBCore:Notify', playerId, text)
end

Core.AddMoney = function(xPlayer, amount)
    if not xPlayer then return end
    xPlayer.Functions.AddMoney('cash', amount, 'Payout')
end

Core.RemoveSocietyMoney = function(identifier, jobName, playerPayout)
    return true
end

Core.GetPlayerJob = function(xPlayer)
    xPlayer = type(xPlayer) == 'number' and Core.GetPlayerFromId(xPlayer) or xPlayer
    if not xPlayer then return end
    return {
        name = xPlayer.PlayerData.job.name,
        grade = tonumber(xPlayer.PlayerData.job.grade.level)
    }
end

Core.GetPlayerIdentifier = function(xPlayer)
    xPlayer = type(xPlayer) == 'number' and Core.GetPlayerFromId(xPlayer) or xPlayer
    if not xPlayer then return end
    return xPlayer.PlayerData.citizenid
end

Core.GetPlayerDutyTime = function(identifier)
    local row = MySQL.single.await('SELECT dutyTime FROM players WHERE citizenid = ? LIMIT 1', {identifier})
    return row and row.dutyTime or nil
end

Core.SetPlayerDutyTime = function(identifier, time)
    MySQL.update('UPDATE players SET dutyTime = ? WHERE citizenid = ?', {time, identifier})
end

Core.SetPlayersDutyTime = function(parameters)
    MySQL.prepare('UPDATE players SET dutyTime = ? WHERE citizenid = ?', parameters)
end

Core.SavePlayerDutyTime = function(identifier, time)
    MySQL.update('UPDATE players SET dutyTime = dutyTime + @newTime WHERE citizenid = @identifier', {
        ['@newTime'] = time, ['@identifier'] = identifier
    })
end

Core.GetWorkers = function(jobName)
    local workers = MySQL.query.await('SELECT * FROM players WHERE JSON_UNQUOTE(JSON_EXTRACT(job, $.name)) = ?', {jobName})
    return workers
end

Core.GetPlayerFromIdentifier = function(identifier)
    return QBCore.Functions.GetPlayerByCitizenId(identifier)
end

Core.ResetTimer = function(identifier)
    MySQL.update('UPDATE players SET dutyTime = 0 WHERE citizenid = ?', {identifier})
    MySQL.update('UPDATE piotreq_payouts SET hours = 0 WHERE identifier = ?', {identifier})
end

Core.ResetTimers = function(data)
    if data.type == 'all' then
        MySQL.update.await('UPDATE players SET dutyTime = 0 WHERE JSON_UNQUOTE(JSON_EXTRACT(job, "$.name")) = ?', {data.job})
        MySQL.update.await('UPDATE piotreq_payouts SET hours = 0 WHERE job = ?', {data.job})
    else
        MySQL.prepare.await('UPDATE players SET dutyTime = 0 WHERE citizenid = ?', data.players)
        MySQL.prepare.await('UPDATE piotreq_payouts SET hours = 0 WHERE identifier = ?', data.players)
    end
end

RegisterNetEvent('QBCore:Server:PlayerLoaded', function(xPlayer)
    Citizen.Wait(500)
    loadPlayer(xPlayer.PlayerData.source)
end)

RegisterNetEvent('QBCore:Server:OnJobUpdate', function(playerId, job)
    playerSetJob(playerId, job)
end)

AddEventHandler('playerDropped', function()
    local _source = source
    playerDropped(_source)
end)

AddEventHandler('QBCore:Server:SetDuty', function(playerId, duty)
    local _source = playerId
    SwitchDuty(_source, {duty = duty and 1 or 0}, true)
end)

RegisterNetEvent('piotreq_jobcore:UpdateDuty', function(playerId, data)
    local Player = QBCore.Functions.GetPlayer(playerId)
    if not Player then return end

    Player.Functions.SetJobDuty(data.status == 1 and true or false)
end)
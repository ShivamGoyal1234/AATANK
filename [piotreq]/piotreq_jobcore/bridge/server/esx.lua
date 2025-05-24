if Config.Framework ~= 'ESX' then
    return
end

ESX = exports['es_extended']:getSharedObject()

Core.GetPlayers = function()
    return ESX.GetExtendedPlayers()
end

Core.GetPlayerFromId = function(playerId)
    return ESX.GetPlayerFromId(playerId)
end

Core.ShowNotification = function(playerId, text)
    TriggerClientEvent('esx:showNotification', playerId, text)
end

Core.AddMoney = function(xPlayer, amount)
    if not xPlayer then return end
    xPlayer.addAccountMoney('money', amount)
end

Core.RemoveSocietyMoney = function(playerId, identifier, jobName, playerPayout)
    local p = promise.new()
    TriggerEvent('esx_addonaccount:getSharedAccount', 'society_'..jobName, function(account)
        if account then
            if Config.Society.needMoney then
                if account.money >= playerPayout then
                    account.removeMoney(playerPayout * (Config.Society.percent / 100))
                    p:resolve(true)
                else
                    Core.ShowNotification(playerId, locale('society_dont_have_money'))
                    p:resolve(false)
                end
            end
        else
            p:resolve(false)
            Core.ShowNotification(playerId, locale('cant_fetch_society'))
            showError(('Player (%s) tried to take payout without registered society account %s'):format(identifier, jobName))
        end
    end)

    return Citizen.Await(p)
end

Core.GetPlayerJob = function(xPlayer)
    if not xPlayer then return end
    return xPlayer.job
end

Core.GetPlayerIdentifier = function(xPlayer)
    if not xPlayer then return end
    return xPlayer.identifier
end

Core.GetPlayerDutyTime = function(identifier)
    local row = MySQL.single.await('SELECT dutyTime FROM users WHERE identifier = ? LIMIT 1', {identifier})
    return row and row.dutyTime or nil
end

Core.SetPlayerDutyTime = function(identifier, time)
    MySQL.update('UPDATE users SET dutyTime = ? WHERE identifier = ?', {time, identifier})
end

Core.SetPlayersDutyTime = function(parameters)
    MySQL.prepare('UPDATE users SET dutyTime = ? WHERE identifier = ?', parameters)
end

Core.SavePlayerDutyTime = function(identifier, time)
    MySQL.update('UPDATE users SET dutyTime = dutyTime + @newTime WHERE identifier = @identifier', {
        ['@newTime'] = time, ['@identifier'] = identifier
    })
end

Core.GetWorkers = function(jobName)
    local workers = MySQL.query.await('SELECT * FROM users WHERE job = ?', {jobName})
    return workers
end

Core.GetPlayerFromIdentifier = function(identifier)
    return ESX.GetPlayerFromIdentifier(identifier)
end

Core.ResetTimer = function(identifier)
    MySQL.update('UPDATE users SET dutyTime = 0 WHERE identifier = ?', {identifier})
    MySQL.update('UPDATE piotreq_payouts SET hours = 0 WHERE identifier = ?', {identifier})
end

Core.ResetTimers = function(data)
    if data.type == 'all' then
        MySQL.update.await('UPDATE users SET dutyTime = 0 WHERE job = ?', {data.job})
        MySQL.update.await('UPDATE piotreq_payouts SET hours = 0 WHERE job = ?', {data.job})
    else
        MySQL.prepare.await('UPDATE users SET dutyTime = 0 WHERE identifier = ?', data.players)
        MySQL.prepare.await('UPDATE piotreq_payouts SET hours = 0 WHERE identifier = ?', data.players)
    end
end

RegisterNetEvent('esx:playerLoaded', function(player)
    Citizen.Wait(1000)
    loadPlayer(player)
end)

RegisterNetEvent('esx:setJob', function(playerId, job, _)
    playerSetJob(playerId, job)
    if job.onDuty ~= nil then
        Citizen.Wait(250)
        SwitchDuty(_source, {duty = job.onDuty and 1 or 0})
    end
end)

RegisterNetEvent('esx:playerDropped', function(player)
    playerDropped(player)
end)
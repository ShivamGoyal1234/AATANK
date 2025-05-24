local framework = {}
local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    PlayerData = framework:getPlayerData()
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(jobData)
    PlayerData.job = jobData
end)

CreateThread(function()
    PlayerData = framework:getPlayerData()
end)

function framework:getPlayerData()
    return QBCore.Functions.GetPlayerData()
end

function framework:getIdentifier()
    return PlayerData.citizenid
end

function framework:getJobName()
    return PlayerData?.job?.name or 'unemployed'
end

function framework:getJobGrade()
    return PlayerData?.job?.grade?.level or 0
end

function framework:getPlayers()
    return QBCore.Functions.GetPlayers()
end

return framework

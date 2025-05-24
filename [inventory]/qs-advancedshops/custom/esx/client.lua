local framework = {}
local ESX = exports['es_extended']:getSharedObject()

RegisterNetEvent('esx:playerLoaded', function(playerData)
    PlayerData = playerData
    Debug('player loaded', playerData)
end)

function framework:getPlayerData()
    return ESX.GetPlayerData()
end

CreateThread(function()
    PlayerData = framework:getPlayerData()
    Debug('init playerData')
end)

RegisterNetEvent('esx:setJob', function(jobData)
    PlayerData.job = jobData
end)

function framework:getIdentifier()
    return PlayerData?.identifier or 'none'
end

function framework:getJobName()
    return PlayerData?.job?.name or 'unemployed'
end

function framework:getJobGrade()
    return PlayerData?.job?.grade or 0
end

function framework:getPlayers()
    return ESX.Game.GetPlayers()
end

return framework

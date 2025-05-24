if Config.Framework ~= 'QB' then
    return
end

local QBCore = exports['qb-core']:GetCoreObject()
Core.ShowNotification = function(text)
    QBCore.Functions.Notify(text)
end

Core.GetPlayerJob = function()
    local job = QBCore.Functions.GetPlayerData().job
    return {name = job.name, grade = job.grade.level}
end
if Config.Framework ~= 'ESX' then
    return
end

Core.ShowNotification = function(text)
    ESX.ShowNotification(text)
end

Core.GetPlayerJob = function()
    return ESX.PlayerData.job
end
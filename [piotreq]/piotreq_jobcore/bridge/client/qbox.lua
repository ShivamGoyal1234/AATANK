if Config.Framework:upper() ~= 'QBOX' then
    return
end

Core.ShowNotification = function(text)
    lib.notify({
        title = 'Notification',
        description = text,
        type = 'inform'
    })
end

Core.GetPlayerJob = function()
    local job = exports['qbx_core']:GetPlayerData().job
    return {name = job.name, grade = job.grade.level}
end
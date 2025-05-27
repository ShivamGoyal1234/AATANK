---------------------------------
-------- Notifications  ---------
---------------------------------

function sendNotify(title, type, time)
    if Config.Misc.Notify == "ESX" then
        Framework.ShowNotification(title, type, time)
    elseif Config.Misc.Notify == "QBCORE" or Config.Misc.Notify == "QBOX" then
        Framework.Functions.Notify(title, type, time)
    elseif Config.Misc.Notify == "op_hud" then
        TriggerEvent('op-hud:showNotification', type, time, title) 
    elseif Config.Misc.Notify == "okokNotify" then
        exports['okokNotify']:Alert("", title, time, type)
    elseif Config.Misc.Notify == "vms_notify" then
        exports["vms_notify"]:Notification("Notify", title, time, "#5feb34", "")
    elseif Config.Misc.Notify == "brutal_notify" then
        exports['brutal_notify']:SendAlert('Notify', title, time, type, false)
    elseif Config.Misc.Notify == "ox_lib" then
        if type == "info" then type = "inform" end
        local data = {
            description = title,
            duration = time,
            type = type
        }
        lib.notify(data)
    end
end

RegisterNetEvent('op-uniqueNotif:sendNotify', function(title, type, time)
    sendNotify(title, type, time)
end)
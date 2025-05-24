Config.Speedcam = {}

Config.Speedcam.AllowedJobs = { -- ALLOWED JOBS TO CREATE SPEED CAMS
    ['police'] = 0,
    ['sheriff'] = 0
}

Config.Speedcam.AllowedGroups = { -- ALLOWED GROUPS TO CREATE SPEED CAMS
    ['owner'] = true,
    ['admin'] = true
}

Config.Speedcam.IgnoredJobs = { -- WHICH JOBS WILL BE IGNORED BY SPEED CAMS
    ['police'] = true,
    ['ambulance'] = true,
    ['sheriff'] = true
}

Config.Speedcam.Models = {
    ['prop_cctv_pole_03'] = 'CCTV Pole 1'
}

Config.Speedcam.Unit = 'KMH' -- KMH / MPH

Config.Speedcam.Blip = {
    sprite = 604,
    color = 0,
    scale = 0.85,
    label = locale('speed_camera')
}

Config.Speedcam.Sound = {
    enabled = true,
    volume = 0.3, -- 0.1 - 1.0
}


Config.Speedcam.ShowHelpNotify = function(title, text)
    if GetResourceState('p_helper') == 'started' then
        exports['p_helper']:showHelper({
            {
                keys = {'X'},
                label = locale('cancel')
            },
            {
                keys = {'<', '>'},
                label = locale('rotate_left_right')
            },
            {
                keys = {'E'},
                label = locale('confirm')
            },
        })
    else
        lib.showTextUI('[X] - '..locale('cancel')..' | [< >] - '..locale('rotate_left_right')..' | [E] - '..locale('confirm'))
    end
end

Config.Speedcam.HideHelpNotify = function()
    if GetResourceState('p_helper') == 'started' then
        exports['p_helper']:hideHelper()
    else
        lib.hideTextUI()
    end
end

Config.Speedcam.PayFine = function(playerId, totalFine, vehicleSpeed, speedLimit)
    local Player = Core.GetPlayerFromId(playerId)
    if Config.Framework == 'ESX' then
        Player.removeAccountMoney('bank', totalFine)
    else
        Player.Functions.RemoveMoney('bank', totalFine)
    end
    local totalSpeed = math.floor(vehicleSpeed - speedLimit)
    Core.ShowNotification(playerId, locale('you_got_speeding_fine', totalFine, totalSpeed..' '..Config.Speedcam.Unit))

    if Config.Framework == 'ESX' then
        TriggerEvent('esx_addonaccount:getSharedAccount', 'society_police', function(account)
            if account then
                account.addMoney(totalFine)
            end
        end)
    end
end
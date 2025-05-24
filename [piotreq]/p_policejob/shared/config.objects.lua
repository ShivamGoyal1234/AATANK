Config.Objects = {}

Config.Objects.Jobs = {
    ['police'] = {
        ['p_ld_stinger_s'] = locale('stinger'),
        ['prop_consign_01a'] = locale('consign'),
        ['prop_roadcone02a'] = locale('roadcone'),
        ['prop_barrier_work05'] = locale('barrier'),
        ['prop_air_conelight'] = locale('roadcone_light'),
        ['reh_prop_reh_outline_01a'] = locale('tape')
    }
}

Config.Objects.SpikeStripItem = {
    enabled = true, -- IF YOU WANT SPIKE TRIPS AS ITEM, REMOVE MODEL 'p_ld_stinger_s' FROM CONFIG ABOVE
    jobRestricted = true, -- IS ONLY ALLOWED FOR JOBS?
    allowedJobs = Config.Jobs,
    
}

Config.Objects.ShowHelpNotify = function()
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
        lib.showTextUI('[X] - Cancel | [<] [>] - Rotate | [E] - Confirm')
    end
end

Config.Objects.HideHelpNotify = function()
    if GetResourceState('p_helper') == 'started' then
        exports['p_helper']:hideHelper()
    else
        lib.hideTextUI()
    end
end

Config.Objects.NeedDuty = true -- need to be on duty to remove props?
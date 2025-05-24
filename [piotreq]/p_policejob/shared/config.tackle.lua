Config.Tackle = {}

Config.Tackle.Keys = { -- WHICH KEYS TO PRESS TO TACKLE [ALL AT THE SAME TIME]
    21, -- LEFT SHIT
    38 -- E
}

Config.Tackle.Distance = 3.0 -- distance to tackle someone

Config.Tackle.Timeout = 10000 -- 10 seconds cooldown

Config.Tackle.RestrictedJobs = { -- set to false if you dont want restrict
    ['police'] = 0
}

Config.Tackle.CanUseTackle = function()
    if cache.vehicle and cache.vehicle ~= 0 then
        return false
    end

    if exports['p_policejob']:isTackling() then
        return false
    end

    if IsPedRagdoll(cache.ped) then
        return false
    end
    
    if not IsPedSprinting(cache.ped) then
        return false
    end

    return true
end
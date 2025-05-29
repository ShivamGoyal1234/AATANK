Config.EnableEvidences = true -- true or false

Config.BloodTypes = {
    'A Rh+', 'A Rh-', 'B Rh+', 'B Rh-', '0 Rh+', '0 Rh-'
}

Config.EvidencesRemovers = {
    ['bullet'] = {
        ['towel'] = 1, -- item name and count, set Config.EvidencesRemovers = false if you dont want other players to remove
    },
    ['blood'] = {
        ['towel'] = 1, -- item name and count
    },
    ['finger'] = {
        ['towel'] = 1, -- item name and count
    },
}

Config.EvidencesExpire = {
    ['bullet'] = 60, -- time in minutes
    ['blood'] = 60, -- time in minutes
    ['finger'] = 60, -- time in minutes
    ['powder'] = 10 -- time in minutes
}

Config.Flashlights = {
    [`WEAPON_FLASHLIGHT`] = true
}

Config.WhitelistedWeapons = { -- which weapons will not leave gun powder
    [`WEAPON_STUNGUN`] = 'Stun Gun' -- label
}

Config.HasGloves = function()
    local hasGloves = false
    if Config.Framework == 'ESX' then
        TriggerEvent('skinchanger:getSkin', function(skin)
            if skin.arms >= 16 and skin.arms < 51 then
                hasGloves = true
            end
        end)
    end

    return hasGloves
end

Config.Laboratories = {
    ['MissionRow'] = {
        job = {['police'] = 0},
        coords = vector3(483.77, -987.96, 30.69),
        stashCoords = vector3(480.87, -990.89, 30.69),
        radius = 1.0,
        drawSprite = false,
        canInteract = function()
            local dutyData = Core.CheckDuty()
            return dutyData.status ~= 0
        end,
        process = 1 -- time in minutes, how long process will take
    }
}

Config.EvidenceStorages = {
    ['MissionRow'] = {
        job = {['police'] = 0},
        coords = vector3(473.07, -1007.45, 26.27),
        radius = 1.0,
        drawSprite = false,
        canInteract = function()
            local dutyData = Core.CheckDuty()
            return dutyData.status ~= 0
        end,
    }
}
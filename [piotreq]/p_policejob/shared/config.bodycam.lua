Config.Bodycam = {}

Config.Bodycam.Prop = {
    isEnabled = true, -- is prop enabled?
    ['male'] = {
        boneIndex = 24818,
        offsetCoords = vector3(0.16683, 0.11320, 0.11986),
        offsetRot = vector3(-14.5023, 82.1910, -164.2206),
    },
    ['female'] = {
        boneIndex = 24818,
        offsetCoords = vector3(0.16683, 0.11320, 0.11986),
        offsetRot = vector3(-14.50232, 82.19109, -164.22066),
    },
}

Config.Bodycam.JobRestricted = true -- if true player can only check bodycams from he's job, if false he can check bodycams from all jobs

Config.Bodycam.OnStartWatching = function()
    -- DO SOMETHING
end

Config.Bodycam.OnStopWatching = function()
    -- DO SOMETHING
end
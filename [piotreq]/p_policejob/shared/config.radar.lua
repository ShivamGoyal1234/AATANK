Config.Radar = {}

Config.Radar.KeyMapper = 'G' -- Press "G" to toggle Police Radar (SET to "" if you dont want key mapper)

Config.Radar.Unit = 'MPH' -- MPH / KMH

Config.Radar.LockKeys = {
    ['front'] = 'J',
    ['rear'] = 'M'
}

Config.Radar.RestrictedJobs = {
    ['police'] = true,
    ['sheriff'] = true
}

Config.Radar.RestrictedVehicles = {
    [`police`] = true,
    [`police2`] = true,
    [`police3`] = true,
    [`cvpi`] = true
}

Config.Radar.RestrictedDuty = true -- must be on duty to use

Config.HandRadar = {}

Config.HandRadar.RestrictedJobs = { -- which jobs can use
    ['police'] = 0,
    ['sheriff'] = 0
}

Config.HandRadar.RestrictedDuty = true -- must be on duty to use
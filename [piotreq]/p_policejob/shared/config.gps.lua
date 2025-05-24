Config.GPS = {}

Config.GPS.NeedDuty = true -- true | false (need to be on duty to turn on/off gps?)
Config.GPS.ShortRange = true -- only visible closests blips on minimap
Config.GPS.RefreshRate = 2500 -- 2.5s
Config.GPS.UseCallSign = false -- true (use job call sign setted by /callsign ?) | false

Config.GPS.Jobs = {
    ['police'] = { -- YOU CAN USE GPS FOR DIFFERENT JOBS ALSO (MECHANIC, EMS, ETC)
        color = 63,
        lights = 1,
        display = 'LSPD',
        types = {
            onFoot = {
                color = 63,
                lights = 1,
                sprite = 1,
                scale = 1.1,
                heading = true
            },
            inVeh = {
                color = 63,
                lights = 1,
                sprite = 56,
                scale = 1.1,
                heading = true
            },
            boat = {
                color = 63,
                lights = 1,
                sprite = 427,
                scale = 1.1,
                heading = true
            },
            plane = {
                color = 63,
                lights = 1,
                sprite = 43,
                scale = 1.1,
                heading = true
            },
            heli = {
                color = 63,
                lights = 1,
                sprite = 43,
                scale = 1.1,
                heading = true
            },
            bike = {
                color = 63,
                lights = 1,
                sprite = 1,
                scale = 1.1,
                heading = true
            },
        }
    },
}
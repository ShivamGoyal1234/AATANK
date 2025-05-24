--[[
    Vehicle Configuration System!
    This section enables custom configurations for vehicles in terms of ownership, 
    access to storage (trunks and gloveboxes), and weight capacities.

    Key features:
    - Allows for control over who can access vehicle trunks and gloveboxes.
    - Includes the option to disable item usage and weapon storage within vehicles.
    - Configures custom storage for specific vehicles.
    - Supports unique vehicle setups like front-mounted trunks for certain car models.
]]

Config.IsVehicleOwned = false        -- Only owned vehicles have saved trunk data if true.
Config.UseItemInVehicle = true       -- Disables item usage inside vehicles when set to false.
Config.WeaponsOnVehicle = true       -- Disables weapon storage in vehicles; setting to false can impact performance.

Config.OpenTrunkAll = true           -- Enables all players to open any vehicle trunk. Set to false to restrict trunk access to vehicle owners only.
Config.OpenTrunkPolice = true        -- Allows police to access trunks regardless of ownership restrictions (only applies if above is set to false).
Config.OpenTrunkPoliceGrade = 0      -- Minimum police grade required to access trunks (applicable only if restricted to owners).

Config.OpenGloveboxesAll = true      -- Enables all players to access any vehicle glovebox. Set to false to restrict glovebox access to owners only.
Config.OpenGloveboxesPolice = true   -- Allows police to access gloveboxes regardless of ownership restrictions (only applies if above is set to false).
Config.OpenGloveboxesPoliceGrade = 0 -- Minimum police grade required to access gloveboxes (applicable only if restricted to owners).

--[[
    Config.VehicleClass:
    Defines storage capacities for various vehicle classes.
    Each class has settings for the glovebox and trunk, including maximum weight and slot capacity.
    Classes refer to the vehicle type, as per the FiveM class list (https://docs.fivem.net/natives/?_0x29439776AAA00A62).
]]
Config.VehicleClass = {
    -- Basic example:
    -- [class_id] = { 
    --     ['glovebox'] = { maxweight = 100000, slots = 5 }, 
    --     ['trunk'] = { maxweight = 38000, slots = 30 } 
    -- },
    [0] = { ['glovebox'] = { maxweight = 100000, slots = 5 }, ['trunk'] = { maxweight = 38000, slots = 30 } },
    [1] = { ['glovebox'] = { maxweight = 100000, slots = 5 }, ['trunk'] = { maxweight = 50000, slots = 40 } },
    [2] = { ['glovebox'] = { maxweight = 100000, slots = 5 }, ['trunk'] = { maxweight = 75000, slots = 50 } },
    [3] = { ['glovebox'] = { maxweight = 100000, slots = 5 }, ['trunk'] = { maxweight = 42000, slots = 35 } },
    [4] = { ['glovebox'] = { maxweight = 100000, slots = 5 }, ['trunk'] = { maxweight = 38000, slots = 30 } },
    [5] = { ['glovebox'] = { maxweight = 100000, slots = 5 }, ['trunk'] = { maxweight = 30000, slots = 25 } },
    [6] = { ['glovebox'] = { maxweight = 100000, slots = 5 }, ['trunk'] = { maxweight = 30000, slots = 25 } },
    [7] = { ['glovebox'] = { maxweight = 100000, slots = 5 }, ['trunk'] = { maxweight = 30000, slots = 25 } },
    [8] = { ['glovebox'] = { maxweight = 100000, slots = 5 }, ['trunk'] = { maxweight = 15000, slots = 15 } },
    [9] = { ['glovebox'] = { maxweight = 100000, slots = 5 }, ['trunk'] = { maxweight = 60000, slots = 35 } },
    [10] = { ['glovebox'] = { maxweight = 100000, slots = 5 }, ['trunk'] = { maxweight = 60000, slots = 35 } },
    [11] = { ['glovebox'] = { maxweight = 100000, slots = 5 }, ['trunk'] = { maxweight = 60000, slots = 35 } },
    [12] = { ['glovebox'] = { maxweight = 100000, slots = 5 }, ['trunk'] = { maxweight = 120000, slots = 35 } },
    [13] = { ['glovebox'] = { maxweight = 100000, slots = 5 }, ['trunk'] = { maxweight = 0, slots = 0 } },
    [14] = { ['glovebox'] = { maxweight = 100000, slots = 5 }, ['trunk'] = { maxweight = 120000, slots = 50 } },
    [15] = { ['glovebox'] = { maxweight = 100000, slots = 5 }, ['trunk'] = { maxweight = 120000, slots = 50 } },
    [16] = { ['glovebox'] = { maxweight = 100000, slots = 5 }, ['trunk'] = { maxweight = 120000, slots = 50 } },
    [17] = { ['glovebox'] = { maxweight = 100000, slots = 5 }, ['trunk'] = { maxweight = 120000, slots = 50 } },
    [18] = { ['glovebox'] = { maxweight = 100000, slots = 5 }, ['trunk'] = { maxweight = 120000, slots = 50 } },
    [19] = { ['glovebox'] = { maxweight = 100000, slots = 5 }, ['trunk'] = { maxweight = 120000, slots = 50 } },
    [20] = { ['glovebox'] = { maxweight = 100000, slots = 5 }, ['trunk'] = { maxweight = 120000, slots = 50 } }
}

-- Custom trunk storage settings for specific vehicles by model.
-- Defines storage capacities for particular vehicles regardless of class.
Config.CustomTrunk = {
    [joaat('adder')] = { slots = 5, maxweight = 100000 },
}

-- Custom glovebox storage settings for specific vehicles by model.
-- Defines glovebox capacities for particular vehicles regardless of class.
Config.CustomGlovebox = {
    [joaat('adder')] = { slots = 5, maxweight = 100000 },
}

--[[
    Config.BackEngineVehicles:
    For vehicles with rear-engine setups, enabling the trunk at the front of the vehicle.
    These models require the trunk to be accessed from the front.
]]
Config.BackEngineVehicles = {
    [`ninef`] = true,
    [`adder`] = true,
    [`vagner`] = true,
    [`t20`] = true,
    [`infernus`] = true,
    [`zentorno`] = true,
    [`reaper`] = true,
    [`comet2`] = true,
    [`comet3`] = true,
    [`jester`] = true,
    [`jester2`] = true,
    [`cheetah`] = true,
    [`cheetah2`] = true,
    [`prototipo`] = true,
    [`turismor`] = true,
    [`pfister811`] = true,
    [`ardent`] = true,
    [`nero`] = true,
    [`nero2`] = true,
    [`tempesta`] = true,
    [`vacca`] = true,
    [`bullet`] = true,
    [`osiris`] = true,
    [`entityxf`] = true,
    [`turismo2`] = true,
    [`fmj`] = true,
    [`re7b`] = true,
    [`tyrus`] = true,
    [`italigtb`] = true,
    [`penetrator`] = true,
    [`monroe`] = true,
    [`ninef2`] = true,
    [`stingergt`] = true,
    [`surfer`] = true,
    [`surfer2`] = true,
    [`gp1`] = true,
    [`autarch`] = true,
    [`tyrant`] = true,
    -- Additional vehicle models with front-access trunks...
}

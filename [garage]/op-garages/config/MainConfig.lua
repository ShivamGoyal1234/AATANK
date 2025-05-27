Config = {}
Config.Locale = "en" -- Supported: EN, EL, FR, HR, IT, SK, SL, CZ, SV, PT, TW, ES, AR
Config.SteamApiKey = "" -- For Administrator avatars.
Config.WebHook = "" -- Discord WebHook for admin commands logs.

-- Translations in progress: PL / DE / BG / TR / LT / HU

-- IF YOU WANT DO USE OUR DEFAULT GARAGES AND IMPOUND LOCATIONS USE COMMAND USING SERVER CONSOLE
-- /insertDefaultLocations
-- Then restart the server.

Config.FuelDependency = "cdn-fuel" -- Options: none, cdn-fuel, ox-fuel, LegacyFuel, qs-fuel, rcore-fuel, codem-xfuel, lc_fuel
Config.KeysDependency = "qb-vehiclekeys" -- Options: none, brutal_keys, qs-keys, qb-keys, qbx_vehiclekeys, wasabi_carlock, sna-vehiclekeys, dusa_vehiclekeys, Renewed-Vehiclekeys, tgiann-keys, ak47_vehiclekeys, ak47_qb_vehiclekeys, MrNewbVehicleKeys, p_carkeys
Config.TextUI = "ox_lib" -- Options: none, ox_lib, jg-textui, qs-textui, okokTextUI, brutal_textui, 0r-textui

----------------------------------------------------------------------------
-- ⚒️ MISC CONFIGURATION ⚒️
----------------------------------------------------------------------------

Config.Misc = {
    Notify = "QBCORE", -- Supported: op_hud / okokNotify / vms_notify / brutal_notify / ox_lib / ESX / QBCORE / QBOX
    Target = "qb-target",  -- none / ox-target / qb-target
    zoneSize = 1.2, -- Marker radius.
    zoneColor = { -- Marker color.
        r = 52,
        g = 116,
        b = 235,
    },
    Icons = { -- OX Target / QB Target icons.
        car = "fa-solid fa-square-parking",
        sea = "fa-solid fa-sailboat",
        air = "fa-solid fa-plane",
        impound = "fa-solid fa-money-bill-wave",
        showroom = "fa-solid fa-building"
    }, 
    TowingPrice = 2000, -- Price of towing left or destroyed vehicle.
    TowingTime = 5, -- Towing destroyed/left vehicle Time.
    TransferPrice = 7500, -- Transfer Vehicle from garage to garage price.
    Peds = {
        -- You can also disable only selected ped. E.X (sea = false)
        Toggle = true, -- Disable/Enable peds.
        sea = {
            model = "player_one",
            gender = "male"
        },
        air = {
            model = "ig_floyd",
            gender = "male"
        },
        impound = {
            model = "ig_trafficwarden",
            gender = "male"
        }
    },
    DisableVehicleHideAnimation = true, -- Disable take out vehicle animation (Player will be teleported inside vehicle instead of animation)
    DisableVehicleSpawnInGarage = false, -- Disable spawning showcase vehicle when open garage
} 

----------------------------------------------------------------------------
-- ⚒️ SUB OWNERS ⚒️
----------------------------------------------------------------------------

Config.SubOwners = {
    Allow = true, -- Disable/Enable sub owners feature.
    Command = "subowner", -- Command Name
    Price = 5000, -- Price of adding subowner
    -- You can add your custom pay method using server/editable/payForSubOwner.lua
    -- You can also set open menu function only for donators or whatever you want using: client/editable/restrictSubOwners.lua
}

----------------------------------------------------------------------------
-- ⚒️ ADMINISTRATORS ⚒️
----------------------------------------------------------------------------

Config.AdminMenu = {
    Command = "garageadmin", -- Command Name
    EnableCommands = true, -- Disable/Enable commands: (/delveh, /addcar)
    PlateChangerCommand = "changeplate", -- Plate changer command.
    DeleteVehicle = "delveh", -- Permamently Delete car from database.
    AddCarCommand = "addcar" -- Add car to database.
}

----------------------------------------------------------------------------
-- ⚒️ Impound Menu Config ⚒️
----------------------------------------------------------------------------

Config.IV = {
    -- Impound menu options.
    -- Jobs that are allowed to use impound menu
    -- Each job will be able to tow vehicles only for configurated impound locations in garage admin!
    -- You can setup impound locations for selected jobs in garage admin.
    jobsList = {
        ['police'] = 2, -- Job name & grade.
    },
    commandName = "impoundmenu", -- Command Name
    allowPriceBeforeImpoundDate = true, -- Allows setting the vehicle release price *before* the impound date. (The player who impounded the vehicle can also set it to 0 to disable the fee.)
    allowPriceAfterImpoundDate = true,  -- Allows setting the vehicle release price *after* the impound date. (The player who impounded the vehicle can also set it to 0 to disable the fee.)
    maxPriceAfterImpoundDate = 6500,    -- Maximum fee for releasing a vehicle after the impound date.
    maxPriceBeforeImpoundDate = 14500,  -- Maximum fee for releasing a vehicle before the impound date.
    timeOptions = {
        -- Time options to select in Impound Menu
        -- Value = hours, or never
        {label = "Available Instantly", value = "0"},
        {label = "1 Day", value = "24"},
        {label = "3 Days", value = "72"},
        {label = "7 Days", value = "168"},
        {label = "Only By fraction member.", value = "never"},
    }
}

----------------------------------------------------------------------------
-- ⚒️ Currency Settings ⚒️
----------------------------------------------------------------------------

Config.CurrencySettings = {
    -- https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/NumberFormat
    currency = "USD",
    style = "currency",
    format = "en-US"
}

----------------------------------------------------------------------------
-- ⚒️ Blips Settings ⚒️
----------------------------------------------------------------------------

Config.Blips = {
    size = 0.8,
    car = {
        blipId = 357, 
        blipColor = 3
    },
    sea = {
        blipId = 356, 
        blipColor = 3
    },
    air = {
        blipId = 569, 
        blipColor = 3
    },
    impound = {
        blipId = 67, 
        blipColor = 1
    }
}

----------------------------------------------------------------------------
-- ⚒️ Showrooms locations ⚒️
----------------------------------------------------------------------------

Config.Showrooms = {
    Config = {
        Enable = true,
        AllowOnlyInPrivateGarages = false,
    },
    car = {
        EntranceCoords = vec4(1295.2756, 261.7921, -50.0573, 174.5392),
        ParkingSlots = {
            {
                Coords = vec4(1281.2789, 240.9465, -49.4692, 243.5022),
            },
            {
                Coords = vec4(1281.3644, 250.2220, -49.4689, 242.7067),
            },
            {
                Coords = vec4(1280.8601, 258.3342, -49.4696, 239.6884),
            },
            {
                Coords = vec4(1295.1112, 249.0047, -49.4691, 177.1261),
            },
            {
                Coords = vec4(1295.1277, 241.2695, -49.4692, 180.6348),
            },
            {
                Coords = vec4(1295.1410, 231.9178, -49.4692, 178.8318),
            },
            {
                Coords = vec4(1309.6279, 230.9311, -49.4691, 52.8349),
            },
            {
                Coords = vec4(1309.7224, 241.4225, -49.4700, 54.4629),
            },
            {
                Coords = vec4(1309.9415, 249.3070, -49.4696, 62.1490),
            },
            {
                Coords = vec4(1309.5300, 258.2726, -49.4688, 63.7715),
            },
        }
    },
    air = {
        EntranceCoords = vec4(-1264.9331, -3044.3931, -49.4903, 4.1420),
        ParkingSlots = {
            {
                Coords = vec4(-1276.7047, -2973.7190, -48.4897, 195.8378)
            },
            {
                Coords = vec4(-1259.4069, -2973.9412, -48.4897, 145.3174)
            },
            {
                Coords = vec4(-1256.5042, -2994.2913, -48.4899, 148.5025)
            },
            {
                Coords = vec4(-1275.6095, -2997.0205, -48.4898, 199.9497)
            },
            {
                Coords = vec4(-1280.2980, -3018.5117, -48.4901, 238.2952)
            },
            {
                Coords = vec4(-1258.7426, -3021.3916, -48.4903, 138.1917)
            },
        }
    },

    -- You can add here sea type if you want as well!
}
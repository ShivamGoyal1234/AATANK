--[[
    Welcome to the **Advanced Shops Configuration**!

    This configuration file includes the essential parameters to personalize and fine-tune your **advancedshops** system. Before making any modifications, we strongly recommend reviewing the corresponding sections of the documentation linked below. It provides step-by-step guidance and detailed explanations for every configurable feature.

    The settings provided here are built for adaptability. You are encouraged to tailor them to match your server’s framework and economy, ensuring a smooth and immersive shopping experience for your players.

    Most editable configurations can be found in the **client/custom/** and **server/custom/** directories, allowing for a clean and organized setup process.

    🛒 **Direct Documentation Link:**
    For full details and usage instructions, visit the official documentation here: https://docs.quasar-store.com/
]]

Config = Config or {}
Locales = Locales or {}

--[[
    Choose your preferred language!

    In this section, you can select the main language for your asset. We have a wide
    selection of default languages available, located in the locales/* folder.

    If your language is not listed, don't worry! You can easily create a new one
    by adding a new file in the locales folder and customizing it to your needs.

    🌐 Default languages available:
        'ar'     -- Arabic
        'bg'     -- Bulgarian
        'ca'     -- Catalan
        'cs'     -- Czech
        'da'     -- Danish
        'de'     -- German
        'el'     -- Greek
        'en'     -- English
        'es'     -- Spanish
        'fa'     -- Persian
        'fr'     -- French
        'hi'     -- Hindi
        'hu'     -- Hungarian
        'it'     -- Italian
        'ja'     -- Japanese
        'ko'     -- Korean
        'nl'     -- Dutch
        'no'     -- Norwegian
        'pl'     -- Polish
        'pt'     -- Portuguese
        'ro'     -- Romanian
        'ru'     -- Russian
        'sl'     -- Slovenian
        'sv'     -- Swedish
        'th'     -- Thai
        'tr'     -- Turkish
        'zh-CN'  -- Chinese (Simplified)
        'zh-TW'  -- Chinese (Traditional)

    After selecting your preferred language, be sure to save your changes and test
    the asset to ensure everything works as expected!
]]

Config.Language = 'en'

Config.UseTarget = false                                    -- Set to true to enable targeting with either 'qb-target' or 'ox_target', or false to disable entirely.
Config.InventoryFolder = 'nui://qs-inventory/html/images/' -- Images will be taken from the inventory.

--[[
    Framework Detection and Configuration Guide for Advanced Shops

    The advancedshops system is designed to automatically detect whether your server uses `qb-core`, `es_extended`, or `qbx_core`
    as its main framework, assigning it to `Config.Framework` accordingly. However, if you have renamed
    these resources or are using a customized framework setup, manual configuration may be required.

    To configure manually:
        1. Clear the automatic detection logic by removing the current value assigned to `Config.Framework`.
        2. Set it manually to the name of your custom or modified framework.
        3. Adjust any framework-dependent logic inside the script's client and server files accordingly.

    Warning:
    ⚠️ The automatic detection is optimized for standard framework setups. Avoid modifying this section
    unless you fully understand your framework structure, as incorrect edits can cause critical issues.

    Make sure your base framework (`qb-core`, `es_extended`, `qbx_core`, or equivalent) is properly started
    before advancedshops, to ensure correct integration and functionality.
]]

local frameworks = {
    ['es_extended'] = 'esx',
    ['qb-core'] = 'qb',
}

Config.Framework = DependencyCheck(frameworks) or 'none'

--[[
    Shop Configuration Overview

    This section defines all shop locations and their respective settings. Each shop can have:
    - A unique name and label.
    - Blip configuration for the map.
    - Job and grade restrictions (optional).
    - Multiple item categories, each with its own list of products, prices, and descriptions.
    - Ped model and animation for visual immersion.
    - Multiple physical coordinates to spawn shop NPCs.

    💡 You can create general stores, hardware shops, weapon shops, or even job-restricted shops like police armories. Simply customize the `categories` and `items` per location.

    Tip: For job-restricted shops, use `jobName` or the `jobs` and `grades` options to control access.
]]


Config.Shops = {
    {
        name = 'Market',
        label = '[E] - 24/7 Market',
        blip = true,
        blipSprite = 52,
        blipColor = 2,
        blipScale = 0.6,
        -- requiredLicense = 'police_license',
        -- jobs = { 'police' },
        -- grades = { 2, 3, 4 },
        categories = {
            [1] = {
                name = 'General',
                description = 'Everyday Essentials',
                icon = 'fa-solid fa-wallet',
                items = {
                    { name = 'water_bottle',  label = 'Water',         perPrice = 150, description = 'Refreshment' },
                    { name = 'sandwich',      label = 'Sandwich',      perPrice = 150, description = 'Quick Meal' },
                    -- { name = 'snikkel_candy', label = 'Snikkel Candy', perPrice = 150, description = 'Sweet Snack' },
                    -- { name = 'tosti',         label = 'Tosti',         perPrice = 150, description = 'Toasted Snack' },
                    -- { name = 'whiskey',       label = 'Whiskey',       perPrice = 150, description = 'Alcohol' },
                    -- { name = 'lighter',       label = 'Lighter',       perPrice = 200, description = 'For Lighting' },
                    -- { name = 'beer',          label = 'Beer',          perPrice = 150, description = 'Alcohol' },
                    { name = 'cola',          label = 'Cola',          perPrice = 150, description = 'Soft Drink' },
                    -- { name = 'twerks_candy',  label = 'Twerks Candy',  perPrice = 150, description = 'Sweet Snack' }
                }

            },
            -- [2] = {
            --     name = 'Medical',
            --     description = 'Health Supplies',
            --     icon = 'fa-solid fa-notes-medical',
            --     items = {
            --         { name = 'bandage', label = 'Bandage', perPrice = 100, description = 'First Aid' }
            --     }
            -- },
            -- [3] = {
            --     name = 'Alcohol',
            --     description = 'Alcoholic Beverages',
            --     icon = 'fa-solid fa-wine-bottle',
            --     items = {
            --         { name = 'vodka',   label = 'Vodka',   perPrice = 150, description = 'Spirits' },
            --         { name = 'whiskey', label = 'Whiskey', perPrice = 150, description = 'Spirits' },
            --         { name = 'beer',    label = 'Beer',    perPrice = 150, description = 'Beer' }
            --     }
            -- },
            [2] = {
                name = 'Snacks',
                description = 'Snacks & Sweets',
                icon = 'fa-solid fa-cookie-bite',
                items = {
                    { name = 'tosti',         label = 'Tosti',         perPrice = 150, description = 'Toasted Snack' },
                    { name = 'snikkel_candy', label = 'Snikkel Candy', perPrice = 150, description = 'Sweet Snack' },
                    { name = 'twerks_candy',  label = 'Twerks Candy',  perPrice = 150, description = 'Sweet Snack' }
                }
            }

        },
        pedHash = 'mp_m_shopkeep_01',
        scenario = 'WORLD_HUMAN_STAND_MOBILE',
        coords = {
            { ped = nil, coords = vector4(24.47, -1346.62, 29.5, 271.66) },
            { ped = nil, coords = vector4(-3039.54, 584.38, 7.91, 17.27) },
            { ped = nil, coords = vector4(-3242.97, 1000.01, 12.83, 357.57) },
            { ped = nil, coords = vector4(1728.07, 6415.63, 35.04, 242.95) },
            { ped = nil, coords = vector4(1959.82, 3740.48, 32.34, 301.57) },
            { ped = nil, coords = vector4(549.13, 2670.85, 42.16, 99.39) },
            { ped = nil, coords = vector4(2677.47, 3279.76, 55.24, 335.08) },
            { ped = nil, coords = vector4(2556.66, 380.84, 108.62, 356.67) },
            { ped = nil, coords = vector4(372.66, 326.98, 103.57, 253.73) }
        }
    },
    {
        name = 'Market',
        label = '[E] - LTD Gasoline',
        blip = true,
        blipSprite = 52,
        blipColor = 2,
        blipScale = 0.6,
        -- requiredLicense = 'police_license',
        -- jobs = { 'police' },
        -- grades = { 2, 3, 4 },
        categories = {
            [1] = {
                name = 'General',
                description = 'Everyday Essentials',
                icon = 'fa-solid fa-wallet',
                items = {
                    { name = 'water_bottle',  label = 'Water',         perPrice = 150, description = 'Refreshment' },
                    { name = 'sandwich',      label = 'Sandwich',      perPrice = 150, description = 'Quick Meal' },
                    -- { name = 'snikkel_candy', label = 'Snikkel Candy', perPrice = 150, description = 'Sweet Snack' },
                    -- { name = 'tosti',         label = 'Tosti',         perPrice = 150, description = 'Toasted Snack' },
                    -- { name = 'whiskey',       label = 'Whiskey',       perPrice = 150, description = 'Alcohol' },
                    -- { name = 'lighter',       label = 'Lighter',       perPrice = 200, description = 'For Lighting' },
                    -- { name = 'beer',          label = 'Beer',          perPrice = 150, description = 'Alcohol' },
                    { name = 'cola',          label = 'Cola',          perPrice = 150, description = 'Soft Drink' },
                    -- { name = 'twerks_candy',  label = 'Twerks Candy',  perPrice = 150, description = 'Sweet Snack' }
                }
            },
            [2] = {
                name = 'Snacks',
                description = 'Snacks & Sweets',
                icon = 'fa-solid fa-cookie-bite',
                items = {
                    { name = 'tosti',         label = 'Tosti',         perPrice = 150, description = 'Toasted Snack' },
                    { name = 'snikkel_candy', label = 'Snikkel Candy', perPrice = 150, description = 'Sweet Snack' },
                    { name = 'twerks_candy',  label = 'Twerks Candy',  perPrice = 150, description = 'Sweet Snack' }
                }
            }
            -- [3] = {
            --     name = 'Alcohol',
            --     description = 'Alcoholic Beverages',
            --     icon = 'fa-solid fa-wine-bottle',
            --     items = {
            --         { name = 'vodka',   label = 'Vodka',   perPrice = 150, description = 'Spirits' },
            --         { name = 'whiskey', label = 'Whiskey', perPrice = 150, description = 'Spirits' },
            --         { name = 'beer',    label = 'Beer',    perPrice = 150, description = 'Beer' }
            --     }
            -- },
            -- [4] = {
            --     name = 'Snacks',
            --     description = 'Snacks & Sweets',
            --     icon = 'fa-solid fa-cookie-bite',
            --     items = {
            --         { name = 'tosti',         label = 'Tosti',         perPrice = 150, description = 'Toasted Snack' },
            --         { name = 'snikkel_candy', label = 'Snikkel Candy', perPrice = 150, description = 'Sweet Snack' },
            --         { name = 'twerks_candy',  label = 'Twerks Candy',  perPrice = 150, description = 'Sweet Snack' }
            --     }
            -- }
        },
        pedHash = 'mp_m_shopkeep_01',
        scenario = 'WORLD_HUMAN_STAND_MOBILE',
        coords = {
            { ped = nil, coords = vector4(-47.02, -1758.23, 29.42, 45.05) },
            { ped = nil, coords = vector4(-706.06, -913.97, 19.22, 88.04) },
            { ped = nil, coords = vector4(-1820.02, 794.03, 138.09, 135.45) },
            { ped = nil, coords = vector4(1164.71, -322.94, 69.21, 101.72) },
            { ped = nil, coords = vector4(1697.87, 4922.96, 42.06, 324.71) }
        }
    },
    {
        name = 'Market',
        label = "[E] - Rob's Liqour",
        blip = true,
        blipSprite = 52,
        blipColor = 2,
        blipScale = 0.7,
        -- requiredLicense = 'police_license',
        -- jobs = { 'police' },
        -- grades = { 2, 3, 4 },
        categories = {
            [1] = {
                name = 'Liquor Store',
                description = '24/7',
                icon = 'fa-solid fa-wine-bottle',
                items = {
                    { name = 'water_bottle',  label = 'Water',         perPrice = 150, description = 'Drinks' },
                    -- { name = 'sandwich',      label = 'Sandwich',      perPrice = 150, description = 'Food' },
                    -- { name = 'snikkel_candy', label = 'Snikkel Candy', perPrice = 150, description = 'General' },
                    -- { name = 'tosti',         label = 'Tosti',         perPrice = 150, description = 'General' },
                    { name = 'beer',          label = 'Beer',          perPrice = 150, description = 'Alcohol' },
                    { name = 'cola',          label = 'Cola',          perPrice = 150, description = 'Drinks' },
                    -- { name = 'twerks_candy',  label = 'Twerks Candy',  perPrice = 150, description = 'Candy' },
                    { name = 'whiskey',       label = 'Whiskey',       perPrice = 150, description = 'Alcohol' }
                }
            },
            -- [2] = {  --- optional
            --     name = 'Chakna',
            --     description = 'Snacks & Sweets',
            --     icon = 'fa-solid fa-cookie-bite',
            --     items = {
            --         { name = 'tosti',         label = 'Tosti',         perPrice = 150, description = 'Snacks' },
            --         { name = 'snikkel_candy', label = 'Snikkel Candy', perPrice = 150, description = 'Candy' },
            --         { name = 'twerks_candy',  label = 'Twerks Candy',  perPrice = 150, description = 'Candy' }
            --     }
            -- }
        },
        pedHash = 'mp_m_shopkeep_01',
        scenario = 'WORLD_HUMAN_STAND_MOBILE',
        coords = {
            { ped = nil, coords = vector4(-1221.58, -908.15, 12.33, 35.49) },
            { ped = nil, coords = vector4(-1486.59, -377.68, 40.16, 139.51) },
            { ped = nil, coords = vector4(-2966.39, 391.42, 15.04, 87.48) },
            { ped = nil, coords = vector4(1165.17, 2710.88, 38.16, 179.43) },
            { ped = nil, coords = vector4(1134.2, -982.91, 46.42, 277.24) }
        }
    },
    {
        name = 'Hardware',
        label = '[E] - Hardware and Tools',
        blip = true,
        blipSprite = 402,
        blipColor = 3,
        blipScale = 0.8,
        -- requiredLicense = 'police_license',
        -- jobs = { 'police' },
        -- grades = { 2, 3, 4 },
        categories = {
            [1] = {
                name = 'General',
                description = 'Hardware Tools',
                icon = 'fa-solid fa-wallet',
                items = {
                    -- { name = 'lockpick',       label = 'Lockpick',        perPrice = 2000, description = 'Tools' },
                    { name = 'weapon_wrench',  label = 'Wrench',          perPrice = 250, description = 'Tools' },
                    { name = 'weapon_hammer',  label = 'Hammer',          perPrice = 250, description = 'Tools' },
                    { name = 'screwdriverset', label = 'Screwdriver Set', perPrice = 350, description = 'Tools' },
                    { name = 'cleaningkit',    label = 'Cleaning Kit',    perPrice = 150, description = 'Tools' },

                }
            },
            -- [2] = {
            --     name = 'Electronics',
            --     description = 'Electronic Devices',
            --     icon = 'fa-solid fa-bolt',
            --     items = {
            --         { name = 'phone',      label = 'Phone',      perPrice = 850, description = 'Electronics' },
            --         { name = 'radio',      label = 'Radio',      perPrice = 250, description = 'Electronics' },
            --         { name = 'binoculars', label = 'Binoculars', perPrice = 50,  description = 'Electronics' },
            --         { name = 'fitbit',     label = 'Fitbit',     perPrice = 400, description = 'Electronics' }
            --     }
            -- },
            [3] = {
                name = 'Fireworks',
                description = 'Fireworks for Fun',
                icon = 'fa-solid fa-fire',
                items = {
                    { name = 'firework1', label = 'Firework 1', perPrice = 50, description = 'Fun' },
                    { name = 'firework2', label = 'Firework 2', perPrice = 50, description = 'Fun' },
                    { name = 'firework3', label = 'Firework 3', perPrice = 50, description = 'Fun' },
                    { name = 'firework4', label = 'Firework 4', perPrice = 50, description = 'Fun' }
                }
            },
            [4] = {
                name = 'Repair Kits',
                description = 'Repair and Maintenance',
                icon = 'fa-solid fa-toolbox',
                items = {
                    { name = 'repairkit', label = 'Repair Kit', perPrice = 5000, description = 'Maintenance' }
                }
            }
        },
        pedHash = 'mp_m_waremech_01',
        scenario = 'WORLD_HUMAN_CLIPBOARD',
        coords = {
            { ped = nil, coords = vector4(45.68, -1749.04, 29.61, 53.13) },
            { ped = nil, coords = vector4(2747.71, 3472.85, 55.67, 255.08) },
            { ped = nil, coords = vector4(-421.83, 6136.13, 31.88, 228.2) }
        }
    },
    {
        name = 'Ammunation ',
        label = '[E] - Ammunation',
        blip = true,
        blipSprite = 110,
        blipColor = 5,
        blipScale = 0.7,
        -- requiredLicense = 'police_license',
        -- jobs = { 'police' },
        -- grades = { 2, 3, 4 },
        categories = {
            [1] = {
                name = 'General',
                description = 'Ammunations',
                icon = 'fa-solid fa-gun',
                items = {
                    { name = 'weapon_knife',         label = 'Knife',          perPrice = 150,  description = 'General' },
                    { name = 'weapon_bat',           label = 'Bat',            perPrice = 150,  description = 'General' },
                    { name = 'weapon_hatchet',       label = 'Hatchet',        perPrice = 150,  description = 'General' },
                    -- { name = 'weapon_knife',         label = 'Knife',          perPrice = 150,  description = 'General' },
                    -- { name = 'weapon_bat',           label = 'Bat',            perPrice = 150,  description = 'General' },
                    -- { name = 'weapon_hatchet',       label = 'Hatchet',        perPrice = 150,  description = 'General' },
                    -- { name = 'weapon_pistol',        label = 'Pistol',         perPrice = 2500, description = 'General' },
                    -- { name = 'weapon_snspistol',     label = 'SNS Pistol',     perPrice = 1500, description = 'General' },
                    -- { name = 'weapon_vintagepistol', label = 'Vintage Pistol', perPrice = 4000, description = 'General' }
                }
            },
            -- [2] = {
            --     name = 'Ammunition',
            --     description = 'Ammunations for Weapons',
            --     icon = 'fa-solid fa-list',
            --     items = {
            --         { name = 'pistol_ammo',  label = 'Pistol Ammo',  perPrice = 250, description = 'Ammunition' },
            --         { name = 'rifle_ammo',   label = 'Rifle Ammo',   perPrice = 350, description = 'Ammunition' },
            --         { name = 'smg_ammo',     label = 'SMG Ammo',     perPrice = 300, description = 'Ammunition' },
            --         { name = 'shotgun_ammo', label = 'Shotgun Ammo', perPrice = 400, description = 'Ammunition' },
            --         { name = 'mg_ammo',      label = 'MG Ammo',      perPrice = 450, description = 'Ammunition' }
            --     }
            -- }
        },
        -- pedHash = 's_m_y_ammucity_01',
        scenario = 'WORLD_HUMAN_COP_IDLES',
        coords = {
            { ped = nil, coords = vector4(-3173.31, 1088.85, 20.84, 244.18) },
            { ped = nil, coords = vector4(-1304.19, -395.12, 36.7, 75.03) },
            { ped = nil, coords = vector4(841.92, -1035.32, 28.19, 1.56) },
            { ped = nil, coords = vector4(-1118.59, 2700.05, 18.55, 221.89) },
            { ped = nil, coords = vector4(2567.48, 292.59, 108.73, 349.68) },
            { ped = nil, coords = vector4(23.0, -1105.67, 29.8, 162.91) },
            { ped = nil, coords = vector4(253.63, -51.02, 69.94, 72.91) },
            { ped = nil, coords = vector4(-331.23, 6085.37, 31.45, 228.02) },
            { ped = nil, coords = vector4(1692.67, 3761.38, 34.71, 227.65) },
            { ped = nil, coords = vector4(809.68, -2159.13, 29.62, 1.43) },
            { ped = nil, coords = vector4(-661.96, -933.53, 21.83, 177.05) }
        }
    },
    {
        name = 'Weed',
        label = '[E] - Smoke On The Water',
        blip = true,
        blipSprite = 140,
        blipColor = 0,
        blipScale = 0.6,
        -- requiredLicense = 'police_license',
        -- jobs = { 'police' },
        -- grades = { 2, 3, 4 },
        categories = {
            [1] = {
                name = 'General',
                description = 'Ammunations',
                icon = 'fa-solid fa-cannabis',
                items = {
                    -- { name = 'weapon_knife',   label = 'Knife',          perPrice = 150, description = 'General' },
                    { name = 'joint',          label = 'Joint',          perPrice = 10,  description = 'Weed' },
                    -- { name = 'weapon_poolcue', label = 'Pool Cue',       perPrice = 100, description = 'Weed Accessories' },
                    { name = 'weed_nutrition', label = 'Weed Nutrition', perPrice = 20,  description = 'Weed Accessories' },
                    { name = 'empty_weed_bag', label = 'Empty Weed Bag', perPrice = 2,   description = 'Weed Packaging' },
                    { name = 'rolling_paper',  label = 'Rolling Paper',  perPrice = 2,   description = 'Weed Accessories' }
                }
            }
        },
        pedHash = 'a_m_y_hippy_01',
        scenario = 'WORLD_HUMAN_AA_SMOKE',
        coords = {
            { ped = nil, coords = vector4(-1168.26, -1573.2, 4.66, 105.24) }
        }
    },
    {
        name = 'Black Market',
        label = '[E] - Illicit Goods & Tools',
        blip = false,
        -- requiredLicense = 'police_license',
        -- jobs = { 'police' },
        -- grades = { 2, 3, 4 },
        categories = {
            [1] = {
                name = 'General',
                description = '24/7 Access',
                icon = 'fa-solid fa-clipboard',
                items = {
                    -- { name = 'pistol_ammo',   label = 'Pistol Ammo',    perPrice = 150,  description = 'PD Items' },
                    -- {
                    --     name = 'security_card_01',
                    --     label = 'Security Card 01',
                    --     perPrice = 5000,
                    --     description = 'Access Card'
                    -- },
                    -- {
                    --     name = 'security_card_02',
                    --     label = 'Security Card 02',
                    --     perPrice = 5000,
                    --     description = 'Access Card'
                    -- },
                    { name = 'lockpick',       label = 'Lockpick',        perPrice = 500, description = 'Tools' },
                    { name = 'electronickit', label = 'Electronic Kit', perPrice = 5000, description = 'Hacking Tools' },
                    { name = 'thermite',      label = 'Thermite',       perPrice = 5000, description = 'Explosive' },
                    { name = 'drill',         label = 'Drill',          perPrice = 5000, description = 'Drilling Tool' },
                    { name = 'radioscanner',  label = 'Radio Scanner',  perPrice = 5000, description = 'Listening Device' },
                    { name = 'cryptostick',   label = 'Crypto Stick',   perPrice = 5000, description = 'Cryptographic Tool' },
                    { name = 'joint',         label = 'Joint',          perPrice = 5000, description = 'Weed Product' },
                    -- { name = 'crack_baggy',   label = 'Crack Baggy',    perPrice = 5000, description = 'Crack Product' },
                    -- { name = 'coke_brick',    label = 'Coke Brick',     perPrice = 5000, description = 'Coke Product' },
                    -- { name = 'weed_brick',    label = 'Weed Brick',     perPrice = 5000, description = 'Weed Product' },
                    -- {
                    --     name = 'coke_small_brick',
                    --     label = 'Coke Small Brick',
                    --     perPrice = 5000,
                    --     description = 'Coke Product'
                    -- },
                    -- { name = 'oxy',  label = 'Oxy',  perPrice = 5000, description = 'Oxy Product' },
                    -- { name = 'meth', label = 'Meth', perPrice = 5000, description = 'Meth Product' },
                    
                }
            }
        },
        pedHash = 'a_m_y_smartcaspat_01',
        scenario = 'WORLD_HUMAN_AA_SMOKE',
        coords = {
            { ped = nil, coords = vector4(-594.7032, -1616.3647, 33.0105, 170.6846) }
        }
    },
    {
        name = 'Pharmacy',
        label = '[E] - Pills & Potions',
        blip = false,
        categories = {
            [1] = {
                name = 'Pills',
                description = '24/7 Access',
                icon = 'fa-solid fa-clipboard',
                items = {
                    { name = 'bandage',       label = 'Bandage',        perPrice = 50, description = 'Heal Wounds' },
                    { name = 'painkillers',   label = 'Pain Killer',    perPrice = 1500, description = 'Pain Relief' },
                    { name = 'firstaid',      label = 'Firstaid',       perPrice = 5000, description = 'Antibiotics' },
                }
            }
        },
        pedHash = 'a_m_y_smartcaspat_01',
        scenario = 'WORLD_HUMAN_AA_SMOKE',
        coords = {
            { ped = nil, coords = vector4(-1253.76, -1436.90, 4.37, 124.27) }
        }
    },
    {
        name = 'Digital Den',
        label = '[E] - Phones and Gadgets',
        blip = false,
        categories = {
            [1] = {
                name = 'Electronics',
                description = '24/7 Access',
                icon = 'fa-solid fa-clipboard',
                items = {
                    { name = 'phone',       label = 'Phone',        perPrice = 1500,   description = 'Phone' },
                    { name = 'radio',       label = 'Radio',        perPrice = 1500, description = 'Radio' },
                    { name = 'ys_sim_card', label = 'Sim card',     perPrice = 5000, description = 'Sim Card' },
                    { name = 'boombox',     label = 'Boom Box',     perPrice = 5000, description = 'Music Box' },
                }
            }
        },
        pedHash = 'a_m_y_smartcaspat_01',
        scenario = 'WORLD_HUMAN_AA_SMOKE',
        coords = {
            { ped = nil, coords = vector4(-1232.23, -1439.81, 4.37, 231.27) }
        }
    },
    -- Job Stores
    -- {
    --     name = 'Job Market',
    --     label = '[E] - LSPD Ammunation',
    --     blip = false,
    --     -- requiredLicense = 'police_license',
    --     jobs = { 'police' },
    --     -- grades = { 2, 3, 4 },
    --     categories = {
    --         [1] = {
    --             name = 'General',
    --             description = 'Random items',
    --             icon = 'fa-solid fa-gun',
    --             items = {
    --                 { name = 'handcuffs',       label = 'Handcuffs', perPrice = 150, description = 'PD Items' },
    --                 { name = 'police_stormram', label = 'Storm Arm', perPrice = 150, description = 'PD Items' },
    --                 { name = 'armor',           label = 'Armor',     perPrice = 150, description = 'PD Items' },
    --                 { name = 'radio',           label = 'Radio',     perPrice = 150, description = 'PD Items' },
    --                 { name = 'bandage',         label = 'Bandage',   perPrice = 150, description = 'PD Items' }
    --             }
    --         },
    --         [2] = {
    --             name = 'Weapons',
    --             description = 'Bullets and others',
    --             icon = 'fa-solid fa-list',
    --             items = {
    --                 { name = 'pistol_ammo',       label = 'Pistol Ammo', perPrice = 150, description = 'PD Items' },
    --                 { name = 'smg_ammo',          label = 'SMG Ammo',    perPrice = 150, description = 'PD Items' },
    --                 { name = 'rifle_ammo',        label = 'Rifle Ammo',  perPrice = 150, description = 'PD Items' },
    --                 { name = 'weapon_stungun',    label = 'Stun Gun',    perPrice = 150, description = 'PD Items' },
    --                 { name = 'weapon_pistol_mk2', label = 'PD Glock',    perPrice = 150, description = 'PD Items' },
    --                 { name = 'weapon_nightstick', label = 'Nightstick',  perPrice = 150, description = 'PD Items' },
    --                 { name = 'weapon_flashlight', label = 'FlashLight',  perPrice = 150, description = 'PD Items' },
    --                 {
    --                     name = 'weapon_pistol',
    --                     label = 'Pistol',
    --                     perPrice = 2500,
    --                     description = 'General',
    --                     -- Check qs-inventory/config/weapons.lua Config.WeaponAttachments for attachments
    --                     attachments = {
    --                         'extendedclip',
    --                         'flashlight',
    --                         'suppressor'
    --                     },
    --                     tint = 2 -- Make sure this tint id exists in the Config.WeaponAttachmentItems in qs-inventory/config/weapons.lua
    --                 },
    --                 {
    --                     name = 'weapon_snspistol',
    --                     label = 'SNS Pistol',
    --                     perPrice = 1500,
    --                     description = 'General',
    --                     attachments = {
    --                         'extendedclip',
    --                     }
    --                 },
    --             }
    --         }
    --     },
    --     pedHash = 'mp_m_securoguard_01',
    --     scenario = 'WORLD_HUMAN_COP_IDLES',
    --     coords = {
    --         { ped = nil, coords = vector4(454.035156, -980.043945, 30.678345, 82.204727) }
    --     }
    -- }
}

--[[
    Stash Configuration Guide

    This section defines static stashes across the map, which can be used for police armories, personal storage, restricted areas, or hidden locations.

    Each stash includes:
    - `coords`: World position where the stash is located.
    - `targetLabel`: The interaction label shown to players.
    - `size`: Configurable weight and slot capacity.
    - `blip`: Optional map blip with name, icon, color, and scale.
    - `label`: Internal stash identifier.
    - `requiredJobs`: Restrict access to specific jobs (e.g., police, ambulance).
    - `requiredJobsGrades`: Optional rank restriction for allowed jobs.
    - `requiredLicense`: Restrict access using an item-based license (e.g., 'weapon_license').
    - `personal`: If true, the stash is unique to each player.
    - `distance`: Interaction range.

    💡 Tip: Use `personal = true` for player-specific storage and leave `requiredJobs` as `nil` for public access.
]]

Config.Stashes = {
    [1] = {
        ['coords'] = vector3(461.723083, -983.182434, 30.678345),
        ['targetLabel'] = '[E] - Open Stash',
        ['size'] = {
            weight = 50000,
            slots = 15
        },
        -- ['blip'] = {
        --     name = 'Police Stash',
        --     coords = vector3(450.6766052246094, -978.5770874023438, 30.68960952758789),
        --     sprite = 1,
        --     color = 38,
        --     size = 0.5
        -- },
        ['label'] = 'police_stash',
        ['requiredJobs'] = { 'police' }, -- nil or example { 'police', 'ambulance' }
        ['requiredJobsGrades'] = { 2, 3, 4 },
        ['requiredLicense'] = nil,       -- nil or example 'itemname',
        ['personal'] = false,
        ['distance'] = 5.0
    },
    [2] = {
        ['coords'] = vector3(306.303284, -1457.709839, 29.953857),
        ['targetLabel'] = '[E] - Open Stash',
        ['size'] = {
            weight = 9500,
            slots = 15
        },
        -- ['blip'] = nil,
        ['label'] = 'doctor_stash',
        ['requiredJobs'] = { 'ambulance' }, -- nil or example { 'police', 'ambulance' }
        ['requiredJobsGrades'] = nil,       -- nil or grade tables example { 2, 3, 4},
        ['requiredLicense'] = nil,          -- nil or example 'itemname',
        ['personal'] = false,
        ['distance'] = 5.0
    },
    [3] = {
        ['coords'] = vector3(237.481323, -1354.747192, 31.032227),
        ['targetLabel'] = '[E] - Open Stash',
        ['size'] = {
            weight = 10000,
            slots = 50
        },
        -- ['blip'] = nil,
        ['label'] = 'mysterious_shed',
        ['requiredJobs'] = nil,       -- nil or example { 'police', 'ambulance' }
        ['requiredJobsGrades'] = nil, -- nil or grade tables example { 2, 3, 4},
        ['requiredLicense'] = nil,    -- nil or example 'itemname',
        ['personal'] = true,
        ['distance'] = 5.0
    }
}

--[[
    Debug Configuration:

    This section is primarily for development purposes, enabling debug mode allows you to view
    various logs and prints related to script actions, events, and errors. This is useful for
    identifying issues and fine-tuning the script during the development stage.

    NOTE: Enable these options only if you are actively developing or troubleshooting,
    as they may increase server load and provide detailed output that isn’t necessary
    for standard gameplay.
]]

Config.Debug = true -- Enables detailed print logs for debugging; leave off for production

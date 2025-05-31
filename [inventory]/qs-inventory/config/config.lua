--[[
    Welcome to the **inventory configuration**!

    This configuration file contains essential settings to customize and optimize your inventory system. Before you begin modifying the settings, please ensure you have reviewed each section of the documentation linked below, as it provides step-by-step instructions and in-depth explanations for each configurable option.

    Key settings within this file are designed for flexibility. You are encouraged to adjust and adapt these configurations to seamlessly integrate with your server's framework, creating a more personalized inventory experience for your players.

    Editable configurations are located primarily in the **client/custom/** and **server/custom/** directories, making adjustments straightforward and organized.

    📄 **Direct Documentation Link:**
    Refer to the official documentation here for comprehensive details and guidance: https://docs.quasar-store.com/
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

--[[
    Framework Detection and Configuration Guide for inventory

    This inventory system automatically detects whether you are using `qb-core`, `es_extended`, or `qbx_core`
    as your main framework, assigning it to `Config.Framework` accordingly. However, if you have renamed
    any of these resources, or use a modified framework setup, you may need to update this configuration manually.

    To set up manually:
        1. Remove the automatic detection code by clearing `Config.Framework`'s value.
        2. Replace it with the name of your custom framework setup.
        3. Update any relevant framework-specific functions within the script's client and server files.

    Warning:
    ⚠️ The automatic framework detection is set for standard setups. Avoid modifying this section
    unless you have a deep understanding of the framework structure, as incorrect modifications
    could disrupt functionality.

    Remember, for the inventory system to work seamlessly, make sure `qb-core`, `es_extended`,
    or `qbx_core` (or their equivalent files) are running at startup.
]]

local esxHas = GetResourceState('es_extended') == 'started'
local qbHas = GetResourceState('qb-core') == 'started'
local qbxHas = GetResourceState('qbx_core') == 'started'

Config.Framework = esxHas and 'esx' or qbHas and 'qb' or qbxHas and 'qb' or 'esx'
Config.QBX = qbxHas

--[[
    Backward Compatibility Mode for inventory Migration

    The `Config.FetchOldInventory` setting is designed for users migrating data from an older version of inventory to the current system.

    - **Purpose:** When set to `true`, this option initiates a one-time data migration process, transferring all relevant inventory data from the old inventory to the updated version.
    - **Completion Alert:** Once the migration is successfully finished, a message saying `Backward compatibility has been completed` will display in your console.
    - **IMPORTANT:** After the migration is complete, immediately switch `Config.FetchOldInventory` back to `false`. Keeping it enabled after migration can result in potential errors, as the script is not intended to run with backward compatibility enabled long-term.
    - **Usage Warning:** Do not use or modify other settings in the script while `Config.FetchOldInventory` is active, as this is a one-time migration setting designed solely for data transfer.

    Ensure to read the documentation for any additional guidance on migration steps.
]]

Config.FetchOldInventory = false -- Set to `true` only once to start the migration process, then return to `false` immediately after.

Config.UseTarget = true         -- Set to true to enable targeting with either 'qb-target' or 'ox_target', or false to disable entirely.

--[[
    General Configuration Guide for the Inventory System

    This section outlines various customization options available within the inventory system. Each setting allows
    for detailed customization, from item targeting methods to inventory slot configurations and item interaction options.
    To adjust the settings for your server, carefully review each parameter below. Note that certain adjustments (e.g.,
    slot limits or item weight capacities) may require special attention to avoid issues with existing inventories.

    ---- CONFIGURATION SETTINGS BREAKDOWN ----
]]

-- Disables the background of this inventory and allows you to see your character at all times.
-- With this setting off, you can't hear people around you. So choose wisely.
Config.TransparentBackground = false

Config.ServerName = 'QUASAR'       -- Server shortname for pause menu
Config.ThrowKeybind = 'E'          -- Sets the keybinding for throwing items from the inventory (default: 'E').
Config.GiveItemHideName = false    -- Hides item names during give-item actions, showing only the item ID for privacy.
Config.OpenProgressBar = false     -- Enable to add a progress bar for inventory opening, reducing duplication risks.
Config.EnableSounds = true         -- Select if you want the default inventory sounds completely muted
Config.EnableThrow = true          -- Enables the ability to throw items from the inventory.

Config.Handsup = true              -- Toggle on/off the hands-up feature and enable/disable robbery options.
Config.StealDeadPlayer = true      -- Allows players to loot items from dead players when enabled.
Config.StealWithoutWeapons = false -- Restricts robbery interactions; can only rob if target has hands raised without a weapon.

Config.InventoryWeight = {         -- Player inventory capacity configurations:
    ['weight'] = 120000,           -- Maximum weight capacity for inventory in grams. ⚠️ Changes require inventory wipe to avoid duplication issues.
    ['slots'] = 41,                -- Total available slots. Set to 40 to remove the sixth (protected) slot.
}

Config.DropWeight = {      -- Drop item weight and slot configurations:
    ['weight'] = 20000000, -- Maximum drop item weight in grams, managing ground clutter capacity.
    ['slots'] = 130,       -- Total slot capacity for dropped items. Adjust to limit or increase ground item limits.
}

Config.LabelChange = true          -- Enables players to rename inventory items for customization.
Config.LabelChangePrice = false    -- Sets a price for label changes; set to 'false' to make renaming free.
Config.BlockedLabelChangeItems = { -- Restricts renaming for certain items:
    ['money'] = true,              -- Prevents renaming of currency items.
    ['phone'] = true,              -- Prevents renaming of phones.
}

Config.UsableItemsFromHotbar = true -- Enables quick access for item use directly from hotbar (slots 1-5).
Config.BlockedItemsHotbar = {       -- Restricts specific items from hotbar use, requiring full inventory access for use.
    'lockpick',                     -- Example item restricted from hotbar usage.
    -- Add additional items as needed to restrict their hotbar access.
}

--[[
    Quasar Store - Backpack Configuration for inventory

    This section configures backpack functionality within the inventory system. Backpacks are managed as unique items
    with a limit of one per player. By defining items as non-storable or non-stealable, you can control item interactions
    and storage rules for specific items. Additionally, this configuration allows for customization of item drop visuals,
    clothing management, and gender identification in inventory contexts.

    ---- DETAILED CONFIGURATION SETTINGS ----
]]

Config.OnePerItem = {
    -- Restricts certain items to a single instance per player. For example, only one backpack can be held at a time.
    ['backpack'] = 1,
    -- Add more items here to set maximum quantity per item type.
}

Config.notStolenItems = {
    -- Defines items that cannot be stolen from other players. Helps protect specific personal or essential items.
    ['id_card'] = false,      -- ID cards cannot be stolen.
    ['water_bottle'] = false, -- Water bottles are non-stealable.
    ['tosti'] = false         -- Additional protected item (example).
}

Config.notStoredItems = {
    -- Defines items that cannot be stored in stashes or shared containers, ensuring these items stay in the player inventory.
    ['backpack'] = true, -- Prevents backpacks from being stored.
}

-- Anything you disable from here, the code is completely deprecated and the ui cannot be edited.
Config.Pages = {
    ['clothing'] = true,
    ['pause_menu'] = true,
    ['quest'] = false,
    ['skill'] = false
}

-- Enables or disables clothing system integration. Refer to the documentation for your framework setup:
-- ESX Documentation: https://docs.quasar-store.com/ Inventory > Functions > Clothing
-- QB Documentation: https://docs.quasar-store.com/
   Config.Clothing = Config.Pages.clothing -- Enables clothing options in the inventory, with a corresponding button.

---@type ClotheSlot[]
Config.ClothingSlots = {
    {
        name = 'helmet',
        slot = 1,
        type = 'head',
        wearType = 'prop',
        componentId = 0,
        anim = {
            dict = 'mp_masks@standard_car@ds@',
            anim = 'put_on_mask',
            flags = 49
        }
    },
    {
        name = 'mask',
        slot = 2,
        type = 'head',
        wearType = 'drawable',
        componentId = 1,
        anim = {
            dict = 'mp_masks@standard_car@ds@',
            anim = 'put_on_mask',
            flags = 49
        }
    },
    {
        name = 'glasses',
        slot = 3,
        type = 'head',
        wearType = 'prop',
        componentId = 1,
        anim = {
            dict = 'clothingspecs',
            anim = 'take_off',
            flags = 49
        }
    },
    {
        name = 'torso',
        slot = 4,
        type = 'body',
        wearType = 'drawable',
        componentId = 11,
        anim = {
            dict = 'missmic4',
            anim = 'michael_tux_fidget',
            flags = 49
        }
    },
    {
        name = 'tshirt',
        slot = 5,
        type = 'body',
        wearType = 'drawable',
        componentId = 8,
        anim = {
            dict = 'clothingtie',
            anim = 'try_tie_negative_a',
            flags = 49
        }
    },
    {
        name = 'jeans',
        slot = 6,
        type = 'body',
        wearType = 'drawable',
        componentId = 4,
        anim = {
            dict = 'missmic4',
            anim = 'michael_tux_fidget',
            flags = 49
        }
    },
    {
        name = 'arms',
        slot = 7,
        type = 'body',
        wearType = 'drawable',
        componentId = 3,
        anim = {
            dict = 'nmt_3_rcm-10',
            anim = 'cs_nigel_dual-10',
            flags = 49
        }
    },
    {
        name = 'shoes',
        slot = 8,
        type = 'body',
        wearType = 'drawable',
        componentId = 6,
        anim = {
            dict = 'random@domestic',
            anim = 'pickup_low',
            flags = 49
        }
    },
    {
        name = 'ears',
        slot = 9,
        type = 'body',
        wearType = 'prop',
        componentId = 2,
        anim = {
            dict = 'mp_cp_stolen_tut',
            anim = 'b_think',
            flags = 49
        }
    },
    {
        name = 'bag',
        slot = 10,
        type = 'addon',
        wearType = 'drawable',
        componentId = 5,
        anim = {
            dict = 'anim@heists@ornate_bank@grab_cash',
            anim = 'intro',
            flags = 49
        }
    },
    {
        name = 'watch',
        slot = 11,
        type = 'addon',
        wearType = 'prop',
        componentId = 6,
        anim = {
            dict = 'nmt_3_rcm-10',
            anim = 'cs_nigel_dual-10',
            flags = 49
        }
    },
    {
        name = 'bracelets',
        slot = 12,
        type = 'addon',
        wearType = 'prop',
        componentId = 7,
        anim = {
            dict = 'nmt_3_rcm-10',
            anim = 'cs_nigel_dual-10',
            flags = 49
        }
    },
    {
        name = 'chain',
        slot = 13,
        type = 'addon',
        wearType = 'drawable',
        componentId = 7,
        anim = {
            dict = 'nmt_3_rcm-10',
            anim = 'cs_nigel_dual-10',
            flags = 49
        }
    },
    {
        name = 'vest',
        slot = 14,
        type = 'addon',
        wearType = 'drawable',
        componentId = 9,
        anim = {
            dict = 'nmt_3_rcm-10',
            anim = 'cs_nigel_dual-10',
            flags = 49
        }
    },
}

---@type CreateQuest[]
Config.Quests = {
    {
        name = 'open_inventory',
        title = 'What’s in the Bag?',
        description = 'Open your inventory for the first time and check what you’re carrying with you.',
        reward = 100,
        requiredLevel = 0
    },
    {
        name = 'use_sandwich',
        title = 'A Tasty Start',
        description = 'Enjoy your first sandwich to recover a bit of energy. You can buy one at any market.',
        reward = 200,
        requiredLevel = 1,
        item = 'sandwich'
    },
    {
        name = 'use_phone',
        title = 'Connected World',
        description = 'Use a phone to explore its features. Purchase one from the market if you don’t have it.',
        reward = 200,
        requiredLevel = 2,
        item = 'phone',
    },
    {
        name = 'use_water',
        title = 'Essential Hydration',
        description = 'Stay hydrated by drinking a bottle of water. You can find it in the market or a store.',
        reward = 150,
        requiredLevel = 3,
        item = 'water',
    },
    {
        name = 'use_carbinerifle',
        title = 'Locked & Loaded',
        description = 'Test a carbine rifle for the first time. Make sure to stay safe while doing so.',
        reward = 350,
        requiredLevel = 5,
        item = 'weapon_carbinerifle',
    },
    {
        name = 'complete_5_quests',
        title = 'Rising Adventurer',
        description = 'Complete 5 quests to prove you’re ready for bigger challenges.',
        reward = 200,
        requiredLevel = 0,
        questCount = 5
    },
    {
        name = 'complete_10_quests',
        title = 'Battle-Tested',
        description = 'Complete 10 quests and show your dedication to the journey.',
        reward = 300,
        requiredLevel = 0,
        questCount = 10
    },
    {
        name = 'complete_30_quests',
        title = 'Seasoned Hero',
        description = 'Complete 30 quests and earn recognition as a true adventurer.',
        reward = 600,
        requiredLevel = 0,
        questCount = 30
    },
    {
        name = 'complete_50_quests',
        title = 'Mythical Champion',
        description = 'Complete 50 quests and ascend to mythical status among players.',
        reward = 1000,
        requiredLevel = 0,
        questCount = 50
    },
    {
        name = 'complete_100_quests',
        title = 'Master of All Quests',
        description = 'Complete 100 quests and dominate the world of adventures.',
        reward = 2000,
        requiredLevel = 0,
        questCount = 100
    },
    {
        name = 'epic_item',
        title = 'Wielder of the Epic',
        description = 'Find and equip an epic item to show your elite potential.',
        reward = 300,
        requiredLevel = 0,
        itemRarity = 'epic',
    },
    {
        name = 'legendary_item',
        title = 'Bearer of Legends',
        description = 'Use a legendary item to mark your place among the elite.',
        reward = 500,
        requiredLevel = 0,
        itemRarity = 'legendary',
    },
    {
        name = 'add_attachment',
        title = 'Weapon Specialist',
        description = 'Enhance your weapon with an attachment to increase its power.',
        reward = 1000,
        requiredLevel = 0
    },
    {
        name = 'reload_weapon',
        title = 'Locked and Loaded',
        description = 'Reload your weapon at least 5 times—stay sharp and ready.',
        reward = 150,
        requiredLevel = 0
    },
    {
        name = 'change_color',
        title = 'Style It Your Way',
        description = 'Customize your inventory color and make it uniquely yours.',
        reward = 400,
        requiredLevel = 0
    },
    {
        name = 'give_item_to_player',
        title = 'The Generous One',
        description = 'Give an item to another player and strengthen community bonds.',
        reward = 500,
        requiredLevel = 0
    },
    {
        name = 'level_5',
        title = 'Level 5 Unlocked',
        description = 'Reach level 5 and unlock new abilities in your journey.',
        reward = 500,
        requiredLevel = 5,
    },
    {
        name = 'level_10',
        title = 'Onward to Level 10',
        description = 'Reach level 10 and take your skills to the next tier.',
        reward = 1000,
        requiredLevel = 10,
    },
    {
        name = 'level_20',
        title = 'Veteran Status',
        description = 'Reach level 20 and establish yourself as a seasoned player.',
        reward = 2000,
        requiredLevel = 20,
    },
    {
        name = 'level_50',
        title = 'Elite Ascension',
        description = 'Reach level 50 and claim your place among the elite.',
        reward = 3000,
        requiredLevel = 50,
    },
    {
        name = 'repair_weapon',
        title = 'Weaponsmith',
        description = 'Repair a damaged weapon and keep it ready for battle.',
        reward = 1000,
        requiredLevel = 0,
    }
}

Config.IsIllenium = GetResourceState('illenium-appearance') == 'started'
Config.TakePreviousClothes = false             -- Determines if previously worn clothes are added back to inventory upon changing.

Config.ItemDropObject = `prop_paper_bag_small` -- Sets the model for dropped items. Can be set to `false` for no visual object.
Config.DropRefreshTime = 15 * 60               -- Sets how often dropped items are refreshed (in seconds).
Config.MaxDropViewDistance = 9.5               -- Maximum distance a player can view dropped items.

Config.Genders = {
    -- Gender labels in the inventory system. No need to adjust unless expanding gender categories.
    ['m'] = 'Male',
    ['f'] = 'Female',
    [1] = 'Male',
    [2] = 'Female'
}

--[[
    Visual Configuration Overview:

    This section controls the visual and user interface settings of the resource.
    Here, you can adjust everything from the animation style used to open the inventory,
    to the logo and item icons within the inventory interface.

    * `InventoryOptions` includes options to display or hide sidebar information,
      such as health, armor, and other character stats.
    * `Config.Defaults` contains settings for base character appearances, such as
      clothing defaults, which you may need to modify if you’re using custom clothes.
]]

Config.OpenInventoryAnim = true -- Enables a player animation when opening the inventory
Config.IdleCamera = true        -- Enables or disables idle camera functionality in the inventory screen

-- Custom icons for items in the inventory UI, utilizing FontAwesome icons (https://fontawesome.com/)
Config.ItemMiniIcons = {
    ['tosti'] = {
        icon = 'fa-solid fa-utensils', -- Icon for "tosti" item
    },
    ['water_bottle'] = {
        icon = 'fa-solid fa-utensils', -- Icon for "water bottle" item
    },
}

-- -- Custom rarity items, here you can create new types of rarities.
Config.ItemRarities = {
    {
        name = 'common',
        css = 'background-image: linear-gradient(to top, rgba(211,211,211,0.5), rgba(211,211,211,0) 60%) !important',
    },
    {
        name = 'epic',
        css = 'background-image: linear-gradient(to top, rgba(128,0,128,0.5), rgba(128,0,128,0) 60%) !important',
    },
    {
        name = 'legendary',
        css = 'background-image: linear-gradient(to top, rgba(255,215,0,0.5), rgba(255,215,0,0) 60%) !important',
    },
}

-- Default character appearance options (adjust as needed for custom clothing setups)
Config.Defaults = {
    ['female'] = {
        torso = 18,
        jeans = 19,
        shoes = 34,
        arms = 15,
        helmet = -1,
        glasses = -1,
        mask = 0,
        tshirt = 2,
        ears = -1,
        bag = 0,
        watch = -1,
        chain = 0,
        bracelets = -1,
        vest = 0,

    },
    ['male'] = {
        torso = 15,
        jeans = 14,
        shoes = 34,
        arms = 15,
        helmet = -1,
        glasses = -1,
        mask = 0,
        tshirt = 15,
        ears = -1,
        bag = 0,
        watch = -1,
        chain = 0,
        bracelets = -1,
        vest = 0
    }
}

-- Pause Menu
Config.UseInventoryPauseMenuByDefault = false                -- when  you press esc it will open the inventory pause menu by default
Config.DiscordLink = 'https://discord.gg/w8p9ezRnZV'       -- Discord Link
-- Config.YoutubeLink = 'https://www.youtube.com/@quasarstore' -- Youtube Link
Config.Announcements = {
    {
        title = 'Server Launch',
        message = 'The server is now live. Begin your journey and shape your destiny.',
        date = '2024-05-01 12:00:00',
    },
    {
        title = 'New Skill System',
        message = 'Our custom skill system is now active. Earn experience and unlock unique abilities.',
        date = '2024-05-03 14:30:00',
    },
    {
        title = 'Weekly Patch Deployed',
        message = 'Bug fixes, new content and performance improvements have been added. See patch notes on Discord.',
        date = '2024-05-05 10:00:00',
    },
    {
        title = 'Criminal Update',
        message = 'New heist routes and robbery mechanics are now available. Plan carefully, the cops are smarter.',
        date = '2024-05-06 17:00:00',
    },
    {
        title = 'Staff Applications Open',
        message = 'We’re recruiting active and mature players for the staff team. Apply now via the forum.',
        date = '2024-05-07 09:00:00',
    },
    {
        title = 'Skill Tree Expansion',
        message = 'New branches have been added to the skill tree. Customize your character even further.',
        date = '2024-05-08 13:00:00',
    },
    {
        title = 'Vehicle Economy Tweaks',
        message = 'Vehicle prices and insurance systems have been rebalanced to improve realism.',
        date = '2024-05-09 11:30:00',
    },
    {
        title = 'Roleplay Events Incoming',
        message = 'Major in-game events are planned this weekend. Stay tuned and be ready to participate.',
        date = '2024-05-10 19:00:00',
    },
}

Config.KeyToOpenSkillMenu = '7' --(number 7 right now)

Config.LevelingDifficulty = 20  --%  the difficulty to level up in [ % ]
Config.SkillPointsPerLevel = 1  -- how many skill points player will get EACH LEVEL UP

Config.NotificationTimeInSeconds = 7

Config.RestoreDefault = {
    allowRestore = true,
    Name = 'Prestige Reset',
    Description = 'Completely reset your skill tree, removing all acquired upgrades and returning you to level 0 with base skill points. Ideal for refining your strategy or trying a new path.',
    Purchase = '⚠️ This option is only available once per game session.',
    NoSkills = 'You currently have no skills to reset.',
    NotAvailable = 'You have already used your Prestige Reset in this session.',
    Confirmation = 'Are you sure you want to reset all your skills? This action is permanent and cannot be undone.',
    Success = 'Your skills have been reset. A new journey begins.',
    Cancelled = 'Skill reset cancelled. Your legacy remains intact.',
}

Config.StartingSkill = {
    SkillName = 'The Legend of ', -- Player name will be appended automatically
    SkillDescription = 'You begin your adventure with 2 starting skill points. Gain 1 extra point with each level up by participating in various activities:\n\n• Criminal Enterprises\n• Legal Professions\n• Heists & Missions\n• World Events & Challenges\n\nEvery choice you make shapes your destiny.',
    StartingSkillPoints = 2,
    Purchase = 0,
    image = 'mainskill',
    Motivation = 'The road to greatness starts here. Forge your legend, one decision at a time.',
    Notification = 'You have received your initial skill points. Open the skill tree to begin.',
    AlreadyClaimed = 'You have already received your starting skill package.',
}


Config.Skills = {
    --- ALL the explanations on SkillAbilities are in Skill Abilities Documentation file
    HealthRegen1 = { --- First Top skill
        ConnectLineTo = 'StartingSkill',
        SkillName = 'Basic Vitality',
        SkillDescription = 'Regenerate 1HP every 5 seconds when below 40% health (20HP)',
        Purchase = 2, -- Increased from 1
        x = 2800,
        y = 1150,
        image = 'HealthRegen1',
        SkillAbilities = {
            AddHealthRegen = {
                SpeedOfRegenerationInSeconds = 5,
                StartRegeneration = 20,
                StopRegeneration = 35, -- Reduced from 40
            },
        },
    },
    StaminaSprintTime1 = { --- First Bottom Left skill
        ConnectLineTo = 'StartingSkill',
        SkillName = 'Endurance Training',
        SkillDescription = 'Increase sprint duration by 25%', -- Reduced from 30%
        Purchase = 2,                                         -- Increased from 1
        image = 'staminasprint',
        x = 2200,
        y = 1750,
        SkillAbilities = {
            AddStaminaSprint = 4, -- Reduced from 5
        },
    },
    RunningSpeed1 = { --- First Bottom Right skill
        ConnectLineTo = 'StartingSkill',
        SkillName = 'Lightfooted',
        SkillDescription = 'Increase running speed by 4%', -- Reduced from 5%
        Purchase = 2,                                      -- Increased from 1
        image = 'Speed',
        x = 3400,
        y = 1650,
        SkillAbilities = {
            AddSpeed = 1.04, -- Reduced from 1.05
        },
    },

    --- TOP LEFT SIDE - Health Specialization
    AddHealth1 = {
        ConnectLineTo = 'HealthRegen1',
        SkillName = 'First Aid Kit',
        SkillDescription = 'Unlock /addhp command (8HP, 5min cooldown)', -- Reduced from 10HP
        Purchase = 2,                                                    -- Increased from 1
        image = 'Health',
        x = 2500,
        y = 850,
        SkillAbilities = {
            AddHealth = 8, -- Reduced from 10
        },
    },
    AddHealth2 = {
        ConnectLineTo = 'AddHealth1',
        SkillName = 'Advanced First Aid',
        SkillDescription = 'Improve /addhp to restore 15HP (5min cooldown)', -- Reduced from 20HP
        Purchase = 2,                                                        -- Increased from 1
        image = 'Health',
        x = 2200,
        y = 550,
        SkillAbilities = {
            AddHealth = 15, -- Reduced from 20
        },
    },
    AddHealth3 = {
        ConnectLineTo = 'AddHealth2',
        SkillName = 'Combat Medic',
        SkillDescription = 'Improve /addhp to restore 25HP (5min cooldown)', -- Reduced from 30HP
        Purchase = 3,                                                        -- Increased from 2
        image = 'Health',
        x = 2500,
        y = 250,
        SkillAbilities = {
            AddHealth = 25, -- Reduced from 30
        },
    },
    AddHealth4 = {
        ConnectLineTo = 'AddHealth3',
        SkillName = 'Field Surgeon',
        SkillDescription = 'Master /addhp to restore 40HP (5min cooldown)', -- Reduced from 50HP
        Purchase = 4,                                                       -- Increased from 3
        image = 'Health',
        x = 1800,
        y = 100,
        SkillAbilities = {
            AddHealth = 40, -- Reduced from 50
        },
    },

    HealthRegen2 = {
        ConnectLineTo = 'AddHealth1',
        SkillName = 'Enhanced Vitality',
        SkillDescription = 'Health regen activates at 30HP, stops at 45HP', -- Reduced from 50HP
        Purchase = 2,                                                       -- Increased from 1
        image = 'HealthRegen1',
        x = 1900,
        y = 700,
        SkillAbilities = {
            AddHealthRegen = {
                StartRegeneration = 30,
                StopRegeneration = 45, -- Reduced from 50
            },
        },
    },
    HealthRegen3 = {
        ConnectLineTo = 'HealthRegen2',
        SkillName = 'Rapid Recovery',
        SkillDescription = 'Health regenerates every 4.5 seconds', -- Reduced from 4
        Purchase = 2,                                              -- Increased from 1
        image = 'HealthRegen1',
        x = 1500,
        y = 400,
        SkillAbilities = {
            AddHealthRegen = {
                SpeedOfRegenerationInSeconds = 4.5, -- Reduced from 4
            },
        },
    },
    HealthRegen4 = {
        ConnectLineTo = 'HealthRegen3',
        SkillName = 'Combat Resilience',
        SkillDescription = 'Health regen activates at 40HP, stops at 55HP', -- Reduced from 60HP
        Purchase = 3,                                                       -- Increased from 2
        image = 'HealthRegen1',
        x = 1200,
        y = 700,
        SkillAbilities = {
            AddHealthRegen = {
                StartRegeneration = 40,
                StopRegeneration = 55, -- Reduced from 60
            },
        },
    },
    HealthRegen5 = {
        ConnectLineTo = 'HealthRegen4',
        SkillName = 'Unyielding',
        SkillDescription = 'Health regen activates at 50HP, stops at 80HP', -- Reduced from 90HP
        Purchase = 4,                                                       -- Increased from 3
        image = 'HealthRegen1',
        x = 800,
        y = 600,
        SkillAbilities = {
            AddHealthRegen = {
                StartRegeneration = 50,
                StopRegeneration = 80, -- Reduced from 90
            },
        },
    },
    HealthRegen6 = {
        ConnectLineTo = 'HealthRegen3',
        SkillName = 'Swift Healing',
        SkillDescription = 'Health regenerates every 3.5 seconds', -- Reduced from 3
        Purchase = 3,                                              -- Increased from 2
        image = 'HealthRegen1',
        x = 1000,
        y = 200,
        SkillAbilities = {
            AddHealthRegen = {
                SpeedOfRegenerationInSeconds = 3.5, -- Reduced from 3
            },
        },
    },
    HealthRegen7 = {
        ConnectLineTo = 'HealthRegen6',
        SkillName = 'Instant Recovery',
        SkillDescription = 'Health regenerates every 1.5 seconds', -- Reduced from 1
        Purchase = 5,                                              -- Increased from 3
        image = 'HealthRegen1',
        x = 500,
        y = 100,
        SkillAbilities = {
            AddHealthRegen = {
                SpeedOfRegenerationInSeconds = 1.5, -- Reduced from 1
            },
        },
    },

    --- TOP RIGHT SIDE - Armor Specialization
    AddArmor1 = {
        ConnectLineTo = 'HealthRegen1',
        SkillName = 'Armor Patch',
        SkillDescription = 'Unlock /addarmor command (8AP, 5min cooldown)', -- Reduced from 10AP
        Purchase = 2,                                                       -- Increased from 1
        image = 'Armor',
        x = 3100,
        y = 850,
        SkillAbilities = {
            AddArmor = 8, -- Reduced from 10
        },
    },
    AddArmor2 = {
        ConnectLineTo = 'AddArmor1',
        SkillName = 'Armor Plating',
        SkillDescription = 'Improve /addarmor to restore 15AP (5min cooldown)', -- Reduced from 20AP
        Purchase = 2,                                                           -- Increased from 1
        image = 'Armor',
        x = 3400,
        y = 550,
        SkillAbilities = {
            AddArmor = 15, -- Reduced from 20
        },
    },
    AddArmor3 = {
        ConnectLineTo = 'AddArmor2',
        SkillName = 'Ballistic Upgrade',
        SkillDescription = 'Improve /addarmor to restore 25AP (5min cooldown)', -- Reduced from 30AP
        Purchase = 3,                                                           -- Increased from 2
        image = 'Armor',
        x = 3700,
        y = 250,
        SkillAbilities = {
            AddArmor = 25, -- Reduced from 30
        },
    },
    AddArmor4 = {
        ConnectLineTo = 'AddArmor3',
        SkillName = 'Military Grade Armor',
        SkillDescription = 'Master /addarmor to restore 40AP (5min cooldown)', -- Reduced from 50AP
        Purchase = 4,                                                          -- Increased from 3
        image = 'Armor',
        x = 4000,
        y = 100,
        SkillAbilities = {
            AddArmor = 40, -- Reduced from 50
        },
    },

    ArmorRegen1 = {
        ConnectLineTo = 'AddArmor1',
        SkillName = 'Reactive Armor',
        SkillDescription = 'Armor regenerates 1AP every 5s (activates below 8AP)', -- Reduced from 10AP
        Purchase = 2,                                                              -- Increased from 1
        x = 3400,
        y = 1200,
        image = 'ArmorRegen',
        SkillAbilities = {
            AddArmorRegen = {
                SpeedOfRegenerationInSeconds = 5,
                StartRegeneration = 8, -- Reduced from 10
                StopRegeneration = 25, -- Reduced from 30
            },
        },
    },
    ArmorRegen2 = {
        ConnectLineTo = 'ArmorRegen1',
        SkillName = 'Enhanced Plating',
        SkillDescription = 'Armor regen activates at 25AP, stops at 45AP', -- Reduced from 30/50
        Purchase = 2,                                                      -- Increased from 1
        image = 'ArmorRegen',
        x = 3800,
        y = 900,
        SkillAbilities = {
            AddArmorRegen = {
                StartRegeneration = 25, -- Reduced from 30
                StopRegeneration = 45,  -- Reduced from 50
            },
        },
    },
    ArmorRegen3 = {
        ConnectLineTo = 'ArmorRegen2',
        SkillName = 'Combat Armor',
        SkillDescription = 'Armor regen activates at 35AP, stops at 55AP', -- Reduced from 40/60
        Purchase = 3,                                                      -- Increased from 2
        image = 'ArmorRegen',
        x = 4300,
        y = 800,
        SkillAbilities = {
            AddArmorRegen = {
                StartRegeneration = 35, -- Reduced from 40
                StopRegeneration = 55,  -- Reduced from 60
            },
        },
    },
    ArmorRegen4 = {
        ConnectLineTo = 'ArmorRegen3',
        SkillName = 'Tactical Armor',
        SkillDescription = 'Armor regen activates at 45AP, stops at 70AP', -- Reduced from 50/80
        Purchase = 4,                                                      -- Increased from 3
        image = 'ArmorRegen',
        x = 4800,
        y = 900,
        SkillAbilities = {
            AddArmorRegen = {
                StartRegeneration = 45, -- Reduced from 50
                StopRegeneration = 70,  -- Reduced from 80
            },
        },
    },
    ArmorRegen5 = {
        ConnectLineTo = 'ArmorRegen2',
        SkillName = 'Rapid Armor',
        SkillDescription = 'Armor regenerates every 4.5 seconds', -- Reduced from 4
        Purchase = 2,                                             -- Increased from 1
        image = 'ArmorRegen',
        x = 3900,
        y = 600,
        SkillAbilities = {
            AddArmorRegen = {
                SpeedOfRegenerationInSeconds = 4.5, -- Reduced from 4
            },
        },
    },
    ArmorRegen6 = {
        ConnectLineTo = 'ArmorRegen5',
        SkillName = 'Instant Armor',
        SkillDescription = 'Armor regenerates every 3.5 seconds', -- Reduced from 3
        Purchase = 3,                                             -- Increased from 2
        image = 'ArmorRegen',
        x = 4200,
        y = 200,
        SkillAbilities = {
            AddArmorRegen = {
                SpeedOfRegenerationInSeconds = 3.5, -- Reduced from 3
            },
        },
    },
    ArmorRegen7 = {
        ConnectLineTo = 'ArmorRegen6',
        SkillName = 'Nanotech Armor',
        SkillDescription = 'Armor regenerates every 1.5 seconds', -- Reduced from 1
        Purchase = 5,                                             -- Increased from 3
        image = 'ArmorRegen',
        x = 4700,
        y = 300,
        SkillAbilities = {
            AddArmorRegen = {
                SpeedOfRegenerationInSeconds = 1.5, -- Reduced from 1
            },
        },
    },

    --- BOTTOM RIGHT SIDE - Mobility and Combat
    DriveCarFaster1 = {
        ConnectLineTo = 'RunningSpeed1',
        SkillName = 'Street Racer',
        SkillDescription = 'Increase vehicle top speed by 4km/h', -- Reduced from 5km/h
        Purchase = 2,                                             -- Increased from 1
        image = 'drivingfaster1',
        x = 3300,
        y = 2000,
        SkillAbilities = {
            AddDrivingSpeed = 4, -- Reduced from 5
        },
    },
    DriveCarFaster2 = {
        ConnectLineTo = 'DriveCarFaster1',
        SkillName = 'Performance Tuning',
        SkillDescription = 'Increase vehicle top speed by 8km/h', -- Reduced from 10km/h
        Purchase = 2,                                             -- Increased from 1
        image = 'drivingfaster1',
        x = 3000,
        y = 2300,
        SkillAbilities = {
            AddDrivingSpeed = 8, -- Reduced from 10
        },
    },
    DriveCarFaster3 = {
        ConnectLineTo = 'DriveCarFaster2',
        SkillName = 'Pro Driver',
        SkillDescription = 'Increase vehicle top speed by 12km/h', -- Reduced from 15km/h
        Purchase = 3,                                              -- Increased from 2
        image = 'drivingfaster1',
        x = 3300,
        y = 2600,
        SkillAbilities = {
            AddDrivingSpeed = 12, -- Reduced from 15
        },
    },
    DriveCarFaster4 = {
        ConnectLineTo = 'DriveCarFaster3',
        SkillName = 'Speed Demon',
        SkillDescription = 'Increase vehicle top speed by 16km/h', -- Reduced from 20km/h
        Purchase = 4,                                              -- Increased from 3
        image = 'drivingfaster1',
        x = 2800,
        y = 2800,
        SkillAbilities = {
            AddDrivingSpeed = 16, -- Reduced from 20
        },
    },

    BoatFaster1 = {
        ConnectLineTo = 'DriveCarFaster1',
        SkillName = 'Mariner',
        SkillDescription = 'Increase boat speed by 4km/h', -- Reduced from 5km/h
        Purchase = 2,                                      -- Increased from 1
        image = 'SailingFaster',
        x = 3500,
        y = 2300,
        SkillAbilities = {
            AddBoatSpeed = 4, -- Reduced from 5
        },
    },
    BoatFaster2 = {
        ConnectLineTo = 'BoatFaster1',
        SkillName = 'Shipwright',
        SkillDescription = 'Increase boat speed by 8km/h', -- Reduced from 10km/h
        Purchase = 2,                                      -- Increased from 1
        image = 'SailingFaster',
        x = 3800,
        y = 2400,
        SkillAbilities = {
            AddBoatSpeed = 8, -- Reduced from 10
        },
    },
    BoatFaster3 = {
        ConnectLineTo = 'BoatFaster2',
        SkillName = 'Naval Expert',
        SkillDescription = 'Increase boat speed by 12km/h', -- Reduced from 15km/h
        Purchase = 3,                                       -- Increased from 2
        image = 'SailingFaster',
        x = 3900,
        y = 2700,
        SkillAbilities = {
            AddBoatSpeed = 12, -- Reduced from 15
        },
    },
    BoatFaster4 = {
        ConnectLineTo = 'BoatFaster3',
        SkillName = 'Master Captain',
        SkillDescription = 'Increase boat speed by 16km/h', -- Reduced from 20km/h
        Purchase = 4,                                       -- Increased from 3
        image = 'SailingFaster',
        x = 4300,
        y = 2600,
        SkillAbilities = {
            AddBoatSpeed = 16, -- Reduced from 20
        },
    },

    RunningSpeed2 = {
        ConnectLineTo = 'RunningSpeed1',
        SkillName = 'Sprinter',
        SkillDescription = 'Increase running speed by 12%', -- Reduced from 15%
        Purchase = 2,                                       -- Increased from 1
        image = 'Speed',
        x = 3900,
        y = 1700,
        SkillAbilities = {
            AddSpeed = 1.12, -- Reduced from 1.15
        },
    },
    RunningSpeed3 = {
        ConnectLineTo = 'RunningSpeed2',
        SkillName = 'Marathoner',
        SkillDescription = 'Increase running speed by 17%', -- Reduced from 20%
        Purchase = 3,                                       -- Increased from 2
        image = 'Speed',
        x = 3900,
        y = 1900,
        SkillAbilities = {
            AddSpeed = 1.17, -- Reduced from 1.20
        },
    },
    RunningSpeed4 = {
        ConnectLineTo = 'RunningSpeed3',
        SkillName = 'Olympian',
        SkillDescription = 'Increase running speed by 25%', -- Reduced from 30%
        Purchase = 4,                                       -- Increased from 3
        image = 'Speed',
        x = 4200,
        y = 2200,
        SkillAbilities = {
            AddSpeed = 1.25, -- Reduced from 1.30
        },
    },

    ShieldWall1 = {
        ConnectLineTo = 'RunningSpeed2',
        SkillName = 'Tactical Shield',
        SkillDescription = 'Deploy temporary cover (12s duration, 3min cooldown)', -- Reduced from 15s
        Purchase = 2,                                                              -- Increased from 1
        image = 'ShieldWall',
        x = 4000,
        y = 1500,
        SkillAbilities = {
            AddShieldWall = {
                WallStandingTimeInSeconds = 12, -- Reduced from 15
                WallRechargeTimeInSeconds = 180,
            },
        },
    },
    ShieldWall2 = {
        ConnectLineTo = 'ShieldWall1',
        SkillName = 'Reinforced Shield',
        SkillDescription = 'Increase shield duration to 17 seconds', -- Reduced from 20
        Purchase = 2,                                                -- Increased from 1
        image = 'ShieldWall',
        x = 4400,
        y = 1700,
        SkillAbilities = {
            AddShieldWall = {
                WallStandingTimeInSeconds = 17, -- Reduced from 20
            },
        },
    },
    ShieldWall3 = {
        ConnectLineTo = 'ShieldWall2',
        SkillName = 'Fortified Shield',
        SkillDescription = 'Increase shield duration to 22 seconds', -- Reduced from 25
        Purchase = 3,                                                -- Increased from 2
        image = 'ShieldWall',
        x = 4700,
        y = 2200,
        SkillAbilities = {
            AddShieldWall = {
                WallStandingTimeInSeconds = 22, -- Reduced from 25
            },
        },
    },
    ShieldWall4 = {
        ConnectLineTo = 'ShieldWall3',
        SkillName = 'Impenetrable Shield',
        SkillDescription = 'Increase shield duration to 27 seconds', -- Reduced from 30
        Purchase = 4,                                                -- Increased from 3
        image = 'ShieldWall',
        x = 5200,
        y = 2100,
        SkillAbilities = {
            AddShieldWall = {
                WallStandingTimeInSeconds = 27, -- Reduced from 30
            },
        },
    },

    ShieldWall5 = {
        ConnectLineTo = 'ShieldWall1',
        SkillName = 'Rapid Deployment',
        SkillDescription = 'Reduce shield cooldown to 2.75 minutes', -- Reduced from 2.5
        Purchase = 2,                                                -- Increased from 1
        image = 'ShieldWall',
        x = 4600,
        y = 1400,
        SkillAbilities = {
            AddShieldWall = {
                WallRechargeTimeInSeconds = 165, -- Reduced from 150
            },
        },
    },
    ShieldWall6 = {
        ConnectLineTo = 'ShieldWall5',
        SkillName = 'Quick Reload',
        SkillDescription = 'Reduce shield cooldown to 2.25 minutes', -- Reduced from 2
        Purchase = 3,                                                -- Increased from 2
        image = 'ShieldWall',
        x = 5100,
        y = 1600,
        SkillAbilities = {
            AddShieldWall = {
                WallRechargeTimeInSeconds = 135, -- Reduced from 120
            },
        },
    },
    ShieldWall7 = {
        ConnectLineTo = 'ShieldWall6',
        SkillName = 'Instant Reset',
        SkillDescription = 'Reduce shield cooldown to 1.25 minutes', -- Reduced from 1
        Purchase = 5,                                                -- Increased from 3
        image = 'ShieldWall',
        x = 4900,
        y = 1800,
        SkillAbilities = {
            AddShieldWall = {
                WallRechargeTimeInSeconds = 75, -- Reduced from 60
            },
        },
    },

    --- BOTTOM LEFT SIDE - Stamina and Aquatic
    StaminaRecoveryTime1 = {
        ConnectLineTo = 'StaminaSprintTime1',
        SkillName = 'Quick Recovery',
        SkillDescription = 'Stamina regenerates 25% faster', -- Reduced from 30%
        Purchase = 2,                                        -- Increased from 1
        image = 'staminasprint',
        x = 2100,
        y = 2000,
        SkillAbilities = {
            AddStaminaRecovery = 2, -- Reduced from 3
        },
    },
    StaminaRecoveryTime2 = {
        ConnectLineTo = 'StaminaRecoveryTime1',
        SkillName = 'Athletic Recovery',
        SkillDescription = 'Stamina regenerates 50% faster', -- Reduced from 60%
        Purchase = 3,                                        -- Increased from 2
        image = 'staminasprint',
        x = 1700,
        y = 2200,
        SkillAbilities = {
            AddStaminaRecovery = 4, -- Reduced from 5
        },
    },
    StaminaRecoveryTime3 = {
        ConnectLineTo = 'StaminaRecoveryTime2',
        SkillName = 'Superhuman Recovery',
        SkillDescription = 'Stamina regenerates 80% faster', -- Reduced from 90%
        Purchase = 4,                                        -- Increased from 3
        image = 'staminasprint',
        x = 1800,
        y = 2600,
        SkillAbilities = {
            AddStaminaRecovery = 8, -- Reduced from 10
        },
    },

    StaminaSprintTime2 = {
        ConnectLineTo = 'StaminaRecoveryTime1',
        SkillName = 'Endurance Runner',
        SkillDescription = 'Increase sprint duration by 60%', -- Reduced from 70%
        Purchase = 2,                                         -- Increased from 1
        image = 'staminasprint',
        x = 2500,
        y = 2300,
        SkillAbilities = {
            AddStaminaSprint = 6, -- Reduced from 8
        },
    },
    StaminaSprintTime3 = {
        ConnectLineTo = 'StaminaSprintTime2',
        SkillName = 'Marathon Runner',
        SkillDescription = 'Increase sprint duration by 90%', -- Reduced from 100%
        Purchase = 3,                                         -- Increased from 2
        image = 'staminasprint',
        x = 2200,
        y = 2500,
        SkillAbilities = {
            AddStaminaSprint = 9, -- Reduced from 10
        },
    },
    StaminaSprintTime4 = {
        ConnectLineTo = 'StaminaSprintTime3',
        SkillName = 'Ultra Runner',
        SkillDescription = 'Increase sprint duration by 180%', -- Reduced from 200%
        Purchase = 5,                                          -- Increased from 3
        image = 'staminasprint',
        x = 2500,
        y = 2900,
        SkillAbilities = {
            AddStaminaSprint = 18, -- Reduced from 20
        },
    },

    SwimmingSpeed1 = {
        ConnectLineTo = 'StaminaSprintTime1',
        SkillName = 'Aquatic Agility',
        SkillDescription = 'Increase swimming speed by 4%', -- Reduced from 5%
        Purchase = 2,                                       -- Increased from 1
        image = 'Swimming',
        x = 1900,
        y = 1700,
        SkillAbilities = {
            AddSwimmingSpeed = 1.04, -- Reduced from 1.05
        },
    },
    SwimmingSpeed2 = {
        ConnectLineTo = 'SwimmingSpeed1',
        SkillName = 'Competitive Swimmer',
        SkillDescription = 'Increase swimming speed by 12%', -- Reduced from 15%
        Purchase = 2,                                        -- Increased from 1
        image = 'Swimming',
        x = 1500,
        y = 1900,
        SkillAbilities = {
            AddSwimmingSpeed = 1.12, -- Reduced from 1.15
        },
    },
    SwimmingSpeed3 = {
        ConnectLineTo = 'SwimmingSpeed2',
        SkillName = 'Olympic Swimmer',
        SkillDescription = 'Increase swimming speed by 17%', -- Reduced from 20%
        Purchase = 3,                                        -- Increased from 2
        image = 'Swimming',
        x = 1300,
        y = 2400,
        SkillAbilities = {
            AddSwimmingSpeed = 1.17, -- Reduced from 1.20
        },
    },
    SwimmingSpeed4 = {
        ConnectLineTo = 'SwimmingSpeed3',
        SkillName = 'Dolphin Grace',
        SkillDescription = 'Increase swimming speed by 25%', -- Reduced from 30%
        Purchase = 4,                                        -- Increased from 3
        image = 'Swimming',
        x = 800,
        y = 2300,
        SkillAbilities = {
            AddSwimmingSpeed = 1.25, -- Reduced from 1.30
        },
    },

    UnderWaterTime1 = {
        ConnectLineTo = 'SwimmingSpeed1',
        SkillName = 'Freediver',
        SkillDescription = 'Increase underwater breathing time by 8 seconds', -- Reduced from 10
        Purchase = 2,                                                         -- Increased from 1
        image = 'underwater',
        x = 1400,
        y = 1500,
        SkillAbilities = {
            AddUnderWaterTime = 18, -- Reduced from 20
        },
    },
    UnderWaterTime2 = {
        ConnectLineTo = 'UnderWaterTime1',
        SkillName = 'Deep Diver',
        SkillDescription = 'Increase underwater breathing time by 17 seconds', -- Reduced from 20
        Purchase = 2,                                                          -- Increased from 1
        image = 'underwater',
        x = 1100,
        y = 1800,
        SkillAbilities = {
            AddUnderWaterTime = 27, -- Reduced from 30
        },
    },
    UnderWaterTime3 = {
        ConnectLineTo = 'UnderWaterTime2',
        SkillName = 'Pearl Diver',
        SkillDescription = 'Increase underwater breathing time by 27 seconds', -- Reduced from 30
        Purchase = 3,                                                          -- Increased from 2
        image = 'underwater',
        x = 600,
        y = 1800,
        SkillAbilities = {
            AddUnderWaterTime = 37, -- Reduced from 40
        },
    }
}

Config.DefaultSkill = {
    currentLevel = 0,
    nextLevel = 100,
    skillPoints = 0,
    skillXP = 0,
    ownedSkills = {},
    abilities = {},
}

-- Key Bindings: Configure shortcut keys for inventory actions
-- Check the documentation for guidelines on modifying these key mappings
Config.KeyBinds = {
    ['inventory'] = 'TAB', -- Open inventory
    ['hotbar'] = 'Z',      -- Show hotbar
    ['reload'] = 'R',      -- Reload action
    ['handsup'] = 'X',     -- Hands-up/robbery gesture
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

--[[
    Interval in milliseconds to save the player inventory to the database
    To solve dupe problems we are not using the old one's system (Save inventory when inventory is closed)
    The new system is detects when the inventory is updated and saves it to the database after a certain time.
    But you need to be careful and avoid frequent script restarts. Because it doesn't work when the script is restarted.

    you can use /save-inventories for save all inventories to the database (if you need to restart the script)
]]

Config.Debug = true                  -- Enables detailed print logs for debugging; leave off for production
Config.ZoneDebug = false             -- Toggles additional debug information for zones; use only if you're troubleshooting specific zones
Config.InventoryPrefix = 'inventory' -- Prefix for inventory references in the codebase; modifying this requires codebase-wide adjustments
Config.SaveInventoryInterval = 12500

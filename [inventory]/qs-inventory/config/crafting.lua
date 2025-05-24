--[[
    Configuring the Crafting System

    The qs-inventory's crafting system is entirely independent, meaning it operates without
    needing additional DLC. This crafting system is designed to be intuitive and adaptable
    to your server needs, allowing you to create complex recipes and control crafting outcomes
    with ease.

    Noteworthy features:
    - Customizable success rates per item (1-100%), which sets the probability of successful crafting.
    - Reputation-based access to crafting recipes (specific to QBCore) that allows items to unlock
      based on a player's reputation points.

    Read through each section to understand the structure of the system, and check examples below
    for reference on crafting items.

    **Important:** If you use the Reputation system, be sure to configure the 'rep' fields and thresholds
    based on your server’s design.
]]

Config.Crafting = true -- Toggle the crafting system on or off

--[[
    Reputation System (Exclusive to QBCore Framework)

    The reputation system restricts certain crafting items until a player reaches a required level.
    This can be configured per item in the crafting recipes. For example, a higher-level item
    may require a specific amount of reputation points to unlock.

    Built-in Reputation Types for QBCore:
    - 'craftingrep' and 'attachmentcraftingrep'

    Set thresholds to only show items that match or exceed a player’s reputation level.
]]

Config.CraftingReputation = false -- Enable to activate reputation gating for crafting items (QBCore only)
Config.ThresholdItems = false     -- Items only visible if rep >= threshold; QBCore-only feature

--[[
    Crafting Recipes Configuration

    Below is an example of how to define crafting items. Each entry contains:
    - Item name and amount crafted
    - Resource costs required for crafting
    - Slot position, item type, and crafting time
    - Reputation requirements and chance of successful crafting

    Customize each field to suit your server, and remember to set 'chance' carefully.
    Higher chance values reduce the likelihood of item breakage.
]]

-- Example Item Entry Structure
--[[
    [1] = {
        name = "weapon_pistol",    -- The name of the item being crafted
        amount = 50,               -- Quantity available for crafting
        info = {},                 -- Information field for metadata (ignore if unsure)
        costs = {                  -- List of required materials to craft this item
            ["iron"] = 80,
            ["metalscrap"] = 120,
            ["rubber"] = 8,
            ["steel"] = 133,
            ["lockpick"] = 5,
        },
        type = "weapon",           -- Specify if 'item' or 'weapon'
        slot = 1,                  -- Position slot in the crafting menu
        rep = 'attachmentcraftingrep', -- Required reputation type (QBCore only)
        points = 1,                -- Reputation points awarded on crafting (QBCore only)
        threshold = 0,             -- Required reputation level for visibility (QBCore only)
        time = 5500,               -- Crafting time in milliseconds
        chance = 100               -- Success chance percentage (1-100)
    },
]]

--[[
    Custom Event for Crafting
    External scripts can call the crafting system using the following sample structure.
    Set up custom crafting recipes and triggers based on your server events.
]]

-- Sample External Crafting Event
function OpenCrafting()
    local CustomCrafting = {
        [1] = {
            name = 'weapon_pistol',
            amount = 50,
            info = {},
            costs = { ['tosti'] = 1 },
            type = 'weapon',
            slot = 1,
            rep = 'attachmentcraftingrep',
            points = 1,
            threshold = 0,
            time = 5500,
            chance = 100
        },
        [2] = {
            name = 'water_bottle',
            amount = 1,
            info = {},
            costs = { ['tosti'] = 1 },
            type = 'item',
            slot = 2,
            rep = 'attachmentcraftingrep',
            points = 1,
            threshold = 0,
            time = 8500,
            chance = 100
        },
    }

    local items = exports['qs-inventory']:SetUpCrafing(CustomCrafting)
    local crafting = {
        label = 'Craft',
        items = items
    }
    TriggerServerEvent('inventory:server:SetInventoryItems', items)
    TriggerServerEvent('inventory:server:OpenInventory', 'customcrafting', crafting.label, crafting)
end

--[[ Crafting Tables Definition

    Define specific crafting tables for different jobs or locations:
    - Each table can have unique items and requirements.
    - You can control access based on job roles, grades, or specific blip visibility on the map.
]]

Config.CraftingTables = {
    [1] = {
        name = 'Police Crafting',
        isjob = 'police',
        grades = 'all',
        text = '[E] - Police Craft',
        blip = {
            enabled = true,
            title = 'Police Crafting',
            scale = 1.0,
            display = 4,
            colour = 0,
            id = 365
        },
        location = vec3(459.771423, -989.050537, 24.898926),
        items = {
            [1] = {
                name = 'weapon_pistol',
                amount = 50,
                info = {},
                costs = {
                    ['iron'] = 80,
                    ['metalscrap'] = 70,
                    ['rubber'] = 8,
                    ['steel'] = 60,
                    ['lockpick'] = 5,
                },
                type = 'weapon',
                slot = 1,
                rep = 'attachmentcraftingrep',
                points = 1,
                threshold = 0,
                time = 5500,
                chance = 100
            },
            [2] = {
                name = 'weapon_smg',
                amount = 1,
                info = {},
                costs = {
                    ['iron'] = 80,
                    ['metalscrap'] = 120,
                    ['rubber'] = 10,
                    ['steel'] = 65,
                    ['lockpick'] = 10,
                },
                type = 'weapon',
                slot = 2,
                rep = 'attachmentcraftingrep',
                points = 1,
                threshold = 0,
                time = 8500,
                chance = 100
            },
            [3] = {
                name = 'weapon_carbinerifle',
                amount = 1,
                info = {},
                costs = {
                    ['iron'] = 120,
                    ['metalscrap'] = 120,
                    ['rubber'] = 20,
                    ['steel'] = 90,
                    ['lockpick'] = 14,
                },
                type = 'weapon',
                slot = 3,
                rep = 'craftingrep',
                points = 2,
                threshold = 0,
                time = 12000,
                chance = 100
            }
        }
    },
    [2] = {
        name = 'Attachment Crafting',
        isjob = false,
        grades = 'all',
        text = '[E] - Craft Attachment',
        blip = {
            enabled = true,
            title = 'Attachment Crafting',
            scale = 1.0,
            display = 4,
            colour = 0,
            id = 365
        },
        location = vec3(90.303299, 3745.503418, 39.771484),
        items = {
            [1] = {
                name = 'pistol_extendedclip',
                amount = 50,
                info = {},
                costs = {
                    ['metalscrap'] = 140,
                    ['steel'] = 250,
                    ['rubber'] = 60,
                },
                type = 'item',
                slot = 1,
                rep = 'attachmentcraftingrep',
                points = 1,
                threshold = 0,
                time = 8000,
                chance = 90
            },
            [2] = {
                name = 'pistol_suppressor',
                amount = 50,
                info = {},
                costs = {
                    ['metalscrap'] = 165,
                    ['steel'] = 285,
                    ['rubber'] = 75,
                },
                type = 'item',
                slot = 2,
                rep = 'attachmentcraftingrep',
                points = 1,
                threshold = 0,
                time = 8000,
                chance = 90
            },
        }
    },
    -- Continue with the same structure for the other Crafting Tables...
}

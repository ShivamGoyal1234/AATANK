--[[
    Vending Machine Configuration
    This section allows you to configure vending machines, including the item categories
    they offer, specific items within each category, and the models of vending machines used.

    Main elements:
    - `Config.VendingMachines`: Defines categories of items available in vending machines and 
      specifies each item within those categories.
    - `Config.Vendings`: Lists the vending machine models in the game world and assigns each 
      to a specific item category, enabling targeted interaction based on machine type.
]]

Config.VendingMachines = {
    ['drinks'] = { -- Category: Drinks
        ['Label'] = 'Drinks',
        ['Items'] = {
            [1] = {
                ['name'] = 'kurkakola',    -- Item name (as it appears in inventory system)
                ['price'] = 4,            -- Price of the item
                ['amount'] = 50,          -- Available stock for each machine reset or refill
                ['info'] = {},            -- Additional info, usually empty unless specific details required
                ['type'] = 'item',        -- Type of entry, typically 'item' for consumables
                ['slot'] = 1              -- Slot in the vending menu
            },
            [2] = {
                ['name'] = 'water_bottle',
                ['price'] = 4,
                ['amount'] = 50,
                ['info'] = {},
                ['type'] = 'item',
                ['slot'] = 2
            },
        }
    },
    ['candy'] = { -- Category: Candy
        ['Label'] = 'Candy',
        ['Items'] = {
            [1] = {
                ['name'] = 'chocolate',    -- Item name for candy machine
                ['price'] = 4,
                ['amount'] = 50,
                ['info'] = {},
                ['type'] = 'item',
                ['slot'] = 1
            },
        }
    },
    ['coffee'] = { -- Category: Coffee
        ['Label'] = 'Coffee',
        ['Items'] = {
            [1] = {
                ['name'] = 'coffee',       -- Coffee item for coffee vending machines
                ['price'] = 4,
                ['amount'] = 50,
                ['info'] = {},
                ['type'] = 'item',
                ['slot'] = 1
            },
        }
    },
    ['water'] = { -- Category: Water
        ['Label'] = 'Water',
        ['Items'] = {
            [1] = {
                ['name'] = 'water_bottle', -- Water bottle available in water machines
                ['price'] = 4,
                ['amount'] = 50,
                ['info'] = {},
                ['type'] = 'item',
                ['slot'] = 1
            },
        }
    },
}

Config.Vendings = {
    [1] = {
        ['Model'] = 'prop_vend_coffe_01', -- Prop model for coffee vending machine
        ['Category'] = 'coffee',          -- Linked to coffee items in Config.VendingMachines
    },
    [2] = {
        ['Model'] = 'prop_vend_water_01', -- Model for water vending machine
        ['Category'] = 'water',           -- Linked to water items
    },
    [3] = {
        ['Model'] = 'prop_watercooler',   -- Model for standard water cooler
        ['Category'] = 'water',           -- Also linked to water category
    },
    [4] = {
        ['Model'] = 'prop_watercooler_Dark', -- Model for a darker water cooler variant
        ['Category'] = 'water',               -- Linked to water items as well
    },
    [5] = {
        ['Model'] = 'prop_vend_snak_01',      -- Model for snack vending machine
        ['Category'] = 'candy',               -- Linked to candy items
    },
    [6] = {
        ['Model'] = 'prop_vend_snak_01_tu',   -- Another variant of the snack machine
        ['Category'] = 'candy',               -- Also uses candy items
    },
    [7] = {
        ['Model'] = 'prop_vend_fridge01',     -- Model for fridge vending machine
        ['Category'] = 'drinks',              -- Linked to drink items
    },
    [8] = {
        ['Model'] = 'prop_vend_soda_01',      -- Soda vending machine model 1
        ['Category'] = 'drinks',              -- Linked to drinks
    },
    [9] = {
        ['Model'] = 'prop_vend_soda_02',      -- Soda vending machine model 2
        ['Category'] = 'drinks'               -- Linked to drinks category
    },
}

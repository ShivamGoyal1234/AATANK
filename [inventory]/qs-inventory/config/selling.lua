--[[ 
    Welcome to the Seller Settings Configuration!
    This section allows you to configure the in-game store items, 
    prices, and related settings. It includes options for item 
    selling and a vending system, as well as customizable blip 
    settings for each store location.

    To configure each store:
    - Define unique stores with specific items and prices.
    - Set up blips that make stores visible on the map with 
      customizable icons, names, and account types for payments.
]]

Config.SellItems = {
    ['Seller item'] = { -- Store configuration for an in-game seller NPC
        coords = vec3(2682.7588, 3284.8857, 55.2103), -- Location of the seller on the map
        blip = { -- Blip settings for marking the seller location on the map
            active = true, -- Enables or disables the blip visibility
            name = 'Seller', -- Name displayed on the blip icon
            sprite = 89, -- Icon type for the blip
            color = 1, -- Color setting for the blip icon
            scale = 0.5, -- Size scale of the blip icon
            account = 'money' -- Account type associated with purchases (e.g., 'money', 'bank')
        },
        items = { -- Items available for sale in this store
            {
                name = 'sandwich', -- Name of the item in the store
                price = 3, -- Sale price per item
                amount = 1, -- Number of items available in this slot
                info = {}, -- Additional information or metadata for the item
                type = 'item', -- Type of inventory entity ('item' or 'weapon')
                slot = 1 -- Position slot for this item in the store's inventory
            },
            {
                name = 'tosti',
                price = 2,
                amount = 1,
                info = {},
                type = 'item',
                slot = 2
            },
            {
                name = 'water_bottle',
                price = 2,
                amount = 1,
                info = {},
                type = 'item',
                slot = 3
            },
        }
    },
    ['24/7'] = { -- Another store configuration, labeled '24/7'
        coords = vec3(2679.9326, 3276.6897, 54.4058),
        blip = { 
            active = true,
            name = '24/7 Store',
            sprite = 89,
            color = 1,
            scale = 0.5,
            account = 'money'
        },
        items = { 
            {
                name = 'tosti',
                price = 1,
                amount = 1,
                info = {},
                type = 'item',
                slot = 1
            },
        }
    }
}

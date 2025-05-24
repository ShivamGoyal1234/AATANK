--[[
    Welcome to the Garbage Settings Configuration!
    In this section, you’ll find settings related to garbage cans and their loot items. Each item listed
    under Config.GarbageItemsForProp will appear randomly when interacting with a garbage can, providing
    an immersive experience where players can search for random loot.

    **Config.GarbageObjects**:
    - This list contains object names used to represent garbage cans across the map.
    - These objects are registered for targeting. If your server doesn’t use targeting, feel free to ignore this.

    **Config.GarbageItemsForProp**:
    - This configuration maps specific garbage can models to lootable items.
    - Each object (like 'prop_dumpster_02a') has defined slots and random item possibilities.
    - The items assigned to each garbage object spawn with variable amounts, as set in each item’s configuration.
    - Adjust min and max amounts per item as desired to tailor gameplay rewards.
]]

Config.GarbageItems = {}

Config.GarbageObjects = {
    'prop_dumpster_02a',     -- Standard dumpster
    'prop_dumpster_4b',      -- Large blue dumpster
    'prop_dumpster_4a',      -- Large green dumpster
    'prop_dumpster_3a',      -- Smaller gray dumpster
    'prop_dumpster_02b',     -- Alternate dumpster model
    'prop_dumpster_01a'      -- Basic dumpster model
}

Config.GarbageItemsForProp = {
    [joaat('prop_dumpster_02a')] = {
        label = 'Garbage',    -- Label shown to players when interacting
        slots = 30,           -- Number of item slots available in the dumpster
        items = {
            [1] = {
                [1] = {
                    name = 'aluminum',      -- Item name: aluminum scrap
                    amount = {
                        min = 1,           -- Minimum amount spawned per search
                        max = 5            -- Maximum amount spawned per search
                    },
                    info = {},              -- Additional item information
                    type = 'item',          -- Type of loot (e.g., 'item' or 'weapon')
                    slot = 1,               -- Slot position within the garbage inventory
                },
                [2] = {
                    name = 'metalscrap',    -- Item name: metal scrap
                    amount = {
                        min = 1,           -- Minimum amount spawned per search
                        max = 5            -- Maximum amount spawned per search
                    },
                    info = {},              -- Additional item information
                    type = 'item',          -- Type of loot (e.g., 'item' or 'weapon')
                    slot = 2,               -- Slot position within the garbage inventory
                },
            },
            [2] = {
                [1] = {
                    name = 'iron',
                    amount = {
                        min = 1,
                        max = 5
                    },
                    info = {},
                    type = 'item',
                    slot = 1,
                },
                [2] = {
                    name = 'steel',
                    amount = {
                        min = 1,
                        max = 5
                    },
                    info = {},
                    type = 'item',
                    slot = 2,
                },
            },
        }
    },
    [joaat('prop_dumpster_4b')] = {
        label = 'Garbage',
        slots = 30,
        items = {
            [1] = {
                [1] = {
                    name = 'aluminum',
                    amount = {
                        min = 1,
                        max = 5
                    },
                    info = {},
                    type = 'item',
                    slot = 1,
                },
                [2] = {
                    name = 'plastic',
                    amount = {
                        min = 1,
                        max = 5
                    },
                    info = {},
                    type = 'item',
                    slot = 2,
                },
            },
            [2] = {
                [1] = {
                    name = 'plastic',
                    amount = {
                        min = 1,
                        max = 5
                    },
                    info = {},
                    type = 'item',
                    slot = 1,
                },
                [2] = {
                    name = 'metalscrap',
                    amount = {
                        min = 1,
                        max = 5
                    },
                    info = {},
                    type = 'item',
                    slot = 2,
                },
            },
        }
    },
    [joaat('prop_dumpster_4a')] = {
        label = 'Garbage',
        slots = 30,
        items = {
            [1] = {
                [1] = {
                    name = 'aluminum',
                    amount = {
                        min = 1,
                        max = 5
                    },
                    info = {},
                    type = 'item',
                    slot = 1,
                },
                [2] = {
                    name = 'metalscrap',
                    amount = {
                        min = 1,
                        max = 5
                    },
                    info = {},
                    type = 'item',
                    slot = 2,
                },
            },
            [2] = {
                [1] = {
                    name = 'glass',
                    amount = {
                        min = 1,
                        max = 5
                    },
                    info = {},
                    type = 'item',
                    slot = 1,
                },
                [2] = {
                    name = 'joint',
                    amount = {
                        min = 1,
                        max = 5
                    },
                    info = {},
                    type = 'item',
                    slot = 2,
                },
            },
        }
    },
    [joaat('prop_dumpster_3a')] = {
        label = 'Garbage',
        slots = 30,
        items = {
            [1] = {
                [1] = {
                    name = 'aluminum',
                    amount = {
                        min = 1,
                        max = 5
                    },
                    info = {},
                    type = 'item',
                    slot = 1,
                },
                [2] = {
                    name = 'lighter',
                    amount = {
                        min = 1,
                        max = 5
                    },
                    info = {},
                    type = 'item',
                    slot = 2,
                },
            },
            [2] = {
                [1] = {
                    name = 'metalscrap',
                    amount = {
                        min = 1,
                        max = 5
                    },
                    info = {},
                    type = 'item',
                    slot = 1,
                },
                [2] = {
                    name = 'rubber',
                    amount = {
                        min = 1,
                        max = 5
                    },
                    info = {},
                    type = 'item',
                    slot = 2,
                },
            },
        }
    },
    [joaat('prop_dumpster_02b')] = {
        label = 'Garbage',
        slots = 30,
        items = {
            [1] = {
                [1] = {
                    name = 'metalscrap',
                    amount = {
                        min = 1,
                        max = 5
                    },
                    info = {},
                    type = 'item',
                    slot = 1,
                },
                [2] = {
                    name = 'rubber',
                    amount = {
                        min = 1,
                        max = 5
                    },
                    info = {},
                    type = 'item',
                    slot = 2,
                },
            },
            [2] = {
                [1] = {
                    name = 'iron',
                    amount = {
                        min = 1,
                        max = 5
                    },
                    info = {},
                    type = 'item',
                    slot = 1,
                },
                [2] = {
                    name = 'steel',
                    amount = {
                        min = 1,
                        max = 5
                    },
                    info = {},
                    type = 'item',
                    slot = 2,
                },
            },
        }
    },
    [joaat('prop_dumpster_01a')] = {
        label = 'Garbage',
        slots = 30,
        items = {
            [1] = {
                [1] = {
                    name = 'plastic',
                    amount = {
                        min = 1,
                        max = 5
                    },
                    info = {},
                    type = 'item',
                    slot = 1,
                },
                [2] = {
                    name = 'metalscrap',
                    amount = {
                        min = 1,
                        max = 5
                    },
                    info = {},
                    type = 'item',
                    slot = 2,
                },
            },
            [2] = {
                [1] = {
                    name = 'lighter',
                    amount = {
                        min = 1,
                        max = 5
                    },
                    info = {},
                    type = 'item',
                    slot = 1,
                },
                [2] = {
                    name = 'metalscrap',
                    amount = {
                        min = 1,
                        max = 5
                    },
                    info = {},
                    type = 'item',
                    slot = 2,
                },
            },
        }
    },
}

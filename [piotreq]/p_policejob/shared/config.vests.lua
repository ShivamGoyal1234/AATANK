Config.Vests = {}

Config.Vests.Items = {
    ['vest_normal'] = {
        armourAmount = 10, -- this item will add 10% to player armout
        maxAmount = 50, -- you can add max 50% from this item
        useable = true, -- if true progress bar will show up
        usingTime = 5000, -- 5 seconds
        usingAnim = {dict = 'clothingshirt', clip = 'try_shirt_positive_d', flag = 49},
        disableControls = {move = false, car = true, combat = true} -- while using item
    },
    ['vest_strong'] = {
        armourAmount = 25, -- this item will add 10% to player armout
        maxAmount = 100, -- you can add max 50% from this item
        useable = true, -- if true progress bar will show up
        usingTime = 5000, -- 5 seconds
        usingAnim = {dict = 'clothingshirt', clip = 'try_shirt_positive_d', flag = 49},
        disableControls = {move = false, car = true, combat = true} -- while using item
    },
}

-- WHEN YOU ADDING NEW ITEM HERE YOU NEED TO CREATE NEW ITEM IN OX_INVENTORY/DATA/ITEMS.LUA LIKE BELOW
-- ['change_item_name'] = {
--     label = 'CHANGE LABEL',
--     weight = 3000,
--     stack = false,
--     consume = 1,
--     client = {
--         export = 'p_policejob.item_name_here' -- CHANGE item_name_here to item name!
--     }
-- },
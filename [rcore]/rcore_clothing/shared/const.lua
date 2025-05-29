-------------------------------------------------------------------------------------------
-- 👉 To find more about this file, please refer to the documentation:
-- 📙 https://documentation.rcore.cz/paid-resources/rcore_clothing/configs/shop_configs
-------------------------------------------------------------------------------------------

-- SHOP_STRUCTURE contains different categories that can be shown in a shop
-- Here is an example of a shop structure:
-- config = {
--     structure = {
--          [SHOP_STRUCTURE.OUTFITS_PERSONAL] = true,
--          [SHOP_STRUCTURE.OUTFITS_SHOP] = true,
--          [SHOP_STRUCTURE.CLOTHING_TOP_LAYER] = true,
--     }
-- }
SHOP_STRUCTURE = {
    OUTFITS_PERSONAL = "my_outfits",
    OUTFITS_SHOP = "global_outfits",
    CHAR_PED_SELECT = 'ped_select',
    CHAR_HEADBLEND = "headblend",
    CHAR_NONFREEMODE_HEAD = "nonfreemode_head",
    CHAR_FACE_FEATURES = "face_features",
    CHAR_BLEMISH = "headOverlay_0",
    CHAR_AGE = "headOverlay_3",
    CHAR_COMPLEXION = "headOverlay_6",
    CHAR_SUN_TAN = "headOverlay_7",
    CHAR_MOLES = "headOverlay_9",
    CHAR_BODY_BLEMISH = "headOverlay_11",
    CHAR_EYE_COLOR = "eye_color",
    HAIR_HAIR = "hair",
    HAIR_BEARD = "headOverlay_1",
    HAIR_EYEBROWS = "headOverlay_2",
    HAIR_CHEST = "headOverlay_10",
    MAKEUP_MAKEUP = "headOverlay_4",
    MAKEUP_BLUSH = "headOverlay_5",
    MAKEUP_LIPSTICK = "headOverlay_8",
    CLOTHING_TOP_LAYER = "top_layer",
    CLOTHING_UNDERSHIRT = "undershirt",
    CLOTHING_ARMS = "arms",
    CLOTHING_GLOVES = "gloves",
    CLOTHING_VESTS = "vests",
    CLOTHING_PANTS = "pants",
    CLOTHING_SHOES = "shoes",
    CLOTHING_MASKS = "masks",
    CLOTHING_HATS = "hats",
    CLOTHING_NECK = "neck",
    CLOTHING_DECALS = "decals",
    CLOTHING_EYEGLASSES = "eyeglasses",
    CLOTHING_EARRINGS = "earrings",
    CLOTHING_BAGS = 'bags',
    CLOTHING_LEFT_ARM = "left_arm",
    CLOTHING_RIGHT_ARM = "right_arm",
}


-- SHOP_MODIFIERS is a table that contains predefined shop modifiers
-- example of a shop with a modifier:
-- config = {
--     modifiers = {
--         [SHOP_MODIFIERS.IS_EVERYTHING_FREE] = true,
--      }
-- }
SHOP_MODIFIERS = {
    ALLOW_ALL_PEDS = "ALLOW_ALL_PEDS",
    IS_EVERYTHING_FREE = "IS_EVERYTHING_FREE",
    CHANGING_ROOM = "CHANGING_ROOM",
    HAS_EVERYTHING = "HAS_EVERYTHING",
    ID_MODE_HAS_EVERYTHING = "ID_MODE_HAS_EVERYTHING",
    DISABLE_OUTFIT_SAVING = "DISABLE_OUTFIT_SAVING",
    CAN_NOT_BE_CLOSED = "CAN_NOT_BE_CLOSED",
    JOB_CHANGING_ROOM = "JOB_CHANGING_ROOM",
    DISABLE_ID_ONLY_MODE_BUTTON = "DISABLE_ID_ONLY_MODE_BUTTON",
}


-- SHOP_CONFIG_ALIAS is a table that contains predefined shop structures
-- it is used to simplify the process of defining shop structures
-- Here is an example of a shop utilizing SHOP_CONFIG_ALIAS:
-- config = SHOP_CONFIG_ALIAS.BARBER

SHOP_CONFIG_ALIAS = {
    BARBER = {
        structure = {
            [SHOP_STRUCTURE.HAIR_HAIR] = true,
            [SHOP_STRUCTURE.HAIR_BEARD] = true,
            [SHOP_STRUCTURE.HAIR_EYEBROWS] = true,
            [SHOP_STRUCTURE.HAIR_CHEST] = true,
            [SHOP_STRUCTURE.MAKEUP_MAKEUP] = true,
            [SHOP_STRUCTURE.MAKEUP_BLUSH] = true,
            [SHOP_STRUCTURE.MAKEUP_LIPSTICK] = true,
        }
    },
    CLOTHING = {
        structure = {
            [SHOP_STRUCTURE.OUTFITS_PERSONAL] = true,
            [SHOP_STRUCTURE.OUTFITS_SHOP] = true,
            [SHOP_STRUCTURE.CLOTHING_TOP_LAYER] = true,
            [SHOP_STRUCTURE.CLOTHING_UNDERSHIRT] = true,
            [SHOP_STRUCTURE.CLOTHING_ARMS] = true,
            [SHOP_STRUCTURE.CLOTHING_GLOVES] = true,
            [SHOP_STRUCTURE.CLOTHING_VESTS] = true,
            [SHOP_STRUCTURE.CLOTHING_PANTS] = true,
            [SHOP_STRUCTURE.CLOTHING_SHOES] = true,
            [SHOP_STRUCTURE.CLOTHING_MASKS] = true,
            [SHOP_STRUCTURE.CLOTHING_HATS] = true,
            [SHOP_STRUCTURE.CLOTHING_NECK] = true,
            [SHOP_STRUCTURE.CLOTHING_DECALS] = true,
            [SHOP_STRUCTURE.CLOTHING_EYEGLASSES] = true,
            [SHOP_STRUCTURE.CLOTHING_BAGS] = true,
            [SHOP_STRUCTURE.CLOTHING_EARRINGS] = true,
            [SHOP_STRUCTURE.CLOTHING_LEFT_ARM] = true,
            [SHOP_STRUCTURE.CLOTHING_RIGHT_ARM] = true,
        }
    },
    PLASTIC_SURGEON = {
        structure = {
            [SHOP_STRUCTURE.CHAR_PED_SELECT] = true,
            [SHOP_STRUCTURE.CHAR_HEADBLEND] = true,
            [SHOP_STRUCTURE.CHAR_FACE_FEATURES] = true,
            [SHOP_STRUCTURE.CHAR_BLEMISH] = true,
            [SHOP_STRUCTURE.CHAR_AGE] = true,
            [SHOP_STRUCTURE.CHAR_COMPLEXION] = true,
            [SHOP_STRUCTURE.CHAR_SUN_TAN] = true,
            [SHOP_STRUCTURE.CHAR_MOLES] = true,
            [SHOP_STRUCTURE.CHAR_BODY_BLEMISH] = true,
            [SHOP_STRUCTURE.CHAR_EYE_COLOR] = true,
        }
    },
}


-- ❗ Don't change anything below this line
Permissions = {
    USE_ADMIN_MODE = "general.use_admin_mode",
    ADMIN_STOCK_MANAGEMENT = "admin.stock_management",
    ADMIN_EDIT_METADATA = "admin.edit_metadata",
    ADMIN_EDIT_ARMS = "admin.edit_arms",
    ADMIN_OUTFIT_EDITOR = "admin.outfit_editor",
    ADMIN_IMAGE_DEBUG = "admin.image_debug",

    TOGGLE_ID_ONLY_MODE = "general.toggle_id_only_mode",
}

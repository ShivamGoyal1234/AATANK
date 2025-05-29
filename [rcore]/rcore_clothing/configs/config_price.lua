Config.GlobalPriceMultiplier = 1.0
Config.ShopMultiplier = {
    binco = 1.0,
    suburban = 5.0,
    ponsonbys = 15.0,
    ammunation = 4.0,
    beach_masks = 4.0,
    vangelico = 30.0,

    -- used when shop is not found
    -- or for items shared across all shops
    -- like undershirts, neckwear, earrings, ...
    default = 1.0,
}
Config.EverythingEverywhereIsFree = false -- Make everything free in all shops

-- If you want players to pay for character features change, configure prices here
-- Example: For hair change, people should pay 1000 in your currency, set it like this:
-- `[SHOP_STRUCTURE.HAIR_HAIR] = 1000,`
-- These changes still respect EverythingEverywhereIsFree and shop modifiers thus it will still be free in /skin and char creator,
-- but paid in all other shops, like barbershop, plastic surgeon etc.
Config.CharFeaturesPrices = {
    [SHOP_STRUCTURE.CHAR_PED_SELECT] = 0,
    [SHOP_STRUCTURE.CHAR_HEADBLEND] = 0,
    [SHOP_STRUCTURE.CHAR_NONFREEMODE_HEAD] = 0,
    [SHOP_STRUCTURE.CHAR_FACE_FEATURES] = 0,
    [SHOP_STRUCTURE.CHAR_BLEMISH] = 0,
    [SHOP_STRUCTURE.CHAR_AGE] = 0,
    [SHOP_STRUCTURE.CHAR_COMPLEXION] = 0,
    [SHOP_STRUCTURE.CHAR_SUN_TAN] = 0,
    [SHOP_STRUCTURE.CHAR_MOLES] = 0,
    [SHOP_STRUCTURE.CHAR_BODY_BLEMISH] = 0,
    [SHOP_STRUCTURE.CHAR_EYE_COLOR] = 0,
    [SHOP_STRUCTURE.HAIR_HAIR] = 0,
    [SHOP_STRUCTURE.HAIR_BEARD] = 0,
    [SHOP_STRUCTURE.HAIR_EYEBROWS] = 0,
    [SHOP_STRUCTURE.HAIR_CHEST] = 0,
    [SHOP_STRUCTURE.MAKEUP_MAKEUP] = 0,
    [SHOP_STRUCTURE.MAKEUP_BLUSH] = 0,
    [SHOP_STRUCTURE.MAKEUP_LIPSTICK] = 0,
}
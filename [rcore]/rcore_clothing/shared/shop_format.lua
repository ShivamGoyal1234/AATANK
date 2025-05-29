local EMPTY_ITEMS_FOR_CATEGORY_ID

local PED_MODEL = {
    MALE = 1885233650,
    FEMALE = -1667301416,
}

Citizen.CreateThread(function()
    if not Config.UnsetCards then
        Config.UnsetCards = {
            [`mp_m_freemode_01`] = {
                mask = '1_-1_0', -- component 1
                pants = '1724446270', -- component 4
                bag = '5_-1_0', -- component 5
                shoes = '130513036', -- component 6
                neckwear = '7_0_0', -- component 7
                undershirt = '8_15_0', -- component 8
                vest = '9_0_0', -- component 9
                decal = '10_0_0', -- component 10
                torso = '11_15_0', -- component 11
        
            },
            [`mp_f_freemode_01`] = {
                mask = '1_-1_0', -- component 1
                pants = '1667217362', -- component 4
                bag = '5_-1_0', -- component 5
                shoes = '747250516', -- component 6
                neckwear = '7_0_0', -- component 7
                undershirt = '8_15_0', -- component 8
                vest = '9_0_0', -- component 9
                decal = '10_0_0', -- component 10
                torso = '11_15_0', -- component 11
            },
        }
    end
end)

function GetEmptyItemsForCategoryId(categoryId, pedModel)
    if pedModel and pedModel == PED_MODEL.FEMALE then
        return EMPTY_ITEMS_FOR_CATEGORY_ID[PED_MODEL.FEMALE][categoryId]
    else
        return EMPTY_ITEMS_FOR_CATEGORY_ID[PED_MODEL.MALE][categoryId]
    end
end

----------------------
--- VEST
----------------------

function GetEmptyVestMale()
    return {
        type = 'clothing_item',
        id = 22534,
        label = _U("unset_item"),
        price = nil,
        drawable_id = 0,
        texture_id = 0,
        image = nil,
        colors = '',
        category = '',
        name_hash = Config.UnsetCards[`mp_m_freemode_01`].vest,
        component_id = 9,
        isUnset = true,
        decal_collection_hash = nil,
        decal_name_hash = nil,
    }
end

function GetEmptyVestFemale()
    return {
        type = 'clothing_item',
        id = 42026,
        label = _U("unset_item"),
        price = nil,
        drawable_id = 0,
        texture_id = 0,
        image = nil,
        colors = '',
        category = '',
        name_hash = Config.UnsetCards[`mp_f_freemode_01`].vest,
        component_id = 9,
        isUnset = true,
        decal_collection_hash = nil,
        decal_name_hash = nil,
    }
end

function GetEmptyVest(pedModel)
    if pedModel and pedModel == PED_MODEL.FEMALE then
        return GetEmptyVestFemale()
    else
        return GetEmptyVestMale()
    end
end

----------------------
--- TORSO
----------------------

function GetEmptyTorsoMale()
    return {
        type = 'clothing_item',
        id = -11,
        label = _U("unset_item"),
        price = nil,
        drawable_id = 15,
        texture_id = 0,
        image = nil,
        colors = '',
        category = '',
        name_hash = Config.UnsetCards[`mp_m_freemode_01`].torso,
        component_id = 11,
        isUnset = true,
        decal_collection_hash = nil,
        decal_name_hash = nil,
        recommended_arms = 'nondlcgta5--3--15--0',
    }
end

function GetEmptyTorsoFemale()
    return {
        type = 'clothing_item',
        id = -11,
        label = _U("unset_item"),
        price = nil,
        drawable_id = 15,
        texture_id = 0,
        image = nil,
        colors = '',
        category = '',
        name_hash = Config.UnsetCards[`mp_f_freemode_01`].torso,
        component_id = 11,
        isUnset = true,
        decal_collection_hash = nil,
        decal_name_hash = nil,
        recommended_arms = 'nondlcgta5--3--15--0',
    }
end

function GetEmptyTorso(pedModel)
    if pedModel and pedModel == PED_MODEL.FEMALE then
        return GetEmptyTorsoFemale()
    else
        return GetEmptyTorsoMale()
    end
end

----------------------
--- NECKWEAR
----------------------

function GetEmptyNeckwear()
    return {
        name_hash = Config.UnsetCards[`mp_m_freemode_01`].neckwear,
        component_id = 7,
        drawable_id = 0,
        texture_id = 0,
        type = 'clothing_item',
        id = -7,
        label = _U("unset_item"),
        price = nil,
        image = nil,
        colors = '',
        category = '',
        isUnset = true,
        decal_collection_hash = nil,
        decal_name_hash = nil,
    }
end

----------------------
--- UNDERSHIRT
----------------------

function GetEmptyUndershirtMale()
    return {
        type = 'clothing_item',
        id = -8,
        label = _U("unset_item"),
        price = nil,
        drawable_id = 15,
        texture_id = 0,
        image = nil,
        colors = '',
        category = '',
        name_hash = Config.UnsetCards[`mp_m_freemode_01`].undershirt,
        component_id = 8,
        isUnset = true,
        decal_collection_hash = nil,
        decal_name_hash = nil,
    }
end

function GetEmptyUndershirtFemale()
    return {
        type = 'clothing_item',
        id = -8,
        label = _U("unset_item"),
        price = nil,
        drawable_id = 15,
        texture_id = 0,
        image = nil,
        colors = '',
        category = '',
        name_hash = Config.UnsetCards[`mp_f_freemode_01`].undershirt,
        component_id = 8,
        isUnset = true,
        decal_collection_hash = nil,
        decal_name_hash = nil,
    }
end

function GetEmptyUndershirt(pedModel)
    if pedModel and pedModel == PED_MODEL.FEMALE then
        return GetEmptyUndershirtFemale()
    else
        return GetEmptyUndershirtMale()
    end
end

----------------------
--- PANTS
----------------------

function GetEmptyPantsMale()
    return {
        type = 'clothing_item',
        id = 22534,
        label = _U("unset_item"),
        price = nil,
        drawable_id = 61,
        texture_id = 2,
        image = nil,
        colors = '',
        category = '',
        name_hash = Config.UnsetCards[`mp_m_freemode_01`].pants,
        component_id = 4,
        isUnset = true,
        decal_collection_hash = nil,
        decal_name_hash = nil,
    }
end

function GetEmptyPantsFemale()
    return {
        type = 'clothing_item',
        id = 42026,
        label = _U("unset_item"),
        price = nil,
        drawable_id = 17,
        texture_id = 0,
        image = nil,
        colors = '',
        category = '',
        name_hash = Config.UnsetCards[`mp_f_freemode_01`].pants,
        component_id = 4,
        isUnset = true,
        decal_collection_hash = nil,
        decal_name_hash = nil,
    }
end

function GetEmptyPants(pedModel)
    if pedModel and pedModel == PED_MODEL.FEMALE then
        return GetEmptyPantsFemale()
    else
        return GetEmptyPantsMale()
    end
end

----------------------
--- SHOES
----------------------

function GetEmptyShoesMale()
    return {
        type = 'clothing_item',
        id = 25097,
        label = _U("unset_item"),
        price = nil,
        drawable_id = 34,
        texture_id = 0,
        image = nil,
        colors = '',
        category = '',
        name_hash = Config.UnsetCards[`mp_m_freemode_01`].shoes,
        component_id = 6,
        isUnset = true,
        decal_collection_hash = nil,
        decal_name_hash = nil,
    }
end

function GetEmptyShoesFemale()
    return {
        type = 'clothing_item',
        id = 44968,
        label = _U("unset_item"),
        price = nil,
        drawable_id = 35,
        texture_id = 0,
        image = nil,
        colors = '',
        category = '',
        name_hash = Config.UnsetCards[`mp_f_freemode_01`].shoes,
        component_id = 6,
        isUnset = true,
        decal_collection_hash = nil,
        decal_name_hash = nil,
    }
end

function GetEmptyShoes(pedModel)
    if pedModel and pedModel == PED_MODEL.FEMALE then
        return GetEmptyShoesFemale()
    else
        return GetEmptyShoesMale()
    end
end

----------------------
--- HAT
----------------------

function GetEmptyHat()
    return {
        type = 'clothing_item',
        id = -100,
        label = _U("unset_item"),
        price = nil,
        drawable_id = -1,
        texture_id = 0,
        image = nil,
        colors = '',
        category = '',
        name_hash = '100_-1_0',
        component_id = 100,
        isUnset = true,
        decal_collection_hash = nil,
        decal_name_hash = nil,
    }
end

----------------------
--- BRACELET
----------------------

function GetEmptyBracelet()
    return {
        type = 'clothing_item',
        id = -107,
        label = _U("unset_item"),
        price = nil,
        drawable_id = -1,
        texture_id = 0,
        image = nil,
        colors = '',
        category = '',
        name_hash = '107_-1_0',
        component_id = 107,
        isUnset = true,
        decal_collection_hash = nil,
        decal_name_hash = nil,
    }
end

----------------------
--- WATCHES
----------------------

function GetEmptyWatches()
    return {
        type = 'clothing_item',
        id = -106,
        label = _U("unset_item"),
        price = nil,
        drawable_id = -1,
        texture_id = 0,
        image = nil,
        colors = '',
        category = '',
        name_hash = '106_-1_0',
        component_id = 106,
        isUnset = true,
        decal_collection_hash = nil,
        decal_name_hash = nil,
    }
end

----------------------
--- EARS
----------------------

function GetEmptyEars()
    return {
        type = 'clothing_item',
        id = -102,
        label = _U("unset_item"),
        price = nil,
        drawable_id = -1,
        texture_id = 0,
        image = nil,
        colors = '',
        category = '',
        name_hash = '102_-1_0',
        component_id = 102,
        isUnset = true,
        decal_collection_hash = nil,
        decal_name_hash = nil,
    }
end

----------------------
--- GLASSES
----------------------

function GetEmptyGlasses()
    return {
        type = 'clothing_item',
        id = -101,
        label = _U("unset_item"),
        price = nil,
        drawable_id = -1,
        texture_id = 0,
        image = nil,
        colors = '',
        category = '',
        name_hash = '101_-1_0',
        component_id = 101,
        isUnset = true,
        decal_collection_hash = nil,
        decal_name_hash = nil,
    }
end

----------------------
--- MASK
----------------------
function GetEmptyMask()
    return {
        type = 'clothing_item',
        id = -1,
        label = _U("unset_item"),
        price = nil,
        drawable_id = -1,
        texture_id = 0,
        image = nil,
        colors = '',
        category = '',
        name_hash = Config.UnsetCards[`mp_m_freemode_01`].mask,
        component_id = 1,
        isUnset = true,
        decal_collection_hash = nil,
        decal_name_hash = nil,
    }
end

----------------------
--- OTHER
----------------------

function GetEmptyDecals()
    return {
        type = 'clothing_item',
        id = -10,
        label = _U("unset_item"),
        price = nil,
        drawable_id = 0,
        texture_id = 0,
        image = nil,
        colors = '',
        category = '',
        name_hash = Config.UnsetCards[`mp_m_freemode_01`].decal,
        component_id = 10,
        isUnset = true,
        decal_collection_hash = nil,
        decal_name_hash = nil,
    }
end

function GetEmptyBagMale()
    return {
        type = 'clothing_item',
        id = -5,
        label = _U("unset_item"),
        price = nil,
        drawable_id = -1,
        texture_id = 0,
        image = nil,
        colors = '',
        category = '',
        name_hash = Config.UnsetCards[`mp_m_freemode_01`].bag,
        component_id = 5,
        isUnset = true,
        decal_collection_hash = nil,
        decal_name_hash = nil,
    }
end

function GetEmptyBagFemale()
    return {
        type = 'clothing_item',
        id = -5,
        label = _U("unset_item"),
        price = nil,
        drawable_id = -1,
        texture_id = 0,
        image = nil,
        colors = '',
        category = '',
        name_hash = Config.UnsetCards[`mp_f_freemode_01`].bag,
        component_id = 5,
        isUnset = true,
        decal_collection_hash = nil,
        decal_name_hash = nil,
    }
end

function GetEmptyBag(pedModel)
    if pedModel and pedModel == PED_MODEL.FEMALE then
        return GetEmptyBagFemale()
    else
        return GetEmptyBagMale()
    end
end

function FormatClothingItem(showEverything, item, shopName)
    
    local inShop = false

    if not showEverything then
        inShop = true
    else
        inShop = formatInShop(item.in_shop)
    end

    return {
        type = 'clothing_item',
        id = item.id,
        label = item.label,
        price = item.custom_price or CalculateItemPrice(item.id, shopName, item.component_id, item.drawable_id, item.type, item.price),
        drawable_id = item.drawable_id,
        texture_id = item.texture_id,
        image = item.image_url,
        colors = item.colors,
        category = item.type,
        name_hash = item.name_hash,
        component_id = item.component_id,
        decal_collection_hash = item.decal_collection_hash,
        decal_name_hash = item.decal_name_hash,
        recommended_arms = item.recommended_arms,
        in_shop = inShop,
        is_blacklisted = item.is_blacklisted,
        jobs = item.jobs,
        identifiers = item.identifiers,
    }
end

function formatInShop(inShop)
    if inShop == 1 then
        return true
    end

    if inShop == true then
        return true
    end

    return false
end

local function getEmptyItemsForBodyPart(pedModel)
    return {
        head = {
            GetEmptyHat(),
            GetEmptyGlasses(),
            GetEmptyEars(),
            GetEmptyNeckwear(),
            GetEmptyMask(),
        },
        torso = {
            GetEmptyTorso(pedModel),
            GetEmptyUndershirt(pedModel),
            GetEmptyNeckwear(),
            GetEmptyDecals(),
            GetEmptyBag(pedModel);
            GetEmptyVest(pedModel),
        },
        all = {
            GetEmptyHat(),
            GetEmptyGlasses(),
            GetEmptyEars(),
            GetEmptyNeckwear(),
            GetEmptyMask(),
            GetEmptyTorso(pedModel),
            GetEmptyUndershirt(pedModel),
            GetEmptyBracelet(),
            GetEmptyWatches(),
            GetEmptyPants(pedModel),
            GetEmptyShoes(pedModel),
            GetEmptyDecals(),
            GetEmptyBag(pedModel),
            GetEmptyVest(pedModel),
        }
    }
end

local EMPTY_ITEMS_FOR_BODY_PART = nil

Citizen.CreateThread(function()
    EMPTY_ITEMS_FOR_BODY_PART = {
        [PED_MODEL.MALE] = getEmptyItemsForBodyPart(PED_MODEL.MALE),
        [PED_MODEL.FEMALE] = getEmptyItemsForBodyPart(PED_MODEL.FEMALE),
    }
end)

local function getEmptyItemsForCategoryIdConst(pedModel)
    return {
        face_features = EMPTY_ITEMS_FOR_BODY_PART[pedModel].head,
        headblend = EMPTY_ITEMS_FOR_BODY_PART[pedModel].head,
        hair = EMPTY_ITEMS_FOR_BODY_PART[pedModel].head,
        headOverlay_0 = EMPTY_ITEMS_FOR_BODY_PART[pedModel].head,
        headOverlay_1 = EMPTY_ITEMS_FOR_BODY_PART[pedModel].head,
        headOverlay_2 = EMPTY_ITEMS_FOR_BODY_PART[pedModel].head,
        headOverlay_3 = EMPTY_ITEMS_FOR_BODY_PART[pedModel].head,
        headOverlay_4 = EMPTY_ITEMS_FOR_BODY_PART[pedModel].head,
        headOverlay_5 = EMPTY_ITEMS_FOR_BODY_PART[pedModel].head,
        headOverlay_6 = EMPTY_ITEMS_FOR_BODY_PART[pedModel].head,
        headOverlay_7 = EMPTY_ITEMS_FOR_BODY_PART[pedModel].head,
        headOverlay_8 = EMPTY_ITEMS_FOR_BODY_PART[pedModel].head,
        headOverlay_9 = EMPTY_ITEMS_FOR_BODY_PART[pedModel].head,
        headOverlay_10 = EMPTY_ITEMS_FOR_BODY_PART[pedModel].torso,
        headOverlay_11 = EMPTY_ITEMS_FOR_BODY_PART[pedModel].torso,
        eye_color = EMPTY_ITEMS_FOR_BODY_PART[pedModel].head,
        ped_select = EMPTY_ITEMS_FOR_BODY_PART[pedModel].all,
    }
end


EMPTY_ITEMS_FOR_CATEGORY_ID = nil

Citizen.CreateThread(function()
    EMPTY_ITEMS_FOR_CATEGORY_ID = {
        [PED_MODEL.MALE] = getEmptyItemsForCategoryIdConst(PED_MODEL.MALE),
        [PED_MODEL.FEMALE] = getEmptyItemsForCategoryIdConst(PED_MODEL.FEMALE),
    }
end)

function MakeIndexedObjectSafeForFrontend(obj)
    local safeObj = {}
    
    if not obj or type(obj) ~= "table" then
        return safeObj
    end

    for i, v in pairs(obj) do
        safeObj[i] = v
    end
    safeObj[-1] = "IGNORE_THIS_INDEX"

    return safeObj
end
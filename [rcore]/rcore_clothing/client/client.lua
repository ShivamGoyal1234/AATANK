PlayerPed = PlayerPedId()

CreateThread(function()
    while true do
        Wait(500)
        PlayerPed = PlayerPedId()
    end
end)

RegisterNetEvent('rcore_clothing:openCharCreator', function()
    local start = GetGameTimer()

    if Config.CharCreatorWaitForCollisions then
        while not HasCollisionLoadedAroundEntity(PlayerPedId()) and (GetGameTimer() - start) < 5000 do
            Wait(0)
        end

        if not HasCollisionLoadedAroundEntity(PlayerPedId()) then
            print("Collision around player has still not loaded")
        end
    end

    if Config.CharCreatorApplyRandom then
        ApplyCharCreatorRandomness(PlayerPedId())
    end

    local charCreatorModifiers = {
        [SHOP_MODIFIERS.ALLOW_ALL_PEDS] = Config.CharCreatorHasAllPeds or false,
        [SHOP_MODIFIERS.IS_EVERYTHING_FREE] = true,
        [SHOP_MODIFIERS.CAN_NOT_BE_CLOSED] = true,
        [SHOP_MODIFIERS.DISABLE_OUTFIT_SAVING] = true,
    }

    if Config.CharCreatorHasEverything then
        charCreatorModifiers[SHOP_MODIFIERS.HAS_EVERYTHING] = true
    end

    RequestOpenClothingShopUI('CHARCREATOR', {
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
            [SHOP_STRUCTURE.HAIR_HAIR] = true,
            [SHOP_STRUCTURE.HAIR_BEARD] = true,
            [SHOP_STRUCTURE.HAIR_EYEBROWS] = true,
            [SHOP_STRUCTURE.HAIR_CHEST] = true,
            [SHOP_STRUCTURE.MAKEUP_MAKEUP] = true,
            [SHOP_STRUCTURE.MAKEUP_BLUSH] = true,
            [SHOP_STRUCTURE.MAKEUP_LIPSTICK] = true,
            [SHOP_STRUCTURE.CLOTHING_TOP_LAYER] = true,
            [SHOP_STRUCTURE.CLOTHING_UNDERSHIRT] = true,
            [SHOP_STRUCTURE.CLOTHING_ARMS] = true,
            [SHOP_STRUCTURE.CLOTHING_GLOVES] = true,
            [SHOP_STRUCTURE.CLOTHING_VESTS] = true,
            [SHOP_STRUCTURE.CLOTHING_PANTS] = true,
            [SHOP_STRUCTURE.CLOTHING_SHOES] = true,
            [SHOP_STRUCTURE.CLOTHING_MASKS] = true,
            [SHOP_STRUCTURE.CLOTHING_HATS] = true,
            [SHOP_STRUCTURE.CLOTHING_EYEGLASSES] = true,
            [SHOP_STRUCTURE.CLOTHING_EARRINGS] = true,
            [SHOP_STRUCTURE.CLOTHING_LEFT_ARM] = true,
            [SHOP_STRUCTURE.CLOTHING_RIGHT_ARM] = true,
            [SHOP_STRUCTURE.CLOTHING_NECK] = true,
            [SHOP_STRUCTURE.CLOTHING_BAGS] = true,
            [SHOP_STRUCTURE.CLOTHING_DECALS] = true,
        },
        modifiers = charCreatorModifiers
    })
end)

AddEventHandler('rcore_clothing:openChangingRoom', function()
    RequestOpenClothingShopUI('changingroom', {
        structure = {
            [SHOP_STRUCTURE.OUTFITS_PERSONAL] = true,
            [SHOP_STRUCTURE.CLOTHING_TOP_LAYER] = true,
            [SHOP_STRUCTURE.CLOTHING_UNDERSHIRT] = true,
            [SHOP_STRUCTURE.CLOTHING_ARMS] = true,
            [SHOP_STRUCTURE.CLOTHING_GLOVES] = true,
            [SHOP_STRUCTURE.CLOTHING_VESTS] = true,
            [SHOP_STRUCTURE.CLOTHING_PANTS] = true,
            [SHOP_STRUCTURE.CLOTHING_SHOES] = true,
            [SHOP_STRUCTURE.CLOTHING_MASKS] = true,
            [SHOP_STRUCTURE.CLOTHING_HATS] = true,
            [SHOP_STRUCTURE.CLOTHING_EYEGLASSES] = true,
            [SHOP_STRUCTURE.CLOTHING_EARRINGS] = true,
            [SHOP_STRUCTURE.CLOTHING_LEFT_ARM] = true,
            [SHOP_STRUCTURE.CLOTHING_RIGHT_ARM] = true,
            [SHOP_STRUCTURE.CLOTHING_NECK] = true,
        },
        modifiers = {
            [SHOP_MODIFIERS.CHANGING_ROOM] = true,
            [SHOP_MODIFIERS.IS_EVERYTHING_FREE] = true,
            [SHOP_MODIFIERS.DISABLE_ID_ONLY_MODE_BUTTON] = true,
        }
    })
end)

AddEventHandler('rcore_clothing:openClothingShopWithEverythingAndFree', function()
    RequestOpenClothingShopUI('UNUSED', {
        structure = {
        },
        modifiers = {
            [SHOP_MODIFIERS.ALLOW_ALL_PEDS] = true,
            [SHOP_MODIFIERS.IS_EVERYTHING_FREE] = true,
            [SHOP_MODIFIERS.HAS_EVERYTHING] = true,
        }
    })
end)

function ResolveModelFromGender(gender)
    if gender == 0 then
        return "mp_m_freemode_01"
    end

    if gender == 1 then
        return "mp_f_freemode_01"
    end

    print("Unknown gender", gender)

    return "mp_m_freemode_01"
end

RegisterNetEvent('rcore_clothing:openSkinMenu', function()
    RequestOpenClothingShopUI('SKIN_MENU', {
        structure = {
            -- [SHOP_STRUCTURE.CLOTHING_TOP_LAYER] = true,
        },
        modifiers = {
            [SHOP_MODIFIERS.HAS_EVERYTHING] = true,
            [SHOP_MODIFIERS.IS_EVERYTHING_FREE] = true,
            [SHOP_MODIFIERS.ALLOW_ALL_PEDS] = true,
        }
    })
end)

local function doesExportExistInResource(resourceName, exportName)
    local status, _ = xpcall(function()
        local _ = exports[resourceName][exportName]
    end, debug.traceback)
    return status
end


AddEventHandler('rcore_clothing:onClothingShopOpened', function()
    if GetResourceState('qs-inventory') == 'started' then
        if doesExportExistInResource("qs-inventory", "setInClothing") then
            exports['qs-inventory']:setInClothing(true)
        else
            TriggerEvent("__cfx_export_qs-inventory_SetInClothing", true)
        end
    end
end)

AddEventHandler('rcore_clothing:onClothingShopClosed', function()
    if GetResourceState('qs-inventory') == 'started' then
        if doesExportExistInResource("qs-inventory", "setInClothing") then
            exports['qs-inventory']:setInClothing(false)
        else
            TriggerEvent("__cfx_export_qs-inventory_SetInClothing", false)
        end
    end
end)

local randomColors = {
    0, 1, 2,3,4,5,6,7,8,9
}

function ApplyCharCreatorRandomness(ped)
    if IsPedFreemode(ped) then
        local savedSkin = GetSkinByIdentifier(-1)

        if HasNoSavedSkin(savedSkin) then
            SetPedHeadBlendData(ped, math.random(0, 15), math.random(21, 30), 0, 0, 0, 0, 0.0, 0.0, 0.0, false)

            SetPedComponentVariation(ped, 2, math.random(1, 5), 0, GetPedPaletteVariation(ped, 2))

            local col = randomColors[math.random(1, #randomColors)]
            SetPedHairColor(PlayerPedId(), col, col)

            for i = 0, 19 do
                SetPedFaceFeature(ped, i, math.random(-10, 10) / 100)
            end

            SetPedHeadOverlay(ped, 2, math.random(1, 5), 1.0)
            SetPedHeadOverlayColor(ped, 2, 1, col, col)

            TriggerEvent('rcore_clothing:saveCurrentSkin')
        else
            ApplyPlayerClothingOnSpawn(savedSkin.ped_model, savedSkin.skin, false)
            ShopInit(PlayerPedId())
        end
    end
end

function HasNoSavedSkin(skinData)

    if not skinData then
        return true
    end

    local skin = skinData.skin

    if not skin then
        return true
    end

    if skin.components then
        return false
    end

    if skin.headblend then
        return false
    end

    if skin.props then
        return false
    end

    if skin.hair then
        return false
    end

    if skin.faceFeatures then
        return false
    end

    if skin.headOverlay then
        return false
    end

    return true
end

local function drawText(x, y, text, scale, color)
	SetTextFont(0)
	SetTextColour(table.unpack(color or {255, 255, 255, 255}))
	SetTextScale(0.0, scale and 0.4*scale or 0.4)
    SetTextProportional(1)
    SetTextEdge(2, 0, 0, 0, 150)
    SetTextOutline()
    
    SetTextDropShadow()
    
    SetTextCentre(1)
	BeginTextCommandDisplayText('STRING')
	AddTextComponentString(tostring(text))
	EndTextCommandDisplayText(x, y)
end


local isDrawingPhotosWarning = false

function StartDrawingPhotosWarning()
    if isDrawingPhotosWarning then
        return
    end

    isDrawingPhotosWarning = true
    
    while isDrawingPhotosWarning do
        drawText(0.5, 0.01, "THIS IS AN ADMIN-ONLY MESSAGE", 0.6)
        drawText(0.5, 0.03, "rcore_clothing_for_photos is running.", 1.0, {255, 100, 100, 255})
        drawText(0.5, 0.06, "If you are not doing or planning to do the addon photo steps now,", 0.6)
        drawText(0.5, 0.08, "please stop the resource, remove it from server.cfg and restart", 0.6)
        drawText(0.5, 0.10, "the game to prevent any unexpected crashes or bugged faces.", 0.6)
        Wait(0)
    end
end

function StopDrawingPhotosWarning()
    isDrawingPhotosWarning = false
end

RegisterNetEvent('rcore_clothing:drawPhotosWarning', StartDrawingPhotosWarning)
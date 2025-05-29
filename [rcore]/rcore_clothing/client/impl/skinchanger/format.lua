local function formatFullHeadOverlay(ped, tbl, id, prefix)
    local retval, overlayValue, colourType, firstColour, secondColour, overlayOpacity = GetPedHeadOverlayData(ped, id)

    if overlayValue ~= -1 then
        tbl[prefix .. '_1'] = overlayValue
        tbl[prefix .. '_2'] = tonumber(math.ceil(overlayOpacity * 10))
        tbl[prefix .. '_3'] = firstColour
        tbl[prefix .. '_4'] = secondColour
    end
end

local function formatSimpleHeadOverlay(ped, tbl, id, prefix)
    local retval, overlayValue, colourType, firstColour, secondColour, overlayOpacity = GetPedHeadOverlayData(ped, id)

    if overlayValue ~= -1 then
        tbl[prefix .. '_1'] = overlayValue
        tbl[prefix .. '_2'] = tonumber(math.ceil(overlayOpacity * 10))
    end
end

function PedToSkinchanger()
    local ped = PlayerPedId()

    local char = {}

    char['sex'] = GetEntityModel(ped) == `mp_m_freemode_01` and 0 or 1

    local hb = GetFormattedPedHeadblendData(ped)
    char['face'] = hb[1]
    char['skin'] = hb[4]

    char['mom'] = hb[1]
    char['dad'] = hb[2]
    char['face_md_weight'] = tonumber(math.ceil(hb[7] * 100))
    char['skin_md_weight'] = tonumber(math.ceil(hb[8] * 100))


    char['rc_maleModel'] = hb[1]
    char['rc_femaleModel'] = hb[2]
    char['rc_maleTone'] = hb[4]
    char['rc_femaleTone'] = hb[5]
    char['rc_modelBlend'] = hb[7]
    char['rc_toneBlend'] = hb[8]
    char['rcore_export'] = true

    local hairCol = GetPedHairColor(ped)
    local hairHighlight = GetPedHairHighlightColor(ped)
    char['hair_color_1'] = hairCol
    char['hair_color_2'] = hairHighlight

    char['eye_color'] = GetPedEyeColor(ped)

    formatFullHeadOverlay  (ped, char, 0, 'blemishes')
    formatFullHeadOverlay  (ped, char, 1, 'beard')
    formatFullHeadOverlay  (ped, char, 2, 'eyebrows')
    formatSimpleHeadOverlay(ped, char, 3, 'age')
    formatFullHeadOverlay  (ped, char, 4, 'makeup')
    formatFullHeadOverlay  (ped, char, 5, 'blush')
    formatSimpleHeadOverlay(ped, char, 6, 'complexion')
    formatSimpleHeadOverlay(ped, char, 7, 'sun')
    formatFullHeadOverlay  (ped, char, 8, 'lipstick')
    formatSimpleHeadOverlay(ped, char, 9, 'moles')
    formatFullHeadOverlay  (ped, char, 10, 'chest')
    formatSimpleHeadOverlay(ped, char, 11, 'bodyb')
    formatSimpleHeadOverlay(ped, char, 12, 'add_bodyb')
    char['bodyb_3'] = char['add_bodyb_1']
    char['bodyb_4'] = char['add_bodyb_2']

    char['add_bodyb_1'] = nil
    char['add_bodyb_2'] = nil

    char['hair_1'] = GetPedDrawableVariation(ped, 2)
    char['hair_2'] = GetPedTextureVariation(ped, 2)
    char['tshirt_1'] = GetPedDrawableVariation(ped, 8)
    char['tshirt_2'] = GetPedTextureVariation(ped, 8)
    char['torso_1'] = GetPedDrawableVariation(ped, 11)
    char['torso_2'] = GetPedTextureVariation(ped, 11)
    char['arms'] = GetPedDrawableVariation(ped, 3)
    char['arms_2'] = GetPedTextureVariation(ped, 3)
    char['decals_1'] = GetPedDrawableVariation(ped, 10)
    char['decals_2'] = GetPedTextureVariation(ped, 10)
    char['pants_1'] = GetPedDrawableVariation(ped, 4)
    char['pants_2'] = GetPedTextureVariation(ped, 4)
    char['shoes_1'] = GetPedDrawableVariation(ped, 6)
    char['shoes_2'] = GetPedTextureVariation(ped, 6)
    char['mask_1'] = GetPedDrawableVariation(ped, 1)
    char['mask_2'] = GetPedTextureVariation(ped, 1)
    char['bproof_1'] = GetPedDrawableVariation(ped, 9)
    char['bproof_2'] = GetPedTextureVariation(ped, 9)
    char['chain_1'] = GetPedDrawableVariation(ped, 7)
    char['chain_2'] = GetPedTextureVariation(ped, 7)
    char['bags_1'] = GetPedDrawableVariation(ped, 5)
    char['bags_2'] = GetPedTextureVariation(ped, 5)


    char['helmet_1'] = GetPedPropIndex(ped, 0)
    char['helmet_2'] = GetPedPropTextureIndex(ped, 0)
    char['glasses_1'] = GetPedPropIndex(ped, 1)
    char['glasses_2'] = GetPedPropTextureIndex(ped, 1)
    char['ears_1'] = GetPedPropIndex(ped, 2)
    char['ears_2'] = GetPedPropTextureIndex(ped, 2)
    char['watches_1'] = GetPedPropIndex(ped, 6)
    char['watches_2'] = GetPedPropTextureIndex(ped, 6)
    char['bracelets_1'] = GetPedPropIndex(ped, 7)
    char['bracelets_2'] = GetPedPropTextureIndex(ped, 7)
    char['model'] = GetEntityModel(ped)

    char['nose_1'] = tonumber(math.ceil(GetPedFaceFeature(ped, 0)*10))
    char['nose_2'] = tonumber(math.ceil(GetPedFaceFeature(ped, 1)*10))
    char['nose_3'] = tonumber(math.ceil(GetPedFaceFeature(ped, 2)*10))
    char['nose_4'] = tonumber(math.ceil(GetPedFaceFeature(ped, 3)*10))
    char['nose_5'] = tonumber(math.ceil(GetPedFaceFeature(ped, 4)*10))
    char['nose_6'] = tonumber(math.ceil(GetPedFaceFeature(ped, 5)*10))
    char['eyebrows_5'] = tonumber(math.ceil(GetPedFaceFeature(ped, 6)*10))
    char['eyebrows_6'] = tonumber(math.ceil(GetPedFaceFeature(ped, 7)*10))
    char['cheeks_1'] = tonumber(math.ceil(GetPedFaceFeature(ped, 8)*10))
    char['cheeks_2'] = tonumber(math.ceil(GetPedFaceFeature(ped, 9)*10))
    char['cheeks_3'] = tonumber(math.ceil(GetPedFaceFeature(ped, 10)*10))
    char['eye_squint'] = tonumber(math.ceil(GetPedFaceFeature(ped, 11)*10))
    char['lip_thickness'] = tonumber(math.ceil(GetPedFaceFeature(ped, 12)*10))
    char['jaw_1'] = tonumber(math.ceil(GetPedFaceFeature(ped, 13)*10))
    char['jaw_2'] = tonumber(math.ceil(GetPedFaceFeature(ped, 14)*10))
    char['chin_1'] = tonumber(math.ceil(GetPedFaceFeature(ped, 15)*10))
    char['chin_2'] = tonumber(math.ceil(GetPedFaceFeature(ped, 16)*10))
    char['chin_3'] = tonumber(math.ceil(GetPedFaceFeature(ped, 17)*10))
    char['chin_4'] = tonumber(math.ceil(GetPedFaceFeature(ped, 18)*10))
    char['neck_thickness'] = tonumber(math.ceil(GetPedFaceFeature(ped, 19)*10))

    return char
end

function SkinchangerApplySkin(playerPed, skin)
    local Character = PedToSkinchanger()

    for k, v in pairs(skin) do
        Character[k] = v
    end

    local face_weight = (Character['face_md_weight'] / 100) + 0.0
    local skin_weight = (Character['skin_md_weight'] / 100) + 0.0

    if IsPedFreemode(playerPed) then
        if Character['rcore_export'] then
            SetPedHeadBlendData(
                playerPed,
                Character['rc_maleModel'], Character['rc_femaleModel'], 0,
                Character['rc_maleTone'], Character['rc_femaleTone'], 0,
                Character['rc_modelBlend'], Character['rc_toneBlend'], 0.0, false
            )
        else
            SetPedHeadBlendData(playerPed, Character['mom'], Character['dad'], 0, Character['mom'], Character['dad'], 0,
                face_weight, skin_weight, 0.0, false)
        end
    end

    SetPedFaceFeature(playerPed, 0, (Character['nose_1'] / 10) + 0.0)                                  -- Nose Width
    SetPedFaceFeature(playerPed, 1, (Character['nose_2'] / 10) + 0.0)                                  -- Nose Peak Height
    SetPedFaceFeature(playerPed, 2, (Character['nose_3'] / 10) + 0.0)                                  -- Nose Peak Length
    SetPedFaceFeature(playerPed, 3, (Character['nose_4'] / 10) + 0.0)                                  -- Nose Bone Height
    SetPedFaceFeature(playerPed, 4, (Character['nose_5'] / 10) + 0.0)                                  -- Nose Peak Lowering
    SetPedFaceFeature(playerPed, 5, (Character['nose_6'] / 10) + 0.0)                                  -- Nose Bone Twist
    SetPedFaceFeature(playerPed, 6, (Character['eyebrows_5'] / 10) + 0.0)                              -- Eyebrow height
    SetPedFaceFeature(playerPed, 7, (Character['eyebrows_6'] / 10) + 0.0)                              -- Eyebrow depth
    SetPedFaceFeature(playerPed, 8, (Character['cheeks_1'] / 10) + 0.0)                                -- Cheekbones Height
    SetPedFaceFeature(playerPed, 9, (Character['cheeks_2'] / 10) + 0.0)                                -- Cheekbones Width
    SetPedFaceFeature(playerPed, 10, (Character['cheeks_3'] / 10) + 0.0)                               -- Cheeks Width
    SetPedFaceFeature(playerPed, 11, (Character['eye_squint'] / 10) + 0.0)                             -- Eyes squint
    SetPedFaceFeature(playerPed, 12, (Character['lip_thickness'] / 10) + 0.0)                          -- Lip Fullness
    SetPedFaceFeature(playerPed, 13, (Character['jaw_1'] / 10) + 0.0)                                  -- Jaw Bone Width
    SetPedFaceFeature(playerPed, 14, (Character['jaw_2'] / 10) + 0.0)                                  -- Jaw Bone Length
    SetPedFaceFeature(playerPed, 15, (Character['chin_1'] / 10) + 0.0)                                 -- Chin Height
    SetPedFaceFeature(playerPed, 16, (Character['chin_2'] / 10) + 0.0)                                 -- Chin Length
    SetPedFaceFeature(playerPed, 17, (Character['chin_3'] / 10) + 0.0)                                 -- Chin Width
    SetPedFaceFeature(playerPed, 18, (Character['chin_4'] / 10) + 0.0)                                 -- Chin Hole Size
    SetPedFaceFeature(playerPed, 19, (Character['neck_thickness'] / 10) + 0.0)                         -- Neck Thickness

    SetPedHairColor(playerPed, Character['hair_color_1'], Character['hair_color_2'])                   -- Hair Color
    SetPedHeadOverlay(playerPed, 3, Character['age_1'], (Character['age_2'] / 10) + 0.0)               -- Age + opacity
    SetPedHeadOverlay(playerPed, 0, Character['blemishes_1'], (Character['blemishes_2'] / 10) + 0.0)   -- Blemishes + opacity
    SetPedHeadOverlay(playerPed, 1, Character['beard_1'], (Character['beard_2'] / 10) + 0.0)           -- Beard + opacity
    SetPedEyeColor(playerPed, Character['eye_color'])                                                  -- Eyes color
    SetPedHeadOverlay(playerPed, 2, Character['eyebrows_1'], (Character['eyebrows_2'] / 10) + 0.0)     -- Eyebrows + opacity
    SetPedHeadOverlay(playerPed, 4, Character['makeup_1'], (Character['makeup_2'] / 10) + 0.0)         -- Makeup + opacity
    SetPedHeadOverlay(playerPed, 8, Character['lipstick_1'], (Character['lipstick_2'] / 10) + 0.0)     -- Lipstick + opacity
    SetPedComponentVariation(playerPed, 2, Character['hair_1'], Character['hair_2'], 2)                -- Hair
    SetPedHeadOverlayColor(playerPed, 1, 1, Character['beard_3'], Character['beard_4'])                -- Beard Color
    SetPedHeadOverlayColor(playerPed, 2, 1, Character['eyebrows_3'], Character['eyebrows_4'])          -- Eyebrows Color
    SetPedHeadOverlayColor(playerPed, 4, 2, Character['makeup_3'], Character['makeup_4'])              -- Makeup Color
    SetPedHeadOverlayColor(playerPed, 8, 1, Character['lipstick_3'], Character['lipstick_4'])          -- Lipstick Color
    SetPedHeadOverlay(playerPed, 5, Character['blush_1'], (Character['blush_2'] / 10) + 0.0)           -- Blush + opacity
    SetPedHeadOverlayColor(playerPed, 5, 2, Character['blush_3'])                                      -- Blush Color
    SetPedHeadOverlay(playerPed, 6, Character['complexion_1'], (Character['complexion_2'] / 10) + 0.0) -- Complexion + opacity
    SetPedHeadOverlay(playerPed, 7, Character['sun_1'], (Character['sun_2'] / 10) + 0.0)               -- Sun Damage + opacity
    SetPedHeadOverlay(playerPed, 9, Character['moles_1'], (Character['moles_2'] / 10) + 0.0)           -- Moles/Freckles + opacity
    SetPedHeadOverlay(playerPed, 10, Character['chest_1'], (Character['chest_2'] / 10) + 0.0)          -- Chest Hair + opacity
    SetPedHeadOverlayColor(playerPed, 10, 1, Character['chest_3'])                                     -- Torso Color

    if Character['bodyb_1'] == -1 then
        SetPedHeadOverlay(playerPed, 11, 255, (Character['bodyb_2'] / 10) + 0.0) -- Body Blemishes + opacity
    else
        SetPedHeadOverlay(playerPed, 11, Character['bodyb_1'], (Character['bodyb_2'] / 10) + 0.0)
    end

    if Character['bodyb_3'] == -1 then
        SetPedHeadOverlay(playerPed, 12, 255, (Character['bodyb_4'] / 10) + 0.0)
    else
        SetPedHeadOverlay(playerPed, 12, Character['bodyb_3'], (Character['bodyb_4'] / 10) + 0.0) -- Blemishes 'added body effect' + opacity
    end

    if Character['ears_1'] == -1 then
        ClearPedProp(playerPed, 2)
    else
        SetPedPropIndex(playerPed, 2, Character['ears_1'], Character['ears_2'], 2) -- Ears Accessories
    end

    SetPedComponentVariation(playerPed, 8, Character['tshirt_1'], Character['tshirt_2'], 2)  -- Tshirt
    SetPedComponentVariation(playerPed, 11, Character['torso_1'], Character['torso_2'], 2)   -- torso parts
    SetPedComponentVariation(playerPed, 3, Character['arms'], Character['arms_2'], 2)        -- Arms
    SetPedComponentVariation(playerPed, 10, Character['decals_1'], Character['decals_2'], 2) -- decals
    SetPedComponentVariation(playerPed, 4, Character['pants_1'], Character['pants_2'], 2)    -- pants
    SetPedComponentVariation(playerPed, 6, Character['shoes_1'], Character['shoes_2'], 2)    -- shoes
    SetPedComponentVariation(playerPed, 1, Character['mask_1'], Character['mask_2'], 2)      -- mask
    SetPedComponentVariation(playerPed, 9, Character['bproof_1'], Character['bproof_2'], 2)  -- bulletproof
    SetPedComponentVariation(playerPed, 7, Character['chain_1'], Character['chain_2'], 2)    -- chain
    SetPedComponentVariation(playerPed, 5, Character['bags_1'], Character['bags_2'], 2)      -- Bag

    if Character['helmet_1'] == -1 then
        ClearPedProp(playerPed, 0)
    else
        SetPedPropIndex(playerPed, 0, Character['helmet_1'], Character['helmet_2'], 2) -- Helmet
    end

    if Character['glasses_1'] == -1 then
        ClearPedProp(playerPed, 1)
    else
        SetPedPropIndex(playerPed, 1, Character['glasses_1'], Character['glasses_2'], 2) -- Glasses
    end

    if Character['watches_1'] == -1 then
        ClearPedProp(playerPed, 6)
    else
        SetPedPropIndex(playerPed, 6, Character['watches_1'], Character['watches_2'], 2) -- Watches
    end

    if Character['bracelets_1'] == -1 then
        ClearPedProp(playerPed, 7)
    else
        SetPedPropIndex(playerPed, 7, Character['bracelets_1'], Character['bracelets_2'], 2) -- Bracelets
    end
end





function RcoreoutfitToSkinchangerSkin(outfit, ped)
    if not ped then
        ped = PlayerPedId()
    end

    local char = {
        chin_1 = 0,
        bproof_1 = 0,
        age_1 = 0,
        mask_1 = 0,
        eyebrows_2 = 0,
        glasses_1 = 0,
        eyebrows_5 = 0,
        nose_6 = 0,
        beard_3 = 0,
        hair_color_1 = 0,
        chain_1 = 0,
        shoes_1 = 0,
        decals_1 = 0,
        jaw_1 = 0,
        dad = 0,
        helmet_2 = 0,
        makeup_3 = 0,
        bproof_2 = 0,
        sex = 0,
        cheeks_3 = 0,
        eye_squint = 0,
        lipstick_4 = 0,
        bracelets_1 = -1,
        blemishes_2 = 0,
        shoes_2 = 0,
        bracelets_2 = 0,
        watches_1 = -1,
        watches_2 = 0,
        bags_2 = 0,
        arms = 0,
        ears_2 = 0,
        tshirt_1 = 0,
        nose_2 = 0,
        glasses_2 = 0,
        arms_2 = 0,
        complexion_1 = 0,
        beard_4 = 0,
        cheeks_2 = 0,
        mom = 21,
        lip_thickness = 0,
        eye_color = 0,
        jaw_2 = 0,
        eyebrows_1 = 0,
        bodyb_3 = -1,
        beard_2 = 0,
        nose_3 = 0,
        moles_1 = 0,
        beard_1 = 0,
        hair_color_2 = 0,
        bodyb_1 = -1,
        nose_1 = 0,
        sun_2 = 0,
        sun_1 = 0,
        lipstick_1 = 0,
        blush_3 = 0,
        blush_2 = 0,
        pants_2 = 0,
        chin_2 = 0,
        face_md_weight = 50,
        chest_1 = 0,
        tshirt_2 = 0,
        lipstick_2 = 0,
        chin_4 = 0,
        bodyb_4 = 0,
        makeup_4 = 0,
        chest_2 = 0,
        mask_2 = 0,
        makeup_1 = 0,
        eyebrows_4 = 0,
        blush_1 = 0,
        chin_3 = 0,
        bodyb_2 = 0,
        moles_2 = 0,
        chest_3 = 0,
        makeup_2 = 0,
        blemishes_1 = 0,
        cheeks_1 = 0,
        ears_1 = -1,
        lipstick_3 = 0,
        complexion_2 = 0,
        decals_2 = 0,
        helmet_1 = -1,
        torso_1 = 0,
        hair_2 = 0,
        chain_2 = 0,
        skin_md_weight = 50,
        eyebrows_6 = 0,
        hair_1 = 0,
        eyebrows_3 = 0,
        torso_2 = 0,
        nose_4 = 0,
        age_2 = 0,
        nose_5 = 0,
        neck_thickness = 0,
        pants_1 = 0,
        bags_1 = 0
    }

    if outfit.headblend then
        char['face'] = outfit.headblend.maleModel
        char['skin'] = outfit.headblend.maleTone
        char['mom'] = outfit.headblend.maleModel
        char['mom_2'] = outfit.headblend.maleTone
        char['dad'] = outfit.headblend.femaleModel
        char['dad_2'] = outfit.headblend.femaleTone
        char['face_md_weight'] = outfit.headblend.modelBlend * 100
        char['skin_md_weight'] = outfit.headblend.toneBlend * 100

        char['rc_maleModel'] = outfit.headblend.maleModel
        char['rc_femaleModel'] = outfit.headblend.femaleModel
        char['rc_maleTone'] = outfit.headblend.maleTone
        char['rc_femaleTone'] = outfit.headblend.femaleTone
        char['rc_modelBlend'] = outfit.headblend.modelBlend
        char['rc_toneBlend'] = outfit.headblend.toneBlend

        char['rcore_export'] = true
    end

    char['eye_color'] = outfit.eyeColor

    if outfit.hair then
        local resolvedHair = UsableHashToData(ped, outfit.hair.id)
        char['hair_1'] = resolvedHair.drawableId

        char['hair_color_1'] = outfit.hair.color1
        char['hair_color_2'] = outfit.hair.color2
    end

    if outfit.headOverlay then
        for key, overlay in pairs(outfit.headOverlay) do
            local id = tonumber(key)
            if id == 3 then
                char['age_1'] = overlay.id
                char['age_2'] = overlay.opacity * 10
            elseif id == 1 then
                char['beard_1'] = overlay.id
                char['beard_2'] = overlay.opacity * 10
                char['beard_3'] = overlay.color1
                char['beard_4'] = overlay.color2
            elseif id == 2 then
                char['eyebrows_1'] = overlay.id
                char['eyebrows_2'] = overlay.opacity * 10
                char['eyebrows_3'] = overlay.color1
                char['eyebrows_4'] = overlay.color2
            elseif id == 4 then
                char['makeup_1'] = overlay.id
                char['makeup_2'] = overlay.opacity * 10
                char['makeup_3'] = overlay.color1
                char['makeup_4'] = overlay.color2
            elseif id == 8 then
                char['lipstick_1'] = overlay.id
                char['lipstick_2'] = overlay.opacity * 10
                char['lipstick_3'] = overlay.color1
                char['lipstick_4'] = overlay.color2
            elseif id == 5 then
                char['blush_1'] = overlay.id
                char['blush_2'] = overlay.opacity * 10
                char['blush_3'] = overlay.color1
                char['blush_4'] = overlay.color2
            elseif id == 10 then
                char['chest_1'] = overlay.id
                char['chest_2'] = overlay.opacity * 10
                char['chest_3'] = overlay.color1
                char['chest_4'] = overlay.color2
            elseif id == 6 then
                char['complexion_1'] = overlay.id
                char['complexion_2'] = overlay.opacity * 10
            elseif id == 7 then
                char['sun_1'] = overlay.id
                char['sun_2'] = overlay.opacity * 10
            elseif id == 9 then
                char['moles_1'] = overlay.id
                char['moles_2'] = overlay.opacity * 10
            elseif id == 11 then
                char['bodyb_1'] = overlay.id
                char['bodyb_2'] = overlay.opacity * 10
            end
        end
    end

    if outfit.components then
        for component, value in pairs(outfit.components) do
            local data = UsableHashToData(ped, value)
            
            local id = data.componentId 
            local part1 = data.drawableId
            local part2 = data.textureId

            if id == 8 then
                char['tshirt_1'] = part1
                char['tshirt_2'] = part2
            elseif id == 11 then
                char['torso_1'] = part1
                char['torso_2'] = part2
            elseif id == 3 then
                char['arms'] = part1
                char['arms_2'] = part2
            elseif id == 10 then
                char['decals_1'] = part1
                char['decals_2'] = part2
            elseif id == 4 then
                char['pants_1'] = part1
                char['pants_2'] = part2
            elseif id == 6 then
                char['shoes_1'] = part1
                char['shoes_2'] = part2
            elseif id == 1 then
                char['mask_1'] = part1
                char['mask_2'] = part2
            elseif id == 9 then
                char['bproof_1'] = part1
                char['bproof_2'] = part2
            elseif id == 7 then
                char['chain_1'] = part1
                char['chain_2'] = part2
            elseif id == 5 then
                char['bags_1'] = part1
                char['bags_2'] = part2
            end
        end
    end

    if outfit.props then
        for prop, value in pairs(outfit.props) do
            local data = UsablePropHashToData(ped, value)
            
            local id = data.componentId 
            local part1 = data.drawableId
            local part2 = data.textureId

            if id == 2 then
                char['ears_1'] = part1
                char['ears_2'] = part2
            elseif id == 0 then
                char['helmet_1'] = part1
                char['helmet_2'] = part2
            elseif id == 1 then
                char['glasses_1'] = part1
                char['glasses_2'] = part2
            elseif id == 6 then
                char['watches_1'] = part1
                char['watches_2'] = part2
            elseif id == 7 then
                char['bracelets_1'] = part1
                char['bracelets_2'] = part2
            end
        end
    end
    
    if outfit.faceFeatures then
        if outfit.faceFeatures["0"] then char['nose_1'] = outfit.faceFeatures["0"] * 10 end
        if outfit.faceFeatures["1"] then char['nose_2'] = outfit.faceFeatures["1"] * 10 end
        if outfit.faceFeatures["2"] then char['nose_3'] = outfit.faceFeatures["2"] * 10 end
        if outfit.faceFeatures["3"] then char['nose_4'] = outfit.faceFeatures["3"] * 10 end
        if outfit.faceFeatures["4"] then char['nose_5'] = outfit.faceFeatures["4"] * 10 end
        if outfit.faceFeatures["5"] then char['nose_6'] = outfit.faceFeatures["5"] * 10 end
        if outfit.faceFeatures["6"] then char['eyebrows_5'] = outfit.faceFeatures["6"] * 10 end
        if outfit.faceFeatures["7"] then char['eyebrows_6'] = outfit.faceFeatures["7"] * 10 end
        if outfit.faceFeatures["8"] then char['cheeks_1'] = outfit.faceFeatures["8"] * 10 end
        if outfit.faceFeatures["9"] then char['cheeks_2'] = outfit.faceFeatures["9"] * 10 end
        if outfit.faceFeatures["10"] then char['cheeks_3'] = outfit.faceFeatures["10"] * 10 end
        if outfit.faceFeatures["11"] then char['eye_squint'] = outfit.faceFeatures["11"] * 10 end
        if outfit.faceFeatures["12"] then char['lip_thickness'] = outfit.faceFeatures["12"] * 10 end
        if outfit.faceFeatures["13"] then char['jaw_1'] = outfit.faceFeatures["13"] * 10 end
        if outfit.faceFeatures["14"] then char['jaw_2'] = outfit.faceFeatures["14"] * 10 end
        if outfit.faceFeatures["15"] then char['chin_1'] = outfit.faceFeatures["15"] * 10 end
        if outfit.faceFeatures["16"] then char['chin_2'] = outfit.faceFeatures["16"] * 10 end
        if outfit.faceFeatures["17"] then char['chin_3'] = outfit.faceFeatures["17"] * 10 end
        if outfit.faceFeatures["18"] then char['chin_4'] = outfit.faceFeatures["18"] * 10 end
        if outfit.faceFeatures["19"] then char['neck_thickness'] = outfit.faceFeatures["19"] * 10 end
    end

    return char
end

exports('convertToSkinchangerSkin', RcoreoutfitToSkinchangerSkin)
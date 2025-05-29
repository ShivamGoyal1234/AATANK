function RcoreoutfitToQBCoreSkin(outfit, ped)
    if not ped then ped = PlayerPedId() end

    local skin = {
        ['face'] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
        ['face2'] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
        ['facemix'] = { skinMix = 0, shapeMix = 0, defaultSkinMix = 0.0, defaultShapeMix = 0.0 },
        ['pants'] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
        ['hair'] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
        ['eyebrows'] = { item = -1, texture = 1, defaultItem = -1, defaultTexture = 1 },
        ['beard'] = { item = -1, texture = 1, defaultItem = -1, defaultTexture = 1 },
        ['blush'] = { item = -1, texture = 1, defaultItem = -1, defaultTexture = 1 },
        ['lipstick'] = { item = -1, texture = 1, defaultItem = -1, defaultTexture = 1 },
        ['makeup'] = { item = -1, texture = 1, defaultItem = -1, defaultTexture = 1 },
        ['ageing'] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
        ['arms'] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
        ['t-shirt'] = { item = 1, texture = 0, defaultItem = 1, defaultTexture = 0 },
        ['torso2'] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
        ['vest'] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
        ['bag'] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
        ['shoes'] = { item = 0, texture = 0, defaultItem = 1, defaultTexture = 0 },
        ['mask'] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
        ['hat'] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
        ['glass'] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
        ['ear'] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
        ['watch'] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
        ['bracelet'] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
        ['accessory'] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
        ['decals'] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
        ['eye_color'] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
        ['moles'] = { item = 0, texture = 0, defaultItem = -1, defaultTexture = 0 },
        ['nose_0'] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
        ['nose_1'] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
        ['nose_2'] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
        ['nose_3'] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
        ['nose_4'] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
        ['nose_5'] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
        ['cheek_1'] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
        ['cheek_2'] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
        ['cheek_3'] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
        ['eye_opening'] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
        ['lips_thickness'] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
        ['jaw_bone_width'] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
        ['eyebrown_high'] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
        ['eyebrown_forward'] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
        ['jaw_bone_back_lenght'] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
        ['chimp_bone_lowering'] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
        ['chimp_bone_lenght'] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
        ['chimp_bone_width'] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
        ['chimp_hole'] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
        ['neck_thikness'] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
    }

    if outfit.headblend then
        skin.face.item = outfit.headblend.maleModel
        skin.face2.item = outfit.headblend.femaleModel
        skin.face.texture = outfit.headblend.maleTone
        skin.face2.texture = outfit.headblend.femaleTone
        skin.facemix.shapeMix = outfit.headblend.modelBlend
        skin.facemix.skinMix = outfit.headblend.toneBlend

        skin['rc_maleModel'] = outfit.headblend.maleModel
        skin['rc_femaleModel'] = outfit.headblend.femaleMode
        skin['rc_maleTone'] = outfit.headblend.maleTone
        skin['rc_femaleTone'] = outfit.headblend.femaleTone
        skin['rc_modelBlend'] = outfit.headblend.modelBlend
        skin['rc_toneBlend'] = outfit.headblend.toneBlend
    end

    skin['eye_color'].item = outfit.eye_color

    if outfit.hair then
        local resolvedHair = UsableHashToData(ped, outfit.hair.id)

        skin.hair.item = resolvedHair.drawableId
        skin.hair.texture = outfit.hair.color1
    end

    if outfit.headOverlay then
        for key, overlay in pairs(outfit.headOverlay) do
            local id = tonumber(key)
            if id == 3 then
                skin['ageing'].item = overlay.id
                skin['ageing'].texture = overlay.opacity * 10
            elseif id == 1 then
                skin['beard'].item = overlay.id
                skin['beard'].texture = overlay.color1
            elseif id == 2 then
                skin['eyebrows'].item = overlay.id
                skin['eyebrows'].texture = overlay.color1
            elseif id == 4 then
                skin['makeup'].item = overlay.id
                skin['makeup'].texture = overlay.color1 + 1
            elseif id == 8 then
                skin['lipstick'].item = overlay.id
                skin['lipstick'].texture = overlay.color1
            elseif id == 5 then
                skin['blush'].item = overlay.id
                skin['blush'].texture = overlay.color1
            elseif id == 10 then
                -- ?? no chest hair
            elseif id == 6 then
                -- ?? no complexion
            elseif id == 7 then
                -- ?? no sun tan
            elseif id == 9 then
                -- ?? no moles
            elseif id == 11 then
                -- ?? no body blemish
            end
        end
    end

    if outfit.components then
        for _, value in pairs(outfit.components) do
            local data = UsableHashToData(ped, value)

            local id = data.componentId
            local drawableId = data.drawableId
            local textureId = data.textureId

            if id == 4 then
                skin['pants'].item = drawableId
                skin['pants'].texture = textureId
            elseif id == 6 then
                skin['shoes'].item = drawableId
                skin['shoes'].texture = textureId
            elseif id == 8 then
                skin['t-shirt'].item = drawableId
                skin['t-shirt'].texture = textureId
            elseif id == 11 then
                skin['torso2'].item = drawableId
                skin['torso2'].texture = textureId
            elseif id == 3 then
                skin['arms'].item = drawableId
                skin['arms'].texture = textureId
            elseif id == 9 then
                skin['vest'].item = drawableId
                skin['vest'].texture = textureId
            elseif id == 10 then
                skin['decals'].item = drawableId
                skin['decals'].texture = textureId
            elseif id == 7 then
                skin['accessory'].item = drawableId
                skin['accessory'].texture = textureId
            elseif id == 5 then
                skin['bag'].item = drawableId
                skin['bag'].texture = textureId
            elseif id == 1 then
                skin['mask'].item = drawableId
                skin['mask'].texture = textureId
            end
        end
    end

    if outfit.props then
        for _, value in pairs(outfit.props) do
            local data = UsablePropHashToData(ped, value)

            local id = data.componentId
            local drawableId = data.drawableId
            local textureId = data.textureId

            if id == 0 then
                skin['hat'].item = drawableId
                skin['hat'].texture = textureId
            elseif id == 1 then
                skin['glass'].item = drawableId
                skin['glass'].texture = textureId
            elseif id == 2 then
                skin['ear'].item = drawableId
                skin['ear'].texture = textureId
            elseif id == 6 then
                skin['watch'].item = drawableId
                skin['watch'].texture = textureId
            elseif id == 7 then
                skin['bracelet'].item = drawableId
                skin['bracelet'].texture = textureId
            end
        end
    end

    if outfit.faceFeatures then
        if outfit.faceFeatures["0"] then skin['nose_0'].item = outfit.faceFeatures["0"] * 10 end
        if outfit.faceFeatures["1"] then skin['nose_1'].item = outfit.faceFeatures["1"] * 10 end
        if outfit.faceFeatures["2"] then skin['nose_2'].item = outfit.faceFeatures["2"] * 10 end
        if outfit.faceFeatures["3"] then skin['nose_3'].item = outfit.faceFeatures["3"] * 10 end
        if outfit.faceFeatures["4"] then skin['nose_4'].item = outfit.faceFeatures["4"] * 10 end
        if outfit.faceFeatures["5"] then skin['nose_5'].item = outfit.faceFeatures["5"] * 10 end
        if outfit.faceFeatures["6"] then skin['eyebrown_high'].item = outfit.faceFeatures["6"] * 10 end
        if outfit.faceFeatures["7"] then skin['eyebrown_forward'].item = outfit.faceFeatures["7"] * 10 end
        if outfit.faceFeatures["8"] then skin['cheek_1'].item = outfit.faceFeatures["8"] * 10 end
        if outfit.faceFeatures["9"] then skin['cheek_2'].item = outfit.faceFeatures["9"] * 10 end
        if outfit.faceFeatures["10"] then skin['cheek_3'].item = outfit.faceFeatures["10"] * 10 end
        if outfit.faceFeatures["11"] then skin['eye_opening'].item = outfit.faceFeatures["11"] * 10 end
        if outfit.faceFeatures["12"] then skin['lips_thickness'].item = outfit.faceFeatures["12"] * 10 end
        if outfit.faceFeatures["13"] then skin['jaw_bone_width'].item = outfit.faceFeatures["13"] * 10 end
        if outfit.faceFeatures["14"] then skin['jaw_bone_back_lenght'].item = outfit.faceFeatures["14"] * 10 end
        if outfit.faceFeatures["15"] then skin['chimp_bone_lowering'].item = outfit.faceFeatures["15"] * 10 end
        if outfit.faceFeatures["16"] then skin['chimp_bone_lenght'].item = outfit.faceFeatures["16"] * 10 end
        if outfit.faceFeatures["17"] then skin['chimp_bone_width'].item = outfit.faceFeatures["17"] * 10 end
        if outfit.faceFeatures["18"] then skin['chimp_hole'].item = outfit.faceFeatures["18"] * 10 end
        if outfit.faceFeatures["19"] then skin['neck_thikness'].item = outfit.faceFeatures["19"] * 10 end
    end

    return skin
end

local function formatHeadOverlay(ped, data, id, key) 
    local retval, overlayValue, colourType, firstColour, secondColour, overlayOpacity = GetPedHeadOverlayData(ped, id)

    data[key] = {
        item = overlayValue,
        texture = firstColour,
    }
end

function GetPedQBCoreSkin()
    local ped = PlayerPedId()

    local data = {}

    local hb = GetFormattedPedHeadblendData(ped)

    data.face = {
        item = hb[1],
        texture = hb[4]
    }
    data.face2 = {
        item = hb[2],
        texture = hb[5]
    }
    data.facemix = {
        shapeMix = hb[7],
        skinMix = hb[8]
    }

    data.pants = {
        item = GetPedDrawableVariation(ped, 4),
        texture = GetPedTextureVariation(ped, 4)
    }

    data.hair = {
        item = GetPedDrawableVariation(ped, 2),
        texture = GetPedHairColor(ped),
    }


    -- Eyebrows
    formatHeadOverlay(ped, data, 2, "eyebrows")

    -- Beard
    formatHeadOverlay(ped, data, 1, "beard")

    -- Blush
    formatHeadOverlay(ped, data, 5, "blush")

    -- Lipstick
    formatHeadOverlay(ped, data, 8, "lipstick")

    -- Makeup
    formatHeadOverlay(ped, data, 4, "makeup")

    -- Ageing
    
    formatHeadOverlay(ped, data, 3, "ageing")

    
    formatHeadOverlay(ped, data, 9, "moles")

    -- Arms
    data.arms = {
        item = GetPedDrawableVariation(ped, 3),
        texture = GetPedTextureVariation(ped, 3)
    }

    -- T-Shirt
    data["t-shirt"] = {
        item = GetPedDrawableVariation(ped, 8),
        texture = GetPedTextureVariation(ped, 8)
    }

    -- Vest
    data.vest = {
        item = GetPedDrawableVariation(ped, 9),
        texture = GetPedTextureVariation(ped, 9)
    }

    -- Torso 2
    data.torso2 = {
        item = GetPedDrawableVariation(ped, 11),
        texture = GetPedTextureVariation(ped, 11)
    }

    -- Shoes
    data.shoes = {
        item = GetPedDrawableVariation(ped, 6),
        texture = GetPedTextureVariation(ped, 6)
    }

    -- Mask
    data.mask = {
        item = GetPedDrawableVariation(ped, 1),
        texture = GetPedTextureVariation(ped, 1)
    }

    -- Badge
    data.decals = {
        item = GetPedDrawableVariation(ped, 10),
        texture = GetPedTextureVariation(ped, 10)
    }

    -- Accessory
    data.accessory = {
        item = GetPedDrawableVariation(ped, 7),
        texture = GetPedTextureVariation(ped, 7)
    }

    -- Bag
    data.bag = {
        item = GetPedDrawableVariation(ped, 5),
        texture = GetPedTextureVariation(ped, 5)
    }


    -- Eye Color
    data.eye_color = {
        item = GetPedEyeColor(ped),
    }


    data.nose_0 = {
        item = GetPedFaceFeature(ped, 0)
    }

    data.nose_1 = {
        item = GetPedFaceFeature(ped, 1)
    }

    data.nose_2 = {
        item = GetPedFaceFeature(ped, 2)
    }

    data.nose_3 = {
        item = GetPedFaceFeature(ped, 3)
    }

    data.nose_4 = {
        item = GetPedFaceFeature(ped, 4)
    }

    data.nose_5 = {
        item = GetPedFaceFeature(ped, 5)
    }

    data.eyebrown_high = {
        item = GetPedFaceFeature(ped, 6)
    }

    data.eyebrown_forward = {
        item = GetPedFaceFeature(ped, 7)
    }

    data.cheek_1 = {
        item = GetPedFaceFeature(ped, 8)
    }

    data.cheek_2 = {
        item = GetPedFaceFeature(ped, 9)
    }

    data.cheek_3 = {
        item = GetPedFaceFeature(ped, 10)
    }

    data.eye_opening = {
        item = GetPedFaceFeature(ped, 11)
    }

    data.lips_thickness = {
        item = GetPedFaceFeature(ped, 12)
    }

    data.jaw_bone_width = {
        item = GetPedFaceFeature(ped, 13)
    }

    data.jaw_bone_back_lenght = {
        item = GetPedFaceFeature(ped, 14)
    }

    data.chimp_bone_lowering = {
        item = GetPedFaceFeature(ped, 15)
    }

    data.chimp_bone_lenght = {
        item = GetPedFaceFeature(ped, 16)
    }

    data.chimp_bone_width = {
        item = GetPedFaceFeature(ped, 17)
    }

    data.chimp_hole = {
        item = GetPedFaceFeature(ped, 18)
    }

    data.neck_thikness = {
        item = GetPedFaceFeature(ped, 19)
    }



    

    -- Hat
    data.hat = {
        item = GetPedPropIndex(ped, 0),
        texture = GetPedPropTextureIndex(ped, 0)
    }

    -- Glass
    data.glass = {
        item = GetPedPropIndex(ped, 1),
        texture = GetPedPropTextureIndex(ped, 1)
    }

    -- Ear
    data.ear = {
        item = GetPedPropIndex(ped, 2),
        texture = GetPedPropTextureIndex(ped, 2)
    }

    -- Watch
    data.watch = {
        item = GetPedPropIndex(ped, 6),
        texture = GetPedPropTextureIndex(ped, 6)
    }

    -- Bracelet
    data.bracelet = {
        item = GetPedPropIndex(ped, 7),
        texture = GetPedPropTextureIndex(ped, 7)
    }

    return data
end

exports('convertToQbClothingSkin', RcoreoutfitToQBCoreSkin)

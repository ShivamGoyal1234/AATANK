-- {
--     "id": 1,
--     "citizenid": "db83440ad0f50049e0db82cbca456b49e88491f0",
--     "outfitname": "illenium",
--     "model": "mp_m_freemode_01",
--     "props": '[{"drawable":-1,"prop_id":0,"texture":-1},{"drawable":5,"prop_id":1,"texture":5},{"drawable":-1,"prop_id":2,"texture":-1},{"drawable":-1,"prop_id":6,"texture":-1},{"drawable":-1,"prop_id":7,"texture":-1}]',
--     "components": '[{"drawable":0,"texture":0,"component_id":0},{"drawable":0,"texture":0,"component_id":1},{"drawable":0,"texture":0,"component_id":2},{"drawable":20,"texture":0,"component_id":3},{"drawable":28,"texture":0,"component_id":4},{"drawable":0,"texture":0,"component_id":5},{"drawable":20,"texture":0,"component_id":6},{"drawable":0,"texture":0,"component_id":7},{"drawable":76,"texture":0,"component_id":8},{"drawable":0,"texture":0,"component_id":9},{"drawable":0,"texture":0,"component_id":10},{"drawable":194,"texture":0,"component_id":11}]'
--   }

-- llenium skin:
-- {
--     "model": "mp_m_freemode_01",
--     "headOverlays": {
--       "blemishes": { "secondColor": 0, "color": 0, "opacity": 0, "style": 0 },
--       "blush": { "secondColor": 0, "color": 0, "opacity": 0, "style": 0 },
--       "sunDamage": { "secondColor": 0, "color": 0, "opacity": 0, "style": 0 },
--       "makeUp": { "secondColor": 0, "color": 0, "opacity": 0, "style": 0 },
--       "chestHair": { "secondColor": 0, "color": 0, "opacity": 0, "style": 0 },
--       "moleAndFreckles": {
--         "secondColor": 0,
--         "color": 0,
--         "opacity": 0,
--         "style": 0
--       },
--       "beard": { "secondColor": 0, "color": 0, "opacity": 0, "style": 0 },
--       "ageing": { "secondColor": 0, "color": 0, "opacity": 0, "style": 0 },
--       "eyebrows": { "secondColor": 0, "color": 0, "opacity": 0, "style": 0 },
--       "bodyBlemishes": { "secondColor": 0, "color": 0, "opacity": 0, "style": 0 },
--       "complexion": { "secondColor": 0, "color": 0, "opacity": 0, "style": 0 },
--       "lipstick": { "secondColor": 0, "color": 0, "opacity": 0, "style": 0 }
--     },
--     "headBlend": {
--       "skinMix": 0,
--       "thirdMix": 0,
--       "skinSecond": 0,
--       "shapeMix": 0,
--       "shapeSecond": 0,
--       "skinFirst": 0,
--       "shapeThird": 0,
--       "shapeFirst": 0,
--       "skinThird": 0
--     },
--     "hair": { "highlight": 0, "color": 0, "texture": 0, "style": 0 },
--     "components": [
--       { "drawable": 0, "texture": 0, "component_id": 0 },
--       { "drawable": 0, "texture": 0, "component_id": 1 },
--       { "drawable": 0, "texture": 0, "component_id": 2 },
--       { "drawable": 20, "texture": 0, "component_id": 3 },
--       { "drawable": 28, "texture": 0, "component_id": 4 },
--       { "drawable": 0, "texture": 0, "component_id": 5 },
--       { "drawable": 20, "texture": 0, "component_id": 6 },
--       { "drawable": 76, "texture": 0, "component_id": 8 },
--       { "drawable": 0, "texture": 0, "component_id": 9 },
--       { "drawable": 0, "texture": 0, "component_id": 10 },
--       { "drawable": 194, "texture": 0, "component_id": 11 },
--       { "drawable": 1, "texture": 0, "component_id": 7 }
--     ],
--     "props": [
--       { "drawable": -1, "prop_id": 0, "texture": -1 },
--       { "drawable": 5, "prop_id": 1, "texture": 5 },
--       { "drawable": -1, "prop_id": 2, "texture": -1 },
--       { "drawable": -1, "prop_id": 6, "texture": -1 },
--       { "drawable": -1, "prop_id": 7, "texture": -1 }
--     ],
--     "eyeColor": 0,
--     "faceFeatures": {
--       "noseWidth": 0,
--       "chinBoneLenght": 0,
--       "noseBoneTwist": 0,
--       "lipsThickness": 0,
--       "nosePeakHigh": 0,
--       "jawBoneWidth": 0,
--       "chinBoneSize": 0,
--       "neckThickness": 0,
--       "chinBoneLowering": 0,
--       "chinHole": 0,
--       "eyesOpening": 0,
--       "cheeksBoneHigh": 0,
--       "cheeksBoneWidth": 0,
--       "noseBoneHigh": 0,
--       "eyeBrownForward": 0,
--       "jawBoneBackSize": 0,
--       "cheeksWidth": 0,
--       "nosePeakSize": 0,
--       "nosePeakLowering": 0,
--       "eyeBrownHigh": 0
--     },
--     "tattoos": []
--   }

local illeniumFaceFeatureMap = {
    noseWidth = 0,
    nosePeakHigh = 1,
    nosePeakSize = 2,
    noseBoneHigh = 3,
    nosePeakLowering = 4,
    noseBoneTwist = 5,
    eyeBrownHigh = 6,
    eyeBrownForward = 7,
    cheeksBoneHigh = 8,
    cheeksBoneWidth = 9,
    cheeksWidth = 10,
    eyesOpening = 11,
    lipsThickness = 12,
    jawBoneWidth = 13,
    jawBoneBackSize = 14,
    chinBoneLowering = 15,
    chinBoneLenght = 16,
    chinBoneSize = 17,
    chinHole = 18,
    neckThickness = 19,
}

local illeniumHeadBlendMap = {
    blemishes = 0,
    beard = 1,
    eyebrows = 2,
    ageing = 3,
    makeUp = 4,
    blush = 5,
    complexion = 6,
    sunDamage = 7,
    lipstick = 8,
    moleAndFreckles = 9,
    chestHair = 10,
    bodyBlemishes = 11,
}

local function illeniumPropsToRcoreProps(props)
    local formattedProps = {}

    for _, props in pairs(props) do
        local componentId = props.prop_id
        local drawable = props.drawable
        local texture = props.texture or 0

        formattedProps[tostring(componentId)] = (componentId + 100) .. "_" .. drawable .. "_" .. texture
    end

    return formattedProps
end

local function illeniumComponentsToRcoreComponents(components)
    local formattedComponents = {}

    for _, component in pairs(components) do
        if not (component.component_id == 0) and not (component.component_id == 2) then
            local componentId = component.component_id
            local drawable = component.drawable
            local texture = component.texture

            if componentId and drawable and texture then
                formattedComponents[tostring(componentId)] = componentId .. "_" .. drawable .. "_" .. texture
            end
        end
    end

    return formattedComponents
end

local function illeniumSkinToRcoreSkin(skin)
    local outfitData = {
        faceFeatures = {},
        props = {},
        components = {},
        headOverlay = {},
        eyeColor = 0,
    }

    if skin.components then
        outfitData.components = illeniumComponentsToRcoreComponents(skin.components)
    end

    if skin.props then
        outfitData.props = illeniumPropsToRcoreProps(skin.props)
    end

    outfitData.eyeColor = skin.eyeColor

    if skin.hair then
        outfitData.hair = {
            color1 = skin.hair.color,
            color2 = skin.hair.highlight,
            id = '2_' .. skin.hair.style .. '_0',
        }

        outfitData.components["2"] = "2_" .. skin.hair.style .. "_" .. (skin.hair.texture or 0)
    end

    if skin.faceFeatures then
        for key, value in pairs(skin.faceFeatures) do
            local featureId = illeniumFaceFeatureMap[key]
            outfitData.faceFeatures[tostring(featureId)] = value
        end
    end

    if skin.headBlend then
        local headblend = skin.headBlend
        outfitData.headblend = {
            maleModel = headblend.shapeFirst,
            femaleModel = headblend.shapeSecond,
            maleTone = headblend.skinFirst,
            femaleTone = headblend.skinSecond,
            modelBlend = headblend.shapeMix,
            toneBlend = headblend.skinMix,
        }
    end

    if skin.headOverlays then
        for key, value in pairs(skin.headOverlays) do
            local overlayId = illeniumHeadBlendMap[key]
            outfitData.headOverlay[tostring(overlayId)] = {
                id = value.style,
                opacity = value.opacity,
                color1 = value.color,
                color2 = value.secondColor,
            }
        end
    end

    return outfitData
end

local function illeniumGetPlayerOutfits(lastId)
    return MySQL.Sync.fetchAll("SELECT * FROM player_outfits WHERE id > @lastId ORDER BY id ASC LIMIT 50", {
        ['@lastId'] = lastId
    })
end

local function fivemAppearanceGetPlayerOutfits(lastId)
    return MySQL.Sync.fetchAll("SELECT * FROM outfits WHERE id > @lastId ORDER BY id ASC LIMIT 50", {
        ['@lastId'] = lastId
    })
end

local function illeniumGetPlayerSkinsEsx(page)
    local pageSize = 50
    return MySQL.Sync.fetchAll("SELECT skin, identifier FROM users ORDER BY identifier ASC LIMIT @pageSize OFFSET @offset", {
        ['@offset'] = (page - 1) * pageSize,
        ['@pageSize'] = pageSize,
    })
end
local function illeniumGetPlayerSkinsQBCore(page)
    local pageSize = 50
    return MySQL.Sync.fetchAll("SELECT skin, citizenid as identifier FROM playerskins WHERE active = 1 ORDER BY id ASC LIMIT @pageSize OFFSET @offset", {
        ['@offset'] = (page - 1) * pageSize,
        ['@pageSize'] = pageSize,
    })
end

local function migrateOutfits(isIllenium)
    local lastId = 0
    while true do
        local outfits = isIllenium and illeniumGetPlayerOutfits(lastId) or fivemAppearanceGetPlayerOutfits(lastId)

        if #outfits == 0 then
            print("Outfits migration finished")
            break
        end

        for _, meta in pairs(outfits) do
            local citizenid = isIllenium and meta.citizenid or meta.identifier
            local name = isIllenium and meta.outfitname or meta.name
            local model = isIllenium and meta.model or meta.ped:gsub('"', '')
            local props = json.decode(meta.props)
            local components = json.decode(meta.components)

            local formattedProps = illeniumPropsToRcoreProps(props)
            local formattedComponents = illeniumComponentsToRcoreComponents(components)

            DbSavePersonalOutfit(citizenid, GetHashKey(model), name, {
                props = formattedProps,
                components = formattedComponents,
            })

            lastId = meta.id
        end

        Wait(0)
    end
end

local migrateIlleniumSkins = function(getSkinsFn)
    local page = 1
    while true do
        local skins = getSkinsFn(page)

        if #skins == 0 then
            print("Skins migration finished")
            break
        end

        for _, meta in pairs(skins) do
            local skin = json.decode(meta.skin)
            if skin and skin.model then
                local model = skin.model and GetHashKey(skin.model) or 1885233650
                
                local formatted = illeniumSkinToRcoreSkin(skin)
                DbCreateCurrentOutfit(meta.identifier, model, formatted)
            else
                DbCreateCurrentOutfit(meta.identifier, 1885233650, {})
            end
        end

        page = page + 1
    end
end

RegisterCommand("rcore_clothes_migrate_esx_illenium", function()
    print("Migrating Illenium Appearance clothing to RCore Clothing")

    migrateOutfits(true)
    migrateIlleniumSkins(illeniumGetPlayerSkinsEsx)
end, true)

RegisterCommand("rcore_clothes_migrate_qbcore_illenium", function()
    print("Migrating Illenium Appearance clothing to RCore Clothing")
    
    migrateOutfits(true)
    migrateIlleniumSkins(illeniumGetPlayerSkinsQBCore)
end, true)

RegisterCommand("rcore_clothes_migrate_esx_fivem_appearance", function()
    print("Migrating Fivem-Appearance clothing to RCore Clothing")

    migrateOutfits()
    migrateIlleniumSkins(illeniumGetPlayerSkinsEsx)
end, true)

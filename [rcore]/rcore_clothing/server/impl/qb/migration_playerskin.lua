-- qb structure is [key] = {item = drawable, texture = texture}
local qbClothingCategorys = {
    ["arms"]                 = { type = "variation", id = 3 },
    ["t-shirt"]              = { type = "variation", id = 8 },
    ["torso2"]               = { type = "variation", id = 11 },
    ["pants"]                = { type = "variation", id = 4 },
    ["vest"]                 = { type = "variation", id = 9 },
    ["shoes"]                = { type = "variation", id = 6 },
    ["bag"]                  = { type = "variation", id = 5 },
    ["hair"]                 = { type = "hair", id = 2 },
    ["eyebrows"]             = { type = "overlay", id = 2 },
    ["beard"]                = { type = "overlay", id = 1 },
    ["blush"]                = { type = "overlay", id = 5 },
    ["lipstick"]             = { type = "overlay", id = 8 },
    ["makeup"]               = { type = "overlay", id = 4 },
    ["ageing"]               = { type = "ageing", id = 3 },
    ["mask"]                 = { type = "mask", id = 1 },
    ["hat"]                  = { type = "prop", id = 0 },
    ["glass"]                = { type = "prop", id = 1 },
    ["ear"]                  = { type = "prop", id = 2 },
    ["watch"]                = { type = "prop", id = 6 },
    ["bracelet"]             = { type = "prop", id = 7 },
    ["accessory"]            = { type = "variation", id = 7 },
    ["decals"]               = { type = "variation", id = 10 },
    ["eye_color"]            = { type = "eye_color", id = 1 },
    ["moles"]                = { type = "moles", id = 1 },
    ["jaw_bone_width"]       = { type = "cheek", id = 1 },
    ["jaw_bone_back_lenght"] = { type = "cheek", id = 1 },
    ["lips_thickness"]       = { type = "nose", id = 1 },
    ["nose_0"]               = { type = "nose", id = 1 },
    ["nose_1"]               = { type = "nose", id = 1 },
    ["nose_2"]               = { type = "nose", id = 2 },
    ["nose_3"]               = { type = "nose", id = 3 },
    ["nose_4"]               = { type = "nose", id = 4 },
    ["nose_5"]               = { type = "nose", id = 5 },
    ["cheek_1"]              = { type = "cheek", id = 1 },
    ["cheek_2"]              = { type = "cheek", id = 2 },
    ["cheek_3"]              = { type = "cheek", id = 3 },
    ["eyebrown_high"]        = { type = "nose", id = 1 },
    ["eyebrown_forward"]     = { type = "nose", id = 2 },
    ["eye_opening"]          = { type = "nose", id = 1 },
    ["chimp_bone_lowering"]  = { type = "chin", id = 1 },
    ["chimp_bone_lenght"]    = { type = "chin", id = 2 },
    ["chimp_bone_width"]     = { type = "cheek", id = 3 },
    ["chimp_hole"]           = { type = "cheek", id = 4 },
    ["neck_thikness"]        = { type = "cheek", id = 5 },
    face                     = { ignore = true },
    face2                    = { ignore = true },
    facemix                  = { ignore = true },
}

-- 0-10 values
local qbFaceFeatureMap = {
    nose_0 = 0,
    nose_1 = 1,
    nose_2 = 2,
    nose_3 = 3,
    nose_4 = 4,
    nose_5 = 5,
    eyebrown_high = 6,
    eyebrown_forward = 7,
    cheek_1 = 8,
    cheek_2 = 9,
    cheek_3 = 10,
    eye_opening = 11,
    lips_thickness = 12,
    jaw_bone_width = 13,
    jaw_bone_back_lenght = 14,
    chimp_bone_lowering = 15,
    chimp_bone_lenght = 16,
    chimp_bone_width = 17,
    chimp_hole = 18,
    neck_thikness = 19,
}

local function QbSkinToRcoreSkin(skin)
    local outfitData = {
        faceFeatures = {},
        props = {},
        components = {},
        headOverlay = {},
        eyeColor = 0,
        hair = {},
    }

    if skin.face and skin.face2 and skin.facemix then
        outfitData.headblend = {
            maleModel = skin.face.item,
            femaleModel = skin.face2.item,
            maleTone = skin.face.texture,
            femaleTone = skin.face2.texture,
            modelBlend = skin.facemix.shapeMix,
            toneBlend = skin.facemix.skinMix,
        }
    end

    if skin.hair and skin.hair.item then
        outfitData.hair = {
            id = '2_' .. skin.hair.item .. '_0',
            color1 = skin.hair.texture,
            color2 = skin.hair.texture,
        }
    end

    for key, data in pairs(skin) do
        local def = qbClothingCategorys[key]

        if def then
            if def.ignore then
            elseif qbFaceFeatureMap[name] then
                outfitData.faceFeatures[tostring(qbFaceFeatureMap[name])] = data.item
            elseif def.type == 'prop' then
                if data.item ~= nil and data.texture ~= nil then
                    outfitData.props[tostring(def.id)] = (def.id+100) .. "_" .. data.item .. "_" .. data.texture
                end
            elseif def.type == "variation" or def.type == "mask" then
                if data.item ~= nil and data.texture ~= nil then
                    outfitData.components[tostring(def.id)] = def.id .. "_" .. data.item .. "_" .. data.texture
                end
            elseif def.type == "overlay" then
                if data.item ~= nil and data.texture ~= nil then
                    outfitData.headOverlay[tostring(def.id)] = {
                        color1 = data.texture,
                        color2 = 0,
                        opacity = 1.0,
                        id = data.item,
                    }
                end
            elseif def.type == "moles" then
                if data.item ~= nil and data.texture ~= nil then
                    outfitData.headOverlay[tostring(def.id)] = {
                        color1 = 0,
                        color2 = 0,
                        opacity = data.texture / 10,
                        id = data.item,
                    }
                end
            elseif def.type == "ageing" then
                if data.item ~= nil and data.texture ~= nil then
                    outfitData.headOverlay[tostring(def.id)] = {
                        color1 = data.texture,
                        color2 = 0,
                        opacity = 1.0,
                        id = data.item,
                    }
                end
            elseif def.type == "eye_color" then
                if data.item ~= nil then
                    outfitData.eyeColor = data.item
                end
            end
        else
            print("Unknown key: " .. key)
        end
    end

    return outfitData
end

local function qbGetPlayerskins(lastId)
    return MySQL.Sync.fetchAll("SELECT * FROM playerskins WHERE active=1 AND id > @lastId LIMIT 50", {
        ['@lastId'] = lastId
    })
end

local function qbGetOutfits(lastId)
    return MySQL.Sync.fetchAll("SELECT * FROM player_outfits WHERE id > @lastId LIMIT 50", {
        ['@lastId'] = lastId
    })
end

RegisterCommand("rcore_clothes_migrate_qb_clothing", function()
    print("Migrating QB Clothing to RCore Clothing")
    local lastId = 0
    while true do
        local skins = qbGetPlayerskins(lastId)

        if #skins == 0 then
            print("Migration finished")
            break
        end

        for _, meta in pairs(skins) do
            local model = tonumber(meta.model)
            local skin = json.decode(meta.skin)

            local formatted = QbSkinToRcoreSkin(skin)
            DbCreateCurrentOutfit(meta.citizenid, model, formatted)
            lastId = meta.id
        end

        Wait(0)
    end

    print("Migrating QB Clothing Outfits to RCore Clothing")

    lastId = 0
    while true do
        local skins = qbGetOutfits(lastId)

        if #skins == 0 then
            print("Migration finished")
            break
        end

        for _, meta in pairs(skins) do
            local model = tonumber(meta.model)
            local skin = json.decode(meta.skin)
            local name = meta.outfitname

            local formatted = QbSkinToRcoreSkin(skin)
            DbSavePersonalOutfit(meta.citizenid, model, name, formatted)
            lastId = meta.id
        end

        Wait(0)
    end
end, true)

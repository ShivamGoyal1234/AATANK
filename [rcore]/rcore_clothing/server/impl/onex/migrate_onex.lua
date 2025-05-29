

local function onexGetPlayerskins(lastId)
    return MySQL.Sync.fetchAll("SELECT * FROM `playerskins8` WHERE id > @lastId LIMIT 50", {
        ['@lastId'] = lastId
    })
end

function OnexSkinToRcoreSkin(sourceData)
    local outfit = {
        faceFeatures = {},
        components = {},
        props = {},
        headOverlay = {},
        hair = {},
    }

    -- Process face features
    local faceFeaturesMap = {
        ["nose_0"] = 0,
        ["nose_1"] = 1,
        ["nose_2"] = 2,
        ["nose_3"] = 3,
        ["nose_4"] = 4,
        ["nose_5"] = 5,
        ["eyebrown_high"] = 6,
        ["eyebrown_forward"] = 7,
        ["cheek_1"] = 8,
        ["cheek_2"] = 9,
        ["cheek_3"] = 10,
		-- 9: Cheek Sideways Bone Size (In/Out)

        ["eye_opening"] = 11,
        ["lips_thickness"] = 12,

        ["jaw_bone_width"] = 13,
        ["jaw_bone_back_lenght"] = 14,
        ["chins_bone"] = 15,
        ["chins_length"] = 16,
        ["chins_shape"] = 17,
        ["chimp_hole"] = 18,
        ["neck_thikness"] = 19
    }

    for featureName, featureId in pairs(faceFeaturesMap) do
        if sourceData[featureName] then
            outfit.faceFeatures[tostring(featureId)] = sourceData[featureName].item
        end
    end

    -- Process components (e.g., clothing items)
    local componentsMap = {
        mask = 1,
        hair = 2,
        arms = 3,
        pants = 4,
        bag = 5,
        shoes = 6,
		accessory = 7,
        shirt = 8,
        vest = 9,
		decals = 10,
		torso = 11,
    }
    for compName, compId in pairs(componentsMap) do
        if sourceData[compName] then
            local item = sourceData[compName].item
            local texture = sourceData[compName].texture or 0
            print(">", compId , item , texture)
            if item ~= nil and texture ~= nil then
                outfit.components[tostring(compId)] = compId .. '_' .. item .. '_' .. texture
            end
        end
    end

    -- Process props (e.g., accessories)
    local propsMap = {
		hat = 0,
        glass = 1,
        ear = 2,
        watch = 3,
        bracelet = 7,
    }
	
    for propName, propId in pairs(propsMap) do
        if sourceData[propName] then
            local item = sourceData[propName].item
            local texture = sourceData[propName].texture or 0
            if item ~= nil and texture ~= nil then
                outfit.props[tostring(propId)] = (propId + 100) .. '_' .. item .. '_' .. texture
            end
        end
    end

    -- Process head overlay (e.g., makeup, blush, tattoos)
    local headOverlayMap = {
		blemish = 0	,
		beard = 1	,
		eyebrows = 2	,
		ageing = 3	,
		makeup = 4	,
		blush = 5	,
		complexion = 6	,
		sundamage = 7	,
		lipstick = 8	,
		molefreckles = 9	,
		chesthair = 10	,
		bodyblemishes = 11	,
    }
    for overlayName, overlayId in pairs(headOverlayMap) do
        if sourceData[overlayName] then
            outfit.headOverlay[tostring(overlayId)] = {
                id = sourceData[overlayName].item,
                opacity = sourceData[overlayName].opacity or 1.0,
                color1 = 0, -- didnt find this
                color2 = 0 -- Set color2 to 0 by default if not provided
            }
        end
    end

    -- Process hair details
    if sourceData.hair then
        outfit.hair.id = sourceData.eyebrows.item
        outfit.hair.color1 = sourceData.eyebrows.texture or 0
        outfit.hair.color2 = sourceData.eyebrows.texture2 or 0
    end

    -- Additional properties
    if sourceData.eye_color then
        outfit.eyeColor = sourceData.eye_color.texture
    end

    return outfit
end

RegisterCommand("rcore_clothing_migrate_onex", function()
    print("Migrating OEX skins Clothing to RCore Clothing")
    local lastId = 0
    while true do
        local skins = onexGetPlayerskins(lastId)

        if #skins == 0 then
            print("Migration finished")
            break
        end

        for _, meta in pairs(skins) do
            local model = GetHashKey(meta.model)
            local appearance = json.decode(meta.skin)

            local formatted = OnexSkinToRcoreSkin(appearance)
            DbCreateCurrentOutfit(meta.citizenid, model, formatted)
            lastId = meta.id
        end

        Wait(0)
    end

end, true)

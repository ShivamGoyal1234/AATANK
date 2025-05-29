

local function nfGetPlayerskins(lastId)
    return MySQL.Sync.fetchAll("SELECT * FROM `nf-skins` WHERE id > @lastId LIMIT 50", {
        ['@lastId'] = lastId
    })
end

local function NfSkinToRcoreSkin(face, clothes)
	local outfit = {
		props = {},
		components = {},
		headOverlay = {},
		eyeColor = face['eye_color'] or 0,
	}

    outfit.headblend = {
        maleModel = face.head_blend[1],
        femaleModel = face.head_blend[2],
        maleTone = face.head_blend[4],
        femaleTone = face.head_blend[5],
        modelBlend = face.head_blend[7],
        toneBlend = face.head_blend[8],
    }

    outfit.hair = {
        id = '2_' .. face.hair[1] .. '_' .. face.hair[2],
        color1 = face.hair[3] or 0,
        color2 = face.hair[4] or 0,
    }

    
	if face['blemishes'] then 
		outfit.headOverlay[tostring(0)] = {
			id = face['blemishes'][1],
			opacity = ((face['blemishes'][2] or 0) / 10) + 0.0,
			color1 = 0,
			color2 = 0,
		}
	end

    
	if face['facial_hair'] then 
		outfit.headOverlay[tostring(1)] = {
			id = face['facial_hair'][1],
			opacity = ((face['facial_hair'][2] or 0) / 10) + 0.0,
			color1 = face['facial_hair'][3] or 0,
		}
	end

	if face['eyebrows'] then 
		outfit.headOverlay[tostring(2)] = {
			id = face['eyebrows'][1],
			opacity = ((face['eyebrows'][2] or 0) / 10) + 0.0,
			color1 = face['eyebrows'][3] or 0,
		}
	end

	if face['ageing'] then
		outfit.headOverlay[tostring(3)] = {
			id = face['ageing'][1],
			opacity = (face['ageing'][2] or 0) / 10 + 0.0,
			color1 = 0,
			color2 = 0,
		}
	end

	if face['makeup'] then 
		outfit.headOverlay[tostring(4)] = {
			id = face['makeup'][1],
			opacity = ((face['makeup'][2] or 0) / 10) + 0.0,
			color1 = face['makeup'][3] or 0,
			color2 = face['makeup'][4] or 0,
		}
	end

	if face['blush'] then 
		outfit.headOverlay[tostring(5)] = {
			id = face['blush'][1],
			opacity = ((face['blush'][2] or 0) / 10) + 0.0,
			color1 = face['blush'][3] or 0,
		}
	end

	if face['complexion'] then 
		outfit.headOverlay[tostring(6)] = {
			id = face['complexion'][1],
			opacity = ((face['complexion'][2] or 0) / 10) + 0.0,
			color1 = 0,
			color2 = 0,
		}
	end

	if face['sun_damage'] then 
		outfit.headOverlay[tostring(7)] = {
			id = face['sun_damage'][1],
			opacity = ((face['sun_damage'][2] or 0) / 10) + 0.0,
			color1 = 0,
			color2 = 0,
		}
	end

	if face['lipstick'] then 
		outfit.headOverlay[tostring(8)] = {
			id = face['lipstick'][1],
			opacity = ((face['lipstick'][2] or 0) / 10) + 0.0,
			color1 = face['lipstick'][3] or 0,
			color2 = face['lipstick'][3] or 0,
		}
	end

	if face['moles_freckles'] then 
		outfit.headOverlay[tostring(9)] = {
			id = face['moles_freckles'][1],
			opacity = ((face['moles_freckles'][2] or 0) / 10) + 0.0,
			color1 = 0,
			color2 = 0,
		}
	end

	if face['chest_hair'] then 
		outfit.headOverlay[tostring(10)] = {
			id = face['chest_hair'][1],
			opacity = ((face['chest_hair'][2] or 0) / 10) + 0.0,
			color1 = face['chest_hair'][3] or 0,
			color2 = face['chest_hair'][3] or 0,
		}
	end

	if face['body_blemishes'] then 
		outfit.headOverlay[tostring(11)] = {
			id = face['body_blemishes'][1],
			opacity = ((face['body_blemishes'][2] or 0) / 10) + 0.0,
			color1 = 0,
			color2 = 0,
		}
	end

    outfit.faceFeatures = {}
	if face['nose_width_peak'] ~= nil then outfit.faceFeatures["0"] = face['nose_width_peak'][1] / 10 end
	if face['nose_width_peak'] ~= nil then outfit.faceFeatures["1"] = face['nose_width_peak'][2] / 10 end
	if face['nose_length_tip'] ~= nil then outfit.faceFeatures["2"] = face['nose_length_tip'][1] / 10 end
	if face['nose_length_tip'] ~= nil then outfit.faceFeatures["3"] = face['nose_length_tip'][2] / 10 end
	if face['nose_twist_curveness'] ~= nil then outfit.faceFeatures["4"] = face['nose_twist_curveness'][1] / 10 end
	if face['nose_twist_curveness'] ~= nil then outfit.faceFeatures["5"] = face['nose_twist_curveness'][2] / 10 end
	if face['eyebrow'] ~= nil then outfit.faceFeatures["6"] = face['eyebrow'][1] / 10 end
	if face['eyebrow'] ~= nil then outfit.faceFeatures["7"] = face['eyebrow'][2] / 10 end
	if face['cheek_width_height'] ~= nil then outfit.faceFeatures["8"] = face['cheek_width_height'][1] / 10 end
	if face['cheek_width_height'] ~= nil then outfit.faceFeatures["9"] = face['cheek_width_height'][2] / 10 end
	if face['cheek_size'] ~= nil then outfit.faceFeatures["10"] = face['cheek_size'] / 10 end
	if face['eye_opening'] ~= nil then outfit.faceFeatures["11"] = face['eye_opening'] / 10 end
	if face['lip_thickness'] ~= nil then outfit.faceFeatures["12"] = face['lip_thickness'] / 10 end
	if face['jaw_width_shape'] ~= nil then outfit.faceFeatures["13"] = face['jaw_width_shape'][1] / 10 end
	if face['jaw_width_shape'] ~= nil then outfit.faceFeatures["14"] = face['jaw_width_shape'][2] / 10 end
	if face['chin_length_height'] ~= nil then outfit.faceFeatures["15"] = face['chin_length_height'][1] / 10 end
	if face['chin_length_height'] ~= nil then outfit.faceFeatures["16"] = face['chin_length_height'][2] / 10 end
	if face['chin_shape_hole'] ~= nil then outfit.faceFeatures["17"] = face['chin_shape_hole'][1] / 10 end
	if face['chin_shape_hole'] ~= nil then outfit.faceFeatures["18"] = face['chin_shape_hole'][2] / 10 end
	if face['neck_thickness'] ~= nil then outfit.faceFeatures["19"] = face['neck_thickness'] / 10 end


    if clothes['mask'] then
        outfit.components['1'] = '1_' .. clothes['mask'][1] .. '_' .. clothes['mask'][2]
    end

    if clothes['arms'] then
        outfit.components['3'] = '3_' .. clothes['arms'][1] .. '_' .. clothes['arms'][2]
    end

    if clothes['pants'] then
        outfit.components['4'] = '4_' .. clothes['pants'][1] .. '_' .. clothes['pants'][2]
    end

    if clothes['bag'][1] then
        outfit.components['5'] = '5_' .. clothes['bag'][1] .. '_' .. clothes['bag'][2]
    end

    if clothes['shoes'] then
        outfit.components['6'] = '6_' .. clothes['shoes'][1] .. '_' .. clothes['shoes'][2]
    end

    if clothes['accessory'] then
        outfit.components['7'] = '7_' .. clothes['accessory'][1] .. '_' .. clothes['accessory'][2]
    end

    if clothes['t-shirt'] then
        outfit.components['8'] = '8_' .. clothes['t-shirt'][1]  .. '_' .. clothes['t-shirt'][2]
    end

    if clothes['vest'] then
        outfit.components['9'] = '9_' .. clothes['vest'][1] .. '_' .. clothes['vest'][2]
    end

    if clothes['decals'] then
        outfit.components['10'] = '10_' .. clothes['decals'][1] .. '_' .. clothes['decals'][2]
    end

    if clothes['torso2'] then
        outfit.components['11'] = '11_' .. clothes['torso2'][1] .. '_' .. clothes['torso2'][2]
    end

    if clothes['hat'] then
        outfit.props['0'] ='100_' .. clothes['hat'][1] .. '_' .. clothes['hat'][2]
    end
    if clothes['glass'] then
        outfit.props['1'] ='101_' .. clothes['glass'][1] .. '_' .. clothes['glass'][2]
    end
    if clothes['ear'] then
        outfit.props['2'] ='102_' .. clothes['ear'][1] .. '_' .. clothes['ear'][2]
    end
    if clothes['watch'] then
        outfit.props['6'] ='106_' .. clothes['watch'][1] .. '_' .. clothes['watch'][2]
    end
    if clothes['bracelet'] then
        outfit.props['7'] ='107_' .. clothes['bracelet'][1] .. '_' .. clothes['bracelet'][2]
    end


    return outfit
end

RegisterCommand("rcore_clothing_migrate_nf", function()
    print("Migrating NF skins Clothing to RCore Clothing")
    local lastId = 0
    while true do
        local skins = nfGetPlayerskins(lastId)

        if #skins == 0 then
            print("Migration finished")
            break
        end

        for _, meta in pairs(skins) do
            local model = GetHashKey(meta.model)
            local appearance = json.decode(meta.appearance)
            local clothes = json.decode(meta.clothes)

            local formatted = NfSkinToRcoreSkin(appearance, clothes)
            DbCreateCurrentOutfit(meta.citizenid, model, formatted)
            lastId = meta.id
        end

        Wait(0)
    end

end, true)

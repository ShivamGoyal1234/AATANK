function SkinchangerSkinToRcoreoutfit(char)
	-- "sex": 0, = model
	local outfit = {
		props = {},
		components = {},
		headOverlay = {},
		eyeColor = char['eye_color'] or 0,
	}

	if char['rcore_export'] then
		outfit.headblend = {
			maleModel = char['rc_maleModel'],
			femaleModel = char['rc_femaleModel'],
			maleTone = char['rc_maleTone'],
			femaleTone = char['rc_femaleTone'],
			modelBlend = char['rc_modelBlend'],
			toneBlend = char['rc_toneBlend'],
		}
	elseif char['face'] then
		outfit.headblend = {
			maleModel = char['face'],
			femaleModel = char['face'],
			maleTone = char['skin'] or 0,
			femaleTone = char['skin'] or 0,
			modelBlend = 1.0,
			toneBlend = 1.0,
		}
	elseif char['mom'] then
		-- flipped, we have 1st model as male, skinchanger has 1st model as female
		local maleTone = char['mom']
		local femaleTone = char['dad'] or 0
		
		if char['mom_2'] then
			maleTone = char['mom_2']
		end

		if char['dad_2'] then
			femaleTone = char['dad_2']
		end
		
		outfit.headblend = {
			maleModel = char['mom'],
			femaleModel = char['dad'] or 0,
			maleTone = maleTone,
			femaleTone = femaleTone,
			modelBlend = (char['face_md_weight'] or 0) / 100 + 0.0,
			toneBlend = (char['skin_md_weight'] or 0) / 100 + 0.0,
		}
	end

	if char['hair_1'] then
		outfit.hair = {
			id = '2_' .. char['hair_1'] .. '_0',
			color1 = char['hair_color_1'] or 0,
			color2 = char['hair_color_2'] or 0,
		}
	end

	if char['beard_1'] then 
		outfit.headOverlay[tostring(1)] = {
			id = char['beard_1'],
			opacity = ((char['beard_2'] or 0) / 10) + 0.0,
			color1 = char['beard_3'] or 0,
			color2 = char['beard_4'] or 0,
		}
	end

	if char['eyebrows_1'] then 
		outfit.headOverlay[tostring(2)] = {
			id = char['eyebrows_1'],
			opacity = ((char['eyebrows_2'] or 0) / 10) + 0.0,
			color1 = char['eyebrows_3'] or 0,
			color2 = char['eyebrows_4'] or 0,
		}
	end

	if char['age_1'] then
		outfit.headOverlay[tostring(3)] = {
			id = char['age_1'],
			opacity = (char['age_2'] or 0) / 10 + 0.0,
			color1 = 0,
			color2 = 0,
		}
	end

	if char['makeup_1'] then 
		outfit.headOverlay[tostring(4)] = {
			id = char['makeup_1'],
			opacity = ((char['makeup_2'] or 0) / 10) + 0.0,
			color1 = char['makeup_3'] or 0,
			color2 = char['makeup_4'] or 0,
		}
	end

	if char['blush_1'] then 
		outfit.headOverlay[tostring(5)] = {
			id = char['blush_1'],
			opacity = ((char['blush_2'] or 0) / 10) + 0.0,
			color1 = char['blush_3'] or 0,
			color2 = char['blush_4'] or 0,
		}
	end

	if char['complexion_1'] then 
		outfit.headOverlay[tostring(6)] = {
			id = char['complexion_1'],
			opacity = ((char['complexion_2'] or 0) / 10) + 0.0,
			color1 = 0,
			color2 = 0,
		}
	end

	if char['sun_1'] then 
		outfit.headOverlay[tostring(7)] = {
			id = char['sun_1'],
			opacity = ((char['sun_2'] or 0) / 10) + 0.0,
			color1 = 0,
			color2 = 0,
		}
	end

	if char['lipstick_1'] then 
		outfit.headOverlay[tostring(8)] = {
			id = char['lipstick_1'],
			opacity = ((char['lipstick_2'] or 0) / 10) + 0.0,
			color1 = char['lipstick_3'] or 0,
			color2 = char['lipstick_4'] or 0,
		}
	end

	if char['moles_1'] then 
		outfit.headOverlay[tostring(9)] = {
			id = char['moles_1'],
			opacity = ((char['moles_2'] or 0) / 10) + 0.0,
			color1 = 0,
			color2 = 0,
		}
	end

	if char['chest_1'] then 
		outfit.headOverlay[tostring(10)] = {
			id = char['chest_1'],
			opacity = ((char['chest_2'] or 0) / 10) + 0.0,
			color1 = char['chest_3'] or 0,
			color2 = char['chest_4'] or 0,
		}
	end

	if char['bodyb_1'] then 
		outfit.headOverlay[tostring(11)] = {
			id = char['bodyb_1'],
			opacity = ((char['bodyb_2'] or 0) / 10) + 0.0,
			color1 = 0,
			color2 = 0,
		}
	end


	if char['tshirt_1'] ~= nil then
		outfit.components['8'] = 8 .. '_' .. char['tshirt_1'] .. '_' .. (char['tshirt_2'] or 0) -- Tshirt
	end
	if char['torso_1'] ~= nil then
		outfit.components['11'] = 11 .. '_' .. char['torso_1'] .. '_' .. (char['torso_2'] or 0) -- torso parts
	end
	if char['arms'] ~= nil then
		outfit.components['3'] = 3 .. '_' .. char['arms'] .. '_' .. (char['arms_2'] or 0) -- Amrs
	end
	if char['decals_1'] ~= nil then
		outfit.components['10'] = 10 .. '_' .. char['decals_1'] .. '_' .. (char['decals_2'] or 0) -- decals
	end
	if char['pants_1'] ~= nil then
		outfit.components['4'] = 4 .. '_' .. char['pants_1'] .. '_' .. (char['pants_2'] or 0) -- pants
	end
	if char['shoes_1'] ~= nil then
		outfit.components['6'] = 6 .. '_' .. char['shoes_1'] .. '_' .. (char['shoes_2'] or 0) -- shoes
	end
	if char['mask_1'] ~= nil then
		outfit.components['1'] = 1 .. '_' .. char['mask_1'] .. '_' .. (char['mask_2'] or 0) -- mask
	end
	if char['bproof_1'] ~= nil then
		outfit.components['9'] = 9 .. '_' .. char['bproof_1'] .. '_' .. (char['bproof_2'] or 0) -- bulletproof
	end
	if char['chain_1'] ~= nil then
		outfit.components['7'] = 7 .. '_' .. char['chain_1'] .. '_' .. (char['chain_2'] or 0) -- chain
	end
	if char['bags_1'] ~= nil then
		outfit.components['5'] = 5 .. '_' .. char['bags_1'] .. '_' .. (char['bags_2'] or 0) -- Bag
	end

	if char['ears_1'] ~= nil then
		outfit.props['2'] = 102 .. '_' .. char['ears_1'] .. '_' .. (char['ears_2'] or 0)
	end
	if char['helmet_1'] ~= nil then
		outfit.props['0'] = 100 .. '_' .. char['helmet_1'] .. '_' .. (char['helmet_2'] or 0)
	end
	if char['glasses_1'] ~= nil then
		outfit.props['1'] = 101 .. '_' .. char['glasses_1'] .. '_' .. (char['glasses_2'] or 0)
	end
	if char['watches_1'] ~= nil then
		outfit.props['6'] = 106 .. '_' .. char['watches_1'] .. '_' .. (char['watches_2'] or 0)
	end
	if char['bracelets_1'] ~= nil then
		outfit.props['7'] = 107 .. '_' .. char['bracelets_1'] .. '_' .. (char['bracelets_2'] or 0)
	end


	outfit.faceFeatures = {}
	if char['nose_1'] ~= nil then outfit.faceFeatures["0"] = char['nose_1'] / 10 end
	if char['nose_2'] ~= nil then outfit.faceFeatures["1"] = char['nose_2'] / 10 end
	if char['nose_3'] ~= nil then outfit.faceFeatures["2"] = char['nose_3'] / 10 end
	if char['nose_4'] ~= nil then outfit.faceFeatures["3"] = char['nose_4'] / 10 end
	if char['nose_5'] ~= nil then outfit.faceFeatures["4"] = char['nose_5'] / 10 end
	if char['nose_6'] ~= nil then outfit.faceFeatures["5"] = char['nose_6'] / 10 end
	if char['eyebrows_5'] ~= nil then outfit.faceFeatures["6"] = char['eyebrows_5'] / 10 end
	if char['eyebrows_6'] ~= nil then outfit.faceFeatures["7"] = char['eyebrows_6'] / 10 end
	if char['cheeks_1'] ~= nil then outfit.faceFeatures["8"] = char['cheeks_1'] / 10 end
	if char['cheeks_2'] ~= nil then outfit.faceFeatures["9"] = char['cheeks_2'] / 10 end
	if char['cheeks_3'] ~= nil then outfit.faceFeatures["10"] = char['cheeks_3'] / 10 end
	if char['eye_squint'] ~= nil then outfit.faceFeatures["11"] = char['eye_squint'] / 10 end
	if char['lip_thickness'] ~= nil then outfit.faceFeatures["12"] = char['lip_thickness'] / 10 end
	if char['jaw_1'] ~= nil then outfit.faceFeatures["13"] = char['jaw_1'] / 10 end
	if char['jaw_2'] ~= nil then outfit.faceFeatures["14"] = char['jaw_2'] / 10 end
	if char['chin_1'] ~= nil then outfit.faceFeatures["15"] = char['chin_1'] / 10 end
	if char['chin_2'] ~= nil then outfit.faceFeatures["16"] = char['chin_2'] / 10 end
	if char['chin_3'] ~= nil then outfit.faceFeatures["17"] = char['chin_3'] / 10 end
	if char['chin_4'] ~= nil then outfit.faceFeatures["18"] = char['chin_4'] / 10 end
	if char['neck_thickness'] ~= nil then outfit.faceFeatures["19"] = char['neck_thickness'] / 10 end

	return outfit
end
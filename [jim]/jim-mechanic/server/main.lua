onResourceStart(function()
	Wait(1000)
	local itemcheck = true
	--Check crafting recipes and their ingredients
	if Config.Crafting.enable then
		for k, v in pairs(Crafting) do
			for i = 1, #v do
				 for l, b in pairs(v[i]) do
					if l ~= "amount" and l ~= "job" then
						if not Items[l] then
							print("^5Debug^7: ^3onResourceStart^7: ^2Missing Item from ^4Shared^7.^4Items^7: '^6"..l.."^7'")
							itemcheck = false
						end
						for j in pairs(b) do
							if not Items[j] then
								print("^5Debug^7: ^3onResourceStart^7: ^2Missing Item from ^4Shared^7.^4Items^7: '^6"..j.."^7'")
								itemcheck = false
							end
						end
					end
				end
			end
		end
	end
	-- Check Stores for missing items
	if Config.Crafting.Stores then
		for _, v in pairs(Stores) do
			for i = 1, #v.items do
				if not Items[v.items[i].name] then
					print("^5Debug^7: ^3onResourceStart^7: ^1Missing ^2Item from ^4Shared^7.^4Items^7: '^6"..v.items[i].name.."^7'")
					itemcheck = false
				end
			end
		end
	end
		-- Check if theres a missing item/mistake in the repair materials
	if not Config.Repairs.FreeRepair then
		local repairTable = { "engine", "body", "oil", "axle", "spark", "battery", "fuel", }
		for _, v in pairs(repairTable) do
			if not Config.Repairs.Parts[v][1] then Config.Repairs.Parts[v] = { Config.Repairs.Parts[v] } end
			for i = 1, #Config.Repairs.Parts[v] do
				local item = Config.Repairs.Parts[v][i].part
			if not Items[item] then
					print("^5Debug^7: ^3onResourceStart^7: ^2"..(v:sub(1, 1):upper() .. v:sub(2)).." repair requested a item ^1missing ^2from the Shared^7: '"..item.."^7'")
					ittemcheck = false
				end
			end
		end
	end

	-- Check for "mechboard" item
	if not Items["mechboard"] then
		print("^5Debug^7: ^3onResourceStart^7: ^2Missing Item from ^4Shared^7.^4Items^7: '^6mechboard^7'")
		itemcheck = false
	end
	for k, v in pairs(Config.Main.JobRoles) do
		while not Jobs do Wait(10) end
		if not Jobs[v] then print("^5Debug^7: ^3onResourceStart^7: ^4Config^7.^4Jobroles ^2tried to find the missing job^7: '^6"..v.."^7'") end
	end

	--Success message if all there.
	if itemcheck then
		debugPrint("^5Debug^7: ^3onResourceStart^7: ^2All items found in the shared^7!")
	end

	for _, loc in pairs(Locations) do
		if loc.Enabled then
			if loc.job and not Jobs[loc.job] then
				print("^1Error^7: ^2Job role not found ^7- '^6"..loc.job.."^7'")
			end
			if loc.gang and (not Jobs[loc.gang] and not Gangs[loc.gang]) then
				print("^1Error^7: ^2Gang role not found ^7- '^6"..loc.gang.."^7'")
			end
			if loc.garage and loc.garage.spawn then
				TriggerEvent("jim-jobgarage:server:syncAddLocations", { -- Job Garage creation
					job = loc.job,
					garage = loc.garage or {}
				})
			end
		end
	end
end, true)
local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('ps-drugprocessing:pickedUpweedplant_branch', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)

	if Player.Functions.AddItem("weedplant_branch", 1) then
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["weedplant_branch"], "add")
		TriggerClientEvent('okokNotify', src, Lang:t("success.weedplant_branch"), "success")
	end
end)

RegisterServerEvent('ps-drugprocessing:processweedplant_branch', function()
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)

	if Player.Functions.RemoveItem('weedplant_branch', 1) then
		if Player.Functions.AddItem('weedplant_packedweed', 1) then
			TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['weedplant_branch'], "remove")
			TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['weedplant_packedweed'], "add")
			TriggerClientEvent('okokNotify', src, Lang:t("success.weedplant_packedweed"), "success")
		else
			Player.Functions.AddItem('weedplant_branch', 1)
		end
	else
		TriggerClientEvent('okokNotify', src, Lang:t("error.no_weedplant_branch"), "error")
	end
end)

RegisterServerEvent('ps-drugprocessing:rollJoint', function()
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)

	if Player.Functions.RemoveItem('weedplant_packedweed', 1) then
		if Player.Functions.RemoveItem('rolling_paper', 1) then
			if Player.Functions.AddItem('joint', 1) then
				TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['weedplant_packedweed'], "remove")
				TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['rolling_paper'], "remove")
				TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['joint'], "add")
				TriggerClientEvent('okokNotify', src, Lang:t("success.joint"), "success")
			else
				Player.Functions.AddItem('weedplant_packedweed', 1)
				Player.Functions.AddItem('rolling_paper', 1)
			end
		else
			Player.Functions.AddItem('weedplant_packedweed', 1)
		end
	else
		TriggerClientEvent('okokNotify', src, Lang:t("error.no_marijuhana"), "error")
	end
end)

QBCore.Functions.CreateUseableItem("rolling_paper", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent('ps-drugprocessing:client:rollJoint', source, 'weedplant_packedweed', item)
end)

RegisterServerEvent('ps-drugprocessing:bagskunk', function()
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)

	if Player.Functions.RemoveItem('weedplant_packedweed', 1) then
		if Player.Functions.RemoveItem('empty_weed_bag', 1) then
			if Player.Functions.AddItem('weed_skunk', 1) then
				TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['weedplant_packedweed'], "remove")
				TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['empty_weed_bag'], "remove")
				TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['weed_skunk'], "add")
				TriggerClientEvent('okokNotify', src, Lang:t("success.baggy"), "success")
			else
				Player.Functions.AddItem('weedplant_packedweed', 1)
				Player.Functions.AddItem('empty_weed_bag', 1)
			end
		else
			Player.Functions.AddItem('weedplant_packedweed', 1)
		end
	else
		TriggerClientEvent('okokNotify', src, Lang:t("error.no_marijuhana"), "error")
	end
end)

QBCore.Functions.CreateUseableItem("empty_weed_bag", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent('ps-drugprocessing:client:bagskunk', source, 'weedplant_packedweed', item)
end)

Citizen.CreateThread(function()
    for itemName, itemData in pairs(Config.Vests.Items) do
        exports(itemName, function(data, slot)
            if not itemData.useable then
                goto skip
            end

            if lib.progressBar({
                duration = itemData.usingTime,
                label = locale('using_vest'),
                useWhileDead = false,
                canCancel = true,
                disable = itemData.disableControls or nil,
                anim = itemData.usingAnim or nil
            }) then
                goto skip
            else
                goto cancel
            end

            ::skip::
            Inventory.useItem(data, function(data)
                if data then
                    local playerPed = cache.ped
                    local plyArmour = GetPedArmour(playerPed)
                    local newArmour = math.min(100, plyArmour + itemData.armourAmount)
                    if newArmour > itemData.maxAmount then
                        newArmour = itemData.maxAmount
                    end
                    SetPedArmour(playerPed, newArmour)
                end
            end)

            ::cancel::
        end)

        RegisterNetEvent('p_policejob/use_vest/' .. itemName, function(data)
            exports['p_policejob'][itemName](data)
        end)
    end
end)
CreateThread(function()
    if Config.Item.Inventory ~= "core_inventory" then return end

    local Framework = nil
    if Config.Framework == "esx" then
        Framework = exports['es_extended']:getSharedObject()
    elseif Config.Framework == "qb" then
        Framework = exports["qb-core"]:GetCoreObject()
    end

    local function getItemsByName(name)
        local inventory = {}
        local items = {}

        local cbPromise = promise.new()

        if Config.Framework == "qb" and Framework then
            Framework.Functions.TriggerCallback("core_inventory:server:getInventory", function(inv)
                inventory = inv
                for _, item in pairs(inventory) do
                    if item.name == name then
                        items[#items + 1] = item
                    end
                end

                cbPromise:resolve()
            end)
        elseif Config.Framework == "esx" and Framework then
            Framework.TriggerServerCallback("core_inventory:server:getInventory", function(inv)
                inventory = inv
                for _, item in pairs(inventory) do
                    if item.name == name then
                        items[#items + 1] = item
                    end
                end

                cbPromise:resolve()
            end)
        end

        Citizen.Await(cbPromise)

        return items
    end

    --- Get all sim card items from a player's inventory
    ---@return table
    function GetSimCardItems()
        local simCardItems = {}

        local cards = getItemsByName(Config.Sim.ItemName)
        for i = 1, #cards do
            local card = cards[i]
            if card and (not card.metadata?.cardId or not card.metadata?.simNumber) then
                local simCardDetails = lib.callback.await('yseries:server:generate-sim-card-details')
                if not simCardDetails then debugPrint('Failed to generate or seed sim card details') end

                lib.callback.await('yseries:server:assign-item-metadata', false, card, simCardDetails)

                card.metadata.cardId = simCardDetails.cardId
                card.metadata.simNumber = simCardDetails.simNumber
            end

            if card.metadata and card.metadata.cardId and card.metadata.simNumber then
                simCardItems[#simCardItems + 1] = {
                    id = card.metadata.cardId,
                    number = card.metadata.simNumber,
                }
            end
        end

        return simCardItems
    end

    -- If unique phones are not enabled or not required, do not execute the rest of the code.
    if not Config.Item.UniquePhones or not Config.Item.Require then return end

    function HasImeiIdentifier(imei)
        -- Iterate over each item name in the list of usable items
        for _, itemName in ipairs(Config.UseableItems) do
            local phones = getItemsByName(itemName) -- Get items by current name
            -- Check each phone for the specified IMEI
            for i = 1, #phones do
                if phones then
                    local phone = phones[i]
                    if phone?.metadata?.imei == imei then
                        return true
                    end
                end
            end
        end

        return false
    end

    function GetImeiFromItem(item)
        return item?.metadata?.imei
    end

    RegisterNetEvent("yseries:use-phone-item", function(phoneItem)
        local active = SetupPhone(phoneItem)
        if active then
            ToggleOpen(true)
        end
    end)

    RegisterNetEvent('core_inventory:client:itemAdd', function()
        debugPrint('Phone item added')
    end)

    RegisterNetEvent('core_inventory:client:itemRemove', function()
        Wait(500)

        debugPrint('Phone item removed')

        if Config.Item.UniquePhones and CurrentPhoneImei and not HasImeiIdentifier(CurrentPhoneImei) then
            PhoneDropped()

            local _phoneImei = CurrentPhoneImei

            RemovePrimaryPhone(PlayerData.identifier, CurrentPhoneImei)

            if not HasPrimaryPhone then
                debugPrint('Removed primary phone item with imei: ' .. _phoneImei)
            else
                debugPrint('Could not remove primary phone item with imei: ' .. _phoneImei)
            end
        end
    end)
end)

RegisterNetEvent(Config.InventoryPrefix .. ':client:OpenInventory', function(PlayerAmmo, inventory, other)
    if not inventory then return Error('Inventory is not working, clear the inventory column [sql] to continue.') end
    inventory = FormatItemsToInfo(inventory)
    ToggleHud(false)
    ToggleHotbar(false)
    SetNuiFocus(true, true)
    IdleCamera(true)
    SetPedCanPlayAmbientAnims(PlayerPedId(), false)
    SetResourceKvp('idleCam', 'off')

    if other then
        currentOtherInventory = other.name
    end
    SetPedOnScreen('left')
    Debug('OpenInventory', 'Inventory opened')
    TriggerServerCallback(Config.InventoryPrefix .. ':server:QualityDecay', function(data)
        local PlayerSlots = Config.InventoryWeight.slots
        inventory = data.inventory
        other = data.other
        data = GetPlayerData()
        local skill = Config.Pages.skill and lib.callback.await('inventory:getSkill', 0) or {}
        SendNUIMessage({
            action = 'open',
            inventory = inventory,
            slots = PlayerSlots,
            other = other,
            Ammo = PlayerAmmo,
            forceDisableClothing = cache.vehicle or IsCustomPed(),
            currentPage = CurrentPage,
            skill = skill,
            steal = CheckStealablePlayer()
        })
        inInventory = true
    end, inventory, other)

    if not Config.Handsup then return end
    checkPlayerRobbery(other)
end)

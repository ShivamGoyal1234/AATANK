exports('police_diving_suit', function(event, item, inventory, slot, data)
    if event == 'usingItem' then
        local _source = inventory.id
        local result = lib.callback.await('p_policejob/client_divingsuit/UseSuit', _source)
        if result then
            Inventory.removePlayerItem(_source, 'police_diving_suit', 1)
            Inventory.addPlayerItem(_source, 'player_clothes', 1)
            SendDiscordLog(_source, locale('player_used_divingsuit'), 'divingsuit')
        end
    end
end)

exports('player_clothes', function(event, item, inventory, slot, data)
    if event == 'usingItem' then
        local _source = inventory.id
        local result = lib.callback.await('p_policejob/client_divingsuit/UseClothes', _source)
        if result then
            Inventory.removePlayerItem(_source, 'player_clothes', 1)
            Inventory.addPlayerItem(_source, 'police_diving_suit', 1)
            SendDiscordLog(_source, locale('player_took_off_divingsuit'), 'divingsuit')
        end
    end
end)
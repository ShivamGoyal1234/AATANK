RegisterNetEvent('qb-clothing:loadPlayerSkin', function()
    local Source = source
    LoadSkin(Source, true)
end)

RegisterNetEvent('qb-clothing:saveSkin', function()
    TriggerClientEvent('rcore_clothing:saveCurrentSkin', source)
end)
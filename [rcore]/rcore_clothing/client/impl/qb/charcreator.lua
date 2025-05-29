RegisterNetEvent('rcore_clothing:qb:charcreator', function(existsCb)
    if existsCb then existsCb() end

    LoadAndSetModel(GetPlayerStartingModel())
    CustomSetDefaultVariations(PlayerPedId())
    Wait(1000)
    TriggerEvent('rcore_clothing:openCharCreator')
end)

RegisterNetEvent('qb-clothes:client:CreateFirstCharacter')
AddEventHandler('qb-clothes:client:CreateFirstCharacter', function()
    TriggerEvent('rcore_clothing:qb:charcreator', function()
    end)
end)
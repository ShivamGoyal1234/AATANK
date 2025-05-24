if not Config.IsIllenium then return end

function SaveCurrentClothing()
    local playerPed = PlayerPedId()
    local fullAppearance = exports['illenium-appearance']:getPedAppearance(playerPed)
    exports['illenium-appearance']:setPedAppearance(playerPed, fullAppearance)
    if fullAppearance then
        TriggerServerEvent('qs-inventory:server:SaveUpdatedClothes', fullAppearance)
    end
end

RegisterNetEvent('qs-inventory:client:ChangingClothes')
AddEventHandler('qs-inventory:client:ChangingClothes', function()
    Citizen.Wait(1000)
    SaveCurrentClothing()
end)

RegisterNetEvent('qs-inventory:client:applyCurrentClothes')
AddEventHandler('qs-inventory:client:applyCurrentClothes', function(fullAppearance)
    local playerPed = PlayerPedId()
    if fullAppearance then
        exports['illenium-appearance']:setPedAppearance(playerPed, fullAppearance)
    end
end)

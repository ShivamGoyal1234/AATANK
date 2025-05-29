AddEventHandler('rcore_clothing:onClothingShopClosed', function()
    local outfit = nil

    if Config.Framework == 1 then
        outfit = PedToSkinchanger()
    elseif Config.Framework == 2 then
        outfit = GetPedQBCoreSkin()
    end

    if outfit then
        TriggerServerEvent('rcore_clothing:impl:setFallbackOutfit', outfit)
    end
end)
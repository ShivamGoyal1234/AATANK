local function CreateShopBlip(coords, blipTitle, blipColor, blipId, blipScale)
	local blip = AddBlipForCoord(coords)
    SetBlipSprite(blip, blipId)
	SetBlipDisplay(blip, 4)
	SetBlipScale(blip, blipScale)
	SetBlipColour(blip, blipColor)
	SetBlipAsShortRange(blip, true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString(blipTitle)
	EndTextCommandSetBlipName(blip)
end

Citizen.CreateThread(function()
    for id, shop in pairs(Config.ClothingShops) do
        if shop.blip and shop.blip.title then
            local blipScale = shop.scale

            if blipScale == nil then
                blipScale = 0.9
            end

            CreateShopBlip(shop.pos, shop.blip.title, shop.blip.colour, shop.blip.id, blipScale)

        end
    end
end)


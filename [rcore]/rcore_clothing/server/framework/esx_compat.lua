RegisterNetEvent("esx_skin:save", function(skin)
    local Source = source

    local formatted = SkinchangerSkinToRcoreoutfit(skin)

    local identifier = GetPlayerFwIdentifier(Source)
    local ped = GetPlayerPed(Source)
    local pedModel = GetEntityModel(ped)

    DbSaveCurrentOutfit(identifier, pedModel, formatted)
end)
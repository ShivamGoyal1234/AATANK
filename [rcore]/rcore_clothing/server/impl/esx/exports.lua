function GetSkinchangerSkinByIdentifier(serverId, identifier)
    local outfitData = DbGetCurrentOutfit(identifier)

    if #outfitData == 0 then
        return {}
    end

    outfitData = outfitData[1]

    local outfit = json.decode(outfitData.outfit)
    local pedModel = outfitData.ped_model

    return SvResolveRcoreOutfitToSkinchanger(serverId, outfit, pedModel)
end

exports('GetSkinchangerSkinByIdentifier', GetSkinchangerSkinByIdentifier)
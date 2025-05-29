function DbCollectorInsertItem(
    nameHash,
    componentId,
    drawableId,
    textureId,
    pedModel,
    decalCollectionHash,
    decalNameHash,
    labelGxt,
    label,
    price,
    recommendedArms,
    setComponents
)
    local arms = json.encode(recommendedArms)

    if arms == "" or arms == "[]" or arms == "null" then
        arms = nil
    end

    if not price or price == '' or price == 0 then
        price = GetDefaultOtherPrice(componentId)
    end

    MySQL.Sync.execute([[
        INSERT INTO rcore_clothing_items
        (name_hash, game_build, component_id, drawable_id, texture_id, ped_model, decal_collection_hash, decal_name_hash, label_gxt, label, price, recommended_arms, set_components, is_addon, type, colors, is_blacklisted, is_found)
        VALUES (@name_hash, @game_build, @component_id, @drawable_id, @texture_id, @ped_model, @decal_collection_hash, @decal_name_hash, @label_gxt, @label, @price, @recommended_arms, @set_components, 1, "", "", false, 1)
    ]], {
        ['@name_hash'] = nameHash,
        ['@game_build'] = 0, -- GetGameBuild(),
        ['@component_id'] = componentId,
        ['@drawable_id'] = drawableId,
        ['@texture_id'] = textureId,
        ['@ped_model'] = pedModel,
        ['@decal_collection_hash'] = decalCollectionHash,
        ['@decal_name_hash'] = decalNameHash,
        ['@label_gxt'] = labelGxt,
        ['@label'] = label,
        ['@price'] = price,
        ['@recommended_arms'] = arms,
        ['@set_components'] = json.encode(setComponents),
    })
end

function DbCollectorMarkAsFound(hashes)
    MySQL.Sync.execute([[
        UPDATE rcore_clothing_items SET is_found = 1 WHERE name_hash IN (@hashes)
    ]], {
        ['@hashes'] = hashes
    })
end

function DbCollectorGetByPedModelAndHashes(pedModel, nameHashes)
    return MySQL.Sync.fetchAll([[
        SELECT * FROM rcore_clothing_items WHERE ped_model = @ped_model AND name_hash IN (@hashes)
    ]], {
        ['@ped_model'] = pedModel,
        ['@hashes'] = nameHashes,
    })
end
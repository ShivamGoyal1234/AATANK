function DbAddItemToShop(itemId, shopName)
    MySQL.Sync.execute([[
        REPLACE INTO rcore_clothing_item_shops (rcore_clothing_item_id, shop_name)
        VALUES (@itemId, @shopName) ]], {
        ['@itemId'] = itemId,
        ['@shopName'] = shopName,
    })

    ClearQueryCache()
end

function DbRemoveItemFromShop(itemId, shopName)
    MySQL.Sync.execute([[
        DELETE FROM rcore_clothing_item_shops
        WHERE rcore_clothing_item_id=@itemId AND shop_name=@shopName ]], {
        ['@itemId'] = itemId,
        ['@shopName'] = shopName,
    })

    ClearQueryCache()
end

function DbGetGroupByDrawableId(pedModel, componentId, drawableId)
    return MySQL.Sync.fetchAll([[
        SELECT *
        FROM rcore_clothing_items
        WHERE ped_model=@pedModel AND component_id=@componentId AND drawable_id=@drawableId
    ]], {
        ['@pedModel'] = pedModel,
        ['@componentId'] = componentId,
        ['@drawableId'] = drawableId,
    })
end

function DbAddGroupToShop(itemId, shopName)
    local item = DbGetItemById(itemId)

    local pedModel = item.ped_model
    local componentId = item.component_id
    local drawableId = item.drawable_id

    local itemsInGroup = DbGetGroupByDrawableId(pedModel, componentId, drawableId)

    for _, itemInGroup in pairs(itemsInGroup) do
        DbAddItemToShop(itemInGroup.id, shopName)
    end
end

function DbRemoveGroupFromShop(itemId, shopName)
    local item = DbGetItemById(itemId)

    local pedModel = item.ped_model
    local componentId = item.component_id
    local drawableId = item.drawable_id

    local itemsInGroup = DbGetGroupByDrawableId(pedModel, componentId, drawableId)

    for _, itemInGroup in pairs(itemsInGroup) do
        DbRemoveItemFromShop(itemInGroup.id, shopName)
    end
end

function DbEditItemMetadata(itemId, label, price, type, colors, isBlacklisted, jobs, identifiers, resetImg)
    MySQL.Sync.execute([[
        UPDATE rcore_clothing_items
        SET label=@label, custom_price=@custom_price, type=@type, colors=@colors, is_blacklisted=@isBlacklisted
        WHERE id=@itemId ]], {
        ['@itemId'] = itemId,
        ['@label'] = label,
        ['@custom_price'] = price,
        ['@type'] = type,
        ['@colors'] = colors,
        ['@isBlacklisted'] = isBlacklisted,
    })

    if resetImg then
        MySQL.Sync.execute([[
            UPDATE rcore_clothing_items
            SET image_url=NULL, is_addon=1
            WHERE id=@itemId ]], {
            ['@itemId'] = itemId,
        })
    end

    MySQL.Sync.execute([[
        DELETE FROM rcore_clothing_item_restrictions
        WHERE rcore_clothing_items_id=@itemId ]], {
        ['@itemId'] = itemId,
    })

    for _, job in pairs(jobs) do
        MySQL.Sync.execute([[
            INSERT INTO rcore_clothing_item_restrictions (rcore_clothing_items_id, job, job_grade)
            VALUES (@itemId, @jobName, @jobGrade) ]], {
            ['@itemId'] = itemId,
            ['@jobName'] = job.name,
            ['@jobGrade'] = job.grade,
        })
    end

    for _, identifier in pairs(identifiers) do
        MySQL.Sync.execute([[
            INSERT INTO rcore_clothing_item_restrictions (rcore_clothing_items_id, identifier)
            VALUES (@itemId, @identifier) ]], {
            ['@itemId'] = itemId,
            ['@identifier'] = identifier,
        })
    end

    ClearQueryCache()
end

function DbEditGroupMetadata(itemId, price, type, isBlacklisted)
    local item = DbGetItemById(itemId)

    local pedModel = item.ped_model
    local componentId = item.component_id
    local drawableId = item.drawable_id

    MySQL.Sync.execute([[
        UPDATE rcore_clothing_items
        SET custom_price=@custom_price, type=@type, is_blacklisted=@isBlacklisted
        WHERE ped_model=@pedModel AND component_id=@componentId AND drawable_id=@drawableId ]], {
        ['@custom_price'] = price,
        ['@type'] = type,
        ['@isBlacklisted'] = isBlacklisted,
        ['@pedModel'] = pedModel,
        ['@componentId'] = componentId,
        ['@drawableId'] = drawableId,
    })

    ClearQueryCache()
end

function DbBlacklistItem(itemId)
    if not itemId then return end

    MySQL.Sync.execute([[
        UPDATE rcore_clothing_items
        SET is_blacklisted=1
        WHERE id=@itemId ]], {
        ['@itemId'] = itemId,
    })

    ClearQueryCache()
end

function DbResetItem(itemId)
    if not itemId then return end

    MySQL.Sync.execute([[
        UPDATE rcore_clothing_items
        SET image_url=@imageUrl, type=@type, label=@label
        WHERE id=@itemId ]], {
        ['@itemId'] = itemId,
        ['@imageUrl'] = nil,
        ['@type'] = "",
        ['@label'] = nil,
    })

    ClearQueryCache()
end

function DbEditRecommendedArms(itemId, armsHash)
    MySQL.Sync.execute([[
        UPDATE rcore_clothing_items
        SET recommended_arms=@armsHash
        WHERE id=@itemId ]], {
        ['@itemId'] = itemId,
        ['@armsHash'] = armsHash,
    })

    ClearQueryCache()
end

function DbEditGroupRecommendedArms(itemId, armsHash)
    local item = DbGetItemById(itemId)

    local pedModel = item.ped_model
    local componentId = item.component_id
    local drawableId = item.drawable_id

    MySQL.Sync.execute([[
        UPDATE rcore_clothing_items
        SET recommended_arms=@armsHash
        WHERE ped_model=@pedModel AND component_id=@componentId AND drawable_id=@drawableId ]], {
        ['@armsHash'] = armsHash,
        ['@pedModel'] = pedModel,
        ['@componentId'] = componentId,
        ['@drawableId'] = drawableId,
    })
end

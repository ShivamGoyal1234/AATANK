function DbSyncItem(dbId, label, type, colors)
    MySQL.Sync.execute([[
        UPDATE rcore_clothing_items
        SET label=@label, type=@type, colors=@colors
        WHERE id=@id
    ]], {
        ['@label'] = label,
        ['@type'] = type,
        ['@colors'] = colors,
        ['@id'] = dbId,
    })
end

function DbCountUntypedItem()
    local item = MySQL.Sync.fetchAll([[
        SELECT COUNT(*) as count
        FROM rcore_clothing_items 
        WHERE component_id in (1,4,5,6,7,9,11,100,101,102,106,107) AND (type is null or type = "")  AND image_url is not null AND image_url != "none" AND is_blacklisted = 0 AND is_soft_blacklisted = 0
        ORDER BY id ASC 
    ]], {
        ['@model'] = pedModel,
        ['@start'] = startId
    })

    if item[1] then
        return item[1].count
    end

    return 0
end

function DbGetUntypedItems(limit)
    local items = MySQL.Sync.fetchAll([[
        SELECT id, name_hash, type, component_id, image_url, drawable_id, texture_id, ped_model, colors
        FROM rcore_clothing_items 
        WHERE component_id in (1,4,5,6,7,9,11,100,101,102,106,107) AND (type is null or type = "")  AND image_url is not null AND image_url != "none" AND is_blacklisted = 0 AND is_soft_blacklisted = 0
        ORDER BY id ASC 
        LIMIT @limit
    ]], {
        ['@model'] = pedModel,
        ['@start'] = startId,
        ['@limit'] = limit
    })

    if items[1] then
        return items
    end

    return nil
end
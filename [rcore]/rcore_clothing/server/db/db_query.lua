function DbGetItemsById(ids)
    if #ids == 0 then
        return {}
    end

    return MySQL.Sync.fetchAll([[
        SELECT *
        FROM rcore_clothing_items
        WHERE id IN (@ids)
    ]], {
        ['@ids'] = ids
    })
end

function DbGetItemById(id)
    return MySQL.Sync.fetchAll([[
        SELECT *
        FROM rcore_clothing_items
        WHERE id = @id
    ]], {
        ['@id'] = id
    })[1]
end

function GetAvailableComponentsInShop(pedModel, shopName, showEverything, changingRoomIdentifier)
    if changingRoomIdentifier then
        return MySQL.Sync.fetchAll([[
            SELECT DISTINCT rcore_clothing_items.component_id
            FROM rcore_clothing_purchased
            JOIN rcore_clothing_items ON rcore_clothing_purchased.rcore_clothing_item_id = rcore_clothing_items.id AND rcore_clothing_items.ped_model = @pedModel
            WHERE rcore_clothing_purchased.identifier=@ident AND rcore_clothing_items.game_build <= @gameBuild
        ]], {
            ['@pedModel'] = pedModel,
            ['@ident'] = changingRoomIdentifier,
            ['@gameBuild'] = GetGameBuild(),
        })
    end

    if shopName and not showEverything then
        local cached = GetCachedClothingComponentsForShop(shopName, pedModel)

        if cached then
            return cached
        end

        local data = MySQL.Sync.fetchAll([[
            SELECT DISTINCT rcore_clothing_items.component_id
            FROM rcore_clothing_item_shops
            JOIN rcore_clothing_items ON rcore_clothing_item_shops.rcore_clothing_item_id = rcore_clothing_items.id AND rcore_clothing_items.ped_model = @pedModel
            WHERE rcore_clothing_item_shops.shop_name=@shopName AND rcore_clothing_items.game_build <= @gameBuild
        ]], {
            ['@pedModel'] = pedModel,
            ['@shopName'] = shopName,
            ['@gameBuild'] = GetGameBuild(),
        })

        CacheClothingComponentsForShop(shopName, pedModel, data)

        return data
    end

    local cached = GetCachedClothingComponentsGlobal(pedModel)

    if cached then
        return cached
    end

    -- queries everything
    local data = MySQL.Sync.fetchAll([[
        SELECT DISTINCT rcore_clothing_items.component_id
        FROM rcore_clothing_items
        WHERE  rcore_clothing_items.game_build <= @gameBuild
    ]], {
        ['@gameBuild'] = GetGameBuild(),
        ['@pedModel'] = pedModel,
    })

    CacheClothingComponentsGlobal(pedModel, data)

    return data
end

function GetAvailableClothingTypes(pedModel, shopName, showEverything, changingRoomIdentifier)
    if changingRoomIdentifier then
        return MySQL.Sync.fetchAll([[
            SELECT rcore_clothing_items.component_id, rcore_clothing_items.type
            FROM rcore_clothing_purchased
            JOIN rcore_clothing_items ON rcore_clothing_purchased.rcore_clothing_item_id = rcore_clothing_items.id  AND rcore_clothing_items.ped_model = @pedModel
            WHERE rcore_clothing_purchased.identifier=@ident AND rcore_clothing_items.type <> '' AND rcore_clothing_items.game_build <= @gameBuild
            GROUP BY rcore_clothing_items.component_id, rcore_clothing_items.type
        ]], {
            ['@ident'] = changingRoomIdentifier,
            ['@gameBuild'] = GetGameBuild(),
            ['@pedModel'] = pedModel,
        })
    end

    if shopName and not showEverything then
        local cached = GetCachedClothingTypeCacheForShop(shopName, pedModel)

        if cached then
            return cached
        end

        local data = MySQL.Sync.fetchAll([[
            SELECT rcore_clothing_items.component_id, rcore_clothing_items.type
            FROM rcore_clothing_item_shops
            JOIN rcore_clothing_items ON rcore_clothing_item_shops.rcore_clothing_item_id = rcore_clothing_items.id  AND rcore_clothing_items.ped_model = @pedModel
            WHERE rcore_clothing_item_shops.shop_name=@shopName AND rcore_clothing_items.type <> '' AND rcore_clothing_items.game_build <= @gameBuild
            GROUP BY rcore_clothing_items.component_id, rcore_clothing_items.type
        ]], {
            ['@shopName'] = shopName,
            ['@gameBuild'] = GetGameBuild(),
            ['@pedModel'] = pedModel,
        })

        CacheClothingTypeCacheForShop(shopName, pedModel, data)

        return data
    end

    local cached = GetCachedClothingTypeCacheGlobal(pedModel)

    if cached then
        return cached
    end

    local data = MySQL.Sync.fetchAll([[
        SELECT rcore_clothing_items.component_id, rcore_clothing_items.type
        FROM rcore_clothing_item_shops
        JOIN rcore_clothing_items ON rcore_clothing_item_shops.rcore_clothing_item_id = rcore_clothing_items.id  AND rcore_clothing_items.ped_model = @pedModel
        WHERE rcore_clothing_items.type <> '' AND rcore_clothing_items.game_build <= @gameBuild
        GROUP BY rcore_clothing_items.component_id, rcore_clothing_items.type
    ]], {
        ['@gameBuild'] = GetGameBuild(),
        ['@pedModel'] = pedModel,
    })

    CacheClothingTypeCacheGlobal(pedModel, data)

    return data
end

function DbQueryShopSpecific(additionalAnds, params, addParams)
    params['@job'] = addParams.job
    params['@jobGrade'] = addParams.jobGrade
    params['@identifiers'] = addParams.identifiers
    
    params['@gameBuild'] = GetGameBuild()

    local rootTable = 'rcore_clothing_item_shops'
    local shopWhere = 'rcore_clothing_item_shops.shop_name = @shopName'
    local rootTableIdent = 'rcore_clothing_item_id'

    if addParams.changingRoomIdentifier then
        rootTable = 'rcore_clothing_purchased'
        shopWhere = 'rcore_clothing_purchased.identifier = @changingRoomIdentifier'
        params['@shopName'] = nil
        params['@changingRoomIdentifier'] = addParams.changingRoomIdentifier
    end

    -- this has to be after chanring room stuff
    local tableJoin = 'JOIN rcore_clothing_items ON ' .. rootTable .. '.rcore_clothing_item_id = rcore_clothing_items.id'
    
    if not addParams.changingRoomIdentifier and (addParams.showAll or addParams.showEverything) then
        tableJoin = ''
        shopWhere = '1=1'
        rootTable = 'rcore_clothing_items'
        rootTableIdent = 'id'
    end

    -- @TODO: decals temp disabled
    -- (this part of the query)
    -- AND rcore_clothing_items.decal_name_hash is null
    return MySQL.Sync.fetchAll([[
        SELECT rcore_clothing_items.*
        FROM ]] .. rootTable .. [[
        ]] .. tableJoin .. [[
        WHERE ]] .. shopWhere .. [[
            AND rcore_clothing_items.ped_model = @pedModel
            AND rcore_clothing_items.game_build <= @gameBuild
            AND rcore_clothing_items.component_id=@componentId
            AND rcore_clothing_items.decal_name_hash is null
            AND ]] .. rootTable .. [[.]] .. rootTableIdent .. [[ > @lastId
            AND rcore_clothing_items.is_blacklisted = 0 AND rcore_clothing_items.is_soft_blacklisted = 0
            AND (
                ]] .. rootTable .. [[.]] .. rootTableIdent .. [[ NOT IN (
                    SELECT rcore_clothing_items_id
                    FROM rcore_clothing_item_restrictions
                    WHERE rcore_clothing_item_restrictions.rcore_clothing_items_id=]] .. rootTable .. [[.]] .. rootTableIdent .. [[
                )
                OR ]] .. rootTable .. [[.]] .. rootTableIdent .. [[ IN (
                    SELECT rcore_clothing_items_id
                    FROM rcore_clothing_item_restrictions
                    WHERE (rcore_clothing_item_restrictions.rcore_clothing_items_id = ]] .. rootTable .. [[.]] .. rootTableIdent .. [[ AND ((job = @job AND job_grade <= @jobGrade) OR identifier IN (@identifiers)))
                )
            )
        ]] .. additionalAnds .. [[
            ORDER BY ]] .. rootTable .. [[.]] .. rootTableIdent .. [[ ASC
            LIMIT 50
        ]], params)
end

function DbQueryAllItems(additionalAnds, params)
    params['@gameBuild'] = GetGameBuild()

    -- @TODO: decals temp disabled
    -- (this part of the query)
    -- AND rcore_clothing_items.decal_name_hash is null
    return MySQL.Sync.fetchAll([[
        SELECT rcore_clothing_items.*, rcore_clothing_item_shops.shop_name is not null as in_shop
        FROM rcore_clothing_items
        LEFT JOIN rcore_clothing_item_shops ON rcore_clothing_item_shops.rcore_clothing_item_id = rcore_clothing_items.id AND rcore_clothing_item_shops.shop_name = @shopName
        WHERE rcore_clothing_items.ped_model = @pedModel
            AND rcore_clothing_items.component_id=@componentId
            AND rcore_clothing_items.id > @lastId
            AND rcore_clothing_items.decal_name_hash is null
            AND rcore_clothing_items.game_build <= @gameBuild
        ]] .. additionalAnds .. [[
            ORDER BY rcore_clothing_items.id ASC
            LIMIT 50
        ]], params)
end

function DbGetHair(pedModel)
    return MySQL.Sync.fetchAll([[
        SELECT name_hash as drawable_id, image_url
        FROM rcore_clothing_items
        WHERE component_id = 2 AND texture_id = 0 AND is_blacklisted = 0 AND is_soft_blacklisted = 0 AND ped_model = @pedModel AND rcore_clothing_items.game_build <= @gameBuild
    ]], {
        ['@pedModel'] = pedModel,
        ['@gameBuild'] = GetGameBuild()
    })
end

function DbGetShopItems(shopName, pedModel, addParams)

    local params = {
        ['@shopName'] = shopName,
        ['@componentId'] = addParams.componentId,
        ['@lastId'] = addParams.lastId,
        ['@pedModel'] = pedModel,
    }

    local additionalAnds = ""

    if addParams.notInAnyShop then
        additionalAnds = additionalAnds .. [[
            AND NOT EXISTS (
                SELECT 1
                FROM rcore_clothing_item_shops
                WHERE rcore_clothing_items.id = rcore_clothing_item_shops.rcore_clothing_item_id
            )
        ]]
    end

    if addParams.category and addParams.category ~= "" then
        params['@category'] = addParams.category
        additionalAnds = additionalAnds .. " AND rcore_clothing_items.type = @category"
    end
    
    if addParams.onlyAddons then
        additionalAnds = additionalAnds .. " AND rcore_clothing_items.is_addon = 1"
    end

    if addParams.searchQuery and addParams.searchQuery ~= "" then
        params['@searchQuery'] = "%" .. addParams.searchQuery .. "%"
        additionalAnds = additionalAnds .. " AND rcore_clothing_items.label LIKE @searchQuery"
    end

    if addParams.colors and #addParams.colors > 0 then
        local colorQuery = ""
        for i, color in pairs(addParams.colors) do
            colorQuery = colorQuery .. " OR rcore_clothing_items.colors LIKE @color" .. i
            params['@color' .. i] = color
        end

        additionalAnds = additionalAnds .. " AND (" .. colorQuery:sub(4) .. ")"
    end

    if addParams.groupByDrawable then
        additionalAnds = additionalAnds ..
            " AND (rcore_clothing_items.texture_id = 0 AND rcore_clothing_items.decal_name_hash IS NULL)"
    end

    local items = {}

    if addParams.showAll then
        return DbQueryAllItems(additionalAnds, params)
    else
        return DbQueryShopSpecific(additionalAnds, params, addParams)
    end
end

function DbEnrichWithRestrictions(items)
    local ids = {}

    for _, item in pairs(items) do
        table.insert(ids, item.id)
    end

    local restrictions = {}

    if #ids > 0 then
        restrictions = MySQL.Sync.fetchAll([[
            SELECT rcore_clothing_items_id as id, job, job_grade, identifier
            FROM rcore_clothing_item_restrictions
            WHERE rcore_clothing_items_id IN (@ids)
        ]], {
            ['@ids'] = ids
        })
    end

    local indexedRestrictions = {}

    for _, restriction in pairs(restrictions) do
        if not indexedRestrictions[restriction.id] then
            indexedRestrictions[restriction.id] = {
                jobs = {},
                identifiers = {},
            }
        end

        if restriction.job then
            table.insert(indexedRestrictions[restriction.id].jobs, {
                name = restriction.job,
                grade = restriction.job_grade,
            })
        end

        if restriction.identifier then
            table.insert(indexedRestrictions[restriction.id].identifiers, restriction.identifier)
        end
    end

    for _, item in pairs(items) do
        if indexedRestrictions[item.id] then
            item.jobs = indexedRestrictions[item.id].jobs
            item.identifiers = indexedRestrictions[item.id].identifiers
        end
    end

    return items
end

function DbGetSingleItemMetadata(pedModel, hash)
    local items = MySQL.Sync.fetchAll([[
        SELECT *
        FROM rcore_clothing_items
        WHERE ped_model = @pedModel AND name_hash = @nameHash
    ]], {
        ['@pedModel'] = pedModel,
        ['@nameHash'] = hash,
    })

    return items[1]
end

function DbGetSingleItemMetadataForShop(pedModel, hash, shopName, serverId)
    local items = MySQL.Sync.fetchAll([[
        SELECT rcore_clothing_items.*, rcore_clothing_item_shops.shop_name, rcore_clothing_item_shops.shop_name is not null as in_shop
        FROM rcore_clothing_items
        LEFT JOIN rcore_clothing_item_shops ON rcore_clothing_items.id = rcore_clothing_item_shops.rcore_clothing_item_id AND rcore_clothing_item_shops.shop_name = @shopName
        WHERE rcore_clothing_items.ped_model = @pedModel AND rcore_clothing_items.name_hash = @nameHash
    ]], {
        ['@pedModel'] = pedModel,
        ['@nameHash'] = hash,
        ['@shopName'] = shopName,
    })

    local item = items[1]

    if not item then
        return nil
    end

    local restrictions = MySQL.Sync.fetchAll([[
        SELECT job, job_grade, identifier
        FROM rcore_clothing_item_restrictions
        WHERE rcore_clothing_items_id = @itemId
    ]], {
        ['@itemId'] = item.id,
    })

    if #restrictions > 0 then
        item.in_shop = false

        for _, restriction in ipairs(restrictions) do
            local playerJobData = FwGetPlayerJobData(serverId)

            local job = playerJobData.name
            local jobGrade = playerJobData.grade
            local identifier = GetPlayerFwIdentifier(serverId)
            local identifiers = AppendAces(serverId, GetPlayerIdentifiers(serverId))

            if job and jobGrade and restriction.job and restriction.job == job and restriction.job_grade <= jobGrade then
                item.in_shop = true
            elseif restriction.identifier then
                if restriction.identifier == identifier then
                    item.in_shop = true
                else
                    for _, ident in pairs(identifiers) do
                        if ident == restriction.identifier then
                            item.in_shop = true
                            break
                        end
                    end
                end
            end
        end
    end

    return item
end

function DbGetRecommendedArmsByHash(hash, pedModel)
    return MySQL.Sync.fetchAll([[
        SELECT recommended_arms
        FROM rcore_clothing_items
        WHERE ped_model = @pedModel AND name_hash = @nameHash
    ]], {
        ['@pedModel'] = pedModel,
        ['@nameHash'] = hash,
    })
end
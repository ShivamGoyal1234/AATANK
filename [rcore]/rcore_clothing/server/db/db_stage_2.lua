function DbGetDataForStage2(pedModel, startId, isManual, compId)
    -- WHERE ped_model=@model AND id > @start AND component_id <> 5 AND component_id <> 10 and component_id>=8 ORDER BY id ASC limit 50]], {
    -- skipped items
    -- 7 -> neck accesories, impossible to photo automatically (too small)
    -- 10 -> invisible
    -- 102 -> earrings, too small to photo automatically

    local ids = "1,2,3,4,5,6,8,9,11,100,101, 106,107"

    if isManual then
        ids = "1,2,3,4,5,6,8,9,11,100,101, 7, 102, 106,107"
    end

    if compId and tonumber(compId) > 0 and tonumber(compId) <= 110 then
        ids = tostring(compId)
    end

    local total = MySQL.Sync.fetchScalar([[SELECT COUNT(*) FROM rcore_clothing_items WHERE rcore_clothing_items.image_url is null AND ped_model=@model AND component_id in (]] .. ids .. [[) AND rcore_clothing_items.decal_name_hash is null AND rcore_clothing_items.game_build <= @gameBuild]], {
        ['@model'] = pedModel,
        ['@gameBuild'] = GetGameBuild(),
    })

    return MySQL.Sync.fetchAll([[
        SELECT rcore_clothing_items.id, name_hash,component_id,drawable_id,texture_id,decal_collection_hash,decal_name_hash 
        FROM rcore_clothing_items 
        WHERE rcore_clothing_items.image_url is null AND ped_model=@model AND component_id in (]] .. ids .. [[) AND rcore_clothing_items.decal_name_hash is null AND rcore_clothing_items.game_build <= @gameBuild
        ORDER BY component_id ASC, drawable_id ASC, texture_id ASC, id ASC 
        limit 50
    ]], {
        ['@model'] = pedModel,
        ['@gameBuild'] = GetGameBuild(),
    }), total
end
function DbGetDataForStage4(pedModel, startId)

    local ids = "1,3,4,5,6,8,9,11,100,101, 7, 102, 106,107"

    local total = MySQL.Sync.fetchScalar([[SELECT COUNT(*) FROM rcore_clothing_items WHERE rcore_clothing_items.image_url = 'none' AND ped_model=@model AND component_id in (]] .. ids .. [[) AND rcore_clothing_items.decal_name_hash is null AND rcore_clothing_items.game_build <= @gameBuild AND rcore_clothing_items.id > @id]], {
        ['@model'] = pedModel,
        ['@gameBuild'] = GetGameBuild(),
        ['@id'] = startId
    })

    return MySQL.Sync.fetchAll([[
        SELECT rcore_clothing_items.id, name_hash,component_id,drawable_id,texture_id,decal_collection_hash,decal_name_hash 
        FROM rcore_clothing_items 
        WHERE rcore_clothing_items.image_url = 'none' AND ped_model=@model AND component_id in (]] .. ids .. [[) AND rcore_clothing_items.decal_name_hash is null AND rcore_clothing_items.game_build <= @gameBuild AND rcore_clothing_items.id > @id
        ORDER BY id ASC 
        limit 50
    ]], {
        ['@id'] = startId,
        ['@model'] = pedModel,
        ['@gameBuild'] = GetGameBuild(),
    }), total
end


function DbMarkAsImageless(dbId)
    MySQL.Sync.execute("UPDATE rcore_clothing_items SET image_url = 'none' WHERE id = @id AND image_url is null", {
        ['@id'] = dbId
    })
end

function DbStage2SaveResult(dbId, url, colors)
    MySQL.Sync.execute("UPDATE rcore_clothing_items SET image_url = @url, colors = @colors WHERE id = @id", {
        ['@id'] = dbId,
        ['@url'] = url,
        ['@colors'] = colors
    })
end
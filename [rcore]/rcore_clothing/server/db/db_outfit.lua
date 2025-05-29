function DbSavePersonalOutfit(identifier, model, name, data)
    MySQL.Sync.execute([[
        INSERT INTO rcore_clothing_outfits (identifier, ped_model, name, outfit)
        VALUES (@identifier, @model, @name, @data)
    ]], {
        ['@identifier'] = identifier,
        ['@model'] = model,
        ['@name'] = name,
        ['@data'] = json.encode(data),
    })
end

function DbSaveShopOutfit(model, name, shopName, price, jobs, identifiers, data)
    local insertId = MySQL.Sync.insert([[
        INSERT INTO rcore_clothing_outfits (name, shop_name, price, outfit, ped_model)
        VALUES (@name, @shopName, @price, @data, @pedModel)
    ]], {
        ['@name'] = name,
        ['@shopName'] = shopName,
        ['@price'] = price,
        ['@data'] = json.encode(data),
        ['@pedModel'] = model,
    })

    for _, job in pairs(jobs) do
        MySQL.Sync.execute([[
            INSERT INTO rcore_clothing_outfit_restrictions (rcore_clothing_outfit_id, job, job_grade)
            VALUES (@itemId, @jobName, @jobGrade) ]], {
            ['@itemId'] = insertId,
            ['@jobName'] = job.name,
            ['@jobGrade'] = job.grade,
        })
    end

    for _, identifier in pairs(identifiers) do
        MySQL.Sync.execute([[
            INSERT INTO rcore_clothing_outfit_restrictions (rcore_clothing_outfit_id, identifier)
            VALUES (@itemId, @identifier) ]], {
            ['@itemId'] = insertId,
            ['@identifier'] = identifier,
        })
    end
end

function DbGetPersonalOutfits(identifier, pedModel)
    return MySQL.Sync.fetchAll([[
        SELECT id, name, outfit
        FROM rcore_clothing_outfits
        WHERE identifier=@identifier AND ped_model=@pedModel
    ]], {
        ['@identifier'] = identifier,
        ['@pedModel'] = pedModel,
    })
end

function DbGetOutfitById(id)
    return MySQL.Sync.fetchAll([[
        SELECT id, name, outfit, price
        FROM rcore_clothing_outfits
        WHERE id=@id
    ]], {
        ['@id'] = id,
    })[1]
end

function DbGetShopOutfits(pedModel, shopName, job, jobGrade, identifiers)
    return MySQL.Sync.fetchAll([[
        SELECT id, name, price, outfit
        FROM rcore_clothing_outfits
        WHERE shop_name=@shopName AND ped_model=@pedModel
            AND (
                rcore_clothing_outfits.id NOT IN (
                    SELECT rcore_clothing_outfit_id
                    FROM rcore_clothing_outfit_restrictions
                    WHERE rcore_clothing_outfit_restrictions.rcore_clothing_outfit_id=rcore_clothing_outfits.id
                )
                OR rcore_clothing_outfits.id IN (
                    SELECT rcore_clothing_outfit_id
                    FROM rcore_clothing_outfit_restrictions
                    WHERE rcore_clothing_outfit_restrictions.rcore_clothing_outfit_id = rcore_clothing_outfits.id AND ((job = @job AND job_grade <= @jobGrade) OR rcore_clothing_outfit_restrictions.identifier IN (@identifiers))
                )
            )
    ]], {
        ['@pedModel'] = pedModel,
        ['@shopName'] = shopName,
        ['@job'] = job,
        ['@jobGrade'] = jobGrade,
        ['@identifiers'] = identifiers,
    })
end

function DbRemovePersonalOutfit(identifier, id)
    MySQL.Sync.execute([[
        DELETE FROM rcore_clothing_outfits
        WHERE identifier=@identifier AND id=@id
    ]], {
        ['@identifier'] = identifier,
        ['@id'] = id,
    })
end

function DbRemoveShopOutfit(id)
    MySQL.Sync.execute([[
        DELETE FROM rcore_clothing_outfit_restrictions
        WHERE rcore_clothing_outfit_id=@id
    ]], {
        ['@id'] = id,
    })

    MySQL.Sync.execute([[
        DELETE FROM rcore_clothing_outfits
        WHERE id=@id
    ]], {
        ['@id'] = id,
    })

    MySQL.Sync.execute([[
        DELETE FROM rcore_clothing_outfit_restrictions
        WHERE rcore_clothing_outfit_id=@id
    ]], {
        ['@id'] = id,
    })
end

function DbEditShopOutfit(id, name, price, jobs, identifiers)
    MySQL.Sync.execute([[
        UPDATE rcore_clothing_outfits
        SET name=@name, price=@price
        WHERE id=@id
    ]], {
        ['@id'] = id,
        ['@name'] = name,
        ['@price'] = price,
    })

    MySQL.Sync.execute([[
        DELETE FROM rcore_clothing_outfit_restrictions
        WHERE rcore_clothing_outfit_id=@id
    ]], {
        ['@id'] = id,
    })

    for _, job in pairs(jobs) do
        MySQL.Sync.execute([[
            INSERT INTO rcore_clothing_outfit_restrictions (rcore_clothing_outfit_id, job, job_grade)
            VALUES (@itemId, @jobName, @jobGrade) ]], {
            ['@itemId'] = id,
            ['@jobName'] = job.name,
            ['@jobGrade'] = job.grade,
        })
    end

    for _, identifier in pairs(identifiers) do
        MySQL.Sync.execute([[
            INSERT INTO rcore_clothing_outfit_restrictions (rcore_clothing_outfit_id, identifier)
            VALUES (@itemId, @identifier) ]], {
            ['@itemId'] = id,
            ['@identifier'] = identifier,
        })
    end
end

function DbEnrichOutfitsWithRestrictions(outfits)
    local ids = {}

    for _, outfit in pairs(outfits) do
        table.insert(ids, outfit.id)
    end

    local restrictions = {}

    if #ids > 0 then
        restrictions = MySQL.Sync.fetchAll([[
            SELECT rcore_clothing_outfit_id as id, job, job_grade, identifier
            FROM rcore_clothing_outfit_restrictions
            WHERE rcore_clothing_outfit_id IN (@ids)
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

    for _, outfit in pairs(outfits) do
        if indexedRestrictions[outfit.id] then
            outfit.jobs = indexedRestrictions[outfit.id].jobs
            outfit.identifiers = indexedRestrictions[outfit.id].identifiers
        end
    end

    return outfits
end

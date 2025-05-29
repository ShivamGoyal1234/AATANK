function DbGetOrCreateCurrentOutfit(identifier, pedModel)
    local result = DbGetCurrentOutfit(identifier)

    if #result == 0 then
        DbCreateCurrentOutfit(identifier, pedModel, {})

        return {}
    end

    if #result > 1 then
        MySQL.Sync.execute([[
            DELETE FROM rcore_clothing_current
            WHERE identifier = @identifier AND id != @id
        ]], {
            ['@identifier'] = identifier,
            ['@id'] = result[1].id,
        })
    end

    return json.decode(result[1].outfit), result[1].ped_model
end 

function DbGetCurrentOutfit(identifier)
    local result = MySQL.Sync.fetchAll([[
        SELECT * 
        FROM rcore_clothing_current
        WHERE identifier = @identifier
    ]], {
        ['@identifier'] = identifier,
    })

    return result
end

function DbCreateCurrentOutfit(identifier, pedModel, outfit)
    MySQL.Sync.execute([[
        INSERT INTO rcore_clothing_current (identifier, ped_model, outfit)
        VALUES (@identifier, @ped_model, @outfit)
    ]], {
        ['@identifier'] = identifier,
        ['@ped_model'] = pedModel,
        ['@outfit'] = json.encode(outfit),
    })
end

function DbSaveCurrentOutfit(identifier, pedModel, outfit)
    MySQL.Async.execute([[
        UPDATE rcore_clothing_current
        SET outfit = @outfit, ped_model = @ped_model
        WHERE identifier = @identifier
    ]], {
        ['@identifier'] = identifier,
        ['@ped_model'] = pedModel,
        ['@outfit'] = json.encode(outfit),
    })
end

function DbChangePedModelOutfit(identifier, model, outfit)
    MySQL.Sync.execute([[
        DELETE FROM rcore_clothing_current
        WHERE identifier = @identifier
    ]], {
        ['@identifier'] = identifier,
    })

    DbGetOrCreateCurrentOutfit(identifier, model)
    DbSaveCurrentOutfit(identifier, model, outfit)
end
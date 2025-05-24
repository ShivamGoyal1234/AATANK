local apartmentStart = GetConvar('um:NewPlayerApartmentInsideStart', 'false') == 'true'

function GetApartmentInsideStartSpawnUI(src, newData)
    if not apartmentStart then
        TriggerClientEvent('um-multicharacter:client:defaultSpawn', src)
        Debug('New Character NewPlayerApartmentInsideStart is disabled, defaulting to default spawn')
        return
    end

    if GetResourceState('um-spawn') == 'started' then
        TriggerClientEvent('um-spawn:client:startSpawnUI', src, newData)
        Debug('New Character um-spawn is started, using um-spawn')
    elseif GetResourceState('ps-housing') == 'started' then
        if GetResourceState('qbx_properties') == 'started' then
            TriggerClientEvent('apartments:client:setupSpawnUI', src)
            Debug('New Character ps-housing and qbox is started, using ps-housing')
            return
        end
        TriggerClientEvent('ps-housing:client:setupSpawnUI', src, newData, true, true)
        Debug('New Character ps-housing is started, using ps-housing')
    elseif GetResourceState('okokSpawnSelector') == 'started' then
        TriggerClientEvent('okokSpawnSelector:spawnMenu', src, true)
        Debug('New Character okokSpawnSelector is started, using okokSpawnSelector')
    elseif GetResourceState('vms_spawnselector') == 'started' then
        TriggerClientEvent('vms_spawnselector:open', src, true)
        Debug('New Character vms_spawnselector is started, using vms_spawnselector')
    elseif GetResourceState('qb-apartments') == 'started' then
        TriggerClientEvent('apartments:client:setupSpawnUI', src, newData, true, true)
        Debug('New Character qb-apartments is started, using qb-apartments')
    elseif GetResourceState('qbx_properties') == 'started' then
        TriggerClientEvent('apartments:client:setupSpawnUI', src)
        Debug('New Character qbx_properties is started, using qbx_properties')
    elseif GetResourceState('qbx_apartments') == 'started' then
        TriggerClientEvent('apartments:client:setupSpawnUI', src, newData)
        Debug('New Character qbx_apartments is started, using qbx_apartments')
    elseif GetResourceState('0r-apartment') == 'started' then
        TriggerClientEvent('apartments:client:setupSpawnUI', src, newData, true, true)
        Debug('New Character 0r-apartment is started, using 0r-apartment')
    else
        TriggerClientEvent('um-multicharacter:client:defaultSpawn', src)
        Debug('New Character No apartment resource found, defaulting to default spawn')
    end
end

function GetCharacterReadySpawnUI(src, cData)
    if Config.NoSpawnMenuOnlyLastLocation.Status then
        TriggerClientEvent("um-multicharacter:client:spawnLastCoords", src, json.decode(cData.position))
        Debug('Spawn NoSpawnMenuOnlyLastLocation is enabled, spawning last location')
        return
    end

    if GetResourceState('um-spawn') == 'started' then
        TriggerClientEvent('um-spawn:client:startSpawnUI', src, cData)
        Debug('Spawn um-spawn is started, using um-spawn')
    elseif GetResourceState('okokSpawnSelector') == 'started' then
        TriggerClientEvent('okokSpawnSelector:spawnMenu', src, false, json.decode(cData.position))
        Debug('Spawn okokSpawnSelector is started, using okokSpawnSelector')
    elseif GetResourceState('vms_spawnselector') == 'started' then
        TriggerClientEvent('vms_spawnselector:open', src)
        Debug('Spawn vms_spawnselector is started, using vms_spawnselector')
    elseif GetResourceState('qbx_spawn') == 'started' then
        TriggerClientEvent('qb-spawn:client:setupSpawns', src, cData?.citizenid)
        TriggerClientEvent('qb-spawn:client:openUI', src, true)
        Debug('Spawn qbx_spawn is started, using qb-spawn')
    elseif GetResourceState('qb-spawn') == 'started' then
        TriggerClientEvent('qb-spawn:client:setupSpawns', src, cData?.citizenid)
        TriggerClientEvent('qb-spawn:client:openUI', src, true)
        Debug('Spawn qb-spawn is started, using qb-spawn')
    else
        TriggerClientEvent("um-multicharacter:client:spawnLastCoords", src, json.decode(cData.position))
        Debug('Spawn No spawn resource found, spawning last location')
    end
end

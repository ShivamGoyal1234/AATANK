RegisterNetEvent('rcore_clothing:qb:multicharRequestPed', function(reqId, citizenid, coords)
    local Source = source
    local outfit = DbGetCurrentOutfit(citizenid)

    if outfit and outfit[1] and outfit[1].ped_model then
        local model = outfit[1].ped_model
        local outfit = json.decode(outfit[1].outfit)

        TriggerClientEvent('rcore_clothing:qb:multicharResponsePed', Source, reqId, {
            rcore_clothing = true,
            model = model, 
            coords = coords,
            outfit = outfit,
        })
    else
        local result = MySQL.Sync.fetchAll('SELECT * FROM playerskins WHERE citizenid = @cid AND active = 1', {
            ['@cid'] = citizenid
        })
        
        if result[1] then
            local model = result[1].model
            local skin = result[1].skin

            TriggerClientEvent('rcore_clothing:qb:multicharResponsePed', Source, reqId, {
                qb_clothing = true,
                model = model, 
                coords = coords,
                skin = skin,
            })
        else
            print("Error: no skin found for", Source, citizenid, "in primary or fallback storage")
        end
    end
end)
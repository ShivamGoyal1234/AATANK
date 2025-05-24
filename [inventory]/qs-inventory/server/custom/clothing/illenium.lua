if not Config.IsIllenium then return end

RegisterNetEvent('qs-inventory:server:SaveUpdatedClothes')
AddEventHandler('qs-inventory:server:SaveUpdatedClothes', function(fullAppearance)
    local src = source
    local Player = GetPlayerFromId(src)
    if not Player then return end
    local citizenid = GetPlayerIdentifier(src)
    MySQL.Async.execute('UPDATE playerskins SET skin = ? WHERE citizenid = ? AND active = 1', { json.encode(fullAppearance), citizenid })
end)

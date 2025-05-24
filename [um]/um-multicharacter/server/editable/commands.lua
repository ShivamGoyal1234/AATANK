Framework:Core()

local permission = 'group.admin'

lib.addCommand('logout', { help = 'Logout Character', restricted = permission }, function(source)
    local src = source
    Framework:Logout(src)
    TriggerClientEvent('um-multicharacter:client:logout', src)
end)

lib.addCommand('getbucketCheck', { help = 'Get Bucket Check', restricted = permission }, function(source)
    local src = source
    local bucket = GetPlayerRoutingBucket(tostring(src))
    Debug('Bucket ' .. tostring(src) .. ' - ' .. bucket .. '')
end)

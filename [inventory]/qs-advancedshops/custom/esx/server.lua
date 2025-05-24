--[[
    Hi dear customer or developer, here you can fully configure your server's
    framework or you could even duplicate this file to create your own framework.

    If you do not have much experience, we recommend you download the base version
    of the framework that you use in its latest version and it will work perfectly.
]]

local framework = {}
local ESX = exports['es_extended']:getSharedObject()

function framework:registerUsableItem(item, cb)
    ESX.RegisterUsableItem(item, cb)
end

function framework:getPlayerFromId(source)
    return ESX.GetPlayerFromId(source)
end

function framework:getSourceFromIdentifier(identifier)
    return ESX.GetPlayerFromIdentifier(identifier).source
end

function framework:getIdentifier(source)
    if source == 0 then return 'automated' end
    local player = self:getPlayerFromId(source)
    return player?.identifier
end

function framework:getAccountMoney(source, account)
    local player = self:getPlayerFromId(source)
    return player.getAccount(account).money
end

function framework:removeAccountMoney(source, account, amount)
    local player = self:getPlayerFromId(source)
    if self:getAccountMoney(source, account) < amount then
        return false
    end
    player.removeAccountMoney(account, amount)
    return true
end

function framework:addAccountMoney(source, account, amount)
    local player = self:getPlayerFromId(source)
    player.addAccountMoney(account, amount)
end

function framework:removeItem(source, item, count)
    local player = self:getPlayerFromId(source)
    player.removeInventoryItem(item, count)
end

function framework:addItem(source, item, count, slot, info)
    local player = self:getPlayerFromId(source)
    if player.canCarryItem(item, count) then
        player.addInventoryItem(item, count, info, slot)
        return true
    end
    return false
end

---@param player table
---@param item string
function framework:getItem(player, item)
    local data = player.getInventoryItem(item)
    if not data then
        return {
            count = 0
        }
    end
    return data
end

function framework:playerIsAdmin(source)
    local player = self:getPlayerFromId(source)
    return player.getGroup() == 'admin' or player.getGroup() == 'superadmin'
end

function framework:getUserName(source)
    local xPlayer = self:getPlayerFromId(source)
    local firstName, lastName
    if xPlayer.get and xPlayer.get('firstName') and xPlayer.get('lastName') then
        firstName = xPlayer.get('firstName')
        lastName = xPlayer.get('lastName')
    else
        local name = MySQL.Sync.fetchAll('SELECT firstname, lastname FROM users WHERE identifier = ?', { xPlayer.identifier })
        firstName, lastName = name[1]?.firstname or '', name[1]?.lastname or ''
    end

    return firstName, lastName
end

function framework:getUserNameFromIdentifier(identifier)
    local name = MySQL.Sync.fetchAll('SELECT `firstname`, `lastname` FROM `users` WHERE `identifier`=@identifier', { ['@identifier'] = identifier })
    return name[1]?.firstname or '', name[1]?.lastname or ''
end

function framework:getJobName(source)
    local xPlayer = self:getPlayerFromId(source)
    return xPlayer.getJob().name
end

function framework:getPlayers()
    return ESX.GetPlayers()
end

return framework

--[[
    Hi dear customer or developer, here you can fully configure your server's
    framework or you could even duplicate this file to create your own framework.

    If you do not have much experience, we recommend you download the base version
    of the framework that you use in its latest version and it will work perfectly.
]]

local framework = {}
local QBCore = exports['qb-core']:GetCoreObject()

function framework:registerUsableItem(name, cb)
    QBCore.Functions.CreateUseableItem(name, cb)
end

function framework:getPlayerFromId(source)
    return QBCore.Functions.GetPlayer(source)
end

function framework:getSourceFromIdentifier(identifier)
    local src = QBCore.Functions.GetPlayerByCitizenId(identifier).PlayerData.source
    return src
end

function framework:getIdentifier(source)
    if source == 0 then return 'automated' end
    local player = self:getPlayerFromId(source)
    return player.PlayerData.citizenid
end

---@param player table
---@return number
local function getBlackMoney(player)
    local items = player.PlayerData.items
    local totalWorth = 0
    for k, v in pairs(items) do
        if v.name == 'markedbills' then
            totalWorth = totalWorth + v.info.worth
        end
    end
    return totalWorth
end

function framework:getAccountMoney(source, account)
    local player = self:getPlayerFromId(source)
    if account == 'money' then account = 'cash' end
    if account == 'black_money' then return getBlackMoney(player) end
    return player.PlayerData.money[account]
end

local function removeBlackMoney(player, amount)
    local items = player.PlayerData.items
    local blackMoney = getBlackMoney(player)
    while blackMoney > 0 and amount > 0 do
        Wait(10)
        Debug('blackMoney:', blackMoney, 'removed:', 'amount:', amount)
        for k, v in pairs(items) do
            if v.name ~= 'markedbills' then goto continue end
            if v.info.worth > amount then
                v.info.worth = v.info.worth - amount
                amount = 0
                break
            else
                amount = amount - v.info.worth
                items[k] = nil
                Debug('removed:', v.info.worth, 'amount:', amount)
            end
            ::continue::
        end
    end
    SaveInventory(player.PlayerData.source, items)
end

function framework:removeAccountMoney(source, account, amount)
    local player = self:getPlayerFromId(source)
    if account == 'money' then account = 'cash' end
    if account == 'black_money' then
        removeBlackMoney(player, amount)
        return
    end
    if self:getAccountMoney(source, account) < amount then
        return false
    end
    player.Functions.RemoveMoney(account, amount)
    return true
end

function framework:addAccountMoney(source, account, amount)
    local player = self:getPlayerFromId(source)
    if account == 'money' then account = 'cash' end
    if account == 'black_money' then
        local info = { worth = amount }
        sfr:addItem(source, 'markedbills', 1, false, info)
        return
    end
    player.Functions.AddMoney(account, amount)
end

function framework:removeItem(source, item, count)
    local player = self:getPlayerFromId(source)
    player.Functions.RemoveItem(item, count)
end

function framework:addItem(source, item, count, slot, info)
    local player = self:getPlayerFromId(source)
    return player.Functions.AddItem(item, count, slot, info)
end

function framework:getItem(player, item)
    local data = player.Functions.GetItemByName(item)
    if not data then
        return {
            count = 0
        }
    end
    data.count = data.amount
    return data
end

function framework:playerIsAdmin(source)
    return QBCore.Functions.HasPermission(source, 'god') or IsPlayerAceAllowed(source, 'command') or QBCore.Functions.HasPermission(source, 'admin')
end

function framework:getUserName(source)
    local player = self:getPlayerFromId(source)
    return player.PlayerData.charinfo.firstname, player.PlayerData.charinfo.lastname
end

function framework:getUserNameFromIdentifier(identifier)
    local result = MySQL.Sync.fetchAll('SELECT charinfo FROM `players` WHERE citizenid = ?', { identifier })
    if not result[1] then
        return '', ''
    end
    result = result[1]
    result = json.decode(result.charinfo)
    return result?.firstname, result?.lastname
end

function framework:getJobName(source)
    local player = self:getPlayerFromId(source)
    return player.PlayerData.job.name
end

function framework:getPlayers()
    return QBCore.Functions.GetPlayers()
end

return framework ---@type ServerFramework

ConfigSv = {}
ConfigSv.Webhook = "https://discord.com/api/webhooks/1372564203465998377/KJfRJTSbfLarI_JbZRuJfwWLHy0lnpTUlr0GWNhLC8HswztxjGx4lKf_NBolC2FoDWVg"
ConfigSv.Qs_inventory = GetResourceState("qs-inventory") == "started" and true or false -- If you use qs-inventory, set this to true. If you are not using qs-inventory, make it false.
ConfigSv.Ox_inventory = GetResourceState("ox_inventory") == "started" and true or false -- If you use ox-inventory, set this to true. If you are not using ox-inventory, make it false.
ConfigSv.MoneySettings = {
    ["hasMoneyItem"] = false,
    ["moneyItemName"] = "money",
}

local function sendWebhook(name, job, amount) 
    local ts = os.time()
    local time = os.date('%Y-%m-%d %H:%M:%S', ts)
    local embed = {
        {
            ["title"] = "Player Earned Money",
            ["description"] = ('The player made money by doing %s job'):format(job),
            ["color"] = 16705372,
            ["fields"] = {
                {["name"] = "📃 Player", ["value"] = ('**%s**'):format(name)},
                {["name"] = "👷🏻 Completed Job", ["value"] = job},
                {["name"] = "💸 Earned money", ["value"] = ('**$%s**'):format(amount)},
            },
            ["author"] = {
                ["name"] = "kion",
                ["url"] = "https://github.com/ayazwai",
                ["icon_url"] = "https://cdn.discordapp.com/attachments/1038627173361270936/1368232795721433088/ARP2woBG.png?ex=6826a2d7&is=68255157&hm=a401d325687c0801f4dff8e0f362dc41bcd8207b16935e49fdd47daf905e7234&"
            },
            ["timestamp"] =  time,
            ["thumbnail"] =  {
                ["url"] =  "https://cdn.discordapp.com/attachments/1038627173361270936/1368232795721433088/ARP2woBG.png?ex=6826a2d7&is=68255157&hm=a401d325687c0801f4dff8e0f362dc41bcd8207b16935e49fdd47daf905e7234&"
            }
        }
    }
    PerformHttpRequest(ConfigSv.Webhook, function(err, text, headers) end, 'POST', json.encode({username = "Wais Jobpack", embeds = embed}), { ['Content-Type'] = 'application/json' })
end

---------------------------------------------------------------------------------------------------------------
---Function that takes care of player money count
---@enum [parent=#ConfigSv] GetMoney
---@param source
---@return #number
ConfigSv.GetMoney = function(src)
    local p = promise:new()
    local money = 0

    if Config.Framework.Framework == "esx" then
        local xPlayer = wFramework.GetPlayerFromId(src)
        if ConfigSv.MoneySettings.hasMoneyItem then
            money = xPlayer.getInventoryItem(ConfigSv.MoneySettings.moneyItemName).count
        else
            money = xPlayer.getMoney()
        end
    elseif Config.Framework.Framework == "qbcore" or Config.Framework.Framework == "qbox" then
        local Player = Config.Framework.Framework == "qbcore" and wFramework.Functions.GetPlayer(src) or getPlayerFromQbx(src)
        if ConfigSv.MoneySettings.hasMoneyItem then
            money = Player.Functions.GetItemByName(ConfigSv.MoneySettings.moneyItemName).amount
        else
            money = Player.PlayerData.money["cash"]
        end
    end

    p:resolve(money)
    return Citizen.Await(p)
end
---------------------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------------------
---Function that takes care of player money giving
---@enum [parent=#ConfigSv] AddMoney
---@param source
---@param amount
---@return #boolean
ConfigSv.AddMoney = function(src, amount, comingJob)
    if amount <= 0 then return end
    local p = promise:new()
    local job = "unknown"

    if Config.Framework.Framework == "esx" then
        local xPlayer = wFramework.GetPlayerFromId(src)
        job = ('%s - %s'):format(xPlayer.job.name, xPlayer.job.label)
        if ConfigSv.MoneySettings.hasMoneyItem then
            xPlayer.addInventoryItem(ConfigSv.MoneySettings.moneyItemName, amount)
        else
            xPlayer.addMoney(amount)
        end
    elseif Config.Framework.Framework == "qbcore" or Config.Framework.Framework == "qbox" then
        local Player = Config.Framework.Framework == "qbcore" and wFramework.Functions.GetPlayer(src) or getPlayerFromQbx(src)
        job = ('%s - %s'):format(Player.PlayerData.job.name, Player.PlayerData.job.label)
        if ConfigSv.MoneySettings.hasMoneyItem then
            Player.Functions.AddItem(ConfigSv.MoneySettings.moneyItemName, amount)
        else
            Player.Functions.AddMoney("cash", amount)
        end
    end

    sendWebhook(ConfigSv.GetPlayerName(src), (Config.SideJob and comingJob or job), amount)
    p:resolve(true)
    return Citizen.Await(p)
end
---------------------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------------------
---Function that takes care of player money removing
---@enum [parent=#ConfigSv] RemoveMoney
---@param source
---@param amount
---@return #boolean
ConfigSv.RemoveMoney = function(src, amount)
    local p = promise:new()

    if Config.Framework.Framework == "esx" then
        local xPlayer = wFramework.GetPlayerFromId(src)
        if ConfigSv.MoneySettings.hasMoneyItem then
            xPlayer.removeInventoryItem(ConfigSv.MoneySettings.moneyItemName, amount)
        else
            xPlayer.removeMoney(amount)
        end
    elseif Config.Framework.Framework == "qbcore" or Config.Framework.Framework == "qbox" then
        local Player = Config.Framework.Framework == "qbcore" and wFramework.Functions.GetPlayer(src) or getPlayerFromQbx(src)
        if ConfigSv.MoneySettings.hasMoneyItem then
            Player.Functions.RemoveItem(ConfigSv.MoneySettings.moneyItemName, amount)
        else
            Player.Functions.RemoveMoney("cash", amount)
        end
    end

    p:resolve(true)
    return Citizen.Await(p)
end
---------------------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------------------
---Function that takes care of player items giving
---@enum [parent=#ConfigSv] AddItem
---@param source
---@param item
---@param amount
---@return #boolean
ConfigSv.AddItem = function(src, item, amount)
    local p = promise:new()

    if Config.Framework.Framework == "esx" then
        local xPlayer = wFramework.GetPlayerFromId(src)
        xPlayer.addInventoryItem(item, amount)
    elseif Config.Framework.Framework == "qbcore" or Config.Framework.Framework == "qbox" then
        local Player = Config.Framework.Framework == "qbcore" and wFramework.Functions.GetPlayer(src) or getPlayerFromQbx(src)
        Player.Functions.AddItem(item, amount)
    end

    p:resolve(true)
    return Citizen.Await(p)
end
---------------------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------------------
---Function getting the item count of the player
---@enum [parent=#ConfigSv] GetItem
---@param source
---@param item
---@param amount
---@return #boolean
ConfigSv.GetItemAmount = function(src, item)
    local p = promise:new()

    if Config.Framework.Framework == "esx" then
        local xPlayer = wFramework.GetPlayerFromId(src)
        local count = nil

        if ConfigSv.Qs_inventory then
            count = exports['qs-inventory']:GetItemTotalAmount(src, item)
        elseif ConfigSv.Ox_inventory then
            count = exports.ox_inventory:GetItemCount(src, item)
        else
            count = xPlayer.getInventoryItem(item) ~= nil and xPlayer.getInventoryItem(item).count or 0
        end

        while count == nil do Citizen.Wait(0) end
        p:resolve(count)
    elseif Config.Framework.Framework == "qbcore" or Config.Framework.Framework == "qbox" then
        local Player = Config.Framework.Framework == "qbcore" and wFramework.Functions.GetPlayer(src) or getPlayerFromQbx(src)
        p:resolve(Player.Functions.GetItemByName(item).amount)
    end

    return Citizen.Await(p)
end
---------------------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------------------
---Function that takes care of player items removing
---@enum [parent=#ConfigSv] RemoveItem
---@param source
---@param item
---@param amount
---@return #boolean
ConfigSv.RemoveItem = function(src, item, amount)
    local p = promise:new()
    local Player = Config.Framework.Framework == "esx" and wFramework.GetPlayerFromId(src) or (Config.Framework.Framework == "qbcore" and wFramework.Functions.GetPlayer(src) or getPlayerFromQbx(src))

    if Config.Framework.Framework == "qbcore" or Config.Framework.Framework == "qbox" then
        p:resolve(Player.Functions.RemoveItem(item, amount))
    else
        if ConfigSv.Qs_inventory then
            p:resolve(exports['qs-inventory']:RemoveItem(src, item, amount))
        elseif ConfigSv.Ox_inventory then
            p:resolve(exports['ox_inventory']:RemoveItem(src, item, amount))
        else
            if Player.getInventoryItem(item).count >= amount then
                Player.removeInventoryItem(item, amount)
                p:resolve(true)
            else
                p:resolve(false)
            end
        end
    end

    return Citizen.Await(p)
end
---------------------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------------------
---It is a function written for Fivem-appearance. It pulls the active skin from the database and sends it to the user.
---@enum [parent=#ConfigSv] GetAppearance
---@param source
---@return #table
ConfigSv.GetAppearance = function(source)
    if Config.Framework.Framework == "esx" then
        local xPlayer wFramework.GetPlayerFromId(source)
        MySQL.Async.fetchAll('SELECT skin FROM users WHERE identifier = @identifier', {
            ['@identifier'] = xPlayer.identifier
        }, function(result)
            return result[1] ~= nil and json.decode(result[1].skin) or nil
        end)
    elseif Config.Framework.Framework == "qbcore" or Config.Framework.Framework == "qbox" then
        local Player = wFramework.Functions.GetPlayer(source) or getPlayerFromQbx(source)
        MySQL.Async.fetchAll('SELECT * FROM playerskins WHERE citizenid = @citizenid AND active = @active', {
            ['@citizenid'] = Player.PlayerData.citizenid,
            ['@active'] = 1
        }, function(result)
            return result[1] ~= nil and json.decode(result[1].skin) or nil
        end)
    end
end
---------------------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------------------
---This function is used to access player names.
---@enum [parent=#ConfigSv] GetPlayerName
---@param source
---@return #string
ConfigSv.GetPlayerName = function(source)
    if Config.Framework.Framework == "esx" then
        local player = wFramework.GetPlayerFromId(source)
        return ('%s - %s[%s]'):format(player.get('firstName'), player.get('lastName'), source)
    elseif Config.Framework.Framework == "qbcore" or Config.Framework.Framework == "qbox" then
        local player = wFramework.Functions.GetPlayer(source) or getPlayerFromQbx(source)
        return ('%s - %s[%s]'):format(player.PlayerData.charinfo.firstname, player.PlayerData.charinfo.lastname, source)
    end
end
---------------------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------------------
---This function is used to access player names.
---@enum [parent=#ConfigSv] SetJob
---@param source
---@param job
---@return nil
ConfigSv.SetJob = function(source, job, grade)
    local src = source
    local Player = Config.Framework.Framework == "esx" and wFramework.GetPlayerFromId(src) or (Config.Framework.Framework == "qbcore" and wFramework.Functions.GetPlayer(src) or getPlayerFromQbx(src))

    if Config.SideJob then
        TriggerClientEvent('wais:set:sideJob', src, job)
    else
        if Config.Framework.Framework == "esx" then
            Player.setJob(job, grade)
        elseif Config.Framework.Framework == "qbcore" or Config.Framework.Framework == "qbox" then
            Player.Functions.SetJob(job, grade)
        end
    end

end
---------------------------------------------------------------------------------------------------------------
if not Config.Pages.quest then return end

---@param name string
local function getQuestByName(name)
    return table.find(Config.Quests, function(quest) return quest.name == name end)
end

---@param src number
local function handleOpenInventory(src)
    local open_inventory_handler
    open_inventory_handler = AddEventHandler(Config.InventoryPrefix .. ':server:OpenInventory', function()
        local currentSrc = source
        if currentSrc ~= src then
            return Debug('handleOpenInventory', 'Source mismatch Current src', currentSrc, 'src', src)
        end
        local quest = getQuestByName('open_inventory')
        if not quest then
            return Debug('handleOpenInventory', 'Quest not found', 'open_inventory')
        end
        local level = quest.requiredLevel
        local skill = GetSkill(currentSrc)
        if skill.currentLevel < level then
            return Debug('handleOpenInventory', 'Player level is too low', currentSrc, 'open_inventory')
        end
        RemoveEventHandler(open_inventory_handler)
        UpdateQuestProgress(currentSrc, 'open_inventory', 100)
        Debug('OpenInventory', 'Quest progress updated to 100%', src)
    end)
end

---@param src number
---@param quest string
---@param item string
local function handleUseItem(src, quest, item)
    Debug('handleUseItem', 'Quest item', item, quest)
    local use_item_handler
    use_item_handler = AddEventHandler('inventory:usedItem', function(itemName, source)
        local currentSrc = source
        if currentSrc ~= src then
            return Debug('handleUseItem', 'Source mismatch. Current src', currentSrc, 'src', src)
        end
        if itemName ~= item then
            return
        end
        local level = getQuestByName(quest).requiredLevel
        local skill = GetSkill(currentSrc)
        if skill.currentLevel < level then
            return Debug('handleUseItem', 'Player level is too low', currentSrc, quest, item)
        end
        RemoveEventHandler(use_item_handler)
        UpdateQuestProgress(currentSrc, quest, 100)
        Debug('handleUseItem', 'Quest progress updated to 100%', quest, item)
    end)
end

---@param src number
---@param quest string
---@param count number
local function handleQuestCount(src, quest, count)
    Debug('handleQuestCount', 'Quest count', quest, count)
    local quest_count_handler
    quest_count_handler = AddEventHandler('inventory:questFinished', function(source)
        local currentSrc = source
        if currentSrc ~= src then
            return Debug('handleQuestCount', 'Source mismatch. Current src', currentSrc, 'src', src)
        end
        local level = getQuestByName(quest).requiredLevel
        local skill = GetSkill(currentSrc)
        if skill.currentLevel < level then
            return Debug('handleQuestCount', 'Player level is too low', currentSrc, quest, count)
        end
        local identifier = GetPlayerIdentifier(currentSrc)
        local totalFinishedQuests = MySQL.prepare.await('SELECT COUNT(*) as total FROM inventory_quests WHERE owner = ? AND (status = ? OR status = ?)', {
            identifier,
            'reward',
            'completed'
        })
        Debug('handleQuestCount', 'Total finished quests', totalFinishedQuests, currentSrc, quest, count)
        if totalFinishedQuests < count then
            return Debug('handleQuestCount', 'totalFinishedQuests is less than count', currentSrc, quest, count)
        end
        RemoveEventHandler(quest_count_handler)
        UpdateQuestProgress(currentSrc, quest, 100)
        Debug('handleQuestCount', 'Quest progress updated to 100%', quest, count)
    end)
end

---@param src number
---@param quest string
---@param rarity ItemRarities
local function handleRareItemUse(src, quest, rarity)
    Debug('handleRareItemUse', 'Quest item rarity', quest, rarity)
    local use_item_handler
    use_item_handler = AddEventHandler('inventory:usedItem', function(itemName, source)
        local currentSrc = source
        if currentSrc ~= src then
            return Debug('handleRareItemUse', 'Source mismatch. Current src', currentSrc, 'src', src)
        end
        local itemData = ItemList[itemName]
        if not itemData then
            return Error('handleRareItemUse', 'Item not found', itemName, currentSrc, quest, rarity)
        end
        if itemData.rare ~= rarity then
            return Debug('handleRareItemUse', 'Item rarity mismatch', itemName, currentSrc, quest, rarity)
        end
        local level = getQuestByName(quest).requiredLevel
        local skill = GetSkill(currentSrc)
        if skill.currentLevel < level then
            return Debug('handleRareItemUse', 'Player level is too low', currentSrc, quest, rarity)
        end
        RemoveEventHandler(use_item_handler)
        UpdateQuestProgress(currentSrc, quest, 100)
        Debug('handleRareItemUse', 'Quest progress updated to 100%', quest, rarity)
    end)
end

---@param src number
---@param quest string
local function handleAddAttachment(src, quest)
    Debug('handleAddAttachment', 'Quest item', quest)
    local add_attachment_handler
    add_attachment_handler = AddEventHandler('inventory:addAttachment', function(source)
        local currentSrc = source
        if currentSrc ~= src then
            return Debug('handleAddAttachment', 'Source mismatch. Current src', currentSrc, 'src', src)
        end
        local level = getQuestByName(quest).requiredLevel
        local skill = GetSkill(currentSrc)
        if skill.currentLevel < level then
            return Debug('handleAddAttachment', 'Player level is too low', currentSrc, quest)
        end
        RemoveEventHandler(add_attachment_handler)
        UpdateQuestProgress(currentSrc, quest, 100)
        Debug('handleAddAttachment', 'Quest progress updated to 100%', quest)
    end)
end

---@param src number
---@param quest string
local function handleReloadWeapon(src, quest)
    local reloaded = 0
    local handler
    handler = AddEventHandler('weapons:server:AddWeaponAmmo', function()
        local currentSrc = source
        if currentSrc ~= src then
            return Debug('handleReloadWeapon', 'Source mismatch. Current src', currentSrc, 'src', src)
        end
        local level = getQuestByName(quest).requiredLevel
        local skill = GetSkill(currentSrc)
        if skill.currentLevel < level then
            return Debug('handleReloadWeapon', 'Player level is too low', currentSrc, quest)
        end
        reloaded = reloaded + 1
        Debug('handleReloadWeapon', 'Reloaded', reloaded, currentSrc, quest)
        if reloaded >= 5 then
            RemoveEventHandler(handler)
            UpdateQuestProgress(currentSrc, quest, 100)
            Debug('handleReloadWeapon', 'Quest progress updated to 100%', quest)
        end
    end)
end

---@param src number
---@param quest string
local function handleGiveItemToPlayer(src, quest)
    local handler
    handler = AddEventHandler(Config.InventoryPrefix .. ':server:GiveItem', function(target, itemName, amount, slot)
        local currentSrc = source
        if currentSrc ~= src then
            return Debug('handleGiveItemToPlayer', 'Source mismatch. Current src', currentSrc, 'src', src)
        end
        local level = getQuestByName(quest).requiredLevel
        local skill = GetSkill(currentSrc)
        if skill.currentLevel < level then
            return Debug('handleGiveItemToPlayer', 'Player level is too low', currentSrc, quest)
        end
        RemoveEventHandler(handler)
        UpdateQuestProgress(currentSrc, quest, 100)
        Debug('handleGiveItemToPlayer', 'Quest progress updated to 100%', quest)
    end)
end

---@param src number
---@param questName string
local function handleUpdateLevel(src, questName)
    local handler
    handler = AddEventHandler('inventory:updateLevel', function(source, level)
        local currentSrc = source
        if currentSrc ~= src then
            return Debug('handleUpdateLevel', 'Source mismatch. Current src', currentSrc, 'src', src)
        end
        local quest = getQuestByName(questName)
        if not quest then
            return Debug('handleUpdateLevel', 'Quest not found', quest)
        end
        local requiredLevel = quest.requiredLevel
        if level < requiredLevel then
            return Debug('handleUpdateLevel', 'Player level is too low', currentSrc, quest)
        end
        RemoveEventHandler(handler)
        UpdateQuestProgress(currentSrc, questName, 100)
        Debug('handleUpdateLevel', 'Quest progress updated to 100%', quest)
    end)
end

local function handleRepairWeapon(src, questName)
    local handler
    handler = AddEventHandler('weapons:weaponRepaired', function(source, weaponName)
        local currentSrc = source
        if currentSrc ~= src then
            return Debug('handleRepairWeapon', 'Source mismatch. Current src', currentSrc, 'src', src)
        end
        local level = getQuestByName(questName).requiredLevel
        local skill = GetSkill(currentSrc)
        if skill.currentLevel < level then
            return Debug('handleRepairWeapon', 'Player level is too low', currentSrc, questName)
        end
        RemoveEventHandler(handler)
        UpdateQuestProgress(currentSrc, questName, 100)
        Debug('handleRepairWeapon', 'Quest progress updated to 100%', questName)
    end)
end

RegisterNetEvent('inventory:handleQuest', function(questName)
    local src = source
    if not questName then
        return
    end
    local quest = getQuestByName(questName)
    if not quest then
        return Error('handleQuest', 'Quest not found', questName)
    end
    Debug('handleQuest', 'Quest found', questName, quest)
    if quest.item then
        handleUseItem(src, questName, quest.item)
    elseif quest.questCount then
        handleQuestCount(src, questName, quest.questCount)
    elseif quest.itemRarity then
        handleRareItemUse(src, questName, quest.itemRarity)
    elseif questName == 'open_inventory' then
        handleOpenInventory(src)
    elseif questName == 'add_attachment' then
        handleAddAttachment(src, questName)
    elseif questName == 'reload_weapon' then
        handleReloadWeapon(src, questName)
    elseif questName == 'change_color' then
        UpdateQuestProgress(src, questName, 100)
        Debug('handleQuest', 'Quest progress updated to 100%', questName)
    elseif questName == 'give_item_to_player' then
        handleGiveItemToPlayer(src, questName)
    elseif questName == 'repair_weapon' then
        handleRepairWeapon(src, questName)
    elseif quest.requiredLevel then
        handleUpdateLevel(src, questName)
    else
        Error('handleQuest', 'No handler found for quest', questName)
    end
end)

RegisterCommand('questCount', function(source, args, raw)
    TriggerEvent('inventory:questFinished', source, args[1])
end)

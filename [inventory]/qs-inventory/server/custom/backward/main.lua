if not Config.FetchOldInventory then
    return
end
-- Retrieves your old qs inventory datas
local Query <const> = {
    ['glovebox'] = {
        id = 'plate',
        SELECT = 'SELECT * FROM qs_glovebox WHERE items != "[]"',
        UPSERT = 'INSERT INTO inventory_glovebox (plate, items) VALUES (?, ?) ON DUPLICATE KEY UPDATE items = VALUES(items)',
    },
    ['stash'] = {
        id = 'stash',
        SELECT = 'SELECT * FROM qs_stash WHERE items != "[]"',
        UPSERT = 'INSERT INTO inventory_stash (stash, items) VALUES (?, ?) ON DUPLICATE KEY UPDATE items = VALUES(items)',
    },
    ['trunk'] = {
        id = 'plate',
        SELECT = 'SELECT * FROM qs_trunk WHERE items != "[]"',
        UPSERT = 'INSERT INTO inventory_trunk (plate, items) VALUES (?, ?) ON DUPLICATE KEY UPDATE items = VALUES(items)',
    }
}
local MISSING_ITEM_FILE = 'server/custom/backward/missing_items.json'
local missingItems = {}

local function initItems(items, idName, id)
    items = json.decode(items)
    local newItems = {}
    local slot = 1
    for k, v in pairs(items) do
        local itemInfo = ItemInfo(v)
        if not itemInfo then
            table.insert(missingItems, {
                [idName] = id,
                item = v
            })
            goto continue
        end
        itemInfo.slot = slot
        table.insert(newItems, itemInfo)
        slot = slot + 1
        ::continue::
    end
    return json.encode(newItems)
end

---@param invType 'stash' | 'glovebox' | 'trunk'
local function initBackwardItems(invType)
    Info(('BACKWARD ::: Retrieving %s items'):format(invType))
    local SELECT = Query[invType].SELECT
    local UPSERT = Query[invType].UPSERT
    local ID = Query[invType].id
    if not SELECT or not UPSERT or not ID then
        Error(('BACKWARD ::: No query found for %s'):format(invType))
        return
    end
    local success, result = pcall(function(...)
        return MySQL.Sync.fetchAll(SELECT)
    end)
    if not success then
        Info(('BACKWARD ::: No %s items found'):format(invType))
        return
    end
    local queries = {}
    for k, v in pairs(result) do
        table.insert(queries, {
            query = UPSERT,
            parameters = {
                v[ID],
                initItems(v.items, ID, v[ID])
            }
        })
    end
    local success = MySQL.transaction.await(queries)
    if success then
        Info(('BACKWARD ::: Successfully retrieved %s items. Total items: %d.'):format(invType, #queries))
    else
        Error(('BACKWARD ::: Failed to retrieve %s items.'):format(invType))
    end
end

initBackwardItems('stash')
initBackwardItems('glovebox')
initBackwardItems('trunk')

if #missingItems ~= 0 then
    SaveResourceFile(GetCurrentResourceName(), MISSING_ITEM_FILE, json.encode(missingItems, { indent = true }), -1)
    Error(('BACKWARD ::: %d missing items found. Check %s. These items are not available in items.lua, you can add them to your own items.lua or you can give them to the players manually.'):format(#missingItems, MISSING_ITEM_FILE))
end

Info(('^2Backward compatibility has been completed.^0 PLEASE SET false THE BACKWARD COMPATIBILITY IN THE CONFIG FILE. DO NOT USE THIS SCRIPT WITH BACKWARD COMPATIBILITY ENABLED.'))
Error('It would be best for your server to delete your old sql files. PLEASE DELETE THEM!')

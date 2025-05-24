function AddToStash(stashId, slot, otherslot, itemName, amount, info, created)
    amount = tonumber(amount) or 1
    local ItemData = ItemList[itemName]
    if not ItemData.unique then
        if Stashes[stashId].items[slot] and Stashes[stashId].items[slot].name == itemName then
            if NotStoredItems(itemName, source, amount) then
                return
            end
            Stashes[stashId].items[slot].amount = Stashes[stashId].items[slot].amount + amount
        else
            Stashes[stashId].items[slot] = ItemInfo({
                name = itemName,
                amount = amount,
                slot = slot,
                info = info,
                created = created,
            })
        end
    else
        if Stashes[stashId].items[slot] and Stashes[stashId].items[slot].name == itemName then
            Stashes[stashId].items[otherslot] = ItemInfo({
                name = itemName,
                amount = amount,
                slot = otherslot,
                info = info,
                created = created,
            })
        else
            Stashes[stashId].items[slot] = ItemInfo({
                name = itemName,
                amount = amount,
                slot = slot,
                info = info,
                created = created,
            })
        end
    end
    UpdatedInventories.stash[stashId] = true
end

sharedExports('AddToStash', AddToStash)

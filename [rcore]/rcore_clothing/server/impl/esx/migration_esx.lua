local function esxGetPlayerSkins(page, pageSize)
    local offset = (page - 1) * pageSize
    return MySQL.Sync.fetchAll("SELECT skin, identifier FROM users ORDER BY identifier ASC LIMIT @pageSize OFFSET @offset", {
        ['@pageSize'] = pageSize,
        ['@offset'] = offset
    })
end

local function migrateESXSkins()
    local page = 1
    while true do
        local skins = esxGetPlayerSkins(page, 50)

        if #skins == 0 then
            print("Skins migration finished")
            break
        end

        for _, meta in pairs(skins) do
            if meta.skin and meta.skin ~= '' then
                local skin = json.decode(meta.skin)

                if skin then
                    local model = skin.sex == 1 and -1667301416 or 1885233650

                    local formatted = SkinchangerSkinToRcoreoutfit(skin)
                    DbCreateCurrentOutfit(meta.identifier, model, formatted)
                end
            end
        end

        page = page + 1
    end
end

RegisterCommand("rcore_clothes_migrate_esx", function()
    print("Migrating ESX to RCore Clothing")

    migrateESXSkins()
end, true)

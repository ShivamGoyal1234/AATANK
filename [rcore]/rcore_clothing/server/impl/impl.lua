RegisterNetEvent('rcore_clothing:impl:setFallbackOutfit', function(outfit)
    local Source = source

    local ident = GetPlayerFwIdentifier(Source)
    local model = GetEntityModel(GetPlayerPed(Source))

    if Config.Framework == 1 then
        MySQL.Sync.execute([[
            UPDATE users SET skin=@skin WHERE identifier=@ident
        ]], {
            ['@skin'] = json.encode(outfit),
            ['@ident'] = ident
        })
    elseif Config.Framework == 2 then
        local dbSkin = MySQL.Sync.fetchAll([[
            SELECT * from playerskins WHERE citizenid=@cid AND active=1
        ]], {
            ['@cid'] = ident
        })

        if #dbSkin == 0 then
            MySQL.Sync.execute([[
                INSERT INTO playerskins (citizenid, model, skin, active) VALUES (@cid, @model, @skin, 1)
            ]], {
                ['@model'] = model,
                ['@skin'] = json.encode(outfit),
                ['@cid'] = ident
            })
        else
            MySQL.Sync.execute([[
                UPDATE playerskins SET model=@model, skin=@skin WHERE citizenid=@cid AND active=1
            ]], {
                ['@model'] = model,
                ['@skin'] = json.encode(outfit),
                ['@cid'] = ident
            })
        end
    end
end)
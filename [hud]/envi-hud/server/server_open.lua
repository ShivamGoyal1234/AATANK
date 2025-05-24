CreateThread(function()
    if Bridge.Framework == 'esx' then
        Database.query([[
            ALTER TABLE owned_vehicles
            ADD COLUMN IF NOT EXISTS HarnessInstalled INT DEFAULT 0
        ]])
    elseif Bridge.Framework == 'qb' or Bridge.Framework == 'qbox' then
        Database.query([[
            ALTER TABLE player_vehicles 
            ADD COLUMN IF NOT EXISTS HarnessInstalled INT DEFAULT 0
        ]])
    else
        error('No Compatible Framework found by envi-bridge - Please install envi-bridge and use a compatible Framework as shown on documentation - alternatively, you can make your own edits to envi-hud/server/server_open.lua')
    end
    Database.query([[
        CREATE TABLE IF NOT EXISTS envi_hud_settings_global (
            id INT PRIMARY KEY DEFAULT 1 CHECK (id = 1),
            updated_by VARCHAR(255),
            updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
            settings TEXT,
            disabled_elements TEXT
        )
    ]])
    Database.query([[
        CREATE TABLE IF NOT EXISTS envi_hud_settings (
            identifier VARCHAR(255) PRIMARY KEY,
            settings TEXT
        )
    ]])
end)

Framework.CreateCallback('envi-hud:getDisabledHudElements', function(source, cb)
    local result = Database.single([[SELECT disabled_elements FROM envi_hud_settings_global]])
    if result then
        local disabledElements = json.decode(result.disabled_elements)
        print('Disabled Elements: ', json.encode(disabledElements))
        cb(disabledElements)
    else
        cb(false)
    end
end)

Framework.CreateCallback('envi-hud:saveGlobalHudSettings', function(source, cb, settings, disabledElements)
    local src = source
    local Player = Framework.GetPlayer(src)
    if not Player then
        cb(false)
        return
    end
    local hasPermission = Framework.HasPermission(src, Config.AdminRoles)
    if not hasPermission then
        cb(false)
        return
    end
    local dateAndTime = os.date('%Y-%m-%d %H:%M:%S')
    Database.query([[
        INSERT INTO envi_hud_settings_global (id, updated_by, updated_at, settings, disabled_elements)
        VALUES (1, ?, ?, ?, ?)
        ON DUPLICATE KEY UPDATE
        updated_by = VALUES(updated_by),
        updated_at = VALUES(updated_at),
        settings = VALUES(settings),
        disabled_elements = VALUES(disabled_elements)
    ]], { Player.Identifier, dateAndTime, json.encode(settings), json.encode(disabledElements) })
    cb(true)
end)

Framework.CreateCallback('envi-hud:isAdmin', function(source, cb)
    local src = source
    local Player = Framework.GetPlayer(src)
    if not Player then
        cb(false)
        return
    end
    local hasPermission = Framework.HasPermission(src, Config.AdminRoles)
    if not hasPermission then
        cb(false)
        return
    end
    cb(true)
end)

Framework.CreateCallback('envi-hud:getGlobalHudSettings', function(source, cb)
    local result = Database.single([[SELECT settings, disabled_elements FROM envi_hud_settings_global]])
    if result then
        print('Global Settings (raw): ', result.settings and result.settings:sub(1, 100) .. '...' or 'nil')
        
        local success, decodedSettings = false, nil
        if result.settings then
            success, decodedSettings = pcall(function() 
                return json.decode(result.settings) 
            end)
        end
        
        if success and decodedSettings then
            print('Global Settings (decoded): Successfully decoded')
            cb(decodedSettings, result.disabled_elements)
        else
            print('Global Settings: Error decoding - returning raw')
            cb(false, result.disabled_elements)
        end
    else
        print('No Global Settings Found')
        cb(false, false)
    end
end)

local lastSaveTime = {}

Framework.CreateCallback('envi-hud:savePlayerHudSettings', function(source, cb, settings)
    local Player = Framework.GetPlayer(source)
    if not Player then
        cb(false)
        return
    end

    local currentTime = os.time()
    if lastSaveTime[source] and currentTime - lastSaveTime[source] < 3 then
        cb(false)
        return
    end
    lastSaveTime[source] = currentTime
    local identifier = Player.Identifier
    if type(settings) ~= 'table' then
        cb(false)
        return
    end
    local success, encodedSettings = pcall(function()
        return json.encode(settings)
    end)
    if not success or not encodedSettings then
        cb(false)
        return
    end
    local decodeSuccess, _ = pcall(function()
        return json.decode(encodedSettings)
    end)
    if not decodeSuccess then
        cb(false)
        return
    end
    Database.query([[
        INSERT INTO envi_hud_settings (identifier, settings) VALUES (?, ?)
        ON DUPLICATE KEY UPDATE settings = VALUES(settings)
    ]], { identifier, encodedSettings })
    cb(true)
end)

Framework.CreateCallback('envi-hud:getPlayerHudSettings', function(source, cb)
    local Player = Framework.GetPlayer(source)
    if not Player then
        cb(false)
        return
    end
    local identifier = Player.Identifier
    local result = Database.single([[SELECT settings FROM envi_hud_settings WHERE identifier = ?]], { identifier })
    if result and result.settings then
        local success, decodedSettings = pcall(function()
            return json.decode(result.settings)
        end)
        if success and decodedSettings then
            print('[envi-hud] Successfully retrieved settings for', identifier, '| Settings: ', json.encode(decodedSettings))
            cb(decodedSettings)
        else
            print('[envi-hud] Error decoding settings from database:', result.settings:sub(1, 100) .. '...')
            cb(false)
        end
    else
        cb(false)
    end
end)

local function isVehcileOwned(plate)
    if Bridge.Framework == 'esx' then
        return Database.single([[SELECT 1 FROM owned_vehicles WHERE plate = ?]], { plate })
    elseif Bridge.Framework == 'qb' or Bridge.Framework == 'qbox' then
        return Database.single([[SELECT 1 FROM player_vehicles WHERE plate = ?]], { plate })
    end
end

local function hasItem(source, item)
    return Framework.HasItem(source, item, 1)
end

Framework.CreateCallback('envi-hud:checkHarness', function(source, cb, plate, level)
    if Bridge.Framework == 'esx' then
        Database.query([[
            SELECT HarnessInstalled FROM owned_vehicles WHERE plate = ?
        ]], { plate }, function(result)
            if result and result[1] then
                local installed = result[1].HarnessInstalled or 0
                if level then
                    cb(installed >= level, installed)
                else
                    cb(installed >= 1, installed)
                end
            else
                cb(false)
            end
        end)
    elseif Bridge.Framework == 'qb' or Bridge.Framework == 'qbox' then
        Database.query([[
            SELECT HarnessInstalled FROM player_vehicles WHERE plate = ?
        ]], { plate }, function(result)
            if result and result[1] then
                local installed = result[1].HarnessInstalled or 0
                if level then
                    cb(installed >= level, installed)
                else
                    cb(installed >= 1, installed)
                end
            else
                cb(false)
            end
        end)
    else
       error('No Compatible Framework found by envi-bridge - Please install envi-bridge and use a compatible Framework as shown on documentation - alternatively, you can make your own edits to envi-hud/server/server_open.lua')
   end
end)


Framework.CreateCallback('envi-hud:installHarness', function(source, cb, plate, level)
    if not hasItem(source, Config.Items.Install[level].item) then
        Framework.Notify(source, Config.Lang.NoInstallItem, 'error')
        cb(false)
        return
    end
    if not isVehcileOwned(plate) then
        Framework.Notify(source, Config.Lang.InstallSuccess, 'success')
        Framework.RemoveItem(source, Config.Items.Install[level].item, 1)
        cb(false)
        return
    end

    if Bridge.Framework == 'esx' then
        Database.query([[
            UPDATE owned_vehicles SET HarnessInstalled = ? WHERE plate = ?
        ]], { level, plate }, function(result)
            if result.affectedRows > 0 then
                Framework.Notify(source, Config.Lang.InstallSuccess, 'success')
                local removed = Framework.RemoveItem(source, Config.Items.Install[level].item, 1)
                if removed then
                    cb(true)
                else
                    Framework.Notify(source, Config.Lang.InstallFailed, 'error')
                    cb(false)
                end
            end
        end)
    elseif Bridge.Framework == 'qb' or Bridge.Framework == 'qbox' then
        Database.query([[
            UPDATE player_vehicles SET HarnessInstalled = ? WHERE plate = ?
        ]], { level, plate }, function(result)
            if result.affectedRows > 0 then
                Framework.Notify(source, Config.Lang.InstallSuccess, 'success')
                local removed = Framework.RemoveItem(source, Config.Items.Install[level].item, 1)
                if removed then
                    cb(true)
                else
                    Framework.Notify(source, Config.Lang.InstallFailed, 'error')
                    cb(false)
                end
            end
        end)
    else
        error('No Compatible Framework found by envi-bridge - Please install envi-bridge and use a compatible Framework as shown on documentation - alternatively, you can make your own edits to envi-hud/server/server_open.lua')
    end
end)

Framework.CreateCallback('envi-hud:uninstallHarness', function(source, cb, plate, level)
    if not isVehcileOwned(plate) then
        Framework.Notify(source, Config.Lang.NotOwnedVehicle, 'error')
        cb(false)
        return
    end
    if not hasItem(source, Config.Items.Uninstall) then
        Framework.Notify(source, Config.Lang.NoUninstallItem, 'error')
        cb(false)
        return
    end
    if Bridge.Framework == 'esx' then
        Database.query([[
            UPDATE owned_vehicles SET HarnessInstalled = 0 WHERE plate = ?
        ]], { plate }, function(result)
            if result.affectedRows > 0 then
                Framework.Notify(source, Config.Lang.UninstallSuccess, 'success')
                local removed = Framework.RemoveItem(source, Config.Items.Uninstall, 1)
                if removed then
                    Framework.AddItem(source, Config.Items.Install[level].item, 1)
                    cb(true)
                else
                    Framework.Notify(source, Config.Lang.UninstallFailed, 'error')
                    cb(false)
                end
            else
                Framework.Notify(source, Config.Lang.UninstallFailed, 'error')
                cb(false)
            end
        end)
    elseif Bridge.Framework == 'qb' or Bridge.Framework == 'qbox' then
        Database.query([[
            UPDATE player_vehicles SET HarnessInstalled = 0 WHERE plate = ?
        ]], { plate }, function(result)
            if result.affectedRows > 0 then
                Framework.Notify(source, Config.Lang.UninstallSuccess, 'success')
                local removed = Framework.RemoveItem(source, Config.Items.Uninstall, 1)
                if removed then
                    Framework.AddItem(source, Config.Items.Install[level].item, 1)
                    cb(true)
                else
                    Framework.Notify(source, Config.Lang.UninstallFailed, 'error')
                    cb(false)
                end
            else
                Framework.Notify(source, Config.Lang.UninstallFailed, 'error')
                cb(false)
            end
        end)
    else
        error('No Compatible Framework found by envi-bridge - Please install envi-bridge and use a compatible Framework as shown on documentation - alternatively, you can make your own edits to envi-hud/server/server_open.lua')
    end
end)

-- QB-HUD Compatibility 
RegisterNetEvent('hud:server:GainStress', function(amount)
    local player = Framework.GetPlayer(source)
    if not player then
        return
    end
    local currentStress = player.GetStatus('stress') or 0
    local newStress = math.min(100, currentStress + amount)
    player.SetStatus('stress', newStress)
    TriggerClientEvent('envi-hud:UpdateStress', source)
end)

RegisterNetEvent('hud:server:RelieveStress', function(amount)
    local player = Framework.GetPlayer(source)
    if not player then
        return
    end
    local currentStress = player.GetStatus('stress') or 0
    local newStress = math.max(0, currentStress - amount)
    player.SetStatus('stress', newStress)
    TriggerClientEvent('envi-hud:UpdateStress', source)
end)


RegisterNetEvent('envi-hud:combatLog', function()
    local player = Framework.GetPlayer(source)
    if not player then
        return
    end
    local playerName = player.Name..'(Character: '..player.Firstname..' '..player.Lastname..')'
    print('^7' .. playerName .. ' HAS LOGGED OUT DURING COMBAT!!  | Identifier: '..player.Identifier..' | Server ID: '..source)
end)

-- EXAMPLE COMMAND TO DISABLE ALL COMBAT IN THE SERVER
-- THIS IS ONLY AVAILIABLE TO FIRE FROM THE SERVER (TXADMIN) CONSOLE
RegisterCommand('DisableAllCombat', function(source)
    if source ~= 0 then
        print('This command can only be used from the server (TXADMIN) console')
        return
    end
    GlobalState.AllCombatDisabled = true
    print('Disabled All Combat: ' .. tostring(GlobalState.AllCombatDisabled))
    TriggerClientEvent('envi-hud:syncPlayers', -1, 'disable')
    local message = {
        type = 'error',
        message = Config.Lang.AllCombatDisabled,
        title = '[ATTENTION!]',
        duration = 60000
    }
    Wait(2000)
    TriggerClientEvent('envi-hud:notify', -1, message)
end, false)

-- EXAMPLE COMMAND TO ENABLE ALL COMBAT IN THE SERVER
-- THIS IS ONLY AVAILIABLE TO FIRE FROM THE SERVER (TXADMIN) CONSOLE
RegisterCommand('EnableAllCombat', function(source)
    if source ~= 0 then
        print('This command can only be used from the server (TXADMIN) console')
        return
    end
    GlobalState.AllCombatDisabled = false
    TriggerClientEvent('envi-hud:syncPlayers', -1, 'enable')
    print('Re-Enabled All Combat')
    local message = {
        type = 'success',
        message = Config.Lang.AllCombatEnabled,
        title = '[ATTENTION!]',
        duration = 60000
    }
    Wait(2000)
    TriggerClientEvent('envi-hud:notify', -1, message)
end, false)

-- EXAMPLE COMMAND TO DISABLE COMBAT FOR A PLAYER
-- THIS IS ONLY AVAILIABLE TO FIRE FROM THE SERVER (TXADMIN) CONSOLE
RegisterCommand('DisableCombat', function(source, args)
    local target = tonumber(args[1])
    if not target then
        print('Please provide a valid player ID')
        return
    end
    TriggerClientEvent('envi-hud:syncPlayers', target, 'disable')
    print('Disabled Combat for ID: ' .. target)
    local message = {
        type = 'error',
        message = Config.Lang.CombatDisabled,
        title = '[ATTENTION!]',
        duration = 60000
    }
    Wait(2000)
    TriggerClientEvent('envi-hud:notify', target, message)
end, false)

-- EXAMPLE COMMAND TO ENABLE COMBAT FOR A PLAYER
-- THIS IS ONLY AVAILIABLE TO FIRE FROM THE SERVER (TXADMIN) CONSOLE
RegisterCommand('EnableCombat', function(source, args)
    local target = tonumber(args[1])
    if not target then
        print('Please provide a valid player ID')
        return
    end
    TriggerClientEvent('envi-hud:syncPlayers', target, 'enable')
    print('Re-Enabled Combat for ID: ' .. target)
    local message = {
        type = 'success',
        message = Config.Lang.CombatEnabled,
        title = '[ATTENTION!]',
        duration = 60000
    }
    Wait(2000)
    TriggerClientEvent('envi-hud:notify', target, message)
end, false)

RegisterNetEvent('rcore_clothing:loadPlayerClothing', function(forceCharCreatorIfNoSkin)
    local Source = source
    LoadSkin(Source, false, forceCharCreatorIfNoSkin)

    local photoScriptState = GetResourceState('rcore_clothing_for_photos')
    local photoScriptStarted = photoScriptState == 'started' or photoScriptState == 'starting'

    if photoScriptStarted and AceCan(Source, Permissions.USE_ADMIN_MODE) then
        TriggerClientEvent('rcore_clothing:drawPhotosWarning', Source)
    end
end)

if Config.EnableReloadSkin then
    RegisterCommand(Config.Commands.ReloadSkin, function(source)
        if source > 0 then
            LoadSkin(source, not Config.EnableSoftReloadSkin)
        else
            print("This command can only be executed by a player")
        end
    end, true)
end

if Config.EnableClearPed then
    RegisterCommand(Config.Commands.ClearPed, function(source)
        if source > 0 then
            TriggerClientEvent('rcore_clothing:clearPed', source)
        else
            print("This command can only be executed by a player")
        end
    end, true)
end

RegisterCommand("opencharcreator", function(source)
    if source > 0 then
        TriggerClientEvent('rcore_clothing:openCharCreator', source)
    else
        print("This command can only be executed by a player")
    end
end, true)

function LoadSkin(serverId, forceReload, forceCharCreatorIfNoSkin)
    local ped = GetPlayerPed(serverId)
    local pedModel = GetEntityModel(ped)
    local identifier = GetPlayerFwIdentifier(serverId)

    local currentOutfit, pedModel = DbGetOrCreateCurrentOutfit(identifier, pedModel)

    if currentOutfit.components or currentOutfit.hair or currentOutfit.props then
        TriggerClientEvent('rcore_clothing:setPlayerClothing', serverId, currentOutfit, pedModel, forceReload)
    else
        if forceCharCreatorIfNoSkin then
            TriggerClientEvent('rcore_clothing:qb:charcreator', serverId)
        end
    end
end

RegisterNetEvent('rcore_clothing:reloadSkin', function()
    local Source = source
    LoadSkin(Source, true)
end)
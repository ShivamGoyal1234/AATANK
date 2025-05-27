Citizen.CreateThread(function()
    while Framework == nil do Wait(5) end

    if Config.AdminMenu.EnableCommands then
        RegisterCommand(Config.AdminMenu.DeleteVehicle, function(source, args, rawCommand)
            local allowed = IsPlayerAceAllowed(tostring(source), "opgarages.admin")

            if allowed then
                local playerPed = GetPlayerPed(source)
                local vehicle = GetVehiclePedIsIn(playerPed, false)
                
                if DoesEntityExist(vehicle) then
                    local plate = GetVehicleNumberPlateText(vehicle)
                    MySQL.Async.execute('DELETE FROM `'..Fr.Table..'` WHERE `plate` = @plate', {
                        ['@plate'] = plate,
                    })
                    TriggerClientEvent('op-uniqueNotif:sendNotify', source, TranslateIt('command_translation_rmcar_success'), "success", 5000)
                    TaskLeaveVehicle(playerPed, vehicle, 1)
                    Wait(1000)
                    local vehNet = NetworkGetNetworkIdFromEntity(vehicle)
                    local vehEntity = NetworkGetEntityFromNetworkId(vehNet)
                    DeleteEntity(vehEntity)
                    DeleteEntity(vehicle)
                    
                    local admin = GetPlayerName(source) .. " (".. Fr.GetIndentifier(source) ..")"
                    local desc = string.format(WHData.vehDel.desc, plate, admin)
                    SendWebHook(WHData.vehDel.head, 16711680, desc)
                else 
                    TriggerClientEvent('op-uniqueNotif:sendNotify', source, TranslateIt('notInveh'), "error", 5000)
                end
            else
                TriggerClientEvent('op-uniqueNotif:sendNotify', source, TranslateIt('notAllowedToUse'), "error", 5000)
            end
        end)

        RegisterCommand(Config.AdminMenu.AddCarCommand, function(source, args, rawCommand)
            local allowed = IsPlayerAceAllowed(tostring(source), "opgarages.admin")

            if source == 0 then return end

            if allowed then
                local plate = generatePlate() 
                print(json.encode(args))
                local model = joaat(args[2])
                local playerOrJob = args[1]
                local vehtype = args[3]
                print(plate)
                print(model)
                print(vehtype)
                local veh = json.encode({model = model, plate = plate})

                if not model or not playerOrJob or not vehtype then
                    return TriggerClientEvent('op-uniqueNotif:sendNotify', source, TranslateIt('argumentsNoMatch'), "error", 5000)
                end

                TriggerClientEvent('op-uniqueNotif:sendNotify', source, TranslateIt('carAdded'), "success", 5000)
                insertVehicleToDatabase(playerOrJob, veh, plate, vehtype)

                local xPlayer = Fr.getPlayerFromId(playerOrJob)
                if xPlayer then
                    playerOrJob = Fr.GetIndentifier(playerOrJob)
                end

                local admin = GetPlayerName(source) .. " (".. Fr.GetIndentifier(source) ..")"
                local desc = string.format(WHData.carAdded.desc, args[2], plate, playerOrJob, admin, vehtype)
                SendWebHook(WHData.carAdded.head, 65390, desc)
            else
                TriggerClientEvent('op-uniqueNotif:sendNotify', source, TranslateIt('notAllowedToUse'), "error", 5000)
            end
        end)
    end

    function insertVehicleToDatabase(playerOrJob, veh, plate, vehtype)
        local xPlayer = Fr.getPlayerFromId(tonumber(playerOrJob))
        if xPlayer then
            local owner = Fr.GetIndentifier(tonumber(playerOrJob))
            if ESX then
                MySQL.insert('INSERT INTO `'..Fr.Table..'` (`'..Fr.OwnerTable..'`, `plate`, `vehicle`, `type`) VALUES (?, ?, ?, ?)',
                {owner, plate, veh, vehtype})
            elseif QBCore or QBox then
                local vehData = json.decode(veh)
                local sourceFromPlayer = Fr.GetSourceFromPlayerObject(xPlayer)
                local license = GetPlayerLicense(sourceFromPlayer)
                MySQL.insert('INSERT INTO `'..Fr.Table..'` (`license`, `'..Fr.OwnerTable..'`, `plate`, `mods`, `type`, `vehicle`) VALUES (?, ?, ?, ?, ?, ?)',
                {license, owner, plate, veh, vehtype, vehData.model})
            end
        else 
            if ESX then
                MySQL.insert('INSERT INTO `'..Fr.Table..'` (`'..Fr.OwnerTable..'`, `plate`, `vehicle`, `type`, `job`) VALUES (?, ?, ?, ?, ?)',
                {"", plate, veh, vehtype, playerOrJob})
            elseif QBCore or QBox then
                local vehData = json.decode(veh)
                MySQL.insert('INSERT INTO `'..Fr.Table..'` (`license`, `'..Fr.OwnerTable..'`, `plate`, `mods`, `type`, `job`, `vehicle`) VALUES (?, ?, ?, ?, ?, ?, ?)',
                {"", "", plate, veh, vehtype, playerOrJob, vehData.model})
            end
        end
    end

    function GetPlayerLicense(source)
        local identifiers = GetPlayerIdentifiers(source)
        for _, id in ipairs(identifiers) do
            if string.sub(id, 1, string.len("license:")) == "license:" then
                return id
            end
        end
        return nil
    end
end)
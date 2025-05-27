Framework = nil
Fr = {}
ScriptFunctions = {}

ScriptFunctions.GetClosestPlayers = function(maxDistance)
    maxDistance = maxDistance or 10.0
    local playersInRange = {}
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)

    for _, playerId in ipairs(GetActivePlayers()) do
        local otherPed = GetPlayerPed(playerId)
        local playerServerId = GetPlayerServerId(playerId)
        if otherPed ~= playerPed then
            local otherCoords = GetEntityCoords(otherPed)
            local distance = #(playerCoords.xyz - otherCoords.xyz)
            if distance <= maxDistance then
                table.insert(playersInRange, { id = playerServerId, distance = distance })
            end
        end
    end

    return playersInRange
end

ScriptFunctions.RequestModel = function(modelHash, cb)
	modelHash = (type(modelHash) == 'number' and modelHash or joaat(modelHash))

	if not HasModelLoaded(modelHash) and IsModelInCdimage(modelHash) then
		RequestModel(modelHash)

		while not HasModelLoaded(modelHash) do
			Wait(0)
		end
	end

	if cb ~= nil then
		cb()
	end
end

Citizen.CreateThread(function()

    ESX = GetResourceState('es_extended') == 'started' and true or false
    QBCore = GetResourceState('qb-core') == 'started' and true or false
    QBox = GetResourceState('qbx_core') == 'started' and true or false

    function getJobName()
        if (PlayerData ~= nil and PlayerData.job ~= nil and PlayerData.job.name ~= nil) then
            return PlayerData.job.name
        end
        return nil
    end
    
    function getJobGrade() 
        if (PlayerData ~= nil and PlayerData.job ~= nil and PlayerData.job.grade ~= nil) then
            return type(PlayerData.job.grade) == "table" and PlayerData.job.grade.level or PlayerData.job.grade
        end
        return nil
    end

    if ESX then
        Framework = exports["es_extended"]:getSharedObject()
        Fr.PlayerLoaded = 'esx:playerLoaded'
        Fr.VehicleEncode = "vehicle"
        Fr.identificatorTable = "identifier"
        Fr.StoredTable = 'stored'
        Fr.JobUpdateEvent = "esx:setJob"
        Fr.OwnerTable = "owner"

        Fr.TriggerServerCallback = function(...)
            return Framework.TriggerServerCallback(...)
        end
        Fr.GetVehicleProperties = function(vehicle) 
            return lib.getVehicleProperties(vehicle)
        end
        Fr.DeleteVehicle = function(vehicle)
            return Framework.Game.DeleteVehicle(vehicle)
        end
        Fr.SpawnVehicle = function(vehicleModel, coords, heading, networked, cb)
            local model = type(vehicleModel) == 'number' and vehicleModel or joaat(vehicleModel)
            local vector = type(coords) == "vector3" and coords or vec(coords.x, coords.y, coords.z)
            networked = networked == nil and true or networked

            local playerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(playerPed)
            if not vector or not playerCoords then
                return
            end
            local dist = #(playerCoords - vector)
            if dist > 424 then -- Onesync infinity Range (https://docs.fivem.net/docs/scripting-reference/onesync/)
                local executingResource = GetInvokingResource() or "Unknown"
                return print(("[^1ERROR^7] Resource ^5%s^7 Tried to spawn vehicle on the client but the position is too far away (Out of onesync range)."):format(executingResource))
            end

            CreateThread(function()
                ScriptFunctions.RequestModel(model)

                local vehicle = CreateVehicle(model, vector.xyz, heading, networked, true)

                if networked then
                    local id = NetworkGetNetworkIdFromEntity(vehicle)
                    SetNetworkIdCanMigrate(id, true)
                    SetEntityAsMissionEntity(vehicle, true, true)
                end
                SetVehicleHasBeenOwnedByPlayer(vehicle, true)
                SetVehicleNeedsToBeHotwired(vehicle, false)
                SetModelAsNoLongerNeeded(model)
                SetVehRadioStation(vehicle, 'OFF')

                RequestCollisionAtCoord(vector.xyz)
                while not HasCollisionLoadedAroundEntity(vehicle) do
                    Wait(0)
                end

                if cb then
                    cb(vehicle)
                end
            end)
        end
        Fr.SetVehicleProperties = function(...) 
            return lib.setVehicleProperties(...)
        end
        Fr.GetPlayerData = function()
            return Framework.GetPlayerData()
        end
    elseif QBCore or QBox then
        Framework = exports['qb-core']:GetCoreObject()
        Fr.PlayerLoaded = 'QBCore:Client:OnPlayerLoaded'
        Fr.VehicleEncode = "mods"
        Fr.identificatorTable = "citizenid"
        Fr.StoredTable = 'state'
        Fr.JobUpdateEvent = "QBCore:Client:OnJobUpdate"
        Fr.OwnerTable = "citizenid"

        Fr.TriggerServerCallback = function(...)
            return Framework.Functions.TriggerCallback(...)
        end
        Fr.GetVehicleProperties = function(vehicle) 
            return lib.getVehicleProperties(vehicle)
        end
        Fr.DeleteVehicle = function(vehicle)
            return Framework.Functions.DeleteVehicle(vehicle)
        end
        Fr.SpawnVehicle = function(vehicleModel, coords, heading, networked, cb)
            local model = type(vehicleModel) == 'number' and vehicleModel or joaat(vehicleModel)
            local vector = type(coords) == "vector3" and coords or vec(coords.x, coords.y, coords.z)
            networked = networked == nil and true or networked

            local playerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(playerPed)
            if not vector or not playerCoords then
                return
            end
            local dist = #(playerCoords - vector)
            if dist > 424 then -- Onesync infinity Range (https://docs.fivem.net/docs/scripting-reference/onesync/)
                local executingResource = GetInvokingResource() or "Unknown"
                return print(("[^1ERROR^7] Resource ^5%s^7 Tried to spawn vehicle on the client but the position is too far away (Out of onesync range)."):format(executingResource))
            end

            CreateThread(function()
                ScriptFunctions.RequestModel(model)

                local vehicle = CreateVehicle(model, vector.xyz, heading, networked, true)

                if networked then
                    local id = NetworkGetNetworkIdFromEntity(vehicle)
                    SetNetworkIdCanMigrate(id, true)
                    SetEntityAsMissionEntity(vehicle, true, true)
                end
                SetVehicleHasBeenOwnedByPlayer(vehicle, true)
                SetVehicleNeedsToBeHotwired(vehicle, false)
                SetModelAsNoLongerNeeded(model)
                SetVehRadioStation(vehicle, 'OFF')

                RequestCollisionAtCoord(vector.xyz)
                while not HasCollisionLoadedAroundEntity(vehicle) do
                    Wait(0)
                end

                if cb then
                    cb(vehicle)
                end
            end)
        end
        Fr.SetVehicleProperties = function(...) 
            return lib.setVehicleProperties(...)
        end
        Fr.GetPlayerData = function()
            return Framework.Functions.GetPlayerData()
        end
    end
end)

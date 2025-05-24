if Config.Framework:upper() ~= 'QB' then return end

local QBCore = exports['qb-core']:GetCoreObject()

Core.ShowNotification = function(text, type)
    lib.notify({
        title = 'Police',
        description = text,
        type = type or 'inform'
    })
end

Core.GetWeaponLabel = function(hash)
    return QBCore.Shared.Weapons[hash] and QBCore.Shared.Weapons[hash].label or 'Unknown'
end

Core.GetPlayerSkin = function()
    local skin = GetResourceState('illenium-appearance') == 'started' and exports['illenium-appearance']:getPedAppearance(cache.ped) or lib.callback.await('p_policejob/server/getPlayerSkin', false)
    return skin
end

Core.isPlayerLoaded = false

Core.GetPlayerJob = function()
    local playerJob = QBCore.Functions.GetPlayerData().job
    if playerJob then
        return {
            name = playerJob.name,
            grade = tonumber(playerJob.grade.level),
            label = playerJob.label,
        }
    end
    return nil
end

Core.GetPlayerGroup = function()
    return lib.callback.await('p_policejob/getGroup', false)
end

Core.showTextUI = function(text)
    lib.showTextUI(text)
end

Core.hideTextUI = function()
    lib.hideTextUI(text)
end

Core.CheckDuty = function()
    return Config.PoliceMDT and exports['piotreq_jobcore']:GetDutyData() or {status = 1}
end

Core.CuffGame = function()
    local game = lib.skillCheck(
        {
            {areaSize = 30, speedMultiplier = 1.5},
        },
        {'1', '2'}
    )
    return game
end

Core.isPlayerDead = function(player)
    local stateBag = Player(player).state
    return stateBag.isDead or stateBag.dead
end

Core.getPlayerName = function()
    local charinfo = QBCore.Functions.GetPlayerData().charinfo
    return charinfo.firstname..' '..charinfo.lastname
end

Core.getIdentifier = function()
    return QBCore.Functions.GetPlayerData().citizenid
end

Core.GetPlayerSex = function()
    return QBCore.Functions.GetPlayerData().charinfo.gender
end

Core.playOutfitAnim = function()
    local animDict = lib.requestAnimDict('clothingtie')
    TaskPlayAnim(cache.ped, animDict, 'try_tie_negative_a', 2.0, 2.0, 2000, 49, 0, false, false, false)
    RemoveAnimDict(animDict)
end

Core.setPrivateClothes = function()
    Core.playOutfitAnim()
    Citizen.Wait(1500)
    if GetResourceState('illenium-appearance') == 'started' then
        local skin = lib.callback.await('p_policejob/server/getPlayerSkin', false)
        if not skin then return end
        if type(skin) ~= 'table' then
            skin = json.decode(skin)
        end
        exports['illenium-appearance']:setPedComponents(PlayerPedId(), skin.components)
        exports['illenium-appearance']:setPedProps(PlayerPedId(), skin.props)
    else
        TriggerServerEvent('qb-clothes:loadPlayerSkin')
    end
end

Core.SetPlayerOutfit = function(skin)
    if not skin then return end
    if type(skin) ~= 'table' then
        skin = json.decode(skin)
    end
    if GetResourceState('illenium-appearance') == 'started' then
        Core.playOutfitAnim()
        Citizen.Wait(1500)
        if type(skin) ~= 'table' then
            skin = json.decode(skin)
        end
        exports['illenium-appearance']:setPedComponents(PlayerPedId(), skin.components)
        exports['illenium-appearance']:setPedProps(PlayerPedId(), skin.props)
    else
        Core.playOutfitAnim()
        Citizen.Wait(1500)
        TriggerEvent('qb-clothing:client:loadOutfit', {outfitData = skin})
    end
end

Citizen.CreateThread(function()
    Target.addVehicle({
        {
            name = 'p_policejob:TowVehicle',
            label = locale('tow_vehicle'),
            icon = 'fa-solid fa-car',
            distance = 2,
            groups = Config.Jobs,
            onSelect = function(data)
                if lib.progressBar({
                    duration = 10000,
                    label = locale('towing_vehicle'),
                    useWhileDead = false,
                    canCancel = true,
                    disable = {
                        car = true,
                        move = true,
                        combat = true
                    },
                    anim = {
                        scenario = 'CODE_HUMAN_MEDIC_TEND_TO_DEAD',
                    },
                }) then
                    if GetResourceState('jg-advancedgarages') == 'started' then
                        TriggerEvent("jg-advancedgarages:client:show-impound-form")
                    else
                        local entity = type(data) == 'number' and data or data.entity
                        local netId = utils.getNetIdFromEntity(entity)
                        TriggerServerEvent('p_policejob:TowVehicle', {netId = netId})
                    end
                end
            end
        }
    })
end)

Citizen.CreateThread(function()
    if not Config.OxRadial then return end
    lib.registerRadial({
        id = 'police_road',
        items = {
            {
                label = locale('resume'),
                icon = 'traffic-light',
                onSelect = function()
                    exports['p_policejob']:ResumeTraffic()
                    Core.ShowNotification(locale('you_resumed_traffic'), 'success')
                end
            },
            {
                label = locale('slow'),
                icon = 'traffic-light',
                onSelect = function()
                    exports['p_policejob']:SlowTraffic()
                    Core.ShowNotification(locale('you_slowed_traffic'), 'success')
                end
            },
            {
                label = locale('stop'),
                icon = 'traffic-light',
                onSelect = function()
                    exports['p_policejob']:StopTraffic()
                    Core.ShowNotification(locale('you_stopped_traffic'), 'success')
                end
            }
        }
    })
end)

local function loadPoliceRadial()
    local playerData = QBCore.Functions.GetPlayerData()
    local items = {
        {
            label = locale('off'),
            icon = 'walkie-talkie',
            onSelect = function()
                exports['pma-voice']:setRadioChannel(0)
            end
        }
    }
    for channel, data in pairs(Config.Radio) do
        if data.jobs[playerData.job.name] then
            items[#items + 1] = {
                label = '#'..channel..' - '..data.label,
                icon = 'walkie-talkie',
                onSelect = function()
                    if Inventory.getItemCount('radio') > 0 then
                        exports['pma-voice']:setRadioChannel(channel)
                    else
                        Core.ShowNotification(locale('you_need_radio'), 'error')
                    end
                end
            }
        end
    end
    lib.registerRadial({
        id = 'police_radio_menu',
        items = items
    })
    lib.addRadialItem({
        id = 'police_radio',
        icon = 'walkie-talkie',
        label = locale('radio'),
        menu = 'police_radio_menu'
    })
    lib.registerRadial({
        id = 'police_options',
        items = {
            {
                label = locale('tablet'),
                icon = 'tablet',
                onSelect = function()
                    if GetResourceState('piotreq_gpt') == 'started' then
                        exports['piotreq_gpt']:OpenGPT()
                    elseif GetResourceState('ps-mdt') == 'started' then
                        ExecuteCommand('mdt')
                    elseif GetResourceState('tk_mdt') == 'started' then
                        exports['tk_mdt']:openUI('police')
                    elseif GetResourceState('lb-tablet') == 'started' then
                        exports["lb-tablet"]:ToggleOpen(true, false)
                    elseif GetResourceState('redutzu-mdt') == 'started' then
                        TriggerEvent('redutzu-mdt:client:openMDT')
                    elseif GetResourceState('qs-mdt') == 'started' then
                        ExecuteCommand('openmdt')
                    elseif GetResourceState('codem-mdt') == 'started' then
                        ExecuteCommand('mdt')
                    end
                end
            },
            {
                label = locale('dispatch'),
                icon = 'bullhorn',
                onSelect = function()
                    if GetResourceState('piotreq_gpt') == 'started' then
                        exports['piotreq_gpt']:OpenDispatch()
                    elseif GetResourceState('ps-dispatch') == 'started' then
                        local calls = lib.callback.await('ps-dispatch:callback:getCalls', false)
                        TriggerEvent('ps-dispatch:client:openMenu', calls)
                    elseif GetResourceState('cd_dispatch') == 'started' then
                        ExecuteCommand('dispatchlarge')
                    elseif GetResourceState('qs-dispatch') == 'started' then
                        ExecuteCommand('toggleopendispatch')
                    elseif GetResourceState('rcore_dispatch') == 'started' then
                        ExecuteCommand('panel')
                    elseif GetResourceState('codem-dispatch') == 'started' then
                        ExecuteCommand('showDispatchs')
                    end
                end
            },
            {
                label = locale('traffic'),
                icon = 'road',
                menu = 'police_road'
            },
            {
                label = locale('objects'),
                icon = 'road-barrier',
                onSelect = function()
                    ObjectMenu()
                end
            },
        }
    })
end

AddEventHandler('onClientResourceStart', function(resourceName)
    if(GetCurrentResourceName() ~= resourceName) then
        return
    end

    Wait(1000)
    evidenceBloodThread()
    local playerData = QBCore.Functions.GetPlayerData()
    if not playerData or not playerData.job or not playerData.job.name then
        return
    end

    Core.isPlayerLoaded = true
    loadStationsBlips()
    loadGaragesBlips()
    if not Config.OxRadial then return end
    if Config.Jobs[playerData.job.name] then
        lib.addRadialItem({
            {
              id = 'police_menu',
              label = locale('job_menu'),
              icon = 'briefcase',
              menu = 'police_options'
            },
        })
        if not Config.PoliceMDT then
            loadPoliceRadial()
        end
    else
        if not Config.PoliceMDT then
            lib.removeRadialItem('police_radio')
        end
    end
end)

RegisterNetEvent('QBCore:Player:SetPlayerData', function(playerData)
    Wait(1000)
    loadStationsBlips()
    loadGaragesBlips()
    Core.isPlayerLoaded = true
    if not Config.OxRadial then return end
    if Config.Jobs[playerData.job.name] then
        lib.addRadialItem({
            {
              id = 'police_menu',
              label = locale('job_menu'),
              icon = 'briefcase',
              menu = 'police_options'
            },
        })
        if not Config.PoliceMDT then
            loadPoliceRadial()
        end
    else
        lib.removeRadialItem('police_menu')
        if not Config.PoliceMDT then
            lib.removeRadialItem('police_radio')
        end
    end
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(jobData)
    Wait(1000)
    loadStationsBlips()
    loadGaragesBlips()
    Core.isPlayerLoaded = true
    if not Config.OxRadial then return end
    if Config.Jobs[jobData.name] then
        lib.addRadialItem({
            {
              id = 'police_menu',
              label = locale('job_menu'),
              icon = 'briefcase',
              menu = 'police_options'
            },
        })
        if not Config.PoliceMDT then
            loadPoliceRadial()
        end
    else
        lib.removeRadialItem('police_menu')
        if not Config.PoliceMDT then
            lib.removeRadialItem('police_radio')
        end
    end
end)

RegisterNetEvent('piotreq_jobcore:UpdateDuty')
AddEventHandler('piotreq_jobcore:UpdateDuty', function(data)
    if not Config.OxRadial then return end
    local playerData = QBCore.Functions.GetPlayerData()
    if not playerData or not playerData.job or not playerData.job.name then
        return
    end

    if not Config.Jobs[playerData.job.name] then
        return
    end

    if data.status == 1 then
        loadPoliceRadial()
    else
        lib.removeRadialItem('police_radio')
        lib.registerRadial({
            id = 'police_options',
            items = {
                {
                    label = locale('tablet'),
                    icon = 'tablet',
                    onSelect = function()
                        if GetResourceState('piotreq_gpt') == 'started' then
                            exports['piotreq_gpt']:OpenGPT()
                        elseif GetResourceState('ps-mdt') == 'started' then
                            ExecuteCommand('mdt')
                        elseif GetResourceState('tk_mdt') == 'started' then
                            exports['tk_mdt']:openUI('police')
                        elseif GetResourceState('lb-tablet') == 'started' then
                            exports["lb-tablet"]:ToggleOpen(true, false)
                        elseif GetResourceState('redutzu-mdt') == 'started' then
                            TriggerEvent('redutzu-mdt:client:openMDT')
                        elseif GetResourceState('qs-mdt') == 'started' then
                            ExecuteCommand('openmdt')
                        elseif GetResourceState('codem-mdt') == 'started' then
                            ExecuteCommand('mdt')
                        end
                    end
                },
            }
        })
    end
end)

Citizen.CreateThread(function()
    if not Config.OxRadial then return end
    lib.registerRadial({
        id = 'police_options',
        items = {
            {
                label = locale('tablet'),
                icon = 'tablet',
                onSelect = function()
                    if GetResourceState('piotreq_gpt') == 'started' then
                        exports['piotreq_gpt']:OpenGPT()
                    elseif GetResourceState('ps-mdt') == 'started' then
                        ExecuteCommand('mdt')
                    elseif GetResourceState('tk_mdt') == 'started' then
                        exports['tk_mdt']:openUI('police')
                    elseif GetResourceState('lb-tablet') == 'started' then
                        exports["lb-tablet"]:ToggleOpen(true, false)
                    elseif GetResourceState('redutzu-mdt') == 'started' then
                        TriggerEvent('redutzu-mdt:client:openMDT')
                    elseif GetResourceState('qs-mdt') == 'started' then
                        ExecuteCommand('openmdt')
                    elseif GetResourceState('codem-mdt') == 'started' then
                        ExecuteCommand('mdt')
                    end
                end
            },
        }
    })
end)

Citizen.CreateThread(function()
    Citizen.Wait(1000)
    if GetResourceState('qs-dispatch') ~= 'missing' then
        RegisterNetEvent('p_policejob/qs-dispatch/alert', function(alertName)
            exports['qs-dispatch'][alertName]()
        end)
    elseif GetResourceState('codem-dispatch') ~= 'missing' then
        RegisterNetEvent('p_policejob/codem-dispatch/alert', function(data)
            exports['codem-dispatch']:CustomDispatch(data)
        end)
    end
end)

Core.AddNewEvidence = function(data)
    if GetResourceState('piotreq_gpt') == 'started' then
        TriggerServerEvent('piotreq_gpt:AddNewEvidence', data)
    elseif GetResourceState('redutzu-mdt') == 'started' then
        exports['redutzu-mdt']:CreateEvidence({
            name = data.item.metadata.displayBlood and locale('blood') or locale('bullet'),
            description = data.data
        })
    end
end

Core.sortGarageVehicles = function(garageName, result)
    local options = {}
    for i = 1, #result, 1 do
        local vehicleData = result[i].mods and json.decode(result[i].mods) or {}
        vehicleData.plate = result[i].plate
        vehicleData.model = result[i].vehicle
        local vehicleName = nil
        local display, make = GetDisplayNameFromVehicleModel(vehicleData.model), GetMakeNameFromVehicleModel(vehicleData.model)
        if Config.Garage.CustomLabels[display:lower()] then
            vehicleName = Config.Garage.CustomLabels[display:lower()]
        else
            local displayLabel, makeLabel = GetLabelText(display), GetLabelText(make)
            vehicleName = (makeLabel ~= 'NULL' and makeLabel or make)..' '..(displayLabel ~= 'NULL' and displayLabel or display)
        end
        options[i] = {
            title = vehicleName,
            description = locale('take_out_vehicle', vehicleName),
            arrow = true,
            image = 'https://docs.fivem.net/vehicles/'..display:lower()..'.webp',
            metadata = {
                {label = locale('vehicle_plate'), value = result[i].plate},
                {label = locale('vehicle_vin'), value = result[i].vin or 'Unknown'},
                {label = locale('vehicle_engine'), value = math.floor(result[i].engine and (result[i].engine / 10) or 100)..'%'},
                {label = locale('vehicle_body'), value = math.floor(result[i].body and (result[i].body / 10) or 100)..'%'},
                {label = locale('vehicle_fuel'), value = math.floor(result[i].fuel or 100)..'%'},
            },
            onSelect = function()
                clientGarages[garageName].takeOutVehicle(vehicleData)
            end
        }
    end

    return options
end
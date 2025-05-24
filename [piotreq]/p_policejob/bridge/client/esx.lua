if Config.Framework:upper() ~= 'ESX' then return end

Core.ShowNotification = function(text, type)
    lib.notify({
        title = 'Police',
        description = text,
        type = type or 'inform'
    })
end

Core.GetWeaponLabel = function(hash)
    local weapon = ESX.GetWeaponFromHash(hash)
    return weapon and weapon.label or 'Unknown'
end

Core.GetPlayerSkin = function()
    local skin = nil
    TriggerEvent('skinchanger:getSkin', function(skinData)
        skin = skinData
    end)

    while skin == nil do Citizen.Wait(100) end

    return skin
end

Core.isPlayerLoaded = false

Core.GetPlayerJob = function()
    return ESX.PlayerData.job
end

Core.GetPlayerGroup = function()
    return LocalPlayer.state.group
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
    return LocalPlayer.state.name
end

Core.getIdentifier = function()
    return ESX.PlayerData.identifier
end

Core.GetPlayerSex = function()
    return ESX.PlayerData.sex
end

Core.playOutfitAnim = function()
    local animDict = lib.requestAnimDict('clothingtie')
    TaskPlayAnim(cache.ped, animDict, 'try_tie_negative_a', 2.0, 2.0, 2000, 49, 0, false, false, false)
    RemoveAnimDict(animDict)
end

Core.setPrivateClothes = function()
    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
        Core.playOutfitAnim()
        Citizen.Wait(1500)
        TriggerEvent('skinchanger:loadClothes', skin, skin)
    end)
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
        TriggerEvent('skinchanger:getSkin', function(mySkin)
            Core.playOutfitAnim()
            Citizen.Wait(1500)
            TriggerEvent('skinchanger:loadClothes', mySkin, skin)
        end)
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
        if data.jobs[ESX.PlayerData.job.name] then
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
    if not ESX.PlayerData or not ESX.PlayerData.job or not ESX.PlayerData.job.name then
        return
    end
    Core.isPlayerLoaded = true
    loadGaragesBlips()
    loadStationsBlips()

    if not Config.OxRadial then return end
    if Config.Jobs[ESX.PlayerData.job.name] then
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

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    Wait(1000)
    ESX.PlayerData = xPlayer
    Core.isPlayerLoaded = true
    loadStationsBlips()
    loadGaragesBlips()

    if not Config.OxRadial then return end
    if Config.Jobs[ESX.PlayerData.job.name] then
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

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    Wait(1000)
    ESX.PlayerData.job = job
    Core.isPlayerLoaded = true
    loadStationsBlips()
    loadGaragesBlips()

    if not Config.OxRadial then return end
    if Config.Jobs[ESX.PlayerData.job.name] then
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

    if not Config.Jobs[ESX.PlayerData.job.name] then
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
        local vehicleData = json.decode(result[i].vehicle)
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
                {label = locale('vehicle_plate'), value = vehicleData.plate},
                {label = locale('vehicle_vin'), value = result[i].vin},
                {label = locale('vehicle_engine'), value = math.floor(vehicleData.engineHealth and (vehicleData.engineHealth / 10) or 100)..'%'},
                {label = locale('vehicle_body'), value = math.floor(vehicleData.bodyHealth and (vehicleData.bodyHealth / 10) or 100)..'%'},
                {label = locale('vehicle_fuel'), value = math.floor(vehicleData.fuelLevel or 100)..'%'},
            },
            onSelect = function()
                clientGarages[garageName].takeOutVehicle(vehicleData)
            end
        }
    end

    return options
end
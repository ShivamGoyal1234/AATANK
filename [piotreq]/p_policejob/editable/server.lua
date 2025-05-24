Core.isPlayerDead = function(player)
    local stateBag = Player(player).state
    return stateBag.isDead or stateBag.dead
end

Core.IsOnDuty = function(identifier)
    return Config.PoliceMDT and exports['piotreq_jobcore']:isPlayerOnDuty(identifier) or true
end

Core.GetPlayerDutyData = function(identifier)
    return Config.PoliceMDT and exports['piotreq_jobcore']:GetPlayerDutyData(identifier) or {status = 1}
end

if Config.Inventory == 'ox_inventory' then
    exports['ox_inventory']:registerHook('swapItems', function(payload)
        local targetId = payload.fromInventory
        if (payload.action == 'swap' or payload.action == 'move') and (targetId ~= payload.toInventory) and payload.fromType == 'player' and payload.toType == 'player' then
            if GlobalState.activeGPS[targetId] then
                local xTarget = Core.GetPlayerFromId(targetId)
                RemoveUnit(targetId)
                local playerName = Core.GetPlayerName(targetId)
                if GetResourceState('piotreq_gpt') == 'started' then
                    exports['piotreq_gpt']:SendAlert(targetId, {
                        title = locale('kidnapped_officer'),
                        code = 'BK-0',
                        canAnswer = false,
                        maxOfficers = 7,
                        time = 5,
                        blip = {
                            scale = 1.1,
                            sprite = 280,
                            color = 1,
                            alpha = 200,
                            name = locale('kidnapped_officer')
                        },
                        info = {
                            {icon = 'fa-solid fa-road', isStreet = true},
                            {icon = 'fa-solid fa-id-card', data = playerName},
                        },
                        notifyTime = 10000,
                        jobs = {['police'] = true, ['sheriff'] = true}
                    })
                elseif GetResourceState('cd_dispatch') == 'started' then
                    local playerPed = GetPlayerPed(targetId)
                    local plyCoords = GetEntityCoords(playerPed)
                    TriggerClientEvent('cd_dispatch:AddNotification', -1, {
                        job_table = {'police', 'sheriff'},
                        coords = vector3(plyCoords.x, plyCoords.y, plyCoords.z),
                        title = 'BK-0',
                        message = locale('kidnapped_officer'),
                        flash = 0,
                        unique_id = tostring(math.random(0000000,9999999)),
                        sound = 1,
                        blip = {
                            sprite = 431,
                            scale = 1.2,
                            colour = 3,
                            flashes = false,
                            text = locale('kidnapped_officer'),
                            time = 5,
                            radius = 0,
                        }
                    })
                elseif GetResourceState('ps-dispatch') == 'started' then
                    TriggerClientEvent('ps-dispatch:client:officerdown', targetId)
                elseif GetResourceState('qs-dispatch') == 'started' then
                    TriggerClientEvent('p_policejob/qs-dispatch/alert', _source, 'OfficerDown')
                elseif GetResourceState('rcore_dispatch') == 'started' then
                    local playerPed = GetPlayerPed(targetId)
                    local plyCoords = GetEntityCoords(playerPed)
                    local data = {
                        code = 'BK-0',
                        default_priority = 'high',
                        coords = plyCoords,
                        job = 'police',
                        text = locale('kidnapped_officer'),
                        type = 'alerts',
                        blip_time = 5, 
                        blip = {
                            sprite = 280,
                            colour = 1,
                            scale = 0.7,
                            text = locale('kidnapped_officer'), 
                            flashes = false,
                            radius = 0,
                        }
                    }
                    TriggerEvent('rcore_dispatch:server:sendAlert', data)
                elseif GetResourceState('codem-dispatch') == 'started' then
                    TriggerClientEvent('p_policejob/codem-dispatch/alert', _source, {
                        type = 'BackUp',
                        header = locale('kidnapped_officer'),
                        text = locale('kidnapped_officer'),
                        code = 'BK-0',
                    })
                end
                exports['p_policejob']:PlaySound(targetId, {
                    distance = 10,
                    file = 'panic',
                    volume = 0.5
                })
            end
        end
        return true
    end, {
        itemFilter = {
            gps = true
        }
    })
end

local antiSpam = {}
local function canUseCommand(playerId)
    local _source = playerId
    if _source < 1 then
        return false
    end

    local xPlayer = Core.GetPlayerFromId(_source)
    if antiSpam[_source] then
        Core.ShowNotification(_source, locale('anti_spam'), 'error')
        return false
    end

    local playerJob = Core.GetPlayerJob(xPlayer)
    if not Config.Jobs[playerJob.name] then
        Core.ShowNotification(_source, locale('you_cant_do_it'), 'error')
        return false
    end

    local dutyData = Core.GetPlayerDutyData(xPlayer.identifier)
    if dutyData.status ~= 1 then
        Core.ShowNotification(_source, locale('not_on_duty'), 'error')
        return false
    end

    return true
end

lib.addCommand('10-13a', {
    help = locale('10-13a_command'),
    restricted = false
}, function(source, args, raw)
    local _source = source
    if not canUseCommand(_source) then return end
    local playerName = Core.GetPlayerName(_source)
    if GetResourceState('piotreq_gpt') == 'started' then
        exports['piotreq_gpt']:SendAlert(_source, {
            title = locale('need_support'),
            code = '10-13A',
            canAnswer = false,
            maxOfficers = 7,
            time = 5,
            blip = {
                scale = 1.1,
                sprite = 280,
                color = 1,
                alpha = 200,
                name = locale('need_support')
            },
            info = {
                {icon = 'fa-solid fa-road', isStreet = true},
                {icon = 'fa-solid fa-id-card', data = playerName},
            },
            type = 'risk',
            notifyTime = 10000,
            jobs = {['police'] = true, ['sheriff'] = true}
        })
    elseif GetResourceState('cd_dispatch') == 'started' then
        local playerPed = GetPlayerPed(_source)
        local plyCoords = GetEntityCoords(playerPed)
        TriggerClientEvent('cd_dispatch:AddNotification', -1, {
            job_table = {'police', 'sheriff'},
            coords = vector3(plyCoords.x, plyCoords.y, plyCoords.z),
            title = '10-13A',
            message = locale('need_support'),
            flash = 0,
            unique_id = tostring(math.random(0000000,9999999)),
            sound = 1,
            blip = {
                sprite = 431,
                scale = 1.2,
                colour = 3,
                flashes = false,
                text = locale('need_support'),
                time = 5,
                radius = 0,
            }
        })
    elseif GetResourceState('ps-dispatch') == 'started' then
        TriggerClientEvent('ps-dispatch:client:officerdown', _source)
    elseif GetResourceState('qs-dispatch') == 'started' then
        TriggerClientEvent('p_policejob/qs-dispatch/alert', _source, 'OfficerDown')
    elseif GetResourceState('rcore_dispatch') == 'started' then
        local playerPed = GetPlayerPed(_source)
        local plyCoords = GetEntityCoords(playerPed)
        local data = {
            code = '10-13A',
            default_priority = 'medium',
            coords = plyCoords,
            job = {'police', 'sheriff'},
            text = locale('need_support'),
            type = 'alerts',
            blip_time = 5, 
            blip = {
                sprite = 280,
                colour = 1,
                scale = 0.7,
                text = locale('need_support'), 
                flashes = false,
                radius = 0,
            }
        }
        TriggerEvent('rcore_dispatch:server:sendAlert', data)
    elseif GetResourceState('codem-dispatch') == 'started' then
        TriggerClientEvent('p_policejob/codem-dispatch/alert', _source, {
            type = 'BackUp',
            header = locale('need_support'),
            text = locale('need_support'),
            code = '10-13A',
        })
    end
    exports['p_policejob']:PlaySound(_source, {
        distance = 10,
        file = 'panic',
        volume = 0.5
    })
    antiSpam[_source] = true
    SetTimeout(5000, function()
        antiSpam[_source] = nil
    end)
end)

lib.addCommand('10-13b', {
    help = locale('10-13b_command'),
    restricted = false
}, function(source, args, raw)
    local _source = source
    if not canUseCommand(_source) then return end

    local playerName = Core.GetPlayerName(_source)
    if GetResourceState('piotreq_gpt') == 'started' then
        exports['piotreq_gpt']:SendAlert(_source, {
            title = locale('need_support'),
            code = '10-13B',
            canAnswer = false,
            maxOfficers = 7,
            time = 5,
            blip = {
                scale = 1.1,
                sprite = 280,
                color = 1,
                alpha = 200,
                name = locale('need_support')
            },
            info = {
                {icon = 'fa-solid fa-road', isStreet = true},
                {icon = 'fa-solid fa-id-card', data = playerName},
            },
            type = 'risk',
            notifyTime = 10000,
            jobs = {['police'] = true, ['sheriff'] = true}
        })
    elseif GetResourceState('cd_dispatch') == 'started' then
        local playerPed = GetPlayerPed(_source)
        local plyCoords = GetEntityCoords(playerPed)
        TriggerClientEvent('cd_dispatch:AddNotification', -1, {
            job_table = {'police', 'sheriff'},
            coords = vector3(plyCoords.x, plyCoords.y, plyCoords.z),
            title = '10-13B',
            message = locale('need_support'),
            flash = 0,
            unique_id = tostring(math.random(0000000,9999999)),
            sound = 1,
            blip = {
                sprite = 431,
                scale = 1.2,
                colour = 3,
                flashes = false,
                text = locale('need_support'),
                time = 5,
                radius = 0,
            }
        })
    elseif GetResourceState('ps-dispatch') == 'started' then
        TriggerClientEvent('ps-dispatch:client:officerdown', _source)
    elseif GetResourceState('qs-dispatch') == 'started' then
        TriggerClientEvent('p_policejob/qs-dispatch/alert', _source, 'OfficerDown')
    elseif GetResourceState('rcore_dispatch') == 'started' then
        local playerPed = GetPlayerPed(_source)
        local plyCoords = GetEntityCoords(playerPed)
        local data = {
            code = '10-13B',
            default_priority = 'medium',
            coords = plyCoords,
            job = {'police', 'sheriff'},
            text = locale('need_support'),
            type = 'alerts',
            blip_time = 5, 
            blip = {
                sprite = 280,
                colour = 1,
                scale = 0.7,
                text = locale('need_support'), 
                flashes = false,
                radius = 0,
            }
        }
        TriggerEvent('rcore_dispatch:server:sendAlert', data)
    elseif GetResourceState('codem-dispatch') == 'started' then
        TriggerClientEvent('p_policejob/codem-dispatch/alert', _source, {
            type = 'BackUp',
            header = locale('need_support'),
            text = locale('need_support'),
            code = '10-13B',
        })
    end
    exports['p_policejob']:PlaySound(_source, {
        distance = 10,
        file = 'panic',
        volume = 0.5
    })
    antiSpam[_source] = true
    SetTimeout(5000, function()
        antiSpam[_source] = nil
    end)
end)

lib.addCommand('bk0', {
    help = locale('bk0_command'),
    restricted = false
}, function(source, args, raw)
    local _source = source
    if not canUseCommand(_source) then return end

    local playerName = Core.GetPlayerName(_source)
    if GetResourceState('piotreq_gpt') == 'started' then
        exports['piotreq_gpt']:SendAlert(_source, {
            title = locale('instant_support'),
            code = 'BK0',
            canAnswer = false,
            maxOfficers = 7,
            time = 5,
            blip = {
                scale = 1.1,
                sprite = 280,
                color = 1,
                alpha = 200,
                name = locale('instant_support')
            },
            info = {
                {icon = 'fa-solid fa-road', isStreet = true},
                {icon = 'fa-solid fa-id-card', data = playerName},
            },
            type = 'risk',
            notifyTime = 10000,
            jobs = {['police'] = true, ['sheriff'] = true}
        })
    elseif GetResourceState('cd_dispatch') == 'started' then
        local playerPed = GetPlayerPed(_source)
        local plyCoords = GetEntityCoords(playerPed)
        TriggerClientEvent('cd_dispatch:AddNotification', -1, {
            job_table = {'police', 'sheriff'},
            coords = vector3(plyCoords.x, plyCoords.y, plyCoords.z),
            title = 'BK0',
            message = locale('instant_support'),
            flash = 0,
            unique_id = tostring(math.random(0000000,9999999)),
            sound = 1,
            blip = {
                sprite = 431,
                scale = 1.2,
                colour = 3,
                flashes = false,
                text = locale('instant_support'),
                time = 5,
                radius = 0,
            }
        })
    elseif GetResourceState('ps-dispatch') == 'started' then
        TriggerClientEvent('ps-dispatch:client:officerdown', _source)
    elseif GetResourceState('qs-dispatch') == 'started' then
        TriggerClientEvent('p_policejob/qs-dispatch/alert', _source, 'OfficerDown')
    elseif GetResourceState('rcore_dispatch') == 'started' then
        local playerPed = GetPlayerPed(_source)
        local plyCoords = GetEntityCoords(playerPed)
        local data = {
            code = 'BK-0',
            default_priority = 'high',
            coords = plyCoords,
            job = {'police', 'sheriff'},
            text = locale('instant_support'),
            type = 'alerts',
            blip_time = 5, 
            blip = {
                sprite = 280,
                colour = 1,
                scale = 0.7,
                text = locale('instant_support'), 
                flashes = false,
                radius = 0,
            }
        }
        TriggerEvent('rcore_dispatch:server:sendAlert', data)
    elseif GetResourceState('codem-dispatch') == 'started' then
        TriggerClientEvent('p_policejob/codem-dispatch/alert', _source, {
            type = 'BackUp',
            header = locale('instant_support'),
            text = locale('instant_support'),
            code = 'BK-0',
        })
    end
    antiSpam[_source] = true
    SetTimeout(5000, function()
        antiSpam[_source] = nil
    end)
end)

lib.addCommand('i', {
    help = locale('custom_alert_command'),
    params = {
        {
            name = 'text',
            type = 'longString',
            help = locale('custom_alert_text')
        },
    },
    restricted = false
}, function(source, args, raw)
    local _source = source
    if not args.text then return end
    if not canUseCommand(_source) then return end
    local playerName = Core.GetPlayerName(_source)
    if GetResourceState('piotreq_gpt') == 'started' then
        exports['piotreq_gpt']:SendAlert(_source, {
            title = locale('custom_alert'),
            code = '00',
            canAnswer = false,
            maxOfficers = 7,
            time = 5,
            blip = {
                scale = 1.1,
                sprite = 280,
                color = 1,
                alpha = 200,
                name = locale('custom_alert')
            },
            info = {
                {icon = 'fa-solid fa-road', isStreet = true},
                {icon = 'fa-solid fa-id-card', data = args.text},
            },
            type = 'normal',
            notifyTime = 10000,
            jobs = {['police'] = true, ['sheriff'] = true}
        })
    elseif GetResourceState('cd_dispatch') == 'started' then
        local playerPed = GetPlayerPed(_source)
        local plyCoords = GetEntityCoords(playerPed)
        TriggerClientEvent('cd_dispatch:AddNotification', -1, {
            job_table = {'police', 'sheriff'},
            coords = vector3(plyCoords.x, plyCoords.y, plyCoords.z),
            title = locale('custom_alert'),
            message = args.text,
            flash = 0,
            unique_id = tostring(math.random(0000000,9999999)),
            sound = 1,
            blip = {
                sprite = 431,
                scale = 1.2,
                colour = 3,
                flashes = false,
                text = locale('custom_alert'),
                time = 5,
                radius = 0,
            }
        })
    elseif GetResourceState('rcore_dispatch') == 'started' then
        local playerPed = GetPlayerPed(_source)
        local plyCoords = GetEntityCoords(playerPed)
        local data = {
            code = '00',
            default_priority = 'medium',
            coords = plyCoords,
            job = {'police', 'sheriff'},
            text = args.text,
            type = 'alerts',
            blip_time = 5, 
            blip = {
                sprite = 280,
                colour = 1,
                scale = 0.7,
                text = locale('custom_alert'), 
                flashes = false,
                radius = 0,
            }
        }
        TriggerEvent('rcore_dispatch:server:sendAlert', data)
    elseif GetResourceState('codem-dispatch') == 'started' then
        TriggerClientEvent('p_policejob/codem-dispatch/alert', _source, {
            type = 'BackUp',
            header = locale('custom_alert'),
            text = args.text,
            code = '00',
        })
    end
    antiSpam[_source] = true
    SetTimeout(5000, function()
        antiSpam[_source] = nil
    end)
end)

RegisterNetEvent('p_policejob:BandAlert', function(targetId) -- alert for band removing
    local _source = source

    local xPlayer = Core.GetPlayerFromId(_source)
    local xTarget = Core.GetPlayerFromId(targetId)

    if not xPlayer or not xTarget then return end

    local targetState = Player(targetId).state
    if not targetState.hasTrackingBand then return end

    local plyCoords = GetEntityCoords(GetPlayerPed(_source))
    local targetCoords = GetEntityCoords(GetPlayerPed(targetId))
    if #(plyCoords - targetCoords) > 5 then return end
    
    if GetResourceState('piotreq_gpt') == 'started' then
        exports['piotreq_gpt']:SendAlert(targetId, {
            title = locale('gps_band_alert'),
            code = 'ALERT',
            canAnswer = false,
            maxOfficers = 7,
            time = 5,
            blip = {
                scale = 1.1,
                sprite = 280,
                color = 1,
                alpha = 200,
                name = locale('gps_band_alert')
            },
            info = {
                {icon = 'fa-solid fa-road', isStreet = true},
            },
            type = 'risk',
            notifyTime = 10000,
        })
    elseif GetResourceState('cd_dispatch') == 'started' then
        local playerPed = GetPlayerPed(_source)
        local plyCoords = GetEntityCoords(playerPed)
        TriggerClientEvent('cd_dispatch:AddNotification', -1, {
            job_table = {'police', 'sheriff'},
            coords = vector3(plyCoords.x, plyCoords.y, plyCoords.z),
            title = locale('gps_band_alert'),
            message = 'ALERT',
            flash = 0,
            unique_id = tostring(math.random(0000000,9999999)),
            sound = 1,
            blip = {
                sprite = 431,
                scale = 1.2,
                colour = 3,
                flashes = false,
                text = locale('gps_band_alert'),
                time = 5,
                radius = 0,
            }
        })
    elseif GetResourceState('ps-dispatch') == 'started' then
        TriggerClientEvent('ps-dispatch:client:officerdown', _source)
    elseif GetResourceState('qs-dispatch') == 'started' then
        TriggerClientEvent('p_policejob/qs-dispatch/alert', _source, 'SuspiciousActivity')
    elseif GetResourceState('rcore_dispatch') == 'started' then
        local playerPed = GetPlayerPed(_source)
        local plyCoords = GetEntityCoords(playerPed)
        local data = {
            code = 'ALERT',
            default_priority = 'high',
            coords = plyCoords,
            job = {'police', 'sheriff'},
            text = locale('gps_band_alert'),
            type = 'alerts',
            blip_time = 5, 
            blip = {
                sprite = 280,
                colour = 1,
                scale = 0.7,
                text = locale('gps_band_alert'), 
                flashes = false,
                radius = 0,
            }
        }
        TriggerEvent('rcore_dispatch:server:sendAlert', data)
    elseif GetResourceState('codem-dispatch') == 'started' then
        TriggerClientEvent('p_policejob/codem-dispatch/alert', _source, {
            type = 'BackUp',
            header = locale('gps_band_alert'),
            text = locale('gps_band_alert'),
            code = 'ALERT',
        })
    end
end)

RegisterNetEvent('p_policejob:TowVehicle', function(data)
    local _source = source
    local xPlayer = Core.GetPlayerFromId(_source)
    local playerJob = Core.GetPlayerJob(xPlayer)
    if not Config.Jobs[playerJob.name] or Config.Jobs[playerJob.name] > playerJob.grade then
        return
    end

    local entity = utils.getEntityFromNetId(data.netId)
    if entity == 0 or not DoesEntityExist(entity) then
        return
    end

    local plyCoords = GetEntityCoords(GetPlayerPed(_source))
    local targetCoords = GetEntityCoords(entity)
    if #(plyCoords - targetCoords) > 5 then return end

    DeleteEntity(entity)
    Core.ShowNotification(_source, locale('vehicle_has_been_towed'), 'success')
end)

local bellTime = os.time()
RegisterNetEvent('p_policejob/server_bell/UseBell', function(data)
    local _source = source
    local stationData = Config.Stations[data.station]
    if not stationData then
        return
    end

    local bellData = stationData.bells[data.bell]
    if not bellData then
        return
    end

    if bellTime > os.time() then
        Core.ShowNotification(_source, locale('bell_cooldown', bellTime - os.time()), 'error')
        return
    end

    bellTime = os.time() + 30
    if GetResourceState('piotreq_gpt') == 'started' then
        exports['piotreq_gpt']:SendAlert(_source, {
            title = locale('bell_alert'),
            code = locale('bell'),
            canAnswer = true,
            maxOfficers = 1,
            time = 1,
            blip = {
                scale = 0.8,
                sprite = 409,
                color = 1,
                alpha = 150,
                name = locale('bell_alert')
            },
            info = {
                {icon = 'fa-solid fa-road', isStreet = true},
            },
            type = 'normal',
            notifyTime = 4000,
            jobs = bellData.jobs
        })
    elseif GetResourceState('cd_dispatch') == 'started' then
        local playerPed = GetPlayerPed(_source)
        local plyCoords = GetEntityCoords(playerPed)
        TriggerClientEvent('cd_dispatch:AddNotification', -1, {
            job_table = {'police', 'sheriff'},
            coords = vector3(plyCoords.x, plyCoords.y, plyCoords.z),
            title = locale('bell_alert'),
            message = locale('bell'),
            flash = 0,
            unique_id = tostring(math.random(0000000,9999999)),
            sound = 1,
            blip = {
                sprite = 431,
                scale = 1.2,
                colour = 3,
                flashes = false,
                text = locale('bell_alert'),
                time = 5,
                radius = 0,
            }
        })
    elseif GetResourceState('rcore_dispatch') == 'started' then
        local playerPed = GetPlayerPed(_source)
        local plyCoords = GetEntityCoords(playerPed)
        local data = {
            code = locale('bell'),
            default_priority = 'low',
            coords = plyCoords,
            job = {'police', 'sheriff'},
            text = locale('bell_alert'),
            type = 'alerts',
            blip_time = 5, 
            blip = {
                sprite = 280,
                colour = 1,
                scale = 0.7,
                text = locale('bell_alert'), 
                flashes = false,
                radius = 0,
            }
        }
        TriggerEvent('rcore_dispatch:server:sendAlert', data)
    elseif GetResourceState('codem-dispatch') == 'started' then
        TriggerClientEvent('p_policejob/codem-dispatch/alert', _source, {
            type = 'BackUp',
            header = locale('bell'),
            text = locale('bell_alert'),
            code = locale('bell'),
        })
    else
        print('[ERROR] SET CUSTOM DISPATCH ALERT IN EDITABLE/SERVER')
    end
end)

lib.callback.register('p_policejob/server_outfits/fetchJobData', function(source)
    local _source = source
    local xPlayer = Core.GetPlayerFromId(_source)
    local serverData = {
        grades = {},
        jobName = Core.GetPlayerJob(xPlayer).name,
        licenses = {}
    }
    if GetResourceState('piotreq_gpt') == 'started' then
        local licenses = exports['piotreq_gpt']:getLicenses()[serverData.jobName]
        for k, v in pairs(licenses) do
            serverData.licenses[#serverData.licenses + 1] = {
                value = k,
                label = v.label
            }
        end
    end
    if Config.Framework == 'ESX' then
        local job_grades = MySQL.query.await('SELECT * FROM job_grades')
        for i = 1, #job_grades, 1 do
            local job_grade = job_grades[i]
            if job_grade.job_name == serverData.jobName then
                serverData.grades[#serverData.grades + 1] = {
                    value = tostring(job_grade.grade),
                    label = job_grade.label
                }
            end
        end
    elseif Config.Framework == 'QB' then
        local QBCore = exports['qb-core']:GetCoreObject()
        for jobName, jobData in pairs(QBCore.Shared.Jobs) do
            for grade, gradeInfo in pairs(jobData.grades) do
                if jobName == serverData.jobName then
                    serverData.grades[#serverData.grades + 1] = {
                        value = tostring(grade),
                        label = gradeInfo.name
                    }
                end
            end
        end
    elseif Config.Framework == 'QBOX' then
        for jobName, jobData in pairs(exports['qbx_core']:GetJobs()) do
            for grade, gradeInfo in pairs(jobData.grades) do
                if jobName == serverData.jobName then
                    serverData.grades[#serverData.grades + 1] = {
                        value = tostring(grade),
                        label = gradeInfo.name
                    }
                end
            end
        end
    end

    return serverData
end)

RegisterNetEvent('p_policejob/server_outfits/createOutfit', function(data, skin)
    local _source = source
    local grades = {}
    local licenses = nil
    for i = 1, #data[2], 1 do
        grades[tostring(data[2][i])] = true
    end
    if data[5] then
        licenses = {}
        for i = 1, #data[5], 1 do
            licenses[data[5][i]] = true
        end
    end
    local id = MySQL.insert.await(
        'INSERT INTO police_outfits (job, grade, label, gender, license, requirements, skin) VALUES (@job, @grade, @label, @gender, @license, @requirements, @skin)', {
        ['@job'] = data[1],
        ['@grade'] = json.encode(grades),
        ['@label'] = data[3],
        ['@gender'] = data[4],
        ['@license'] = licenses and json.encode(licenses) or 'none',
        ['@requirements'] = data[6],
        ['@skin'] = json.encode(skin)
    })
    if id then
        Core.ShowNotification(_source, locale('outfit_created', data[3], data[1]), 'success')
    end
end)

lib.callback.register('p_policejob/server_outfits/getOutfits', function(source, playerGender)
    local _source = source
    local xPlayer = Core.GetPlayerFromId(_source)
    local playerJob = Core.GetPlayerJob(xPlayer)
    local outfits = {}
    local result = MySQL.query.await('SELECT * FROM police_outfits WHERE job = ?', {playerJob.name})
    for i = 1, #result, 1 do
        local outfit = result[i]
        if playerGender == outfit.gender then
            local grades = json.decode(outfit.grade)
            local licenses = outfit.license ~= 'none' and json.decode(outfit.license) or nil
            local hasGrade, hasLicense = grades[tostring(playerJob.grade)], false
            if (outfit.requirements == 'required_grade' or outfit.requirements == 'required_both') and not hasGrade then
                goto skip
            end
            
            if outfit.requirements == 'required_license' or outfit.requirements == 'required_both' then
                if licenses then
                    local plyLicenses = MySQL.query.await('SELECT * FROM gpt_licenses WHERE owner = ?', {xPlayer.identifier})
                    for j = 1, #plyLicenses, 1 do
                        if licenses[plyLicenses[j].type] then
                            hasLicense = true
                            break
                        end
                    end
                end
    
                if not hasLicense then
                    goto skip
                end
            end
    
            outfits[#outfits + 1] = {
                label = outfit.label,
                skin = outfit.skin
            }
        end

        ::skip::
    end
    return outfits
end)

lib.callback.register('p_policejob/server_outfits/fetchAllOutfits', function(source)
    local _source = source
    local xPlayer = Core.GetPlayerFromId(_source)
    local playerJob = Core.GetPlayerJob(xPlayer)
    local result = MySQL.query.await('SELECT * FROM police_outfits')
    return result
end)

RegisterNetEvent('p_policejob/server_outfits/removeOutfits', function(outfits)
    local _source = source
    local xPlayer = Core.GetPlayerFromId(_source)
    local playerJob = Core.GetPlayerJob(xPlayer)
	if not Config.OutfitsAccess[playerJob.name] or Config.OutfitsAccess[playerJob.name] > tonumber(playerJob.grade) then
		return
	end

    local data = {}
    for i = 1, #outfits do
        data[i] = {outfits[i]}
    end
    MySQL.prepare('DELETE FROM police_outfits WHERE id = ?', data)
    Core.ShowNotification(_source, locale('outfits_removed'), 'success')
end)

RegisterNetEvent('p_policejob/server_jail/SendScreenShot', function(data)
    local _source = source
    local webhook = Webhooks['jail']
    if not data.officer then return end
    if not webhook or webhook == 'WEBHOOK HERE' then
        print('[ERROR] SET WEBHOOKS IN CONFIG.WEBHOOKS')
        print('[ERROR] SET WEBHOOKS IN CONFIG.WEBHOOKS')
        print('[ERROR] SET WEBHOOKS IN CONFIG.WEBHOOKS')
        print('[ERROR] SET WEBHOOKS IN CONFIG.WEBHOOKS')
        print('[ERROR] SET WEBHOOKS IN CONFIG.WEBHOOKS')
        print('[ERROR] SET WEBHOOKS IN CONFIG.WEBHOOKS')
        print('[ERROR] SET WEBHOOKS IN CONFIG.WEBHOOKS')
        return
    end

    local playerName = Core.GetPlayerName(_source)
    local embeds = {
		{
			["avatar_url"] = "https://r2.fivemanage.com/xlufCGKYLtGfU8IBmjOL9/LOGO3.png",
			["username"] = locale('bolingbroke'),
			["author"] = {
				["name"] = locale('bolingbroke'),
				["icon_url"] = "https://r2.fivemanage.com/xlufCGKYLtGfU8IBmjOL9/LOGO3.png",
			},
			["description"] = locale('jail_screenshot', playerName, data.officer, data.jail, data.fine, data.reason),
			["type"]="rich",
			["color"] =5793266,
			["image"]= {
				["url"]=data.url
			},
			["footer"] = {
				["text"] = os.date() .. " | "..locale('bolingbroke'),
				["icon_url"] = "https://r2.fivemanage.com/xlufCGKYLtGfU8IBmjOL9/LOGO3.png",
			},
		}
	}
	PerformHttpRequest(Webhooks['jail'], function(err, text, headers) end, 'POST', json.encode({ username = 'pScripts', avatar_url = 'https://r2.fivemanage.com/xlufCGKYLtGfU8IBmjOL9/LOGO3.png',embeds = embeds}), { ['Content-Type'] = 'application/json' })
end)

lib.addCommand('callsign', {
    help = locale('commands.callsign'),
    params = {
        {
            name = 'callsign',
            type = 'number',
            help = locale('callsign_number'),
        }
    },
}, function(source, args)
    local _source = source
    Core.setPlayerData(_source, 'callsign', args.callsign)
end)
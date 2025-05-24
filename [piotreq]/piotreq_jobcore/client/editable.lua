Citizen.CreateThread(function()
    local pedData = Config.Payout
    lib.requestModel(pedData.ped.model)
    local payoutPed = CreatePed(4, GetHashKey(pedData.ped.model), pedData.coords.x, pedData.coords.y, pedData.coords.z - 1, pedData.coords.w, false, true)
    FreezeEntityPosition(payoutPed, true)
    SetBlockingOfNonTemporaryEvents(payoutPed, true)
    SetEntityInvincible(payoutPed, true)
    if pedData.ped.anim.dict then
        loadDict(pedData.ped.anim.dict)
        TaskPlayAnim(payoutPed, pedData.ped.anim.dict, pedData.ped.anim.clip, -8.0, 8.0, -1, pedData.ped.anim.flag or 1, true)
    end
    SetModelAsNoLongerNeeded(pedData.ped.model)
    if GetResourceState('ox_target') == 'started' then
        exports['ox_target']:addSphereZone({
            coords = vector3(pedData.coords.x, pedData.coords.y, pedData.coords.z),
            radius = pedData.radius,
            drawSprite = pedData.drawSprite or false,
            debug = pedData.debug or false,
            options = {
                {
                    name = 'CorePayout',
                    label = pedData.label,
                    icon = pedData.icon,
                    distance = 2,
                    onSelect = function()
                        local hasJob = false
                        local playerJob = Core.GetPlayerJob()
                        if Config.Payouts[playerJob.name] and Config.Payouts[playerJob.name][tostring(playerJob.grade)] then
                            hasJob = true
                        end
    
                        if not hasJob then
                            return Core.ShowNotification(locale('not_payout_for_you'))
                        end
    
                        TriggerServerEvent('piotreq_jobcore:TakePayout')
                    end
                }
            }
        })
    elseif GetResourceState('qb-target') == 'started' then
        exports['qb-target']:AddCircleZone('jobcore_ped', vector3(pedData.coords.x, pedData.coords.y, pedData.coords.z), pedData.radius, {
            name = 'jobcore_ped',
            debugPoly = pedData.debug or false,
        }, {
            options = {
                {
                    action = function()
                        local hasJob = false
                        local playerJob = Core.GetPlayerJob()
                        if Config.Payouts[playerJob.name] and Config.Payouts[playerJob.name][tostring(playerJob.grade)] then
                            hasJob = true
                        end
    
                        if not hasJob then
                            return Core.ShowNotification(locale('not_payout_for_you'))
                        end
    
                        TriggerServerEvent('piotreq_jobcore:TakePayout')
                    end,
                    icon = pedData.icon,
                    label = pedData.label,
                }
            },
            distance = 2.0
        })
    end
end)
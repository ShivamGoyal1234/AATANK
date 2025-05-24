if not Config.UseTarget then
    return
end

local target_name = GetResourceState('ox_target'):find('started') and 'qtarget' or 'qb-target'

function InitializeTargetPed(k, v, ped)
    if ped then
        exports[target_name]:AddTargetEntity(ped, {
            options = {
                {
                    label = v.name .. ' | ' .. v.label,
                    icon = 'fa-solid fa-basket-shopping',
                    action = function()
                        openShop(v)
                    end
                }
            },
            distance = 2.0
        })
    else
        for a, x in pairs(v.coords) do
            exports[target_name]:AddCircleZone(v.name, vector3(x.coords.x, x.coords.y, x.coords.z), 0.5, {
                name = v.name,
                debugPoly = Config.ZoneDebug,
                useZ = true
            }, {
                options = {
                    {
                        label = v.name .. ' | ' .. v.label,
                        icon = 'fa-solid fa-basket-shopping',
                        action = function()
                            openShop(v)
                        end
                    }
                },
                distance = 2.0
            })
        end
    end
end

CreateThread(function()
    for k, v in pairs(Config.Stashes) do
        exports[target_name]:AddCircleZone(v.label .. k, vector3(v.coords.x, v.coords.y, v.coords.z), 0.5, {
            name = v.label .. k,
            debugPoly = false,
            useZ = true
        }, {
            options = {
                {
                    label = v.targetLabel,
                    icon = 'fas fa-shopping-cart',
                    event = 'shops:openStash',
                    stash = v
                }
            },
            distance = 2.0
        })
    end
end)

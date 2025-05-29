Config = {}

Config.Framework = 'QB' -- ESX / QB / QBOX
Config.Language = 'en' -- pl / en
Config.Inventory = 'qb-inventory' -- ox_inventory / qb-inventory / ps-inventory / qs-inventory / tgiann-inventory / codem-inventory
Config.Target = 'qb-target' -- ox_target / qb-target
Config.Logs = false -- true / false
Config.Debug = false
Config.Commands = true -- set to false if you want dont want to use commands
Config.OxRadial = true -- enable ox radial menu? (you can edit this in bridge/client)
Config.PoliceMenu = false -- set to true if you want to use F6 OX LIB MENU
Config.PoliceMenuKey = 'F6' -- key to open police menu
Config.PoliceMDT = GetResourceState('piotreq_gpt') ~= 'missing' -- you using our police mdt?

lib.locale(Config.Language or 'en')

Config.SSN = 'id' -- database column for character unique id

Config.Jobs = {
    ['police'] = 0,
    ['sheriff'] = 0
}

Config.OutfitsAccess = { -- permissions for /police_outfit
    ['police'] = 0,
    ['sheriff'] = 0
}

Config.Stations = {
    ['MissionRow'] = {
        blips = {
            {
                sprite = 60, color = 29, scale = 0.95, display = 2,
                label = 'Mission Row LSPD', coords = vector3(437.6986, -982.1099, 30.6904)
            },
            {
                sprite = 72, color = 29, scale = 0.8, display = 2,
                label = 'Police Extras', coords = vector3(426.9231, -1023.2134, 28.8635),
                restricted = {['police'] = 0, ['sheriff'] = 0}
            },
        },
        bells = {
            {
                coords = vector3(441.22, -981.76, 30.69), radius = 0.75,
                jobs = {['police'] = true, ['sheriff'] = true}, -- which jobs will get alert
            }
        },
        trashes = {
            {
                coords = vector3(450.52, -977.59, 30.69), radius = 0.75,
                allowedJobs = {['police'] = 0, ['sheriff'] = 0}, -- which jobs can access trashes
            }
        },
        bodycams = {
            {
                coords = vector3(461.11, -977.85, 30.69), radius = 0.75,
                allowedJobs = {['police'] = 0, ['sheriff'] = 0}, -- which jobs can access bodycams
            }
        },
        toggleDuty = { -- coords for duty toggle [ONLY QB AND QBOX!!!!!!]
            {
                coords = vector3(442.78, -981.96, 30.69), radius = 0.75,
                allowedJobs = {['police'] = 0, ['sheriff'] = 0},
            }
        }
    }
}

Config.Shops = {
    ['Armory'] = {
        label = 'Police Armory',
        locations = {
            vector3(482.65, -995.27, 30.69)
        },
        requiredDuty = false,
        radius = 0.75,
        allowedJobs = {['police'] = 0, ['sheriff'] = 0}, -- which jobs can access shop
        inventory = {
            {name = 'spike_strip', price = 0},
            {name = 'police_diving_suit', price = 0},
            {name = 'tracking_band', price = 0},
            {name = 'fingerprinter', price = 0},
            {name = 'stick_bag', price = 0},
            {name = 'stick', price = 0},
            {name = 'body_cam', price = 0},
            {name = 'gps', price = 0},
            {name = 'camera', price = 0},
            {name = 'radio', price = 0},
            {name = 'handcuffs', price = 0},
            {name = 'vest_normal', price = 10},
            {name = 'vest_strong', price = 100},
            {name = 'ammo-9', price = 5},
            {name = 'ammo-rifle', price = 5},
            {name = 'ammo-shotgun', price = 5},
            {name = 'WEAPON_FLASHLIGHT', price = 100},
            {name = 'WEAPON_NIGHTSTICK', price = 100, metadata = {registered = true, serial = 'POL'}},
            {name = 'WEAPON_COMBATPISTOL', price = 1000, license = 'weapon', grade = 1, metadata = {registered = true, serial = 'POL'}},
            {name = 'WEAPON_STUNGUN', price = 1000, metadata = {registered = true, serial = 'POL'}},
            {name = 'WEAPON_PUMPSHOTGUN', price = 10000, license = 'weapon', grade = 5, metadata = {registered = true, serial = 'POL'}},
            {name = 'WEAPON_CARBINERIFLE', price = 15000, license = 'weapon', grade = 10, metadata = {registered = true, serial = 'POL'}},
        },
        -- { name = 'weapon_pistol',       price = 0, amount = 50, info = { attachments = { { component = 'COMPONENT_AT_PI_FLSH', label = 'Flashlight' } } } },
        -- { name = 'weapon_stungun',      price = 0, amount = 50, info = { attachments = { { component = 'COMPONENT_AT_AR_FLSH', label = 'Flashlight' } } } },
        -- { name = 'weapon_pumpshotgun',  price = 0, amount = 50, info = { attachments = { { component = 'COMPONENT_AT_AR_FLSH', label = 'Flashlight' } } } },
        -- { name = 'weapon_smg',          price = 0, amount = 50, info = { attachments = { { component = 'COMPONENT_AT_SCOPE_MACRO_02', label = '1x Scope' }, { component = 'COMPONENT_AT_AR_FLSH', label = 'Flashlight' } } } },
        -- { name = 'weapon_carbinerifle', price = 0, amount = 50, info = { attachments = { { component = 'COMPONENT_AT_AR_FLSH', label = 'Flashlight' }, { component = 'COMPONENT_AT_SCOPE_MEDIUM', label = '3x Scope' } } } },
        -- { name = 'weapon_nightstick',   price = 0, amount = 50 },
        -- { name = 'weapon_flashlight',   price = 0, amount = 50 },
        -- { name = 'pistol_ammo',         price = 0, amount = 50 },
        -- { name = 'smg_ammo',            price = 0, amount = 50 },
        -- { name = 'shotgun_ammo',        price = 0, amount = 50 },
        -- { name = 'rifle_ammo',          price = 0, amount = 50 },
        -- { name = 'handcuffs',           price = 0, amount = 50 },
        -- { name = 'empty_evidence_bag',  price = 0, amount = 50 },
        -- { name = 'police_stormram',     price = 0, amount = 50 },
        -- { name = 'armor',               price = 0, amount = 50 },
        -- { name = 'radio',               price = 0, amount = 50 },
        -- { name = 'heavyarmor',          price = 0, amount = 50 },
    }
}

Config.Wardrobes = {
    ['MissionRow'] = {
        coords = vector3(460.97, -999.57, 30.69),
        radius = 0.75,
        drawSprite = false,
    }
}

Config.Lockers = {
    ['MissionRow'] = {
        coords = vector3(460.26, -995.87, 30.69),
        radius = 0.75,
        drawSprite = false,
        options = {
            {
                name = 'MissionRow_Locker', -- stash name and target name ;)
                label = locale('private_locker'),
                icon = 'fa-solid fa-box-open',
                distance = 2,
                groups = Config.Jobs,
                isLocker = true, -- set to false if not locker target
                lockerOwner = false, -- false = shared / true = private
                lockerLabel = locale('private_locker'), -- set only if isLocker
                lockerSlots = 50, lockerWeight = 500000,
                onSelect = function()
                    Inventory.openInventory('stash', 'MissionRow_Locker')
                end,
                canInteract = function()
                    local dutyData = Core.CheckDuty()
                    return dutyData.status == 1
                end
            }
        }
    }
}

Config.Radio = {
    [1] = {
        jobs = {
            ['police'] = true,
            ['sheriff'] = true,
        },
        label = "LSPD"
    },
    [2] = {
        jobs = {
            ['police'] = true,
            ['sheriff'] = true,
        },
        label = "LSPD"
    },
    [3] = {
        jobs = {
            ['police'] = true,
            ['sheriff'] = true,
        },
        label = "LSPD"
    },
    [4] = {
        jobs = {
            ['police'] = true,
            ['sheriff'] = true,
        },
        label = "SHERIFF"
    },
    [5] = {
        jobs = {
            ['police'] = true,
            ['sheriff'] = true,
        },
        label = "SHERIFF"
    },
    [6] = {
        jobs = {
            ['police'] = true,
            ['sheriff'] = true,
        },
        label = "SHERIFF"
    },
}

Config.SetUniform = function(job, grade)
    local animDict = lib.requestAnimDict('clothingtie')
    TaskPlayAnim(cache.ped, animDict, 'try_tie_negative_a', 2.0, 2.0, 2000, 49, 0, false, false, false)
    RemoveAnimDict(animDict)
    Citizen.Wait(1500)
    if Config.Framework == 'ESX' then
        TriggerEvent('skinchanger:getSkin', function(skin)
            local uniformObject
            
            sex = (skin.sex == 0) and "male" or "female"
    
            uniformObject = Config.Outfits[job][grade][sex]
    
            if uniformObject then
                ClearPedBloodDamage(cache.ped)
                ResetPedVisibleDamage(cache.ped)
                ClearPedLastWeaponDamage(cache.ped)
    
                TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
            else
                Core.ShowNotification(locale('no_outfit'), 'error')
            end
        end)
    else
        local uniformObject
            
        local playerSex = Core.GetPlayerSex()
        sex = (playerSex == 0) and "male" or "female"

        uniformObject = Config.Outfits[job][grade][sex]

        if uniformObject then
            ClearPedBloodDamage(cache.ped)
            ResetPedVisibleDamage(cache.ped)
            ClearPedLastWeaponDamage(cache.ped)

            TriggerEvent('qb-clothing:client:loadOutfit', {outfitData = uniformObject})
        else
            Core.ShowNotification(locale('no_outfit'), 'error')
        end
    end
end

Config.CameraShowHelpNotify = function()
    if GetResourceState('p_helper') == 'started' then
        exports['p_helper']:showHelper({
            {
                keys = {'X'},
                label = 'Cancel'
            },
            {
                keys = {'ENTER'},
                label = 'Make Photo'
            },
        })
    else
        lib.showTextUI(locale('camera_helper'))
    end
end

Config.CameraHideHelpNotify = function()
    if GetResourceState('p_helper') == 'started' then
        exports['p_helper']:hideHelper()
    else
        lib.hideTextUI()
    end
end

Config.CameraAccess = false

-- YOU CAN SET CAMERA ITEM ACCESS FOR EACH JOB
-- Config.CameraAccess = {
--     ['police'] = 0,
--     ['sheriff'] = 0
-- }
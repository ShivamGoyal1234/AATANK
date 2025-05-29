Config = {}

Config.Debug = false -- debug prints
Config.Framework = 'QB' -- ESX / QB / QBOX
Config.Language = 'en' -- pl / en
Config.Target = 'qb-target' -- ox_target / qb-target

Config.UseEvidence = false -- enable evidence system [searching by blood, fingerprint, etc.]
Config.EvidenceColumns = {
    ['blood'] = 'blood', -- column from players table in database to search / fetch
    ['fingerprint'] = 'finger' -- column from players table in database to search / fetch
}

Config.TrimPlate = function(plate)
    return (string.gsub(plate, "^%s*(.-)%s*$", "%1"))
end

Config.SSN = 'id' -- database column for unique character id

Config.RadioChannels = {
    ["1"] = 'LSPD' -- script will check player radio channel and show this in workers list
}

Config.Jobs = {
    ['police'] = {
        image = 'img/lspd.png',
        mainColor = '#48569a',
        mainColorHover = '#5160ab',
        bgColor = '#111318'
    }
}

Config.Units = {
    'ADAM', 'MERRY', 'EAGLE', 'SEU' -- for creating patrols (in dropdown menu)
}

Config.Vehicles = {
    
}

Config.DangerCodes = {
    [1] = { -- first danger code is default
        name = 'green',
        label = 'Green',
        color = '#47FF70'
    },
    [2] = {
        name = 'orange',
        label = 'Orange',
        color = 'orange'
    },
    [3] = {
        name = 'red',
        label = 'Red',
        color = 'red'
    },
    [4] = {
        name = 'black',
        label = 'Black',
        color = '#484848'
    },
}

Config.SecondOwner = 'co_owner' -- name of column in owned_vehicles or nil

Config.CitizenLicenses = { -- licenses for citizens
    ['drive'] = {label = 'Driver License B', access = {['police'] = 0}}, -- license name, label and access [which job and from which grade can add license]
    ['drive_truck'] = {label = 'Driver License C', access = {['police'] = 0}}, -- license name, label and access [which job and from which grade can add license]
    ['drive_bike'] = {label = 'Driver License A', access = {['police'] = 0}}, -- license name, label and access [which job and from which grade can add license]
    ['weapon'] = {label = 'Weapon License', access = {['police'] = 0}}, -- license name, label and access [which job and from which grade can add license]
}

Config.PoliceLicenses = { -- licenses for officers
    ['seu'] = {label = 'License SEU', access = {['police'] = 0}}, -- license name, label and access [which job and from which grade can add license]
    ['eagle'] = {label = 'License EAGLE', access = {['police'] = 0}}, -- license name, label and access [which job and from which grade can add license]
    ['dtu'] = {label = 'License DTU', access = {['police'] = 0}}, -- license name, label and access [which job and from which grade can add license]
}

Config.AddKeys = function(plate) -- add carkeys
    TriggerServerEvent('p_carkeys:CreateKeys', plate)
end

Config.RemoveKeys = function(plate) -- remove carkeys
    TriggerServerEvent('p_carkeys:RemoveKeys', plate)
end

Config.Spawners = {
    ['MissionRow'] = {
        coords = vector4(459.04, -1024.88, 28.32, 96.55), -- if ped it will be coords of ped and his heading
        radius = 0.75,
        drawSprite = true,
        debug = false,
        ped = { -- optional
            model = 's_m_y_cop_01',
            anim = {}, -- optional, you can add dict, clip and flag
        }, 
        options = {
            {
                type = 'spawn',
                name = 'MissionRow_Spawn_Helicopters',
                label = 'Take out Helicopter',
                icon = 'fa-solid fa-helicopter',
                distance = 2,
                jobs = {['police'] = 0},
                license = 'eagle', -- license name from gpt_licenses table in db (optional)
                coords = vector4(449.4112, -981.4044, 43.6917, 90.9649), -- coords to spawn veh
                needDuty = true,
                vehicle = {
                    model = 'maverick', -- spawn name
                    tune = true, -- full tune
                    livery = 1, -- optional livery
                    plate = 'PD%s', -- %s = GPT.Editable.FormatPlate in client
                }
            },
            {
                type = 'hide',
                name = 'MissionRow_Hide_Helicopters',
                label = 'Hide Helicopter',
                icon = 'fa-solid fa-helicopter',
                distance = 2,
                jobs = {['police'] = 0},
                license = 'eagle', -- license name from gpt_licenses table in db (optional)
                coords = vector4(449.4112, -981.4044, 43.6917, 90.9649), -- coords to hide veh
                needDuty = true,
            },
        }
    }
}

Config.LicenseSections = { -- required police license to access sections
    -- ['cases'] = 'dtu', -- player need "dtu" license to access cases section
    -- ['evidence'] = 'dtu'
}

Config.ConfiscatePoints = { -- where you can check confiscated vehicles
    ['MissionRow'] = {
        coords = vector3(444.2492, -979.2607, 30.9276),
        -- label = 'Skonfiskowane pojazdy',
        label = 'Confascinated Vehicle',
        icon = 'fa-solid fa-car',
        drawSprite = true,
        debug = false
    }
}

Config.Access = {
    ['police'] = { -- for job police
        ['0'] = {
            ['home'] = {
                ['last_wanted_citizens'] = true, ['last_wanted_vehicles'] = true, ['most_active_employees'] = true,
                ['change_code'] = false, ['duty_time'] = true, ['last_active'] = true
            },
            ['patrols'] = {
                ['create'] = true, ['join'] = true
            },
            ['citizens'] = {
                ['add_note'] = true, ['add_wanted'] = false, ['delete_wanted'] = false, 
                ['add_license'] = false, ['delete_note'] = true, ['delete_license'] = false,
                ['set_photo'] = true
            },
            ['vehicles'] = {
                ['add_note'] = true, ['add_wanted'] = true, 
                ['confiscate'] = false, ['delete_wanted'] = true, ['delete_note'] = true, ['confiscate'] = true
            },
            ['weapons'] = true, -- you can set this to false to disable button for this grade a player
            ['evidence'] = true,
            ['cases'] = {
                ['create'] = true, ['edit'] = true
            },
            ['judgements'] = {
                ['fine'] = true, ['jail'] = true, ['custom_jail'] = false, ['custom_fine'] = false
            },
            ['announcements'] = {
                ['create'] = false, ['delete'] = false
            },
            ['employees'] = {
                ['add'] = false, ['reset_time_all'] = false, ['update'] = false, ['fire'] = false, ['add_note'] = false, ['delete_note'] = false,
                ['break'] = false, ['add_license'] = false, ['delete_license'] = false, ['change_badge'] = false, ['reset_time_employee'] = false,
                ['set_photo'] = false
            },
            ['garage'] = {
                ['buy'] = false, ['impound'] = false, ['manage'] = false
            }
        },
        ['1'] = {
            ['home'] = {
                ['last_wanted_citizens'] = true, ['last_wanted_vehicles'] = true, ['most_active_employees'] = true,
                ['change_code'] = false, ['duty_time'] = true, ['last_active'] = true
            },
            ['patrols'] = {
                ['create'] = true, ['join'] = true
            },
            ['citizens'] = {
                ['add_note'] = true, ['add_wanted'] = false, ['delete_wanted'] = false, 
                ['add_license'] = false, ['delete_note'] = true, ['delete_license'] = false,
                ['set_photo'] = true
            },
            ['vehicles'] = {
                ['add_note'] = true, ['add_wanted'] = true, 
                ['confiscate'] = false, ['delete_wanted'] = true, ['delete_note'] = true, ['confiscate'] = true
            },
            ['weapons'] = true, -- you can set this to false to disable button for this grade a player
            ['evidence'] = true,
            ['cases'] = {
                ['create'] = true, ['edit'] = true
            },
            ['judgements'] = {
                ['fine'] = true, ['jail'] = true, ['custom_jail'] = false, ['custom_fine'] = false
            },
            ['announcements'] = {
                ['create'] = false, ['delete'] = false
            },
            ['employees'] = {
                ['add'] = false, ['reset_time_all'] = false, ['update'] = false, ['fire'] = false, ['add_note'] = false, ['delete_note'] = false,
                ['break'] = false, ['add_license'] = false, ['delete_license'] = false, ['change_badge'] = false, ['reset_time_employee'] = false,
                ['set_photo'] = false
            },
            ['garage'] = {
                ['buy'] = false, ['impound'] = false, ['manage'] = false
            }
        },
        ['2'] = {
            ['home'] = {
                ['last_wanted_citizens'] = true, ['last_wanted_vehicles'] = true, ['most_active_employees'] = true,
                ['change_code'] = true, ['duty_time'] = true, ['last_active'] = true
            },
            ['patrols'] = {
                ['create'] = true, ['join'] = true
            },
            ['citizens'] = {
                ['add_note'] = true, ['add_wanted'] = true, ['delete_wanted'] = true, 
                ['add_license'] = true, ['delete_note'] = true, ['delete_license'] = true,
                ['set_photo'] = true
            },
            ['vehicles'] = {
                ['add_note'] = true, ['add_wanted'] = true, 
                ['confiscate'] = true, ['delete_wanted'] = true, ['delete_note'] = true, ['confiscate'] = true
            },
            ['weapons'] = true, -- you can set this to false to disable button for this grade a player
            ['evidence'] = true,
            ['cases'] = {
                ['create'] = true, ['edit'] = true
            },
            ['judgements'] = {
                ['fine'] = true, ['jail'] = true, ['custom_jail'] = true, ['custom_fine'] = true
            },
            ['announcements'] = {
                ['create'] = true, ['delete'] = true
            },
            ['employees'] = {
                ['add'] = true, ['reset_time_all'] = true, ['update'] = true, ['fire'] = true, ['add_note'] = true, ['delete_note'] = true,
                ['break'] = true, ['add_license'] = true, ['delete_license'] = true, ['change_badge'] = true, ['reset_time_employee'] = true,
                ['set_photo'] = true
            },
            ['garage'] = {
                ['buy'] = true, ['impound'] = true, ['manage'] = true
            }
        },
        ['3'] = {
            ['home'] = {
                ['last_wanted_citizens'] = true, ['last_wanted_vehicles'] = true, ['most_active_employees'] = true,
                ['change_code'] = true, ['duty_time'] = true, ['last_active'] = true
            },
            ['patrols'] = {
                ['create'] = true, ['join'] = true
            },
            ['citizens'] = {
                ['add_note'] = true, ['add_wanted'] = true, ['delete_wanted'] = true, 
                ['add_license'] = true, ['delete_note'] = true, ['delete_license'] = true,
                ['set_photo'] = true
            },
            ['vehicles'] = {
                ['add_note'] = true, ['add_wanted'] = true, 
                ['confiscate'] = true, ['delete_wanted'] = true, ['delete_note'] = true, ['confiscate'] = true
            },
            ['weapons'] = true, -- you can set this to false to disable button for this grade a player
            ['evidence'] = true,
            ['cases'] = {
                ['create'] = true, ['edit'] = true
            },
            ['judgements'] = {
                ['fine'] = true, ['jail'] = true, ['custom_jail'] = true, ['custom_fine'] = true
            },
            ['announcements'] = {
                ['create'] = true, ['delete'] = true
            },
            ['employees'] = {
                ['add'] = true, ['reset_time_all'] = true, ['update'] = true, ['fire'] = true, ['add_note'] = true, ['delete_note'] = true,
                ['break'] = true, ['add_license'] = true, ['delete_license'] = true, ['change_badge'] = true, ['reset_time_employee'] = true,
                ['set_photo'] = true
            },
            ['garage'] = {
                ['buy'] = true, ['impound'] = true, ['manage'] = true
            }
        },
        ['4'] = {
            ['home'] = {
                ['last_wanted_citizens'] = true, ['last_wanted_vehicles'] = true, ['most_active_employees'] = true,
                ['change_code'] = true, ['duty_time'] = true, ['last_active'] = true
            },
            ['patrols'] = {
                ['create'] = true, ['join'] = true
            },
            ['citizens'] = {
                ['add_note'] = true, ['add_wanted'] = true, ['delete_wanted'] = true, 
                ['add_license'] = true, ['delete_note'] = true, ['delete_license'] = true,
                ['set_photo'] = true
            },
            ['vehicles'] = {
                ['add_note'] = true, ['add_wanted'] = true, 
                ['confiscate'] = true, ['delete_wanted'] = true, ['delete_note'] = true, ['confiscate'] = true
            },
            ['weapons'] = true, -- you can set this to false to disable button for this grade a player
            ['evidence'] = true,
            ['cases'] = {
                ['create'] = true, ['edit'] = true
            },
            ['judgements'] = {
                ['fine'] = true, ['jail'] = true, ['custom_jail'] = true, ['custom_fine'] = true
            },
            ['announcements'] = {
                ['create'] = true, ['delete'] = true
            },
            ['employees'] = {
                ['add'] = true, ['reset_time_all'] = true, ['update'] = true, ['fire'] = true, ['add_note'] = true, ['delete_note'] = true,
                ['break'] = true, ['add_license'] = true, ['delete_license'] = true, ['change_badge'] = true, ['reset_time_employee'] = true,
                ['set_photo'] = true
            },
            ['garage'] = {
                ['buy'] = true, ['impound'] = true, ['manage'] = true
            }
        },
        ['5'] = {
            ['home'] = {
                ['last_wanted_citizens'] = true, ['last_wanted_vehicles'] = true, ['most_active_employees'] = true,
                ['change_code'] = true, ['duty_time'] = true, ['last_active'] = true
            },
            ['patrols'] = {
                ['create'] = true, ['join'] = true
            },
            ['citizens'] = {
                ['add_note'] = true, ['add_wanted'] = true, ['delete_wanted'] = true, 
                ['add_license'] = true, ['delete_note'] = true, ['delete_license'] = true,
                ['set_photo'] = true
            },
            ['vehicles'] = {
                ['add_note'] = true, ['add_wanted'] = true, 
                ['confiscate'] = true, ['delete_wanted'] = true, ['delete_note'] = true, ['confiscate'] = true
            },
            ['weapons'] = true, -- you can set this to false to disable button for this grade a player
            ['evidence'] = true,
            ['cases'] = {
                ['create'] = true, ['edit'] = true
            },
            ['judgements'] = {
                ['fine'] = true, ['jail'] = true, ['custom_jail'] = true, ['custom_fine'] = true
            },
            ['announcements'] = {
                ['create'] = true, ['delete'] = true
            },
            ['employees'] = {
                ['add'] = true, ['reset_time_all'] = true, ['update'] = true, ['fire'] = true, ['add_note'] = true, ['delete_note'] = true,
                ['break'] = true, ['add_license'] = true, ['delete_license'] = true, ['change_badge'] = true, ['reset_time_employee'] = true,
                ['set_photo'] = true
            },
            ['garage'] = {
                ['buy'] = true, ['impound'] = true, ['manage'] = true
            }
        },
        ['6'] = {
            ['home'] = {
                ['last_wanted_citizens'] = true, ['last_wanted_vehicles'] = true, ['most_active_employees'] = true,
                ['change_code'] = true, ['duty_time'] = true, ['last_active'] = true
            },
            ['patrols'] = {
                ['create'] = true, ['join'] = true
            },
            ['citizens'] = {
                ['add_note'] = true, ['add_wanted'] = true, ['delete_wanted'] = true, 
                ['add_license'] = true, ['delete_note'] = true, ['delete_license'] = true,
                ['set_photo'] = true
            },
            ['vehicles'] = {
                ['add_note'] = true, ['add_wanted'] = true, 
                ['confiscate'] = true, ['delete_wanted'] = true, ['delete_note'] = true, ['confiscate'] = true
            },
            ['weapons'] = true, -- you can set this to false to disable button for this grade a player
            ['evidence'] = true,
            ['cases'] = {
                ['create'] = true, ['edit'] = true
            },
            ['judgements'] = {
                ['fine'] = true, ['jail'] = true, ['custom_jail'] = true, ['custom_fine'] = true
            },
            ['announcements'] = {
                ['create'] = true, ['delete'] = true
            },
            ['employees'] = {
                ['add'] = true, ['reset_time_all'] = true, ['update'] = true, ['fire'] = true, ['add_note'] = true, ['delete_note'] = true,
                ['break'] = true, ['add_license'] = true, ['delete_license'] = true, ['change_badge'] = true, ['reset_time_employee'] = true,
                ['set_photo'] = true
            },
            ['garage'] = {
                ['buy'] = true, ['impound'] = true, ['manage'] = true
            }
        },
        ['7'] = {
            ['home'] = {
                ['last_wanted_citizens'] = true, ['last_wanted_vehicles'] = true, ['most_active_employees'] = true,
                ['change_code'] = true, ['duty_time'] = true, ['last_active'] = true
            },
            ['patrols'] = {
                ['create'] = true, ['join'] = true
            },
            ['citizens'] = {
                ['add_note'] = true, ['add_wanted'] = true, ['delete_wanted'] = true, 
                ['add_license'] = true, ['delete_note'] = true, ['delete_license'] = true,
                ['set_photo'] = true
            },
            ['vehicles'] = {
                ['add_note'] = true, ['add_wanted'] = true, 
                ['confiscate'] = true, ['delete_wanted'] = true, ['delete_note'] = true, ['confiscate'] = true
            },
            ['weapons'] = true, -- you can set this to false to disable button for this grade a player
            ['evidence'] = true,
            ['cases'] = {
                ['create'] = true, ['edit'] = true
            },
            ['judgements'] = {
                ['fine'] = true, ['jail'] = true, ['custom_jail'] = true, ['custom_fine'] = true
            },
            ['announcements'] = {
                ['create'] = true, ['delete'] = true
            },
            ['employees'] = {
                ['add'] = true, ['reset_time_all'] = true, ['update'] = true, ['fire'] = true, ['add_note'] = true, ['delete_note'] = true,
                ['break'] = true, ['add_license'] = true, ['delete_license'] = true, ['change_badge'] = true, ['reset_time_employee'] = true,
                ['set_photo'] = true
            },
            ['garage'] = {
                ['buy'] = true, ['impound'] = true, ['manage'] = true
            }
        },
        ['8'] = {
            ['home'] = {
                ['last_wanted_citizens'] = true, ['last_wanted_vehicles'] = true, ['most_active_employees'] = true,
                ['change_code'] = true, ['duty_time'] = true, ['last_active'] = true
            },
            ['patrols'] = {
                ['create'] = true, ['join'] = true
            },
            ['citizens'] = {
                ['add_note'] = true, ['add_wanted'] = true, ['delete_wanted'] = true, 
                ['add_license'] = true, ['delete_note'] = true, ['delete_license'] = true,
                ['set_photo'] = true
            },
            ['vehicles'] = {
                ['add_note'] = true, ['add_wanted'] = true, 
                ['confiscate'] = true, ['delete_wanted'] = true, ['delete_note'] = true, ['confiscate'] = true
            },
            ['weapons'] = true, -- you can set this to false to disable button for this grade a player
            ['evidence'] = true,
            ['cases'] = {
                ['create'] = true, ['edit'] = true
            },
            ['judgements'] = {
                ['fine'] = true, ['jail'] = true, ['custom_jail'] = true, ['custom_fine'] = true
            },
            ['announcements'] = {
                ['create'] = true, ['delete'] = true
            },
            ['employees'] = {
                ['add'] = true, ['reset_time_all'] = true, ['update'] = true, ['fire'] = true, ['add_note'] = true, ['delete_note'] = true,
                ['break'] = true, ['add_license'] = true, ['delete_license'] = true, ['change_badge'] = true, ['reset_time_employee'] = true,
                ['set_photo'] = true
            },
            ['garage'] = {
                ['buy'] = true, ['impound'] = true, ['manage'] = true
            }
        },
        ['9'] = {
            ['home'] = {
                ['last_wanted_citizens'] = true, ['last_wanted_vehicles'] = true, ['most_active_employees'] = true,
                ['change_code'] = true, ['duty_time'] = true, ['last_active'] = true
            },
            ['patrols'] = {
                ['create'] = true, ['join'] = true
            },
            ['citizens'] = {
                ['add_note'] = true, ['add_wanted'] = true, ['delete_wanted'] = true, 
                ['add_license'] = true, ['delete_note'] = true, ['delete_license'] = true,
                ['set_photo'] = true
            },
            ['vehicles'] = {
                ['add_note'] = true, ['add_wanted'] = true, 
                ['confiscate'] = true, ['delete_wanted'] = true, ['delete_note'] = true, ['confiscate'] = true
            },
            ['weapons'] = true, -- you can set this to false to disable button for this grade a player
            ['evidence'] = true,
            ['cases'] = {
                ['create'] = true, ['edit'] = true
            },
            ['judgements'] = {
                ['fine'] = true, ['jail'] = true, ['custom_jail'] = true, ['custom_fine'] = true
            },
            ['announcements'] = {
                ['create'] = true, ['delete'] = true
            },
            ['employees'] = {
                ['add'] = true, ['reset_time_all'] = true, ['update'] = true, ['fire'] = true, ['add_note'] = true, ['delete_note'] = true,
                ['break'] = true, ['add_license'] = true, ['delete_license'] = true, ['change_badge'] = true, ['reset_time_employee'] = true,
                ['set_photo'] = true
            },
            ['garage'] = {
                ['buy'] = true, ['impound'] = true, ['manage'] = true
            }
        },
    }
}
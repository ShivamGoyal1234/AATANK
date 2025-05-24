Config.Garage = {}

Config.Garage.CreateVehicleKeys = function(plate, model, netId)
    if GetResourceState('p_carkeys') == 'started' then
        TriggerServerEvent('p_carkeys:CreateKeys', plate)
    elseif GetResourceState('wasabi_carlock') == 'started' then
        exports['wasabi_carlock']:GiveKey(plate)
    elseif GetResourceState('qs-vehiclekeys') == 'started' then
        exports['qs-vehiclekeys']:GiveKeys(plate, model, true)
    elseif GetResourceState('tgiann-hotwire') == 'started' then
        exports["tgiann-hotwire"]:GiveKeyPlate(plate, true)
    elseif GetResourceState('qbx_vehiclekeys') == 'started' then
        TriggerEvent('qb-vehiclekeys:client:AddKeys', plate)
    elseif GetResourceState('qb-vehiclekeys') == 'started' then
        TriggerEvent('qb-vehiclekeys:client:AddKeys', plate)
    end
end

Config.Garage.RemoveVehicleKeys = function(plate, model, netId)
    if GetResourceState('p_carkeys') == 'started' then
        TriggerServerEvent('p_carkeys:RemoveKeys', plate)
    elseif GetResourceState('wasabi_carlock') == 'started' then
        exports['wasabi_carlock']:RemoveKey(plate)
    elseif GetResourceState('qs-vehiclekeys') == 'started' then
        exports['qs-vehiclekeys']:RemoveKeys(plate, model)
    elseif GetResourceState('tgiann-hotwire') == 'started' then
        exports["tgiann-hotwire"]:GiveKeyPlate(plate, true)
    elseif GetResourceState('qb-vehiclekeys') == 'started' then
        TriggerEvent('qb-vehiclekeys:client:RemoveKeys', plate)
    elseif GetResourceState('qbx_vehiclekeys') == 'started' then
        TriggerEvent('qb-vehiclekeys:client:RemoveKeys', plate)
    end
end

Config.Garage.CustomLabels = { -- FOR OWNED VEHICLES ONLY
    ['police'] = 'Police Vehicle',
    ['police2'] = 'Police Vehicle 2'
}

Config.Garage.CustomImages = {
    -- ['police'] = 'LINK TO IMAGE', -- set here link to image, it can be fivemanage :)
    -- ['police2'] = 'LINK TO IMAGE',
    -- ['police3'] = 'LINK TO IMAGE',
}

Config.Garage.Garages = {
    ['Mission_Row'] = {
        -- vehicles = { -- UNCOMMENT THIS IF YOU WANT VEHICLE SPAWNER
        --     ['police'] = {
        --         [0] = { -- FROM GRADE 0 CAN TAKE THIS VEHICLES
        --             ['police'] = 'Police Vehicle' -- spawn name and display name
        --         },
        --         [1] = { -- FROM GRADE 1 CAN TAKE THIS VEHICLES
        --             ['police'] = 'Police Vehicle', -- spawn name and display name
        --             ['police2'] = 'Police Vehicle 2' -- spawn name and display name
        --         }
        --     }
        -- },
        ped = {
            model = 's_m_y_cop_01',
            anim = {dict = 'amb@world_human_cop_idles@male@idle_b', clip = 'idle_e'}
        },
        coords = vector4(434.6770, -1029.1232, 28.9886, 0.0),
        allowedJobs = {
            ['police'] = 0,
            ['sheriff'] = 0
        },
        blip = { -- only visible for allowed jobs
            sprite = 357,
            scale = 0.75,
            color = 3,
            label = 'Mission Row Garage'
        },
        spawnPoints = {
            vector4(431.7113, -1027.2172, 28.9471, 179.8748),
            vector4(427.6960, -1027.6909, 28.9821, 182.6840),
            vector4(424.0269, -1028.0519, 29.0469, 184.6641),
            vector4(420.0333, -1028.3597, 29.1166, 186.3764),
            vector4(416.5734, -1028.6340, 29.1769, 185.2027)
        }
    }
}
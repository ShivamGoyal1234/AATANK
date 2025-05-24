Config.VehicleShop = {}

Config.VehicleShop.Enabled = true

Config.VehicleShop.Shops = {
    ['Mission_Row'] = {
        coords = {
            camCoords = vector3(452.4502, -1008.3307, 26.1293),
            vehicleCoords = vector4(446.7827, -1008.3640, 25.9293, 230.3472),
        },
        ped = {
            coords = vector4(459.1993, -998.6849, 25.9292, 178.8984),
            model = 's_f_y_cop_01',
            anim = {dict = 'amb@world_human_cop_idles@male@idle_b', clip = 'idle_e'}
        },
        allowedJobs = {
            ['police'] = { -- vehicles list for specific job
                grade = 0, -- from which grade player can open vehicle shop
                vehicles = {
                    [0] = { -- GRADE 0 CAN BUY THESE VEHICLES
                        ['police'] = 25000,
                    },
                    [1] = { -- GRADE 1 CAN BUY THESE VEHICLES
                        ['police'] = 25000,
                        ['police2'] = 25000,
                    },
                    [2] = { -- GRADE 2 CAN BUY THESE VEHICLES
                        ['police'] = 25000,
                        ['police2'] = 25000,
                        ['police3'] = 25000,
                    },
                    [3] = { -- GRADE 3 CAN BUY THESE VEHICLES
                        ['police'] = 25000,
                        ['police2'] = 25000,
                        ['police3'] = 25000,
                        ['police4'] = 25000,
                    },
                }
            },
            ['sheriff'] = {
                grade = 0,
                vehicles = {
                    [0] = {
                        ['police'] = 25000,
                        ['police2'] = 30000,
                        ['police3'] = 35000
                    },
                    [1] = {
                        ['police'] = 25000,
                        ['police2'] = 30000,
                        ['police3'] = 35000
                    },
                }
            },
        },
        blip = { -- only visible for allowed jobs
            sprite = 357,
            scale = 0.75,
            color = 3,
            label = 'Police Vehicle Shop'
        },
    }
}
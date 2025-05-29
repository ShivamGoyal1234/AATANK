Config.VehicleShop = {}

Config.VehicleShop.Enabled = true

Config.VehicleShop.Shops = {
    ['Mission_Row'] = {
        coords = {
            camCoords = vector3(451.21, -990.37, 25.70),
            vehicleCoords = vector4(445.32, -994.29, 25.70, 264.56),
        },
        ped = {
            coords = vector4(460.92, -998.37, 25.70, 345.06),
            model = 's_f_y_cop_01',
            anim = {dict = 'amb@world_human_cop_idles@male@idle_b', clip = 'idle_e'}
        },
        allowedJobs = {
             ['police'] = { -- vehicles list for specific job
                grade = 0, -- from which grade player can open vehicle shop
                vehicles = {
                    [0] = { -- GRADE 0 CAN BUY THESE VEHICLES
                        ['polvic'] = 1000,
                    },
                    [1] = { -- GRADE 1 CAN BUY THESE VEHICLES
                        ['polvic'] = 1000,
                        ['polexp'] = 1000,
                    },
                    [2] = { -- GRADE 2 CAN BUY THESE VEHICLES
                        ['polvic'] = 1000,
                        ['polchar'] = 1000,
                    },
                    [3] = { -- GRADE 3 CAN BUY THESE VEHICLES
                        ['polvic'] = 1000,
                        ['polchar'] = 1000,
                        ['polexp'] = 1000,
                    },
                    [4] = { -- GRADE 3 CAN BUY THESE VEHICLES
                        ['polvic'] = 1000,
                        ['polchar'] = 1000,
                        ['polexp'] = 1000,
                        ['polchal'] = 1000,
                        ['polvette'] = 1000,
                    },
                    [5] = { -- GRADE 3 CAN BUY THESE VEHICLES
                        ['polvic'] = 1000,
                        ['polchar'] = 1000,
                        ['polexp'] = 1000,
                        ['polchal'] = 1000,
                        ['polvette'] = 1000,
                    },
                    [6] = { -- GRADE 3 CAN BUY THESE VEHICLES
                        ['polvic'] = 1000,
                        ['polchar'] = 1000,
                        ['polexp'] = 1000,
                        ['polchal'] = 1000,
                        ['polvette'] = 1000,
                    },
                    [7] = { -- GRADE 3 CAN BUY THESE VEHICLES
                        ['polvic'] = 1000,
                        ['polchar'] = 1000,
                        ['polexp'] = 1000,
                        ['polchal'] = 1000,
                        ['polvette'] = 1000,
                        -- ['polstang'] = 1000,
                    },
                    [8] = { -- GRADE 3 CAN BUY THESE VEHICLES
                    ['polvic'] = 1000,
                    ['polchar'] = 1000,
                    ['polexp'] = 1000,
                    ['polchal'] = 1000,
                    ['polvette'] = 1000,
                    -- ['polstang'] = 1000,
                    },
                    [9] = { -- GRADE 3 CAN BUY THESE VEHICLES
                    ['polvic'] = 1000,
                    ['polchar'] = 1000,
                    ['polexp'] = 1000,
                    ['polchal'] = 1000,
                    ['polvette'] = 1000,
                    -- ['polstang'] = 1000,
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
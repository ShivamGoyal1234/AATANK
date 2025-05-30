Config = {}
Config.Framework = {
    ["Framework"] = "qbcore", -- esx, qbcore or qbox
    ["ResourceName"] = "qb-core", -- es_extended or qb-core or your resource name. If you using qbx you should write qb-core
    ["NewCore"] = true, -- If you use the new core, set this to true ( esx or qb ). If you are using the old one, make it false and edit the event below according to yourself.
    -- ["SharedEvent"] = "esx:getSharedObject" -- Event name for old cores.
}

Config.Language = "en" -- en, ro, de, it, cz, ar => will do more, you can translate it into your language and send it to us
Config.Unemployed = {  -- If you use a different job name for unemployed, you can change it here.
    ["job"] = "unemployed",
    ["grade"] = 0,
}
Config.SideJob = false -- If you want to use the side job system, you can activate it here. If you want to use the main job system, you can disable it.
Config.WhenDeadCancelJob = true -- When the player dies, all props, tools and content created for the job are deleted and completely cancelled/deleted.
Config.DrawMarkerInteractDistance = 30.0
Config.JobCentre = {
    ["interaction_type"] = "target", -- "target" || "textUI" => If you select the "Target" option, you can interact with the qb or ox target by clicking on the pad. "textUI" option will allow you to interact by pressing the E key.
    ["blip"] = {
        ["show"] = false,
        ["label"] = "Job Centre",
        ["sprite"] = 407,
        ["color"] = 5,
        ["scale"] = 1.0,
    },
    ["interaction_ped"] = {
        ["model"] = "cs_bankman",
        ["coords"] = vec4(-542.25, -197.29, 38.24, 81.61)
    },
}
Config.AbuseController = {
    ["controller"] = 5 * 1000, -- It sends a warning message every 5 seconds. When the defined right expires, the job/task/operation is canceled.
    ["warning_count"] = 10 -- During the seconds you specify, this count will move towards 0. When 0, all operations will be canceled.
}

Config.Jobs = {
    ["pizza_delivery"] = {
        ["name"] = "Pizza",
        ["debug"] = false,
        ["disabled"] = false,
        ["menu"] = {
            ["job_menu"] = vec3(535.570, 101.700, 96.565), 
            ["interaction_distance"] = 1.0,
            ["blips"] = {
                ["show"] = true,
                ["label"] = "Pizza Delivery - Center",
                ["sprite"] = 267,
                ["color"] = 33,
                ["scale"] = 1.0,
            }
        },
        ["CameraOffsets"] = { x = 0.75, y = -0.75, z = 0.5, zRot = 0.5, fov = 30.0 },
        ["reward"] = {
            ["min"] = 4500,
            ["max"] = 5000
        },
        ["timer"] = {
            ["extra_time"] = 2 * 60 * 1000,
            ["delivery_time"] = 5 * 60 * 1000,
            ["deducted_per_min"] = 50,
        },
        ["car_settings"] = {
            ["model"] = "pizzaboy",
            ["spawnCoords"] = vec4(540.225, 87.210, 96.160, 68.03)
        },
        ["prop"] = {
            ["model"] = "prop_pizza_box_01",
            ["attach_settings"] = {
                ["bone"] = 60309,
                ["coords"] = vec3(0.15, 0.05, 0.21),
                ["rotation"] = vec3(-15.0, -80.0, -70.0),
            },
            ["delivery_animation"] = {
                ["animName"] = "action_01_player",
                ["animDict"] = "anim@scripted@freemode@ig9_pizza@male@",
                ["duration"] = 3800,
                ["loop"] = false,
            },
            ["take_animation"] = {
                ["animName"] = "idle",
                ["animDict"] = "anim@heists@box_carry@",
                ["duration"] = nil,
                ["loop"] = true,
            }
        },
        ["pizzerias"] = {
            ["blips"] = {
                ["show"] = true,
                ["label"] = "Pizzeria",
                ["sprite"] = 889,
                ["color"] = 33,
                ["scale"] = 1.0,
            },
            ["coords"] = {
                [1] = vec3(-1529.515, -909.290, 10.165),
                [2] = vec3(287.340, -963.460, 29.420),
            }
        },
        ["delivery_coords"] = {
            ["blips"] = {
                ["show"] = true,
                ["label"] = "Delivery Address",
                ["sprite"] = 280,
                ["color"] = 33,
                ["scale"] = 1.0,
            },
            ["coords"] = {
                [1] = vec4(-448.660, -132.500, 39.0, 297.67),
                [2] = vec4(38.0, -71.40, 63.60, 255.118),
                [3] = vec4(-286.54, -1061.73, 27.20, 73.70),
                [4] = vec4(1250.63, -1735.04, 52.03, 22.67),
                [5] = vec4(-3228.26, 927.81, 13.96, 124.72),
                [6] = vec4(-1031.32, -1621.0, 5.0, 34.015),
                [7] = vec4(-1545.38, -529.80, 36.14, 221.10),
                [8] = vec4(217.35, -1716.77, 29.30, 124.72),
                [9] = vec4(-458.80, 537.87, 121.45, 184.251),
                [10] = vec4(-573.17, -442.74, 34.33, 0.0),
                [11] = vec4(-768.55, -354.90, 37.33, 158.74),
                [12] = vec4(1270.90, -682.65, 66.0, 187.08),
                [13] = vec4(997.51, -728.89, 57.80, 127.55),
                [14] = vec4(1437.05, -1493.57, 63.21, 345.82),
                [15] = vec4(-59.70, 359.85, 113.04, 62.35),
                [16] = vec4(349.66, -1028.57, 29.33, 0.0),
                [17] = vec4(418.30, -208.02, 59.90, 340.15),
                [18] = vec4(388.41, -732.77, 29.30, 0.0),
                [19] = vec4(64.0, -254.34, 48.18, 257.95),
                [20] = vec4(-1104.75, -1058.80, 2.15, 218.26),
                [21] = vec4(-1022.88, -998.25, 2.2, 34.0),
                [22] = vec4(-3076.99, 659.70, 11.62, 127.55),
                [23] = vec4(430.99, -1558.50, 32.78, 138.89),
                [24] = vec4(-1098.75, -1210.44, 2.53, 121.88),
                [25] = vec4(251.85, -2029.12, 18.31, 141.73),
                [26] = vec4(439.70, -1830.70, 28.35, 317.50),
                [27] = vec4(558.83, -1760.20, 29.31, 59.52),
                [28] = vec4(-1428.75, 458.65, 111.05, 255.11),
                [29] = vec4(-1384.63, -975.80, 8.90, 121.88),
                [30] = vec4(418.30, -208.02, 59.90, 340.15),
            }
        },
        ["outfits"] = {
            ["male"] = {
                ['t-shirt'] = {["item"] = 15, ["texture"] = 0},
                ['torso2'] = {["item"] = 345, ["texture"] = 0},
                ['arms'] = {["item"] = 19, ["texture"] = 0},
                ['pants'] = {["item"] = 3, ["texture"] = 7},
                ['shoes'] = {["item"] = 1, ["texture"] = 0},
            },
            ["female"] = {
                ['t-shirt'] = {["item"] = 15, ["texture"] = 0},
                ['torso2'] = {["item"] = 345, ["texture"] = 0},
                ['arms'] = {["item"] = 19, ["texture"] = 0},
                ['pants'] = {["item"] = 3, ["texture"] = 7},
                ['shoes'] = {["item"] = 1, ["texture"] = 0},
            },
        },
        ["menu_informations"] = {
            ["cover"] = "https://media-rockstargames-com.akamaized.net/tina-uploads/posts/3997o81a1o4k25/0d1d0421f337629f1503cdd130a272ac82501af9.jpg",
            ["title"] = "Pizza Delivery",
            ["description"] = "Will pick up the pizza from the pizzeria and deliver it to the customer",
            ["recommended"] = false,
            ["steps"] = {
                [1] = {
                    ["title"] = "Take Clothes and Pizzaboy",
                    ["description"] = "Access the work menu by going to the work center, then click on Dress up in work clothes. After spawn your job car.",
                    ["cover"] = "https://i.ibb.co/hXL3QBH/DALL-E-2024-10-12-19-26-33-Create-a-detailed-wide-image-of-a-character-from-the-GTA-5-world-The-char.webp",
                },
                [2] = {
                    ["title"] = "Pick up the pizzas",
                    ["description"] = "Go to the pizzeria branches and pick up the pizzas.",
                    ["cover"] = "https://i.ibb.co/Jcdn8y4/DALL-E-2024-10-12-19-33-19-A-wide-background-featuring-a-pizza-restaurant-kitchen-from-the-GTA-5-wor.webp",
                },
                [3] = {
                    ["title"] = "Deliver the pizzas",
                    ["description"] = "Set out to deliver the pizza to the house marked on the map!",
                    ["cover"] = "https://media-rockstargames-com.akamaized.net/tina-uploads/posts/3997o81a1o4k25/0d1d0421f337629f1503cdd130a272ac82501af9.jpg",
                },
            }
        },
    },
    ["news_delivery"] = {
        ["name"] = "Newspaper Delivery",
        ["debug"] = false,
        ["disabled"] = false,
        ["menu"] = {
            ["job_menu"] = vec3(-599.24, -929.90, 23.85), 
            ["interaction_distance"] = 1.0,
            ["blips"] = {
                ["show"] = true,
                ["label"] = "Newspaper Delivery - Center",
                ["sprite"] = 525,
                ["color"] = 53,
                ["scale"] = 1.0,
            }
        },
        ["delivery_reward"] = {
            ["min"] = 500,
            ["max"] = 550
        },
        ["timer"] = {
            ["extra_time"] = 2 * 60 * 1000,
            ["delivery_time"] = 6 * 60 * 1000,
            ["deducted_per_min"] = 5,
        },
        ["car_settings"] = {
            ["model"] = "rumpo",
            ["liveryIndex"] = 2,
            ["spawnCoords"] = vec4(-617.60, -912.35, 24.00, 110.55)
        },
        ["giveable_items"] = {
            ["WEAPON_ACIDPACKAGE"] = 1,
        },
        ["delivery_coords"] = {
            ["drawMarker_distance"] = 40.0,
            ["blips"] = {
                ["show"] = true,
                ["label"] = "Delivery Address",
                ["sprite"] = 837,
                ["color"] = 53,
                ["scale"] = 0.75,
            },
            ["coords"] = {
                [1] = vec3(169.80, 483.52, 142.45),
                [2] = vec3(118.50, 493.25, 146.80),
                [3] = vec3(103.88, 476.90, 146.75),
                [4] = vec3(58.12, 450.35, 146.50),
                [5] = vec3(-7.85, 469.0, 145.35),
                [6] = vec3(-230.35, 488.85, 128.25),
                [7] = vec3(-354.15, 470.70, 112.02),
                [8] = vec3(-580.85, 493.45, 108.05),
                [9] = vec3(-762.35, 431.72, 99.58),
                [10] = vec3(-784.30, 458.95, 99.74),
                [11] = vec3(-849.25, 509.40, 90.30),
                [12] = vec3(-882.90, 518.30, 91.91),
                [13] = vec3(-907.40, 544.90, 100.65),
                [14] = vec3(-905.80, 587.20, 100.45),
                [15] = vec3(-1022.30, 587.93, 102.80),
                [16] = vec3(-1107.08, 593.55, 103.88),
                [17] = vec3(-1308.22, 450.25, 100.20),
                [18] = vec3(-1469.70, 510.70, 117.15),
                [19] = vec3(1302.65, -529.20, 70.80),
                [20] = vec3(1326.90, -536.95, 71.70),
                [21] = vec3(1347.55, -548.65, 73.35),
                [22] = vec3(1371.25, -555.95, 74.01),
                [23] = vec3(1387.90, -569.75, 73.97),
                [24] = vec3(1385.20, -592.77, 73.95),
                [25] = vec3(1367.85, -605.10, 74.15),
                [26] = vec3(1343.35, -597.20, 73.95),
                [27] = vec3(1324.15, -582.18, 72.70),
                [28] = vec3(1301.70, -572.50, 71.15),
                [29] = vec3(-1384.63, -975.80, 8.90),
                [30] = vec3(418.30, -208.02, 59.90),
            }
        },
        ["outfits"] = {
            ["male"] = {
                ['t-shirt'] = {["item"] = 15, ["texture"] = 0},
                ['torso2'] = {["item"] = 345, ["texture"] = 0},
                ['arms'] = {["item"] = 19, ["texture"] = 0},
                ['pants'] = {["item"] = 3, ["texture"] = 7},
                ['shoes'] = {["item"] = 1, ["texture"] = 0},
            },
            ["female"] = {
                ['t-shirt'] = {["item"] = 15, ["texture"] = 0},
                ['torso2'] = {["item"] = 345, ["texture"] = 0},
                ['arms'] = {["item"] = 19, ["texture"] = 0},
                ['pants'] = {["item"] = 3, ["texture"] = 7},
                ['shoes'] = {["item"] = 1, ["texture"] = 0},
            },
        },
        ["menu_informations"] = {
            ["cover"] = "https://i.ibb.co/x3Qqm5S/DALL-E-2024-10-13-10-11-38-A-detailed-GTA-5-world-scene-featuring-a-character-inside-a-small-postal.webp",
            ["title"] = "Delivering news paper",
            ["description"] = "Deliver news papers in front of houses.",
            ["recommended"] = false,
            ["steps"] = {
                [1] = {
                    ["title"] = "Dress the clothes ",
                    ["description"] = "Access the work menu by going to the work center, then click on Dress up in work clothes",
                    ["cover"] = "https://i.ibb.co/jvnW7fk/DALL-E-2024-10-12-19-39-27-A-character-in-the-GTA-5-world-acting-as-a-news-reporter-The-character-is.webp",
                },
                [2] = {
                    ["title"] = "Pick up the car",
                    ["description"] = "To deliver Newspaper, take out your vehicle and go to the locations to distribute news papers!",
                    ["cover"] = "https://i.ibb.co/Fkvf2Xg/DALL-E-2024-10-13-17-59-39-A-detailed-GTA-5-world-scene-featuring-a-small-Weazel-News-themed-postal.webp",
                },
                [3] = {
                    ["title"] = "Deliver the newspaper",
                    ["description"] = "Set out to deliver the newspaper to the house marked on the map!",
                    ["cover"] = "https://i.ibb.co/x3Qqm5S/DALL-E-2024-10-13-10-11-38-A-detailed-GTA-5-world-scene-featuring-a-character-inside-a-small-postal.webp",
                },
            }
        },
    },
    ["mobile_hotdog"] = {
        ["name"] = "Mobile Hotdog",
        ["debug"] = false,
        ["disabled"] = false,
        ["syncPeds"] = true,
        ["menu"] = {
            ["job_menu"] = vec3(44.05, -998.01, 29.33), 
            ["interaction_distance"] = 1.5,
            ["blips"] = {
                ["show"] = true,
                ["label"] = "Mobile Hotdog - Center",
                ["sprite"] = 80,
                ["color"] = 6,
                ["scale"] = 1.0,
            }
        },
        ["reward"] = {
            ["min"] = 1500,
            ["max"] = 2000
        },
        ["randomPedTime"] = math.random(5, 7),
        ["prop"] = {
            ["model"] = "prop_hotdogstand_01",
            ["spawn_coords"] = vec4(46.70, -996.05, 29.33, 337.32),
            ["attach_settings"] = {
                ["bone"] = 28422,
                ["coords"] = vec3(-0.45, -1.2, -0.82),
                ["rotation"] = vec3(180.0, 180.0, 270.0),

                ["animName"] = "pushcar_offcliff_f",
                ["animDict"] = "missfinale_c2ig_11",
            },
            ["spatel_object"] = {
                ["bone"] = 57005,
                ["coords"] = vec3(0.08, 0.0, -0.02),
                ["rotation"] = vec3(0.0, -25.0, 130.0),

                ["animName"] = "idle_b",
                ["animDict"] = "amb@prop_human_bbq@male@idle_a",
            },
        },
        ["requestable_items"] = {
            [1] = {
                ["label"] = "Hotdog",
                ["animDict"] = "mp_player_inteat@burger",
                ["animName"] = "mp_player_int_eat_burger_fp",
                ["proggresstime"] = 5000,
                ["prop"] = {
                    ["bone"] = 18905,
                    ["model"] = "prop_cs_hotdog_02",
                    ["coords"] = vec3(0.02, 0.02, -0.02),
                    ["rotation"] = vec3(0.0, 0.0, 0.0),
                },
                ["type"] = "food"
            },
            [2] = {
                ["label"] = "Soda",
                ["animDict"] = "mp_player_intdrink",
                ["animName"] = "loop_bottle",
                ["proggresstime"] = 5000,
                ["prop"] = {
                    ["bone"] = 18905,
                    ["model"] = "prop_ld_flow_bottle",
                    ["coords"] = vec3(0.03, 0.03, 0.02),
                    ["rotation"] = vec3(0.0, 0.0, -1.5),
                },
                ["type"] = "food"
            }
        },
        ["outfits"] = {
            ["male"] = {
                ['t-shirt'] = {["item"] = 15, ["texture"] = 0},
                ['torso2'] = {["item"] = 345, ["texture"] = 0},
                ['arms'] = {["item"] = 19, ["texture"] = 0},
                ['pants'] = {["item"] = 3, ["texture"] = 7},
                ['shoes'] = {["item"] = 1, ["texture"] = 0},
            },
            ["female"] = {
                ['t-shirt'] = {["item"] = 15, ["texture"] = 0},
                ['torso2'] = {["item"] = 345, ["texture"] = 0},
                ['arms'] = {["item"] = 19, ["texture"] = 0},
                ['pants'] = {["item"] = 3, ["texture"] = 7},
                ['shoes'] = {["item"] = 1, ["texture"] = 0},
            },
        },
        ["menu_informations"] = {
            ["cover"] = "https://i.ibb.co/M2dnxf9/DALL-E-2024-10-13-21-12-53-A-character-in-the-GTA-5-world-wearing-red-and-black-attire-with-a-visibl.webp",
            ["title"] = "Mobile Hotdog",
            ["description"] = "Sell hotdogs by travelling with hotdog stand",
            ["recommended"] = false,
            ["steps"] = {
                [1] = {
                    ["title"] = "Dress the clothes",
                    ["description"] = "Access the work menu by going to the work center, then click on Dress up in work clothes",
                    ["cover"] = "https://i.ibb.co/NxQQPzD/DALL-E-2024-10-13-21-23-12-A-character-from-the-GTA-5-world-standing-in-a-clothing-store-environment.webp",
                },
                [2] = {
                    ["title"] = "Pick up the car",
                    ["description"] = "Get the hotdog stand and start selling hotdogs. You can start selling by standing in any area and pressing the ‘G’ key",
                    ["cover"] = "https://i.ibb.co/CPBrjwt/DALL-E-2024-10-13-21-43-59-A-scene-from-the-GTA-5-world-featuring-a-character-picking-up-a-hotdog-st.webp",
                },
                [3] = {
                    ["title"] = "You're Ready to Sell Hotdogs",
                    ["description"] = "After opening the stand, you can sell hotdogs!",
                    ["cover"] = "https://i.ibb.co/pfZq82B/DALL-E-2024-10-13-22-05-40-A-scene-from-the-GTA-5-world-featuring-a-character-eating-a-hotdog-The-ba.webp",
                },
            }
        },
    },
    ["forklifter"] = {
        ["name"] = "Forklifter",
        ["debug"] = false,
        ["disabled"] = false,
        ["menu"] = {
            ["job_menu"] = vec3(1207.45, -3122.25, 5.40), 
            ["interaction_distance"] = 1.0,
            ["blips"] = {
                ["show"] = true,
                ["label"] = "Forklifer - Center",
                ["sprite"] = 210,
                ["color"] = 44,
                ["scale"] = 1.0,
            }
        },
        ["car_settings"] = {
            ["model"] = "forklift",
        },
        ["cargo_list"] = {
            [1] = {
                ["menuTitle"] = "Napkin loading",
                ["reward"] = 100,
                ["area"] = vec3(1157.48, -3280.74, 5.90),
                ["radius"] = 45.0,
                ["forkliftCoords"] = vec4(1157.37, -3294.78, 5.90, 3.18),
                ["timer"] = {
                    ["extra_time"] = 2 * 60 * 1000,
                    ["mission_time"] = 6 * 60 * 1000,
                    ["deducted_per_min"] = 150,
                },
                ["cargo_car"] = {
                    ["truck"] = "phantom3",
                    ["trailer"] = "trflat",
                    ["coords"] = vec4(1157.10, -3256.99, 5.97, 359.21),
                    ["placeable_bones"] = {
                        [22] = {
                            [1] = {
                                ["markerOffset"] = vec3(0.0, 0.5, 0.35),
                                ["attachOffset"] = vec3(0.0, -4.25, 0.0),
                            },
                            [2] = {
                                ["markerOffset"] = vec3(0.0, 2.5, 0.35),
                                ["attachOffset"] = vec3(0.0, -2.25, 0.0),
                            },
                            [3] = {
                                ["markerOffset"] = vec3(0.0, 4.5, 0.35),
                                ["attachOffset"] = vec3(0.0, -0.25, 0.0),
                            },
                        },
                        [23] = {
                            [1] = {
                                ["markerOffset"] = vec3(0.0, -1.5, 0.35),
                                ["attachOffset"] = vec3(0.0, -1.5, 0.0),
                            },
                            [2] = {
                                ["markerOffset"] = vec3(0.0, -3.5, 0.35),
                                ["attachOffset"] = vec3(0.0, -3.5, 0.0),
                            },
                            [3] = {
                                ["markerOffset"] = vec3(0.0, -5.5, 0.35),
                                ["attachOffset"] = vec3(0.0, -5.5, 0.0),
                            },
                        }
                    },
                },
                ["cargos"] = {
                    [1] = {
                        ["prop"] = "prop_boxpile_06a",
                        ["coords"] = vec4(1177.15, -3277.52, 6.03, 270.68),
                    },
                    [2] = {
                        ["prop"] = "prop_boxpile_06a",
                        ["coords"] = vec4(1177.29, -3279.98, 6.03, 277.55),
                    },
                    [3] = {
                        ["prop"] = "prop_boxpile_06a",
                        ["coords"] = vec4(1177.11, -3282.45, 6.03, 271.96),
                    },
                    [4] = {
                        ["prop"] = "prop_boxpile_06a",
                        ["coords"] = vec4(1177.10, -3284.43, 6.03, 259.66),
                    },
                    [5] = {
                        ["prop"] = "prop_boxpile_06a",
                        ["coords"] = vec4(1179.18, -3284.58, 6.03, 272.99),
                    },
                    [6] = {
                        ["prop"] = "prop_boxpile_06a",
                        ["coords"] = vec4(1179.17, -3279.94, 6.03, 269.34),
                    },
                }
            },
            [2] = {
                ["menuTitle"] = "Tyre loading",
                ["reward"] = 100,
                ["area"] = vec3(1255.13, -3258.02, 5.80),
                ["radius"] = 35.0,
                ["forkliftCoords"] = vec4(1264.60, -3243.45, 5.90, 177.19),
                ["timer"] = {
                    ["extra_time"] = 2 * 60 * 1000,
                    ["mission_time"] = 4 * 60 * 1000,
                    ["deducted_per_min"] = 150,
                },
                ["cargo_car"] = {
                    ["truck"] = "phantom3",
                    ["trailer"] = "trflat",
                    ["coords"] = vec4(1265.21, -3265.49, 5.97, 180.95),
                    ["placeable_bones"] = {
                        [22] = {
                            [1] = {
                                ["markerOffset"] = vec3(0.0, 0.5, 0.35),
                                ["attachOffset"] = vec3(0.0, -4.25, 0.0),
                            },
                            [2] = {
                                ["markerOffset"] = vec3(0.0, 2.5, 0.35),
                                ["attachOffset"] = vec3(0.0, -2.25, 0.0),
                            },
                            [3] = {
                                ["markerOffset"] = vec3(0.0, 4.5, 0.35),
                                ["attachOffset"] = vec3(0.0, -0.25, 0.0),
                            },
                        },
                        [23] = {
                            [1] = {
                                ["markerOffset"] = vec3(0.0, -1.5, 0.35),
                                ["attachOffset"] = vec3(0.0, -1.5, 0.0),
                            },
                            [2] = {
                                ["markerOffset"] = vec3(0.0, -3.5, 0.35),
                                ["attachOffset"] = vec3(0.0, -3.5, 0.0),
                            },
                            [3] = {
                                ["markerOffset"] = vec3(0.0, -5.5, 0.35),
                                ["attachOffset"] = vec3(0.0, -5.5, 0.0),
                            },
                        }
                    },
                },
                ["cargos"] = {
                    [1] = {
                        ["prop"] = "prop_boxpile_06a",
                        ["coords"] = vec4(1246.43, -3254.23, 6.03, 91.01),
                    },
                    [2] = {
                        ["prop"] = "prop_boxpile_06a",
                        ["coords"] = vec4(1246.45, -3251.77, 6.03, 88.30),
                    },
                    [3] = {
                        ["prop"] = "prop_boxpile_06a",
                        ["coords"] = vec4(1246.31, -3248.97, 6.03, 84.73),
                    },
                    [4] = {
                        ["prop"] = "prop_boxpile_06a",
                        ["coords"] = vec4(1243.98, -3254.27, 6.03, 98.80),
                    },
                    [5] = {
                        ["prop"] = "prop_boxpile_06a",
                        ["coords"] = vec4(1244.06, -3252.21, 6.03, 94.00),
                    },
                    [6] = {
                        ["prop"] = "prop_boxpile_06a",
                        ["coords"] = vec4(1243.89, -3248.10, 6.03, 93.87),
                    },
                }
            },
            [3] = {
                ["menuTitle"] = "Fish  loading",
                ["reward"] = 100,
                ["area"] = vec3(1256.33, -3192.25, 5.80),
                ["radius"] = 35.0,
                ["forkliftCoords"] = vec4(1245.74, -3193.01, 6.03, 266.85),
                ["timer"] = {
                    ["extra_time"] = 2 * 60 * 1000,
                    ["mission_time"] = 4 * 60 * 1000,
                    ["deducted_per_min"] = 150,
                },
                ["cargo_car"] = {
                    ["truck"] = "phantom3",
                    ["trailer"] = "trflat",
                    ["coords"] = vec4(1264.83, -3188.69, 5.97, 0.10),
                    ["placeable_bones"] = {
                        [22] = {
                            [1] = {
                                ["markerOffset"] = vec3(0.0, 0.5, 0.35),
                                ["attachOffset"] = vec3(0.0, -4.25, 0.0),
                            },
                            [2] = {
                                ["markerOffset"] = vec3(0.0, 2.5, 0.35),
                                ["attachOffset"] = vec3(0.0, -2.25, 0.0),
                            },
                            [3] = {
                                ["markerOffset"] = vec3(0.0, 4.5, 0.35),
                                ["attachOffset"] = vec3(0.0, -0.25, 0.0),
                            },
                        },
                        [23] = {
                            [1] = {
                                ["markerOffset"] = vec3(0.0, -1.5, 0.35),
                                ["attachOffset"] = vec3(0.0, -1.5, 0.0),
                            },
                            [2] = {
                                ["markerOffset"] = vec3(0.0, -3.5, 0.35),
                                ["attachOffset"] = vec3(0.0, -3.5, 0.0),
                            },
                            [3] = {
                                ["markerOffset"] = vec3(0.0, -5.5, 0.35),
                                ["attachOffset"] = vec3(0.0, -5.5, 0.0),
                            },
                        }
                    },
                },
                ["cargos"] = {
                    [1] = {
                        ["prop"] = "prop_boxpile_06a",
                        ["coords"] = vec4(1249.10, -3183.10, 6.03, 83.37),
                    },
                    [2] = {
                        ["prop"] = "prop_boxpile_06a",
                        ["coords"] = vec4(1246.96, -3182.98, 6.03, 90.98),
                    },
                    [3] = {
                        ["prop"] = "prop_boxpile_06a",
                        ["coords"] = vec4(1248.96, -3185.01, 6.03, 93.55),
                    },
                    [4] = {
                        ["prop"] = "prop_boxpile_06a",
                        ["coords"] = vec4(1247.10, -3185.03, 6.03, 96.44),
                    },
                    [5] = {
                        ["prop"] = "prop_boxpile_06a",
                        ["coords"] = vec4(1248.81, -3186.98, 6.03, 87.23),
                    },
                    [6] = {
                        ["prop"] = "prop_boxpile_06a",
                        ["coords"] = vec4(1247.14, -3186.91, 6.03, 88.47),
                    },
                }
            },
            [4] = {
                ["menuTitle"] = "Cement loading",
                ["reward"] = 100,
                ["area"] = vec3(1215.10, -3218.25, 5.80),
                ["radius"] = 35.0,
                ["forkliftCoords"] = vec4(1226.12, -3210.17, 5.86, 90.20),
                ["timer"] = {
                    ["extra_time"] = 2 * 60 * 1000,
                    ["mission_time"] = 4 * 60 * 1000,
                    ["deducted_per_min"] = 150,
                },
                ["cargo_car"] = {
                    ["truck"] = "phantom3",
                    ["trailer"] = "trflat",
                    ["coords"] = vec4(1201.74, -3206.77, 6.00, 90.53),
                    ["placeable_bones"] = {
                        [22] = {
                            [1] = {
                                ["markerOffset"] = vec3(0.0, 0.5, 0.35),
                                ["attachOffset"] = vec3(0.0, -4.25, 0.0),
                            },
                            [2] = {
                                ["markerOffset"] = vec3(0.0, 2.5, 0.35),
                                ["attachOffset"] = vec3(0.0, -2.25, 0.0),
                            },
                            [3] = {
                                ["markerOffset"] = vec3(0.0, 4.5, 0.35),
                                ["attachOffset"] = vec3(0.0, -0.25, 0.0),
                            },
                        },
                        [23] = {
                            [1] = {
                                ["markerOffset"] = vec3(0.0, -1.5, 0.35),
                                ["attachOffset"] = vec3(0.0, -1.5, 0.0),
                            },
                            [2] = {
                                ["markerOffset"] = vec3(0.0, -3.5, 0.35),
                                ["attachOffset"] = vec3(0.0, -3.5, 0.0),
                            },
                            [3] = {
                                ["markerOffset"] = vec3(0.0, -5.5, 0.35),
                                ["attachOffset"] = vec3(0.0, -5.5, 0.0),
                            },
                        }
                    },
                },
                ["cargos"] = {
                    [1] = {
                        ["prop"] = "prop_boxpile_06a",
                        ["coords"] = vec4(1218.14, -3202.08, 5.53, 1.13),
                    },
                    [2] = {
                        ["prop"] = "prop_boxpile_06a",
                        ["coords"] = vec4(1220.81, -3201.99, 5.53, 0.17),
                    },
                    [3] = {
                        ["prop"] = "prop_boxpile_06a",
                        ["coords"] = vec4(1220.95, -3204.38, 5.62, 2.97),
                    },
                    [4] = {
                        ["prop"] = "prop_boxpile_06a",
                        ["coords"] = vec4(1218.17, -3204.30, 5.61, 4.78),
                    },
                    [5] = {
                        ["prop"] = "prop_boxpile_06a",
                        ["coords"] = vec4(1217.91, -3206.45, 5.76, 355.32),
                    },
                    [6] = {
                        ["prop"] = "prop_boxpile_06a",
                        ["coords"] = vec4(1220.65, -3206.53, 5.77, 355.93),
                    },
                }
            },
            [5] = {
                ["menuTitle"] = "Flour loading",
                ["reward"] = 400,
                ["area"] = vec3(1257.45, -3290.61, 5.80),
                ["radius"] = 35.0,
                ["forkliftCoords"] = vec4(1244.69, -3303.57, 6.03, 271.64),
                ["timer"] = {
                    ["extra_time"] = 2 * 60 * 1000,
                    ["mission_time"] = 4 * 60 * 1000,
                    ["deducted_per_min"] = 150,
                },
                ["cargo_car"] = {
                    ["truck"] = "phantom3",
                    ["trailer"] = "trflat",
                    ["coords"] = vec4(1265.34, -3296.41, 5.97, 180.24),
                    ["placeable_bones"] = {
                        [22] = {
                            [1] = {
                                ["markerOffset"] = vec3(0.0, 0.5, 0.35),
                                ["attachOffset"] = vec3(0.0, -4.25, 0.0),
                            },
                            [2] = {
                                ["markerOffset"] = vec3(0.0, 2.5, 0.35),
                                ["attachOffset"] = vec3(0.0, -2.25, 0.0),
                            },
                            [3] = {
                                ["markerOffset"] = vec3(0.0, 4.5, 0.35),
                                ["attachOffset"] = vec3(0.0, -0.25, 0.0),
                            },
                        },
                        [23] = {
                            [1] = {
                                ["markerOffset"] = vec3(0.0, -1.5, 0.35),
                                ["attachOffset"] = vec3(0.0, -1.5, 0.0),
                            },
                            [2] = {
                                ["markerOffset"] = vec3(0.0, -3.5, 0.35),
                                ["attachOffset"] = vec3(0.0, -3.5, 0.0),
                            },
                            [3] = {
                                ["markerOffset"] = vec3(0.0, -5.5, 0.35),
                                ["attachOffset"] = vec3(0.0, -5.5, 0.0),
                            },
                        }
                    },
                },
                ["cargos"] = {
                    [1] = {
                        ["prop"] = "prop_boxpile_06a",
                        ["coords"] = vec4(1246.94, -3299.11, 5.86, 91.52),
                    },
                    [2] = {
                        ["prop"] = "prop_boxpile_06a",
                        ["coords"] = vec4(1246.92, -3296.04, 5.82, 91.64),
                    },
                    [3] = {
                        ["prop"] = "prop_boxpile_06a",
                        ["coords"] = vec4(1244.24, -3299.24, 5.68, 95.47),
                    },
                    [4] = {
                        ["prop"] = "prop_boxpile_06a",
                        ["coords"] = vec4(1243.91, -3295.93, 5.64, 91.51),
                    },
                    [5] = {
                        ["prop"] = "prop_boxpile_06a",
                        ["coords"] = vec4(1246.60, -3293.51, 5.80, 92.87),
                    },
                    [6] = {
                        ["prop"] = "prop_boxpile_06a",
                        ["coords"] = vec4(1243.40, -3292.59, 5.58, 91.54),
                    },
                }
            },
            [6] = {
                ["menuTitle"] = "Christmas decorations loading",
                ["reward"] = 400,
                ["area"] = vec3(1254.63, -3229.64, 5.80),
                ["radius"] = 35.0,
                ["forkliftCoords"] = vec4(1264.84, -3219.89, 5.90, 93.96),
                ["timer"] = {
                    ["extra_time"] = 2 * 60 * 1000,
                    ["mission_time"] = 4 * 60 * 1000,
                    ["deducted_per_min"] = 150,
                },
                ["cargo_car"] = {
                    ["truck"] = "phantom3",
                    ["trailer"] = "trflat",
                    ["coords"] = vec4(1265.55, -3228.47, 5.97, 1.11),
                    ["placeable_bones"] = {
                        [22] = {
                            [1] = {
                                ["markerOffset"] = vec3(0.0, 0.5, 0.35),
                                ["attachOffset"] = vec3(0.0, -4.25, 0.0),
                            },
                            [2] = {
                                ["markerOffset"] = vec3(0.0, 2.5, 0.35),
                                ["attachOffset"] = vec3(0.0, -2.25, 0.0),
                            },
                            [3] = {
                                ["markerOffset"] = vec3(0.0, 4.5, 0.35),
                                ["attachOffset"] = vec3(0.0, -0.25, 0.0),
                            },
                        },
                        [23] = {
                            [1] = {
                                ["markerOffset"] = vec3(0.0, -1.5, 0.35),
                                ["attachOffset"] = vec3(0.0, -1.5, 0.0),
                            },
                            [2] = {
                                ["markerOffset"] = vec3(0.0, -3.5, 0.35),
                                ["attachOffset"] = vec3(0.0, -3.5, 0.0),
                            },
                            [3] = {
                                ["markerOffset"] = vec3(0.0, -5.5, 0.35),
                                ["attachOffset"] = vec3(0.0, -5.5, 0.0),
                            },
                        }
                    },
                },
                ["cargos"] = {
                    [1] = {
                        ["prop"] = "prop_boxpile_06a",
                        ["coords"] = vec4(1250.56, -3229.12, 5.84, 94.94),
                    },
                    [2] = {
                        ["prop"] = "prop_boxpile_06a",
                        ["coords"] = vec4(1250.64, -3232.69, 5.84, 83.91),
                    },
                    [3] = {
                        ["prop"] = "prop_boxpile_06a",
                        ["coords"] = vec4(1250.56, -3236.32, 5.84, 87.59),
                    },
                    [4] = {
                        ["prop"] = "prop_boxpile_06a",
                        ["coords"] = vec4(1250.32, -3239.86, 5.85, 91.10),
                    },
                    [5] = {
                        ["prop"] = "prop_boxpile_06a",
                        ["coords"] = vec4(1250.55, -3243.45, 5.84, 89.74),
                    },
                    [6] = {
                        ["prop"] = "prop_boxpile_06a",
                        ["coords"] = vec4(1246.14, -3225.33, 5.84, 184.35),
                    },
                }
            },
            [7] = {
                ["menuTitle"] = "Fish loading",
                ["reward"] = 400,
                ["area"] = vec3(1218.85, -3218.34, 5.80),
                ["radius"] = 55.0,
                ["forkliftCoords"] = vec4(1229.73, -3225.53, 5.85, 89.04),
                ["timer"] = {
                    ["extra_time"] = 2 * 60 * 1000,
                    ["mission_time"] = 4 * 60 * 1000,
                    ["deducted_per_min"] = 150,
                },
                ["cargo_car"] = {
                    ["truck"] = "phantom3",
                    ["trailer"] = "trflat",
                    ["coords"] = vec4(1199.74, -3225.51, 5.91, 88.76),
                    ["placeable_bones"] = {
                        [22] = {
                            [1] = {
                                ["markerOffset"] = vec3(0.0, 0.5, 0.35),
                                ["attachOffset"] = vec3(0.0, -4.25, 0.0),
                            },
                            [2] = {
                                ["markerOffset"] = vec3(0.0, 2.5, 0.35),
                                ["attachOffset"] = vec3(0.0, -2.25, 0.0),
                            },
                            [3] = {
                                ["markerOffset"] = vec3(0.0, 4.5, 0.35),
                                ["attachOffset"] = vec3(0.0, -0.25, 0.0),
                            },
                        },
                        [23] = {
                            [1] = {
                                ["markerOffset"] = vec3(0.0, -1.5, 0.35),
                                ["attachOffset"] = vec3(0.0, -1.5, 0.0),
                            },
                            [2] = {
                                ["markerOffset"] = vec3(0.0, -3.5, 0.35),
                                ["attachOffset"] = vec3(0.0, -3.5, 0.0),
                            },
                            [3] = {
                                ["markerOffset"] = vec3(0.0, -5.5, 0.35),
                                ["attachOffset"] = vec3(0.0, -5.5, 0.0),
                            },
                        }
                    },
                },
                ["cargos"] = {
                    [1] = {
                        ["prop"] = "prop_boxpile_06a",
                        ["coords"] = vec4(1228.80, -3233.19, 6.07, 182.45),
                    },
                    [2] = {
                        ["prop"] = "prop_boxpile_06a",
                        ["coords"] = vec4(1225.74, -3233.21, 6.03, 185.09),
                    },
                    [3] = {
                        ["prop"] = "prop_boxpile_06a",
                        ["coords"] = vec4(1223.35, -3230.21, 6.03, 179.83),
                    },
                    [4] = {
                        ["prop"] = "prop_boxpile_06a",
                        ["coords"] = vec4(1225.69, -3230.60, 6.03, 180.88),
                    },
                    [5] = {
                        ["prop"] = "prop_boxpile_06a",
                        ["coords"] = vec4(1227.12, -3230.73, 6.03, 181.55),
                    },
                    [6] = {
                        ["prop"] = "prop_boxpile_06a",
                        ["coords"] = vec4(1229.06, -3230.74, 6.03, 181.31),
                    },
                }
            },
            [8] = {
                ["menuTitle"] = "Spare tire loading",
                ["reward"] = 400,
                ["area"] = vec3(1183.78, -3198.86, 6.03),
                ["radius"] = 40.0,
                ["forkliftCoords"] = vec4(1179.46, -3205.24, 5.48, 0.11),
                ["timer"] = {
                    ["extra_time"] = 2 * 60 * 1000,
                    ["mission_time"] = 4 * 60 * 1000,
                    ["deducted_per_min"] = 150,
                },
                ["cargo_car"] = {
                    ["truck"] = "phantom3",
                    ["trailer"] = "trflat",
                    ["coords"] = vec4(1172.24, -3193.19, 5.90, 0.40),
                    ["placeable_bones"] = {
                        [22] = {
                            [1] = {
                                ["markerOffset"] = vec3(0.0, 0.5, 0.35),
                                ["attachOffset"] = vec3(0.0, -4.25, 0.0),
                            },
                            [2] = {
                                ["markerOffset"] = vec3(0.0, 2.5, 0.35),
                                ["attachOffset"] = vec3(0.0, -2.25, 0.0),
                            },
                            [3] = {
                                ["markerOffset"] = vec3(0.0, 4.5, 0.35),
                                ["attachOffset"] = vec3(0.0, -0.25, 0.0),
                            },
                        },
                        [23] = {
                            [1] = {
                                ["markerOffset"] = vec3(0.0, -1.5, 0.35),
                                ["attachOffset"] = vec3(0.0, -1.5, 0.0),
                            },
                            [2] = {
                                ["markerOffset"] = vec3(0.0, -3.5, 0.35),
                                ["attachOffset"] = vec3(0.0, -3.5, 0.0),
                            },
                            [3] = {
                                ["markerOffset"] = vec3(0.0, -5.5, 0.35),
                                ["attachOffset"] = vec3(0.0, -5.5, 0.0),
                            },
                        }
                    },
                },
                ["cargos"] = {
                    [1] = {
                        ["prop"] = "prop_boxpile_06a",
                        ["coords"] = vec4(1175.91, -3190.35, 6.03, 1.42),
                    },
                    [2] = {
                        ["prop"] = "prop_boxpile_06a",
                        ["coords"] = vec4(1178.25, -3190.37, 6.03, 2.70),
                    },
                    [3] = {
                        ["prop"] = "prop_boxpile_06a",
                        ["coords"] = vec4(1180.80, -3190.29, 6.03, 1.07),
                    },
                    [4] = {
                        ["prop"] = "prop_boxpile_06a",
                        ["coords"] = vec4(1180.86, -3192.57, 6.03, 1.48),
                    },
                    [5] = {
                        ["prop"] = "prop_boxpile_06a",
                        ["coords"] = vec4(1178.61, -3192.47, 6.03, 359.86),
                    },
                    [6] = {
                        ["prop"] = "prop_boxpile_06a",
                        ["coords"] = vec4(1176.18, -3192.33, 6.03, 357.02),
                    },
                }
            },
            [9] = {
                ["menuTitle"] = "Flour loading - 2",
                ["reward"] = 400,
                ["area"] = vec3(1166.41, -3292.30, 5.90),
                ["radius"] = 40.0,
                ["forkliftCoords"] = vec4(1174.11, -3304.43, 5.35, 359.51),
                ["timer"] = {
                    ["extra_time"] = 2 * 60 * 1000,
                    ["mission_time"] = 4 * 60 * 1000,
                    ["deducted_per_min"] = 150,
                },
                ["cargo_car"] = {
                    ["truck"] = "phantom3",
                    ["trailer"] = "trflat",
                    ["coords"] = vec4(1157.74, -3287.09, 5.97, 359.68),
                    ["placeable_bones"] = {
                        [22] = {
                            [1] = {
                                ["markerOffset"] = vec3(0.0, 0.5, 0.35),
                                ["attachOffset"] = vec3(0.0, -4.25, 0.0),
                            },
                            [2] = {
                                ["markerOffset"] = vec3(0.0, 2.5, 0.35),
                                ["attachOffset"] = vec3(0.0, -2.25, 0.0),
                            },
                            [3] = {
                                ["markerOffset"] = vec3(0.0, 4.5, 0.35),
                                ["attachOffset"] = vec3(0.0, -0.25, 0.0),
                            },
                        },
                        [23] = {
                            [1] = {
                                ["markerOffset"] = vec3(0.0, -1.5, 0.35),
                                ["attachOffset"] = vec3(0.0, -1.5, 0.0),
                            },
                            [2] = {
                                ["markerOffset"] = vec3(0.0, -3.5, 0.35),
                                ["attachOffset"] = vec3(0.0, -3.5, 0.0),
                            },
                            [3] = {
                                ["markerOffset"] = vec3(0.0, -5.5, 0.35),
                                ["attachOffset"] = vec3(0.0, -5.5, 0.0),
                            },
                        }
                    },
                },
                ["cargos"] = {
                    [1] = {
                        ["prop"] = "prop_boxpile_06a",
                        ["coords"] = vec4(1180.80, -3302.53, 6.03, 270.87),
                    },
                    [2] = {
                        ["prop"] = "prop_boxpile_06a",
                        ["coords"] = vec4(1180.77, -3304.92, 6.03, 266.81),
                    },
                    [3] = {
                        ["prop"] = "prop_boxpile_06a",
                        ["coords"] = vec4(1181.02, -3307.78, 6.03, 267.06),
                    },
                    [4] = {
                        ["prop"] = "prop_boxpile_06a",
                        ["coords"] = vec4(1178.52, -3302.77, 6.03, 271.55),
                    },
                    [5] = {
                        ["prop"] = "prop_boxpile_06a",
                        ["coords"] = vec4(1178.74, -3304.79, 6.03, 275.43),
                    },
                    [6] = {
                        ["prop"] = "prop_boxpile_06a",
                        ["coords"] = vec4(1178.66, -3307.70, 6.03, 271.82),
                    },
                }
            },
        },
        ["outfits"] = {
            ["male"] = {
                ['t-shirt'] = {["item"] = 15, ["texture"] = 0},
                ['torso2'] = {["item"] = 345, ["texture"] = 0},
                ['arms'] = {["item"] = 19, ["texture"] = 0},
                ['pants'] = {["item"] = 3, ["texture"] = 7},
                ['shoes'] = {["item"] = 1, ["texture"] = 0},
            },
            ["female"] = {
                ['t-shirt'] = {["item"] = 15, ["texture"] = 0},
                ['torso2'] = {["item"] = 345, ["texture"] = 0},
                ['arms'] = {["item"] = 19, ["texture"] = 0},
                ['pants'] = {["item"] = 3, ["texture"] = 7},
                ['shoes'] = {["item"] = 1, ["texture"] = 0},
            },
        },
        ["menu_informations"] = {
            ["cover"] = "https://i.ibb.co/5FxTdDL/DALL-E-2024-10-18-17-45-13-A-scene-from-the-GTA-5-world-featuring-a-truck-with-a-flatbed-trailer-and.webp",
            ["title"] = "Forklifter",
            ["description"] = "Put pallets on trucks, complete the order and make money!",
            ["recommended"] = true,
            ["steps"] = {
                [1] = {
                    ["title"] = "Dress the clothes",
                    ["description"] = "Access the work menu by going to the work center, then click on Dress up in work clothes",
                    ["cover"] = "https://i.ibb.co/GPxHGSW/DALL-E-2024-10-18-17-46-27-A-scene-from-the-GTA-5-world-featuring-a-character-in-a-clothing-store-pu.webp",
                },
                [2] = {
                    ["title"] = "Pick up the car",
                    ["description"] = "Take the forklift and load the pallets in front of the garage onto the incoming truck. ",
                    ["cover"] = "https://i.ibb.co/FmJx4Lj/DALL-E-2024-10-18-17-48-47-A-scene-from-the-GTA-5-world-featuring-a-character-in-orange-and-black-wo.webp",
                },
                [3] = {
                    ["title"] = "Place all the pallets",
                    ["description"] = "Get your money after correctly placing all pallets on the trailer!",
                    ["cover"] = "https://i.ibb.co/5FxTdDL/DALL-E-2024-10-18-17-45-13-A-scene-from-the-GTA-5-world-featuring-a-truck-with-a-flatbed-trailer-and.webp",
                },
            }
        },
    },
    ["gardener"] = {
        ["name"] = "Gardener",
        ["debug"] = false,
        ["disabled"] = false,
        ["menu"] = {
            ["job_menu"] = vec3(-1484.32, -391.79, 39.09), 
            ["interaction_distance"] = 1.0,
            ["blips"] = {
                ["show"] = true,
                ["label"] = "Gardener - Center",
                ["sprite"] = 738,
                ["color"] = 69,
                ["scale"] = 1.0,
            }
        },
        ["car_settings"] = {
            ["model"] = "bison",
            ["trailer"] = "boattrailer",
            ["spawnCoords"] = vec4(-1510.45, -379.52, 41.36, 47.27),
            ["showBlip"] = true,
            ["cut_ptfx"] = {
                ["class"] = "scr_minigamegolf",
                ["name"] = "scr_golf_strike_thick_grass",

                ["bone"] = 6,
                ["coords"] = vec3(0.75, 0.0, -0.25),
                ["rotation"] = vec3(90.0, -340.0, 0.0),
            }
        },
        ["gardener_entitys"] = {
            ["lawn_tractor"] = {
                ["model"] = "mower",
                ["car_attach"] = {
                    ["bone"] = 57005,
                    ["coords"] = vec3(0.0, -1.5, 0.3),
                    ["rotation"] = vec3(0.0, 0.0, 0.0),
                },
            },
            ["lawn_mower"] = {
                ["prop"] = "prop_lawnmower_01",
                ["car_attach"] = {
                    ["bone"] = 6,
                    ["coords"] = vec3(0.1, -1.0, -0.75),
                    ["rotation"] = vec3(0.0, 0.0, 0.0),
                },
                ["player_attach"] = {
                    ["bone"] = 28252,
                    ["coords"] = vec3(1.25, -0.33, -0.25),
                    ["rotation"] = vec3(-122.4053, 85.095, 20.178),

                    ["animDict"] = "anim@amb@nightclub@lazlow@ig1_vip@",
                    ["animName"] = "clubvip_base_laz",
                },
            },
            ["rake_prop"] = {
                ["prop"] = "prop_tool_rake",
                ["car_attach"] = {
                    ["bone"] = 6,
                    ["coords"] = vec3(-0.25, -1.25, -0.7),
                    ["rotation"] = vec3(90.0, 200.0, 0.0),
                },
                ["player_attach"] = {
                    ["bone"] = 28422,
                    ["coords"] = vec3(0.1100, -0.1000, -0.0125),
                    ["rotation"] = vec3(-80.0000, 0.0, 21.9999),
                    
                    ["animDict"] = "move_weapon@jerrycan@generic",
                    ["animName"] = "idle",
                },
                ["player_animation"] = {
                    ["bone"] = 28422,
                    ["coords"] = vec3(0.0, 0.0, -0.0300),
                    ["rotation"] = vec3(0.0, 0.0, 0.0),

                    ["animDict"] = "anim@amb@drug_field_workers@rake@male_a@idles",
                    ["animName"] = "idle_b",
                    ["flag"] = 1,
                }
            }
        },
        ["gardens"] = {
            [1] = {
                ["reward"] = 20000,
                ["zoneRadius"] = 40.0,
                ["coords"] = vec3(1237.36, -596.55, 74.05),
                ["useMarker"] = true,
                ["blips"] = {
                    ["show"] = true,
                    ["label"] = "Garden 1 - To be cleaned",
                    ["sprite"] = 728,
                    ["color"] = 69,
                    ["scale"] = 1.2,
                },
                ["grass"] = {
                    [1] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1248.99, -593.68, 66.60),
                    },
                    [2] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1250.56, -594.42, 66.60),
                    },
                    [3] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1251.50, -593.00, 66.60),
                    },
                    [4] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1250.36, -593.50, 66.60),
                    },
                    [5] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1249.36, -591.59, 66.60),
                    },
                    [6] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1250.47, -591.98, 66.60),
                    },
                    [7] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1250.33, -589.93, 66.60),
                    },
                    [8] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1251.42, -590.08, 66.60),
                    },
                    [9] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1251.77, -591.44, 66.60),
                    },
                    [10] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1248.15, -589.70, 66.60),
                    },
                    [11] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1247.16, -590.68, 66.60),
                    },
                    [12] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1246.73, -589.02, 66.60),
                    },
                    [13] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1248.45, -598.20, 66.60),
                    },
                    [14] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1248.27, -596.91, 66.60),
                    },
                    [15] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1250.11, -598.29, 66.60),
                    },
                    [16] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1252.40, -597.35, 66.60),
                    },
                    [17] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1252.99, -598.18, 66.60),
                    },
                    [18] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1255.08, -603.20, 66.60),
                    },
                    [19] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1254.09, -604.57, 66.60),
                    },
                    [20] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1255.34, -605.15, 66.60),
                    },
                    [21] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1252.87, -605.88, 66.60),
                    },
                    [22] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1252.06, -604.58, 66.60),
                    },
                },
                ["rubbishes"] = {
                    [1] = {
                        ["model"] = "prop_rub_litter_03",
                        ["coords"] = vec3(1254.93, -596.33, 68.01),
                    },
                    [2] = {
                        ["model"] = "prop_rub_litter_02",
                        ["coords"] = vec3(1252.19, -594.95, 68.27),
                    },
                }
            },
            [2] = {
                ["reward"] = 20000,
                ["zoneRadius"] = 40.0,
                ["coords"] = vec3(1262.7561035156, -653.85491943359, 72.583862304688),
                ["useMarker"] = true,
                ["blips"] = {
                    ["show"] = true,
                    ["label"] = "Garden 2 - To be cleaned",
                    ["sprite"] = 728,
                    ["color"] = 69,
                    ["scale"] = 1.2,
                },
                ["grass"] = {
                    [1] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1277.8813476562, -650.20220947266, 65.8154296875),
                    },
                    [2] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1275.5076904297, -651.56042480469, 65.899658203125),
                    },
                    [3] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1274.8220214844, -649.46374511719, 65.967041015625),
                    },
                    [4] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1277.4197998047, -647.96044921875, 65.933349609375),
                    },
                    [5] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1275.9165039062, -644.70330810547, 66.068115234375),
                    },
                    [6] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1274.4000244141, -645.46813964844, 66.017578125),
                    },
                    [7] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1270.5626220703, -645.61315917969, 66.017578125),
                    },
                    [8] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1268.5582275391, -643.39782714844, 66.068115234375),
                    },
                    [9] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1267.3319091797, -640.98461914062, 66.135498046875),
                    },
                    [10] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1270.0087890625, -641.28790283203, 66.202880859375),
                    },
                    [11] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1271.5252685547, -639.30987548828, 66.337768554688),
                    },
                    [12] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1274.8220214844, -640.29888916016, 66.337768554688),
                    },
                    [13] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1275.4681396484, -642.35601806641, 66.202880859375),
                    },
                    [14] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1271.3802490234, -634.44396972656, 66.725219726562),
                    },
                    [15] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1268.6373291016, -634.94506835938, 66.573608398438),
                    },
                    [16] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1266.4879150391, -636.68572998047, 66.388305664062),
                    },
                    [17] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1263.0329589844, -637.75384521484, 66.287231445312),
                    },
                    [18] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1260.5274658203, -640.29888916016, 66.135498046875),
                    },
                    [19] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1268.9406738281, -648.32965087891, 65.8828125),
                    },
                    [20] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1271.89453125, -654.0791015625, 65.84912109375),
                    },
                    [21] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1280.2153320312, -660.22418212891, 65.377319335938),
                    },
                    [22] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1278.5933837891, -663.61315917969, 65.377319335938),
                    },
                    [23] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1280.9274902344, -665.85491943359, 65.05712890625),
                    },
                },
                ["rubbishes"] = {
                    [1] = {
                        ["model"] = "prop_rub_litter_03",
                        ["coords"] = vec3(1268.2813720703, -660.34283447266, 66.748046875),
                    },
                    [2] = {
                        ["model"] = "prop_rub_litter_02",
                        ["coords"] = vec3(1266.9362792969, -646.93188476562, 66.832275390625),
                    },
                    [3] = {
                        ["model"] = "prop_rub_litter_02",
                        ["coords"] = vec3(1273.3319091797, -635.39343261719, 67.607299804688),
                    },
                }
            },
            [3] = {
                ["reward"] = 20000,
                ["zoneRadius"] = 40.0,
                ["coords"] = vec3(1254.8176269531, -478.33847045898, 75.431518554688),
                ["useMarker"] = true,
                ["blips"] = {
                    ["show"] = true,
                    ["label"] = "Garden 3 - To be cleaned",
                    ["sprite"] = 728,
                    ["color"] = 69,
                    ["scale"] = 1.2,
                },
                ["grass"] = {
                    [1] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1263.9165039062, -488.78240966797, 67.517211914062),
                    },
                    [2] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1265.4593505859, -488.51867675781, 67.365600585938),
                    },
                    [3] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1265.7758789062, -486.19781494141, 67.517211914062),
                    },
                    [4] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1267.3319091797, -485.02416992188, 67.348754882812),
                    },
                    [5] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1266.158203125, -482.95385742188, 67.618286132812),
                    },
                    [6] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1264.8264160156, -480.68569946289, 67.719360351562),
                    },
                    [7] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1267.3055419922, -480.79119873047, 67.449829101562),
                    },
                    [8] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1269.7846679688, -477.94287109375, 67.281372070312),
                    },
                    [9] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1267.5692138672, -477.52087402344, 67.550903320312),
                    },
                    [10] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1266.1713867188, -476.78240966797, 67.685668945312),
                    },
                    [11] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1264.1538085938, -477.03295898438, 67.786865234375),
                    },
                    [12] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1262.9274902344, -475.47692871094, 67.87109375),
                    },
                    [13] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1263.3099365234, -473.68350219727, 67.87109375),
                    },
                    [14] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1264.8000488281, -474.32968139648, 67.820556640625),
                    },
                    [15] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1266.5142822266, -475.06814575195, 67.77001953125),
                    },
                    [16] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1268.5714111328, -475.27911376953, 67.517211914062),
                    },
                    [17] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1269.4945068359, -473.70989990234, 67.466674804688),
                    },
                    [18] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1271.0109863281, -473.10330200195, 67.315063476562),
                    },
                    [19] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1270.2065429688, -471.0725402832, 67.550903320312),
                    },
                    [20] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1268.7032470703, -470.47912597656, 67.786865234375),
                    },
                    [21] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1267.0549316406, -471.46813964844, 67.854248046875),
                    },
                    [22] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1265.0769042969, -470.33407592773, 67.90478515625),
                    },
                    [23] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1263.1779785156, -471.25714111328, 67.887939453125),
                    },
                    [24] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1260.6065673828, -471.11209106445, 67.887939453125),
                    },
                },
                ["rubbishes"] = {
                    [1] = {
                        ["model"] = "prop_rub_litter_03",
                        ["coords"] = vec3(1260.9362792969, -473.89450073242, 68.854248046875),
                    },
                    [2] = {
                        ["model"] = "prop_rub_litter_02",
                        ["coords"] = vec3(1260.3165283203, -479.44616699219, 69.17431640625),
                    },
                    [3] = {
                        ["model"] = "prop_rub_litter_02",
                        ["coords"] = vec3(1271.2351074219, -481.62197875977, 68.0791015625),
                    },
                }
            },
            [4] = {
                ["reward"] = 20000,
                ["zoneRadius"] = 40.0,
                ["coords"] = vec3(1230.6856689453, -722.17584228516, 65.20361328125),
                ["useMarker"] = true,
                ["blips"] = {
                    ["show"] = true,
                    ["label"] = "Garden 4 - To be cleaned",
                    ["sprite"] = 728,
                    ["color"] = 69,
                    ["scale"] = 1.2,
                },
                ["grass"] = {
                    [1] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1226.8352050781, -734.30767822266, 58.317260742188),
                    },
                    [2] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1221.6395263672, -737.61755371094, 57.390502929688),
                    },
                    [3] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1218.5802001953, -741.73187255859, 57.851318359375),
                    },
                    [4] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1220.1362304688, -743.49890136719, 57.053466796875),
                    },
                    [5] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1219.2131347656, -745.29229736328, 56.90185546875),
                    },
                    [6] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1220.9011230469, -745.35821533203, 57.188232421875),
                    },
                    [7] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1222.9318847656, -744.36920166016, 57.457885742188),
                    },
                    [8] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1225.5955810547, -743.64398193359, 57.794921875),
                    },
                    [9] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1226.0966796875, -741.81097412109, 57.912841796875),
                    },
                    [10] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1228.5098876953, -741.13848876953, 58.19921875),
                    },
                    [11] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1231.3582763672, -742.12744140625, 58.435180664062),
                    },
                    [12] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1230.5406494141, -737.59118652344, 58.620483398438),
                    },
                    [13] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1231.6087646484, -735.23077392578, 58.839599609375),
                    },
                    [14] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1234.2725830078, -734.86151123047, 58.805908203125),
                    },
                    [15] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1234.4307861328, -737.93408203125, 58.738525390625),
                    },
                    [16] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1235.841796875, -740.41320800781, 58.7890625),
                    },
                    [17] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1237.6878662109, -739.64837646484, 58.923828125),
                    },
                    [18] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1237.7275390625, -736.98461914062, 58.8564453125),
                    },
                    [19] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1240.1010742188, -736.40441894531, 58.82275390625),
                    },
                    [20] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1240.4835205078, -738.26373291016, 58.805908203125),
                    },
                    [21] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1240.3648681641, -733.38464355469, 58.839599609375),
                    },
                    [22] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1220.8088378906, -726.51428222656, 58.519409179688),
                    },
                    [23] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1218.2373046875, -722.76922607422, 58.09814453125),
                    },
                    [24] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1218.2241210938, -718.79998779297, 58.283569335938),
                    },
                },
                ["rubbishes"] = {
                    [1] = {
                        ["model"] = "prop_rub_litter_03",
                        ["coords"] = vec3(1215.2703857422, -731.90771484375, 57.817626953125),
                    },
                    [2] = {
                        ["model"] = "prop_rub_litter_02",
                        ["coords"] = vec3(1226.6241455078, -724.40441894531, 59.620483398438),
                    },
                }
            },
            [5] = {
                ["reward"] = 20000,
                ["zoneRadius"] = 45.0,
                ["coords"] = vec3(-1940.96, 161.26, 92.50),
                ["useMarker"] = true,
                ["blips"] = {
                    ["show"] = true,
                    ["label"] = "Garden 5 - To be cleaned",
                    ["sprite"] = 728,
                    ["color"] = 69,
                    ["scale"] = 1.2,
                },
                ["grass"] = {
                    [1] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(-1929.29, 177.27, 81.85),
                    },
                    [2] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(-1927.64, 179.19, 81.85),
                    },
                    [3] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(-1925.86, 179.95, 81.85),
                    },
                    [4] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(-1925.51, 181.84, 81.85),
                    },
                    [5] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(-1923.89, 183.24, 81.85),
                    },
                    [6] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(-1922.17, 181.98, 81.85),
                    },
                    [7] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(-1920.70, 180.64, 81.85),
                    },
                    [8] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(-1918.48, 178.60, 81.85),
                    },
                    [9] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(-1917.86, 175.66, 81.85),
                    },
                    [10] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(-1916.36, 174.34, 81.85),
                    },
                    [11] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(-1917.35, 172.64, 81.85),
                    },
                    [12] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(-1919.56, 170.31, 81.85),
                    },
                    [13] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(-1921.52, 170.79, 81.85),
                    },
                    [14] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(-1922.33, 168.89, 81.85),
                    },
                    [15] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(-1919.13, 167.18, 81.85),
                    },
                    [16] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(-1918.34, 165.01, 81.85),
                    },
                    [17] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(-1916.21, 163.68, 81.85),
                    },
                    [18] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(-1915.63, 161.60, 81.85),
                    },
                    [19] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(-1913.54, 162.90, 81.85),
                    },
                    [20] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(-1911.23, 163.92, 81.85),
                    },
                    [21] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(-1912.61, 165.94, 81.85),
                    },
                    [22] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(-1913.74, 168.37, 81.85),
                    },
                    [23] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(-1916.25, 168.66, 81.85),
                    },
                    [24] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(-1915.86, 167.08, 81.85),
                    },
                    [25] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(-1914.10, 171.25, 81.85),
                    },
                },
                ["rubbishes"] = {
                    [1] = {
                        ["model"] = "prop_rub_litter_03",
                        ["coords"] = vec3(-1937.20, 176.20, 83.65),
                    },
                    [2] = {
                        ["model"] = "prop_rub_litter_02",
                        ["coords"] = vec3(-1928.39, 192.98, 83.52),
                    },
                }
            },
            [6] = {
                ["reward"] = 20000,
                ["zoneRadius"] = 25.0,
                ["coords"] = vec3(1054.62, -476.79, 69.34),
                ["useMarker"] = true,
                ["blips"] = {
                    ["show"] = true,
                    ["label"] = "Garden 6 - To be cleaned",
                    ["sprite"] = 728,
                    ["color"] = 69,
                    ["scale"] = 1.2,
                },
                ["grass"] = {
                    [1] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1060.77, -475.67, 61.50),
                    },
                    [2] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1059.99, -476.77, 61.50),
                    },
                    [3] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1059.36, -480.20, 61.25),
                    },
                    [4] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1057.71, -480.06, 61.25),
                    },
                    [5] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1058.36, -479.17, 61.25),
                    },
                    [6] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1057.32, -478.44, 61.25),
                    },
                    [7] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1056.00, -477.29, 61.25),
                    },
                    [8] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1055.59, -475.74, 61.25),
                    },
                    [9] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1055.65, -474.53, 61.25),
                    },
                    [10] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1056.73, -474.00, 61.75),
                    },
                    [11] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1057.32, -475.00, 61.75),
                    },
                    [12] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1058.61, -475.31, 61.75),
                    },
                    [13] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1059.49, -474.81, 61.50),
                    },
                    [14] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1061.81, -469.09, 61.85),
                    },
                    [15] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1061.23, -467.50, 61.85),
                    },
                    [16] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1062.26, -466.03, 61.85),
                    },
                    [17] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1059.97, -467.72, 61.75),
                    },
                    [18] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1060.42, -465.92, 61.75),
                    },
                    [19] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1058.20, -467.98, 61.50),
                    },
                    [20] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1058.35, -466.27, 61.50),
                    },
                },
                ["rubbishes"] = {
                    [1] = {
                        ["model"] = "prop_rub_litter_03",
                        ["coords"] = vec3(1061.42, -478.04, 63.00),
                    },
                    [2] = {
                        ["model"] = "prop_rub_litter_02",
                        ["coords"] = vec3(1061.81, -480.02, 63.00),
                    },
                }
            },
            [7] = {
                ["reward"] = 20000,
                ["zoneRadius"] = 20.0,
                ["coords"] = vec3(1014.48, -428.93, 64.95),
                ["useMarker"] = true,
                ["blips"] = {
                    ["show"] = true,
                    ["label"] = "Garden 7 - To be cleaned",
                    ["sprite"] = 728,
                    ["color"] = 69,
                    ["scale"] = 1.2,
                },
                ["grass"] = {
                    [1] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1015.04, -426.81, 62.35),
                    },
                    [2] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1013.68, -428.01, 62.35),
                    },
                    [3] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1012.35, -428.98, 62.35),
                    },
                    [4] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1010.82, -430.17, 62.35),
                    },
                    [5] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1009.87, -430.83, 62.35),
                    },
                    [6] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1019.46, -424.14, 62.55),
                    },
                    [7] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1020.66, -422.68, 62.55),
                    },
                    [8] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1019.93, -421.44, 62.55),
                    },
                    [9] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1019.24, -422.63, 62.55),
                    },
                    [10] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1018.07, -422.59, 62.55),
                    },
                    [11] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1017.60, -421.36, 62.45),
                    },
                    [12] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(1015.97, -420.18, 62.40),
                    },
                },
                ["rubbishes"] = {
                    [1] = {
                        ["model"] = "prop_rub_litter_03",
                        ["coords"] = vec3(1016.83, -428.24, 64.05),
                    },
                }
            },
            [8] = {
                ["reward"] = 20000,
                ["zoneRadius"] = 20.0,
                ["coords"] = vec3(851.45, -558.00, 59.95),
                ["useMarker"] = true,
                ["blips"] = {
                    ["show"] = true,
                    ["label"] = "Garden 8 - To be cleaned",
                    ["sprite"] = 728,
                    ["color"] = 69,
                    ["scale"] = 1.2,
                },
                ["grass"] = {
                    [1] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(857.09, -560.08, 54.85),
                    },
                    [2] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(855.21, -559.89, 54.85),
                    },
                    [3] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(853.91, -561.49, 55.00),
                    },
                    [4] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(853.24, -559.02, 55.00),
                    },
                    [5] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(854.41, -558.61, 54.85),
                    },
                    [6] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(855.35, -557.01, 54.85),
                    },
                    [7] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(854.15, -556.20, 54.85),
                    },
                    [8] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(852.60, -554.92, 55.00),
                    },
                    [9] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(854.37, -553.61, 54.85),
                    },
                    [10] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(854.72, -551.34, 54.85),
                    },
                    [11] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(855.53, -549.91, 54.85),
                    },
                    [12] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(854.05, -549.60, 54.85),
                    },
                    [13] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(856.40, -554.72, 54.85),
                    },
                    [14] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(852.18, -551.99, 55.00),
                    },
                    [15] = {
                        ["model"] = "prop_skunk_bush_01",
                        ["coords"] = vec3(851.83, -550.37, 55.00),
                    },
                },
                ["rubbishes"] = {
                    [1] = {
                        ["model"] = "prop_rub_litter_03",
                        ["coords"] = vec3(859.42, -561.20, 56.35),
                    },
                }
            },
        },
        ["outfits"] = {
            ["male"] = {
                ['t-shirt'] = {["item"] = 15, ["texture"] = 0},
                ['torso2'] = {["item"] = 345, ["texture"] = 0},
                ['arms'] = {["item"] = 19, ["texture"] = 0},
                ['pants'] = {["item"] = 3, ["texture"] = 7},
                ['shoes'] = {["item"] = 1, ["texture"] = 0},
            },
            ["female"] = {
                ['t-shirt'] = {["item"] = 15, ["texture"] = 0},
                ['torso2'] = {["item"] = 345, ["texture"] = 0},
                ['arms'] = {["item"] = 19, ["texture"] = 0},
                ['pants'] = {["item"] = 3, ["texture"] = 7},
                ['shoes'] = {["item"] = 1, ["texture"] = 0},
            },
        },
        ["menu_informations"] = {
            ["cover"] = "https://i.ibb.co/dGGRnGC/DALL-E-2024-10-18-17-03-44-A-scene-from-the-GTA-5-world-featuring-a-character-using-a-lawn-mower-in.webp",
            ["title"] = "Gardener",
            ["description"] = "Clean up customers gardens and get your money!",
            ["recommended"] = false,
            ["steps"] = {
                [1] = {
                    ["title"] = "Dress the clothes",
                    ["description"] = "Access the work menu by going to the work center, then click on Dress up in work clothes",
                    ["cover"] = "https://i.ibb.co/HVZsWSW/DALL-E-2024-10-18-17-04-39-A-scene-from-the-GTA-5-world-featuring-a-character-inside-a-clothing-stor.webp",
                },
                [2] = {
                    ["title"] = "Pick up the car",
                    ["description"] = "Pick up your lawn tractor, lawn mower and travelling vehicle. On your way to the customer",
                    ["cover"] = "https://i.ibb.co/wp9qdTC/DALL-E-2024-10-18-17-07-00-A-scene-from-the-GTA-5-world-featuring-a-pickup-truck-towing-a-trailer-wi.webp",
                },
                [3] = {
                    ["title"] = "Clean up the garden",
                    ["description"] = "Clean the garden with a lawnmower, water the flowers and remove rubbish. Then your money is in your pocket!",
                    ["cover"] = "https://i.ibb.co/3WYdLWz/DALL-E-2024-10-18-17-09-25-A-scene-from-the-GTA-5-world-featuring-two-characters-working-in-a-garden.webp",
                },
            }
        },
    },
    ["trucker"] = {
        ["name"] = "Trucker",
        ["debug"] = false,
        ["disabled"] = false,
        ["menu"] = {
            ["job_menu"] = vec3(1196.96, -3253.50, 7.10),
            ["interaction_distance"] = 1.0,
            ["blips"] = {
                ["show"] = true,
                ["label"] = "Trucker - Center",
                ["sprite"] = 79,
                ["color"] = 44,
                ["scale"] = 1.0,
            }
        },
        ["car_settings"] = {
            ["model"] = "packer",
            ["showBlip"] = true,
            ["spawnCoords"] = vec4(1173.78, -3232.04, 4.85, 359.69),
        },
        ["job_list"] = {
            [1] = {
                ["reward"] = 10000,
                ["extra_time"] = 2 * 60 * 1000,
                ["delivery_time"] = 10 * 60 * 1000,
                ["deducted_per_min"] = 50,
                ["delivery_coords"] = vec4(-599.68, 5301.81, 69.35, 269.93),
                ["blips"] = {
                    ["show"] = true,
                    ["label"] = "Lumber Transport",
                    ["sprite"] = 514,
                    ["color"] = 44,
                    ["scale"] = 1.0,
                },
                ["trailer_stuff"] = {
                    ["model"] = "trailerlogs",
                    ["coords"] = vec4(920.01, -1564.25, 30.75, 93.59),
                    ["spawn_with_attached"] = false,
                    ["trailer_attachable_with_default"] = true,
                },
                ["menu_stuff"] = {
                    ["name"] = "Lumber transport",
                    ["time"] = "",
                    ["t_type"] = "Must be taken and delivered",
                },
            },
            [2] = {
                ["reward"] = 12000,
                ["extra_time"] = 4 * 60 * 1000,
                ["delivery_time"] = 12 * 60 * 1000,
                ["deducted_per_min"] = 50,
                ["delivery_coords"] = vec4(1058.31, -3209.52, 5.90, 0.46),
                ["blips"] = {
                    ["show"] = true,
                    ["label"] = "Ship Transport",
                    ["sprite"] = 514,
                    ["color"] = 44,
                    ["scale"] = 1.0,
                },
                ["trailer_stuff"] = {
                    ["model"] = "tr3",
                    ["coords"] = vec4(3790.24, 4455.40, 5.35, 59.52),
                    ["spawn_with_attached"] = false,
                    ["trailer_attachable_with_default"] = false,
                },
                ["menu_stuff"] = {
                    ["name"] = "Ship transport",
                    ["time"] = "",
                    ["t_type"] = "Must be taken and delivered",
                },
            },
            [3] = {
                ["reward"] = 14000,
                ["extra_time"] = 4 * 60 * 1000,
                ["delivery_time"] = 12 * 60 * 1000,
                ["deducted_per_min"] = 50,
                ["delivery_coords"] = vec4(-981.73, -2878.90, 13.95, 241.51),
                ["blips"] = {
                    ["show"] = true,
                    ["label"] = "Aircraft Fuel Transport",
                    ["sprite"] = 514,
                    ["color"] = 44,
                    ["scale"] = 1.0,
                },
                ["trailer_stuff"] = {
                    ["model"] = "tanker2",
                    ["coords"] = vec4(2703.23, 1357.20, 24.52, 359.51),
                    ["spawn_with_attached"] = false,
                    ["trailer_attachable_with_default"] = true,
                },
                ["menu_stuff"] = {
                    ["name"] = "Aircraft Fuel transport",
                    ["time"] = "",
                    ["t_type"] = "Must be taken and delivered",
                },
            },
            [4] = {
                ["reward"] = 16000,
                ["extra_time"] = 4 * 60 * 1000,
                ["delivery_time"] = 12 * 60 * 1000,
                ["deducted_per_min"] = 50,
                ["delivery_coords"] = vec4(2381.03, 3039.01, 48.15, 7.67),
                ["blips"] = {
                    ["show"] = true,
                    ["label"] = "New Car Transport",
                    ["sprite"] = 514,
                    ["color"] = 44,
                    ["scale"] = 1.0,
                },
                ["trailer_stuff"] = {
                    ["model"] = "tr4",
                    ["coords"] = vec4(-432.69, -2711.27, 6.00, 226.87),
                    ["spawn_with_attached"] = false,
                    ["trailer_attachable_with_default"] = true,
                },
                ["menu_stuff"] = {
                    ["name"] = "New Cars transport",
                    ["time"] = "",
                    ["t_type"] = "Must be taken and delivered",
                },
            },
            [5] = {
                ["reward"] = 18000,
                ["extra_time"] = 3 * 60 * 1000,
                ["delivery_time"] = 10 * 60 * 1000,
                ["deducted_per_min"] = 50,
                ["delivery_coords"] = vec4(749.84, -1842.20, 29.29, 86.35),
                ["blips"] = {
                    ["show"] = true,
                    ["label"] = "Teddy Bear Transport",
                    ["sprite"] = 514,
                    ["color"] = 44,
                    ["scale"] = 1.0,
                },
                ["trailer_stuff"] = {
                    ["model"] = "trailers4",
                    ["coords"] = vec4(2776.90, 3492.52, 55.20, 247.64),
                    ["spawn_with_attached"] = false,
                    ["trailer_attachable_with_default"] = true,
                },
                ["menu_stuff"] = {
                    ["name"] = "Teddy Bears transport",
                    ["time"] = "",
                    ["t_type"] = "Must be taken and delivered",
                },
            },
        },
        ["outfits"] = {
            ["male"] = {
                ['t-shirt'] = {["item"] = 15, ["texture"] = 0},
                ['torso2'] = {["item"] = 345, ["texture"] = 0},
                ['arms'] = {["item"] = 19, ["texture"] = 0},
                ['pants'] = {["item"] = 3, ["texture"] = 7},
                ['shoes'] = {["item"] = 1, ["texture"] = 0},
            },
            ["female"] = {
                ['t-shirt'] = {["item"] = 15, ["texture"] = 0},
                ['torso2'] = {["item"] = 345, ["texture"] = 0},
                ['arms'] = {["item"] = 19, ["texture"] = 0},
                ['pants'] = {["item"] = 3, ["texture"] = 7},
                ['shoes'] = {["item"] = 1, ["texture"] = 0},
            },
        },
        ["menu_informations"] = {
            ["cover"] = "https://i.ibb.co/51jNS1G/DALL-E-2024-10-28-13-40-09-A-scene-from-the-GTA-5-world-featuring-a-truck-driver-in-the-foreground-w.webp",
            ["title"] = "Trucker",
            ["description"] = "Deliver trailers fast and earn your money!",
            ["recommended"] = true,
            ["steps"] = {
                [1] = {
                    ["title"] = "Dress the clothes",
                    ["description"] = "Access the work menu by going to the work center, then click on Dress up in work clothes",
                    ["cover"] = "https://i.ibb.co/cv1cFVc/DALL-E-2024-10-28-13-41-18-A-scene-from-the-GTA-5-world-featuring-a-truck-driver-character-in-a-clot.webp",
                },
                [2] = {
                    ["title"] = "Check Job list",
                    ["description"] = "Review the contracts, choose the delivery that works for you and start working",
                    ["cover"] = "https://i.ibb.co/mBjz0P9/DALL-E-2024-10-28-13-46-43-A-scene-from-the-GTA-5-world-showing-a-worker-wearing-a-green-reflective.webp",
                },
                [3] = {
                    ["title"] = "Deliver the trailer",
                    ["description"] = "Clean the garden with a lawnmower, water the flowers and remove rubbish. Then your money is in your pocket!",
                    ["cover"] = "https://i.ibb.co/60bPptK/DALL-E-2024-10-28-13-50-08-A-scene-from-the-GTA-5-world-showing-a-truck-driver-parking-a-trailer-in.webp",
                },
            }
        },
    },
    ["roadhelper"] = {
        ["name"] = "Road Helper",
        ["debug"] = false,
        ["disabled"] = false,
        ["menu"] = {
            ["job_menu"] = vec3(-229.42, -1377.19, 31.26),
            ["interaction_distance"] = 1.0,
            ["blips"] = {
                ["show"] = true,
                ["label"] = "Road Helper - Center",
                ["sprite"] = 739,
                ["color"] = 33,
                ["scale"] = 1.0,
            }
        },
        ["car_settings"] = {
            ["model"] = "towtruck",
            ["spawnCoords"] = vec4(-228.61, -1392.72, 31.26, 104.91),
        },
        ["attachable_things"] = {
            ["jack_stand"] = {
                ["model"] = "imp_prop_car_jack_01a",
                ["car_attach"] = {
                    ["bone"] = 3,
                    ["coords"] = vec3(-0.90, -2.75, 0.2),
                    ["rotation"] = vec3(0.0, 0.0, 0.0),
                },
                ["player_attach"] = {
                    ["animDict"] = "missfinale_c2ig_11",
                    ["animName"] = "pushcar_offcliff_f",

                    ["bone"] = 28422,
                    ["coords"] = vec3(-0.4, -1.3, -0.60),
                    ["rotation"] = vec3(180.0, 180.0, 0.0),
                }
            },
            ["spare_wheel"] = {
                ["model"] = "imp_prop_impexp_tyre_02c",
                ["car_attach"] = {
                    ["bone"] = 3,
                    ["coords"] = vec3(0.0, -0.7, 0.6),
                    ["rotation"] = vec3(0.0, 0.0, 0.0),
                },
                ["player_attach"] = {
                    ["animDict"] = "anim@heists@box_carry@",
                    ["animName"] = "idle",

                    ["bone"] = 28422,
                    ["coords"] = vec3(0.0, -0.10, 0.15),
                    ["rotation"] = vec3(0.0, 0.0, 0.0),
                }
            },
            ["jerry_can"] = {
                ["model"] = "w_am_jerrycan",
                ["car_attach"] = {
                    ["bone"] = 3,
                    ["coords"] = vec3(-0.90, -2.0, 0.45),
                    ["rotation"] = vec3(0.0, 0.0, 180.0),
                },
                ["player_attach"] = {
                    ["animDict"] = "weapons@misc@jerrycan@franklin",
                    ["animName"] = "idle",

                    ["bone"] = 28422,
                    ["coords"] = vec3(0.26, 0.050, 0.0300),
                    ["rotation"] = vec3(80.0, 180.0, 79.99),
                }
            },
        },
        ["randomEvents"] = {
            ["event_timer"] = math.random(3, 7),
            ["events"] = {
                [1] = {
                    ["extra_time"] = 2 * 60 * 1000,
                    ["mission_time"] = 7 * 60 * 1000,
                    ["deducted_per_min"] = 50,
                    ["type"] = "fuel_help",
                    ["label"] = "Refuelling",
                    ["reward"] = 12000,
                    ["blips"] = {
                        ["label"] = "Refuelling - Call",
                        ["sprite"] = 280,
                        ["color"] = 33,
                        ["scale"] = 1.5,
                    },
                    ["car_stuff"] = {
                        ["model"] = "buffalo",
                        ["coords"] = vec4(2941.62, 3782.37, 52.63, 349.07),
                        ["fuel_bone"] = 15,
                    },
                    ["progress"] = {
                        ["time"] = 10 * 1000,
                        ["animDict"] = "weapons@misc@jerrycan@",
                        ["animName"] = "fire",

                        ["prop"] = {
                            ["model"] = "w_am_jerrycan",
                            ["bone"] = 57005,
                            ["coords"] = vec3(0.1800, 0.1300, -0.2400),
                            ["rotation"] = vec3(-165.8693883, -11.2122753, -32.9453021),
                        }
                    },
                },
                [2] = {
                    ["extra_time"] = 2 * 60 * 1000,
                    ["mission_time"] = 7 * 60 * 1000,
                    ["deducted_per_min"] = 50,
                    ["type"] = "fuel_help",
                    ["label"] = "Refuelling",
                    ["reward"] = 12000,
                    ["blips"] = {
                        ["label"] = "Refuelling - Call",
                        ["sprite"] = 280,
                        ["color"] = 33,
                        ["scale"] = 1.5,
                    },
                    ["car_stuff"] = {
                        ["model"] = "buffalo",
                        ["coords"] = vec4(-3138.2, 1090.85, 20.64, 84.11),
                        ["fuel_bone"] = 15,
                    },
                    ["progress"] = {
                        ["time"] = 10 * 1000,
                        ["animDict"] = "weapons@misc@jerrycan@",
                        ["animName"] = "fire",

                        ["prop"] = {
                            ["model"] = "w_am_jerrycan",
                            ["bone"] = 57005,
                            ["coords"] = vec3(0.1800, 0.1300, -0.2400),
                            ["rotation"] = vec3(-165.8693883, -11.2122753, -32.9453021),
                        }
                    },
                },
                [3] = {
                    ["extra_time"] = 2 * 60 * 1000,
                    ["mission_time"] = 7 * 60 * 1000,
                    ["deducted_per_min"] = 50,
                    ["type"] = "fuel_help",
                    ["label"] = "Refuelling",
                    ["reward"] = 12000,
                    ["blips"] = {
                        ["label"] = "Refuelling - Call",
                        ["sprite"] = 280,
                        ["color"] = 33,
                        ["scale"] = 1.5,
                    },
                    ["car_stuff"] = {
                        ["model"] = "buffalo",
                        ["coords"] = vec4(1355.67, -584.28, 74.21, 35.87),
                        ["fuel_bone"] = 15,
                    },
                    ["progress"] = {
                        ["time"] = 10 * 1000,
                        ["animDict"] = "weapons@misc@jerrycan@",
                        ["animName"] = "fire",

                        ["prop"] = {
                            ["model"] = "w_am_jerrycan",
                            ["bone"] = 57005,
                            ["coords"] = vec3(0.1800, 0.1300, -0.2400),
                            ["rotation"] = vec3(-165.8693883, -11.2122753, -32.9453021),
                        }
                    },
                },
                [4] = {
                    ["extra_time"] = 2 * 60 * 1000,
                    ["mission_time"] = 7 * 60 * 1000,
                    ["deducted_per_min"] = 50,
                    ["type"] = "fuel_help",
                    ["label"] = "Refuelling",
                    ["reward"] = 12000,
                    ["blips"] = {
                        ["label"] = "Refuelling - Call",
                        ["sprite"] = 280,
                        ["color"] = 33,
                        ["scale"] = 1.5,
                    },
                    ["car_stuff"] = {
                        ["model"] = "buffalo",
                        ["coords"] = vec4(654.32, 769.88, 205.15, 274.21),
                        ["fuel_bone"] = 15,
                    },
                    ["progress"] = {
                        ["time"] = 10 * 1000,
                        ["animDict"] = "weapons@misc@jerrycan@",
                        ["animName"] = "fire",

                        ["prop"] = {
                            ["model"] = "w_am_jerrycan",
                            ["bone"] = 57005,
                            ["coords"] = vec3(0.1800, 0.1300, -0.2400),
                            ["rotation"] = vec3(-165.8693883, -11.2122753, -32.9453021),
                        }
                    },
                },
                [5] = {
                    ["extra_time"] = 2 * 60 * 1000,
                    ["mission_time"] = 7 * 60 * 1000,
                    ["deducted_per_min"] = 50,
                    ["type"] = "fuel_help",
                    ["label"] = "Refuelling",
                    ["reward"] = 12000,
                    ["blips"] = {
                        ["label"] = "Refuelling - Call",
                        ["sprite"] = 280,
                        ["color"] = 33,
                        ["scale"] = 1.5,
                    },
                    ["car_stuff"] = {
                        ["model"] = "buffalo",
                        ["coords"] = vec4(-1793.07, 763.42, 136.9, 305.44),
                        ["fuel_bone"] = 15,
                    },
                    ["progress"] = {
                        ["time"] = 10 * 1000,
                        ["animDict"] = "weapons@misc@jerrycan@",
                        ["animName"] = "fire",

                        ["prop"] = {
                            ["model"] = "w_am_jerrycan",
                            ["bone"] = 57005,
                            ["coords"] = vec3(0.1800, 0.1300, -0.2400),
                            ["rotation"] = vec3(-165.8693883, -11.2122753, -32.9453021),
                        }
                    },
                },

                -----------------------------------------------------------------------------------------
                -- WHEEL CHANGE'S --
                -----------------------------------------------------------------------------------------

                [6] = {
                    ["extra_time"] = 2 * 60 * 1000,
                    ["mission_time"] = 10 * 60 * 1000,
                    ["deducted_per_min"] = 50,
                    ["type"] = "change_wheel",
                    ["label"] = "Change Wheel",
                    ["reward"] = 12000,
                    ["blips"] = {
                        ["label"] = "Wheel Change - Call",
                        ["sprite"] = 280,
                        ["color"] = 33,
                        ["scale"] = 1.5,
                    },
                    ["car_stuff"] = {
                        ["model"] = "asterope",
                        ["coords"] = vec4(959.56, -1072.08, 37.11, 123.85),
                        ["tyre_bone"] = 52,
                        ["tyre_index"] = 0,
                        ["jack_attach"] = {
                            ["coords"] = vec3(0.20, -0.70, -0.35),
                            ["rotation"] = vec3(0.0, 0.0, 90.0),
                        }
                    },
                    ["progress"] = {
                        ["time"] = 10 * 1000,
                        ["animDict"] = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
                        ["animName"] = "machinic_loop_mechandplayer",
                        ["flag"] = 01,
                    },
                },
                [7] = {
                    ["extra_time"] = 2 * 60 * 1000,
                    ["mission_time"] = 20 * 60 * 1000,
                    ["deducted_per_min"] = 50,
                    ["type"] = "change_wheel",
                    ["label"] = "Change Wheel",
                    ["reward"] = 12000,
                    ["blips"] = {
                        ["label"] = "Wheel Change - Call",
                        ["sprite"] = 280,
                        ["color"] = 33,
                        ["scale"] = 1.5,
                    },
                    ["car_stuff"] = {
                        ["model"] = "asterope",
                        ["coords"] = vec4(411.94, -1157.81, 29.29, 268.68),
                        ["tyre_bone"] = 52,
                        ["tyre_index"] = 0,
                        ["jack_attach"] = {
                            ["coords"] = vec3(0.20, -0.70, -0.35),
                            ["rotation"] = vec3(0.0, 0.0, 90.0),
                        }
                    },
                    ["progress"] = {
                        ["time"] = 10 * 1000,
                        ["animDict"] = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
                        ["animName"] = "machinic_loop_mechandplayer",
                        ["flag"] = 01,
                    },
                },
                [8] = {
                    ["extra_time"] = 2 * 60 * 1000,
                    ["mission_time"] = 20 * 60 * 1000,
                    ["deducted_per_min"] = 50,
                    ["type"] = "change_wheel",
                    ["label"] = "Change Wheel",
                    ["reward"] = 12000,
                    ["blips"] = {
                        ["label"] = "Wheel Change - Call",
                        ["sprite"] = 280,
                        ["color"] = 33,
                        ["scale"] = 1.5,
                    },
                    ["car_stuff"] = {
                        ["model"] = "adder",
                        ["coords"] = vec4(324.87, -1153.84, 28.29, 270.31),
                        ["tyre_bone"] = 43,
                        ["tyre_index"] = 0,
                        ["jack_attach"] = {
                            ["coords"] = vec3(0.20, -0.70, -0.35),
                            ["rotation"] = vec3(0.0, 0.0, 90.0),
                        }
                    },
                    ["progress"] = {
                        ["time"] = 10 * 1000,
                        ["animDict"] = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
                        ["animName"] = "machinic_loop_mechandplayer",
                        ["flag"] = 01,
                    },
                },
                [9] = {
                    ["extra_time"] = 2 * 60 * 1000,
                    ["mission_time"] = 20 * 60 * 1000,
                    ["deducted_per_min"] = 50,
                    ["type"] = "change_wheel",
                    ["label"] = "Change Wheel",
                    ["reward"] = 12000,
                    ["blips"] = {
                        ["label"] = "Wheel Change - Call",
                        ["sprite"] = 280,
                        ["color"] = 33,
                        ["scale"] = 1.5,
                    },
                    ["car_stuff"] = {
                        ["model"] = "adder",
                        ["coords"] = vec4(324.87, -1153.84, 29.29, 270.31),
                        ["tyre_bone"] = 43,
                        ["tyre_index"] = 0,
                        ["jack_attach"] = {
                            ["coords"] = vec3(0.20, -0.70, -0.35),
                            ["rotation"] = vec3(0.0, 0.0, 90.0),
                        }
                    },
                    ["progress"] = {
                        ["time"] = 10 * 1000,
                        ["animDict"] = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
                        ["animName"] = "machinic_loop_mechandplayer",
                        ["flag"] = 01,
                    },
                },
                [10] = {
                    ["extra_time"] = 2 * 60 * 1000,
                    ["mission_time"] = 20 * 60 * 1000,
                    ["deducted_per_min"] = 50,
                    ["type"] = "change_wheel",
                    ["label"] = "Change Wheel",
                    ["reward"] = 12000,
                    ["blips"] = {
                        ["label"] = "Wheel Change - Call",
                        ["sprite"] = 280,
                        ["color"] = 33,
                        ["scale"] = 1.5,
                    },
                    ["car_stuff"] = {
                        ["model"] = "sultan",
                        ["coords"] = vec4(324.87, -1153.84, 29.29, 270.31),
                        ["tyre_bone"] = 50,
                        ["tyre_index"] = 0,
                        ["jack_attach"] = {
                            ["coords"] = vec3(0.20, -0.70, -0.35),
                            ["rotation"] = vec3(0.0, 0.0, 90.0),
                        }
                    },
                    ["progress"] = {
                        ["time"] = 10 * 1000,
                        ["animDict"] = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
                        ["animName"] = "machinic_loop_mechandplayer",
                        ["flag"] = 01,
                    },
                },

                -----------------------------------------------------------------------------------------
                -- TOWTRUCK'S --
                -----------------------------------------------------------------------------------------

                [11] = {
                    ["extra_time"] = 2 * 60 * 1000,
                    ["mission_time"] = 8 * 60 * 1000,
                    ["deducted_per_min"] = 50,
                    ["type"] = "towing",
                    ["label"] = "Vehicle must be towed",
                    ["reward"] = 12000,
                    ["blips"] = {
                        ["label"] = "Vehicle Towing - Call",
                        ["sprite"] = 280,
                        ["color"] = 33,
                        ["scale"] = 1.5,
                    },
                    ["car_stuff"] = {
                        ["model"] = "weevil",
                        ["coords"] = vec4(595.10, 225.08, 102.69, 272.17),
                    },
                    ["delivery_coords"] = vec3(2422.18, 3131.47, 48.19),
                },
                [12] = {
                    ["extra_time"] = 2 * 60 * 1000,
                    ["mission_time"] = 8 * 60 * 1000,
                    ["deducted_per_min"] = 50,
                    ["type"] = "towing",
                    ["label"] = "Vehicle must be towed",
                    ["reward"] = 12000,
                    ["blips"] = {
                        ["label"] = "Vehicle Towing - Call",
                        ["sprite"] = 280,
                        ["color"] = 33,
                        ["scale"] = 1.5,
                    },
                    ["car_stuff"] = {
                        ["model"] = "ratloader",
                        ["coords"] = vec4( 838.61, 233.62, 83.06, 159.35),
                    },
                    ["delivery_coords"] = vec3(2422.18, 3131.47, 48.19),
                },
                [13] = {
                    ["extra_time"] = 2 * 60 * 1000,
                    ["mission_time"] = 8 * 60 * 1000,
                    ["deducted_per_min"] = 50,
                    ["type"] = "towing",
                    ["label"] = "Vehicle must be towed",
                    ["reward"] = 12000,
                    ["blips"] = {
                        ["label"] = "Vehicle Towing - Call",
                        ["sprite"] = 280,
                        ["color"] = 33,
                        ["scale"] = 1.5,
                    },
                    ["car_stuff"] = {
                        ["model"] = "rebel",
                        ["coords"] = vec4(1156.24, -827.94, 54.96, 107.36),
                    },
                    ["delivery_coords"] = vec3(2422.18, 3131.47, 48.19),
                },
                [14] = {
                    ["extra_time"] = 2 * 60 * 1000,
                    ["mission_time"] = 8 * 60 * 1000,
                    ["deducted_per_min"] = 50,
                    ["type"] = "towing",
                    ["label"] = "Vehicle must be towed",
                    ["reward"] = 12000,
                    ["blips"] = {
                        ["label"] = "Vehicle Towing - Call",
                        ["sprite"] = 280,
                        ["color"] = 33,
                        ["scale"] = 1.5,
                    },
                    ["car_stuff"] = {
                        ["model"] = "habanero",
                        ["coords"] = vec4(778.88, -1074.78, 28.28, 184.01),
                    },
                    ["delivery_coords"] = vec3(2422.18, 3131.47, 48.19),
                },
                [15] = {
                    ["extra_time"] = 2 * 60 * 1000,
                    ["mission_time"] = 8 * 60 * 1000,
                    ["deducted_per_min"] = 50,
                    ["type"] = "towing",
                    ["label"] = "Vehicle must be towed",
                    ["reward"] = 12000,
                    ["blips"] = {
                        ["label"] = "Vehicle Towing - Call",
                        ["sprite"] = 280,
                        ["color"] = 33,
                        ["scale"] = 1.5,
                    },
                    ["car_stuff"] = {
                        ["model"] = "asea",
                        ["coords"] = vec4(722.29, -2032.96, 29.28, 359.84),
                    },
                    ["delivery_coords"] = vec3(2422.18, 3131.47, 48.19),
                },
                [16] = {
                    ["extra_time"] = 2 * 60 * 1000,
                    ["mission_time"] = 8 * 60 * 1000,
                    ["deducted_per_min"] = 50,
                    ["type"] = "towing",
                    ["label"] = "Vehicle must be towed",
                    ["reward"] = 12000,
                    ["blips"] = {
                        ["label"] = "Vehicle Towing - Call",
                        ["sprite"] = 280,
                        ["color"] = 33,
                        ["scale"] = 1.5,
                    },
                    ["car_stuff"] = {
                        ["model"] = "asea",
                        ["coords"] = vec4(-830.30, -1165.37, 6.89, 78.62),
                    },
                    ["delivery_coords"] = vec3(2422.18, 3131.47, 48.19),
                },
                [17] = {
                    ["extra_time"] = 2 * 60 * 1000,
                    ["mission_time"] = 8 * 60 * 1000,
                    ["deducted_per_min"] = 50,
                    ["type"] = "towing",
                    ["label"] = "Vehicle must be towed",
                    ["reward"] = 12000,
                    ["blips"] = {
                        ["label"] = "Vehicle Towing - Call",
                        ["sprite"] = 280,
                        ["color"] = 33,
                        ["scale"] = 1.5,
                    },
                    ["car_stuff"] = {
                        ["model"] = "tornado3",
                        ["coords"] = vec4(-1493.77, -728.76, 26.09, 357.19),
                    },
                    ["delivery_coords"] = vec3(2422.18, 3131.47, 48.19),
                },
                [18] = {
                    ["extra_time"] = 2 * 60 * 1000,
                    ["mission_time"] = 8 * 60 * 1000,
                    ["deducted_per_min"] = 50,
                    ["type"] = "towing",
                    ["label"] = "Vehicle must be towed",
                    ["reward"] = 12000,
                    ["blips"] = {
                        ["label"] = "Vehicle Towing - Call",
                        ["sprite"] = 280,
                        ["color"] = 33,
                        ["scale"] = 1.5,
                    },
                    ["car_stuff"] = {
                        ["model"] = "bison",
                        ["coords"] = vec4(-146.13, -1408.94, 30.43, 122.75),
                    },
                    ["delivery_coords"] = vec3(2422.18, 3131.47, 48.19),
                },
                [19] = {
                    ["extra_time"] = 2 * 60 * 1000,
                    ["mission_time"] = 8 * 60 * 1000,
                    ["deducted_per_min"] = 50,
                    ["type"] = "towing",
                    ["label"] = "Vehicle must be towed",
                    ["reward"] = 12000,
                    ["blips"] = {
                        ["label"] = "Vehicle Towing - Call",
                        ["sprite"] = 280,
                        ["color"] = 33,
                        ["scale"] = 1.5,
                    },
                    ["car_stuff"] = {
                        ["model"] = "burrito3",
                        ["coords"] = vec4(807.36, -1378.38, 26.65, 1.12),
                    },
                    ["delivery_coords"] = vec3(2422.18, 3131.47, 48.19),
                },
                [20] = {
                    ["extra_time"] = 2 * 60 * 1000,
                    ["mission_time"] = 8 * 60 * 1000,
                    ["deducted_per_min"] = 50,
                    ["type"] = "towing",
                    ["label"] = "Vehicle must be towed",
                    ["reward"] = 12000,
                    ["blips"] = {
                        ["label"] = "Vehicle Towing - Call",
                        ["sprite"] = 280,
                        ["color"] = 33,
                        ["scale"] = 1.5,
                    },
                    ["car_stuff"] = {
                        ["model"] = "burrito3",
                        ["coords"] = vec4(778.54, -1065.31, 27.76, 319.48),
                    },
                    ["delivery_coords"] = vec3(2422.18, 3131.47, 48.19),
                },
            }
        },
        ["outfits"] = {
            ["male"] = {
                ['t-shirt'] = {["item"] = 15, ["texture"] = 0},
                ['torso2'] = {["item"] = 345, ["texture"] = 0},
                ['arms'] = {["item"] = 19, ["texture"] = 0},
                ['pants'] = {["item"] = 3, ["texture"] = 7},
                ['shoes'] = {["item"] = 1, ["texture"] = 0},
            },
            ["female"] = {
                ['t-shirt'] = {["item"] = 15, ["texture"] = 0},
                ['torso2'] = {["item"] = 345, ["texture"] = 0},
                ['arms'] = {["item"] = 19, ["texture"] = 0},
                ['pants'] = {["item"] = 3, ["texture"] = 7},
                ['shoes'] = {["item"] = 1, ["texture"] = 0},
            },
        },
        ["menu_informations"] = {
            ["cover"] = "https://i.ibb.co/G7yzvDp/DALL-E-2024-11-10-13-37-07-A-realistic-scene-in-the-GTA-5-world-featuring-a-tow-truck-with-a-driver.webp",
            ["title"] = "Road Helper",
            ["description"] = "Help stranded vehicles and get money!",
            ["recommended"] = false,
            ["steps"] = {
                [1] = {
                    ["title"] = "Dress the clothes",
                    ["description"] = "Access the work menu by going to the work center, then click on Dress up in work clothes",
                    ["cover"] = "https://i.ibb.co/3d0HP5H/DALL-E-2024-11-10-13-33-22-A-scene-from-the-GTA-5-world-featuring-a-character-in-mechanic-style-clot.webp",
                },
                [2] = {
                    ["title"] = "Wait a call",
                    ["description"] = "Wait for a call from a stuck person. These are usually local people (npc).",
                    ["cover"] = "https://i.ibb.co/wzxpBNs/DALL-E-2024-11-10-13-43-45-A-realistic-scene-in-the-GTA-5-world-featuring-a-woman-standing-next-to-h.webp",
                },
                [3] = {
                    ["title"] = "Help it!",
                    ["description"] = "You can refuel, change a tyre or tow the vehicle you are assisting",
                    ["cover"] = "https://i.ibb.co/mSnWMGC/DALL-E-2024-11-10-13-55-59-A-detailed-scene-in-the-GTA-5-world-featuring-a-tow-truck-parked-next-to.webp",
                },
            }
        },
    },
    ["bus_driver"] = {
        ["name"] = "Bus Driver",
        ["debug"] = false,
        ["disabled"] = false,
        ["menu"] = {
            ["job_menu"] = vec3(466.49, -575.86, 28.50),
            ["interaction_distance"] = 1.0,
            ["blips"] = {
                ["show"] = true,
                ["label"] = "Dashound Bus - Center",
                ["sprite"] = 513,
                ["color"] = 32,
                ["scale"] = 1.0,
            }
        },
        ["car_settings"] = {
            ["model"] = "coach",
            ["spawnCoords"] = vec4(457.18, -653.68, 28.71, 214.47),
            ["cam_settings"] = {
                ["fov"] = 45.0,
                ["bone"] = 3,
                ["rotation"] = vec3(0.0, 0.0, 160.0),
                ["offset"] = vec3(3.0, 6.0, 1.5),
            }
        },
        ["lines"] = {
            ["number_33"] = {
                ["reward"] = 15000,
                ["extra_time"] = 2 * 60 * 1000,
                ["mission_time"] = 7 * 60 * 1000,
                ["deducted_per_min"] = 50,
                ["label"] = "Textile City",
                ["blips"] = {
                    ["show"] = false,
                    ["label"] = "Line 33 - Bus Stop %s",
                    ["sprite"] = 280,
                    ["color"] = 32,
                    ["scale"] = 1.0,
                },
                ["stops"] = {
                    [1] = {
                        ["coords"] = vec4(789.36, -1368.03, 26.56, 176.35),
                        ["npc_coord"] = vec4(786.00, -1369.15, 26.60, 278.75),
                        ["distance"] = 2.0,
                        ["leaving_passenger"] = 0,
                        ["boarding_passenger"] = 2,
                    },
                    [2] = {
                        ["coords"] = vec4(826.56, -1637.83, 31.20, 174.02),
                        ["npc_coord"] = vec4(822.73, -1638.50, 30.40, 270.86),
                        ["distance"] = 2.0,
                        ["leaving_passenger"] = 1,
                        ["boarding_passenger"] = 2,
                    },
                    [3] = {
                        ["coords"] = vec4(-106.04, -1687.65, 30.11, 140.01),
                        ["npc_coord"] = vec4(-109.68, -1685.85, 29.31, 235.65),
                        ["distance"] = 2.0,
                        ["leaving_passenger"] = 1,
                        ["boarding_passenger"] = 3,
                    },
                    [4] = {
                        ["coords"] = vec4(-710.61, -828.40, 24.30, 89.93),
                        ["npc_coord"] = vec4(-711.82, -824.87, 23.55, 184.84),
                        ["distance"] = 2.0,
                        ["leaving_passenger"] = 0,
                        ["boarding_passenger"] = 1,
                    },
                    [5] = {
                        ["coords"] = vec4(-694.23, -667.10, 31.63, 269.19),
                        ["npc_coord"] = vec4(-692.77, -670.48, 30.86, 0.20),
                        ["distance"] = 2.0,
                        ["leaving_passenger"] = 2,
                        ["boarding_passenger"] = 0,
                    },
                }
            },
            ["number_19S"] = {
                ["reward"] = 15000,
                ["extra_time"] = 2 * 60 * 1000,
                ["mission_time"] = 10 * 60 * 1000,
                ["deducted_per_min"] = 50,
                ["label"] = "Vespucci",
                ["blips"] = {
                    ["show"] = false,
                    ["label"] = "Line 19S - Bus Stop %s",
                    ["sprite"] = 280,
                    ["color"] = 32,
                    ["scale"] = 1.0,
                },
                ["stops"] = {
                    [1] = {
                        ["coords"] = vec4(-504.39, 19.34, 44.76, 95.05),
                        ["npc_coord"] = vec4(-505.08, 23.38, 44.79, 189.08),
                        ["distance"] = 2.0,
                        ["leaving_passenger"] = 0,
                        ["boarding_passenger"] = 3,
                    },
                    [2] = {
                        ["coords"] = vec4(-1525.10, -467.68, 35.37, 124.19),
                        ["npc_coord"] = vec4(-1527.57, -464.49, 35.40, 214.38),
                        ["distance"] = 2.0,
                        ["leaving_passenger"] = 1,
                        ["boarding_passenger"] = 1,
                    },
                    [3] = {
                        ["coords"] = vec4(-1477.26, -631.75, 30.54, 306.45),
                        ["npc_coord"] = vec4(-1475.81, -634.49, 30.60, 41.09),
                        ["distance"] = 2.0,
                        ["leaving_passenger"] = 2,
                        ["boarding_passenger"] = 1,
                    },
                    [4] = {
                        ["coords"] = vec4(-249.17, -882.40, 30.61, 251.71),
                        ["npc_coord"] = vec4(-250.05, -886.62, 30.63, 347.18),
                        ["distance"] = 2.0,
                        ["leaving_passenger"] = 0,
                        ["boarding_passenger"] = 4,
                    },
                    [5] = {
                        ["coords"] = vec4(355.30, -1063.06, 29.39, 272.29),
                        ["npc_coord"] = vec4(355.99, -1066.68, 29.56, 352.31),
                        ["distance"] = 2.0,
                        ["leaving_passenger"] = 3,
                        ["boarding_passenger"] = 1,
                    },
                }
            },
            ["number_6C"] = {
                ["reward"] = 15000,
                ["extra_time"] = 2 * 60 * 1000,
                ["mission_time"] = 8 * 60 * 1000,
                ["deducted_per_min"] = 50,
                ["label"] = "Southside - Textile City",
                ["blips"] = {
                    ["show"] = false,
                    ["label"] = "Line 6C - Bus Stop %s",
                    ["sprite"] = 280,
                    ["color"] = 32,
                    ["scale"] = 1.0,
                },
                ["stops"] = {
                    [1] = {
                        ["coords"] = vec4(308.17, -766.03, 29.28, 165.00),
                        ["npc_coord"] = vec4(304.54, -765.16, 29.31, 254.65),
                        ["distance"] = 2.0,
                        ["leaving_passenger"] = 0,
                        ["boarding_passenger"] = 1,
                    },
                    [2] = {
                        ["coords"] = vec4(114.19, -786.15, 31.40, 67.90),
                        ["npc_coord"] = vec4(114.55, -781.10, 31.41, 167.58),
                        ["distance"] = 2.0,
                        ["leaving_passenger"] = 0,
                        ["boarding_passenger"] = 1,
                    },
                    [3] = {
                        ["coords"] = vec4(360.40, -1781.82, 29.07, 318.51),
                        ["npc_coord"] = vec4(366.21, -1786.43, 29.17, 54.84),
                        ["distance"] = 2.0,
                        ["leaving_passenger"] = 0,
                        ["boarding_passenger"] = 3,
                    },
                    [4] = {
                        ["coords"] = vec4(774.39, -1750.34, 29.50, 265.75),
                        ["npc_coord"] = vec4(774.78, -1754.48, 29.51, 1.96),
                        ["distance"] = 2.0,
                        ["leaving_passenger"] = 2,
                        ["boarding_passenger"] = 0,
                    },
                    [5] = {
                        ["coords"] = vec4(784.57, -776.81, 26.40, 0.69),
                        ["npc_coord"] = vec4(788.03, -776.30, 26.42, 93.21),
                        ["distance"] = 2.0,
                        ["leaving_passenger"] = 1,
                        ["boarding_passenger"] = 2,
                    },
                }
            },
            ["number_522"] = {
                ["reward"] = 15000,
                ["extra_time"] = 2 * 60 * 1000,
                ["mission_time"] = 11 * 60 * 1000,
                ["deducted_per_min"] = 50,
                ["label"] = "Arena Ring",
                ["blips"] = {
                    ["show"] = false,
                    ["label"] = "Line 522 - Bus Stop %s",
                    ["sprite"] = 280,
                    ["color"] = 32,
                    ["scale"] = 1.0,
                },
                ["stops"] = {
                    [1] = {
                        ["coords"] = vec4(-137.84, -1972.06, 22.81, 95.42),
                        ["npc_coord"] = vec4(-136.15, -1966.87, 22.81, 183.19),
                        ["distance"] = 2.0,
                        ["leaving_passenger"] = 0,
                        ["boarding_passenger"] = 5,
                    },
                    [2] = {
                        ["coords"] = vec4(49.54, -1535.02, 29.28, 319.87),
                        ["npc_coord"] = vec4(56.34, -1539.87, 29.29, 54.97),
                        ["distance"] = 2.0,
                        ["leaving_passenger"] = 1,
                        ["boarding_passenger"] = 3,
                    },
                    [3] = {
                        ["coords"] = vec4(114.24, -785.85, 31.39, 73.38),
                        ["npc_coord"] = vec4(115.40, -781.95, 31.40, 163.98),
                        ["distance"] = 2.0,
                        ["leaving_passenger"] = 3,
                        ["boarding_passenger"] = 0,
                    },
                    [4] = {
                        ["coords"] = vec4(-243.91, -714.61, 33.45, 155.25),
                        ["npc_coord"] = vec4(-247.34, -713.47, 33.56, 252.31),
                        ["distance"] = 2.0,
                        ["leaving_passenger"] = 2,
                        ["boarding_passenger"] = 0,
                    },
                    [5] = {
                        ["coords"] = vec4(-712.88, -828.77, 23.47, 91.73),
                        ["npc_coord"] = vec4(-712.52, -825.14, 23.54, 183.51),
                        ["distance"] = 2.0,
                        ["leaving_passenger"] = 1,
                        ["boarding_passenger"] = 4,
                    },
                    [6] = {
                        ["coords"] = vec4(-137.84, -1972.06, 22.81, 95.42),
                        ["npc_coord"] = vec4(-136.15, -1966.87, 22.81, 183.19),
                        ["distance"] = 2.0,
                        ["leaving_passenger"] = 2,
                        ["boarding_passenger"] = 1,
                    },
                }
            },
            ["number_11"] = {
                ["reward"] = 15000,
                ["extra_time"] = 2 * 60 * 1000,
                ["mission_time"] = 11 * 60 * 1000,
                ["deducted_per_min"] = 50,
                ["label"] = "Vespucci - City Hall",
                ["blips"] = {
                    ["show"] = false,
                    ["label"] = "Line 11 - Bus Stop %s",
                    ["sprite"] = 280,
                    ["color"] = 32,
                    ["scale"] = 1.0,
                },
                ["stops"] = {
                    [1] = {
                        ["coords"] = vec4(-524.25, -268.49, 35.29, 112.10),
                        ["npc_coord"] = vec4(-530.99, -265.86, 35.41, 203.63),
                        ["distance"] = 2.0,
                        ["leaving_passenger"] = 0,
                        ["boarding_passenger"] = 4,
                    },
                    [2] = {
                        ["coords"] = vec4(-647.09, -139.61, 37.72, 30.00),
                        ["npc_coord"] = vec4(-646.39, -133.52, 37.84, 180.87),
                        ["distance"] = 2.0,
                        ["leaving_passenger"] = 1,
                        ["boarding_passenger"] = 1,
                    },
                    [3] = {
                        ["coords"] = vec4(-928.36, -125.08, 37.58, 120.22),
                        ["npc_coord"] = vec4(-930.86, -120.36, 37.77, 212.86),
                        ["distance"] = 2.0,
                        ["leaving_passenger"] = 1,
                        ["boarding_passenger"] = 0,
                    },
                    [4] = {
                        ["coords"] = vec4(-1525.27, -467.75, 35.37, 122.76),
                        ["npc_coord"] = vec4(-1527.70, -464.71, 35.40, 213.74),
                        ["distance"] = 2.0,
                        ["leaving_passenger"] = 0,
                        ["boarding_passenger"] = 1,
                    },
                    [5] = {
                        ["coords"] = vec4(-1478.37, -630.95, 30.58, 307.70),
                        ["npc_coord"] = vec4(-1475.85, -634.10, 30.61, 40.02),
                        ["distance"] = 2.0,
                        ["leaving_passenger"] = 0,
                        ["boarding_passenger"] = 2,
                    },
                    [6] = {
                        ["coords"] = vec4(-558.35, -845.49, 27.51, 269.78),
                        ["npc_coord"] = vec4(-558.19, -848.63, 27.58, 9.39),
                        ["distance"] = 2.0,
                        ["leaving_passenger"] = 1,
                        ["boarding_passenger"] = 0,
                    },
                    [7] = {
                        ["coords"] = vec4(-248.85, -882.27, 30.61, 251.86),
                        ["npc_coord"] = vec4(-249.73, -886.23, 30.62, 345.65),
                        ["distance"] = 2.0,
                        ["leaving_passenger"] = 1,
                        ["boarding_passenger"] = 0,
                    },
                }
            },
        },
        ["outfits"] = {
            ["male"] = {
                ['t-shirt'] = {["item"] = 15, ["texture"] = 0},
                ['torso2'] = {["item"] = 345, ["texture"] = 0},
                ['arms'] = {["item"] = 19, ["texture"] = 0},
                ['pants'] = {["item"] = 3, ["texture"] = 7},
                ['shoes'] = {["item"] = 1, ["texture"] = 0},
            },
            ["female"] = {
                ['t-shirt'] = {["item"] = 15, ["texture"] = 0},
                ['torso2'] = {["item"] = 345, ["texture"] = 0},
                ['arms'] = {["item"] = 19, ["texture"] = 0},
                ['pants'] = {["item"] = 3, ["texture"] = 7},
                ['shoes'] = {["item"] = 1, ["texture"] = 0},
            },
        },
        ["menu_informations"] = {
            ["cover"] = "https://i.ibb.co/F0J5m0m/DALL-E-2024-11-15-18-30-25-A-realistic-scene-in-the-GTA-5-world-featuring-a-coach-style-bus-with-sev.webp",
            ["title"] = "Bus Driver",
            ["description"] = "Collect passengers at stops and get money",
            ["recommended"] = true,
            ["steps"] = {
                [1] = {
                    ["title"] = "Dress the clothes",
                    ["description"] = "Access the work menu by going to the work center, then click on Dress up in work clothes",
                    ["cover"] = "https://i.ibb.co/brPQGdn/DALL-E-2024-11-15-18-35-18-A-scene-in-the-GTA-5-world-featuring-a-character-working-for-a-bus-compan.webp",
                },
                [2] = {
                    ["title"] = "Select a bus line",
                    ["description"] = "Choose a line and start collecting people at the bus stops.",
                    ["cover"] = "https://i.ibb.co/kMYjcq9/DALL-E-2024-11-15-18-40-58-A-detailed-scene-in-the-GTA-5-world-showing-a-bus-at-a-clean-street-bus-s.webp",
                },
                [3] = {
                    ["title"] = "Back to the garage",
                    ["description"] = "Bring passengers back to the garage and earn your money",
                    ["cover"] = "https://i.ibb.co/9TVbPzN/DALL-E-2024-11-15-18-44-14-A-realistic-scene-in-the-GTA-5-world-showing-a-full-bus-entering-a-bus-de.webp",
                },
            }
        },
    },
    ["fire_department"] = {
        ["name"] = "Fire Department",
        ["debug"] = false,
        ["disabled"] = false,
        ["can_multiplayer"] = true,
        ["show_members_blips"] = true,
        ["menu"] = {
            ["job_menu"] = vec3(204.70, -1642.62, 29.80),
            ["interaction_distance"] = 1.0,
            ["blips"] = {
                ["show"] = true,
                ["label"] = "Fire Department - Center",
                ["sprite"] = 86,
                ["color"] = 81,
                ["scale"] = 1.0,
            }
        },
        ["giveable_items"] = {
            ["weapon_fireextinguisher"] = 1,
        },
        ["car_settings"] = {
            ["model"] = "firetruk",
            ["spawnCoords"] = vec4(208.69, -1647.81, 28.87, 319.27),
        },
        ["random_fires"] = {
            ["fire_timer"] = math.random(1, 2),
            ["blips"] = {
                ["show"] = true,
                ["label"] = "Fire Area",
                ["sprite"] = 436,
                ["color"] = 81,
                ["scale"] = 1.0,
            },
            ["fires"] = {
                [1] = {
                    ["reward"] = 5000,
                    ["extra_time"] = 2 * 60 * 1000,
                    ["mission_time"] = 7 * 60 * 1000,
                    ["split_reward_members"] = false,
                    ["deducted_per_min"] = 100,

                    ["ptfx"] = {
                        ["class"] = "scr_trevor3",
                        ["scale"] = 1.0,
                        ["effect"] = "scr_trev3_trailer_plume",
                    },
                    ["zone_radius"] = 25.0,
                    ["zone_coords"] = vec3(1384.68, -1511.33, 63.36),
                    ["flame_coords"] = {
                        [1] = vec3(1376.31, -1513.75, 57.03),
                        [2] = vec3(1381.61, -1515.07, 57.30),
                        [3] = vec3(1383.23, -1515.65, 61.30),
                    }
                },
                [2] = {
                    ["reward"] = 5000,
                    ["extra_time"] = 2 * 60 * 1000,
                    ["mission_time"] = 7 * 60 * 1000,
                    ["split_reward_members"] = false,
                    ["deducted_per_min"] = 100,

                    ["ptfx"] = {
                        ["class"] = "scr_trevor3",
                        ["scale"] = 1.0,
                        ["effect"] = "scr_trev3_trailer_plume",
                    },
                    ["zone_radius"] = 27.0,
                    ["zone_coords"] = vec3(-46.20, -1079.85, 26.69),
                    ["flame_coords"] = {
                        [1] = vec3(-48.24, -1068.07, 27.55),
                        [2] = vec3(-44.00, -1069.57, 27.55),
                        [3] = vec3(-34.40, -1073.15, 27.55),
                    }
                },
                [3] = {
                    ["reward"] = 5000,
                    ["extra_time"] = 2 * 60 * 1000,
                    ["mission_time"] = 8 * 60 * 1000,
                    ["split_reward_members"] = false,
                    ["deducted_per_min"] = 100,

                    ["ptfx"] = {
                        ["class"] = "scr_trevor3",
                        ["scale"] = 1.25,
                        ["effect"] = "scr_trev3_trailer_plume",
                    },
                    ["zone_radius"] = 30.0,
                    ["zone_coords"] = vec3(39.14, -1014.38, 28.92),
                    ["flame_coords"] = {
                        [1] = vec3(43.34, -1002.17, 32.12),
                        [2] = vec3(42.99, -1004.04, 33.99),
                        [3] = vec3(39.82, -1008.51, 31.15),
                        [4] = vec3(42.75, -1015.91, 29.55),
                    }
                },
                [4] = {
                    ["reward"] = 5000,
                    ["extra_time"] = 2 * 60 * 1000,
                    ["mission_time"] = 6 * 60 * 1000,
                    ["split_reward_members"] = false,
                    ["deducted_per_min"] = 100,

                    ["ptfx"] = {
                        ["class"] = "scr_trevor3",
                        ["scale"] = 1.25,
                        ["effect"] = "scr_trev3_trailer_plume",
                    },
                    ["zone_radius"] = 30.0,
                    ["zone_coords"] = vec3(508.76, -989.78, 27.66),
                    ["flame_coords"] = {
                        [1] = vec3(511.37, -986.27, 26.59),
                        [2] = vec3(512.35, -985.63, 29.81),
                        [3] = vec3(512.60, -998.76, 26.62),
                        [4] = vec3(511.25, -994.79, 26.64),
                        [5] = vec3(514.82, -995.05, 26.56),
                        [6] = vec3(512.51, -994.95, 29.79),
                    }
                },
                [5] = {
                    ["reward"] = 5000,
                    ["extra_time"] = 2 * 60 * 1000,
                    ["mission_time"] = 8 * 60 * 1000,
                    ["split_reward_members"] = false,
                    ["deducted_per_min"] = 100,

                    ["ptfx"] = {
                        ["class"] = "scr_trevor3",
                        ["scale"] = 1.25,
                        ["effect"] = "scr_trev3_trailer_plume",
                    },
                    ["zone_radius"] = 40.0,
                    ["zone_coords"] = vec3(-139.16, -1314.22, 39.97),
                    ["flame_coords"] = {
                        [1] = vec3(-148.81, -1305.90, 37.74),
                        [2] = vec3(-130.33, -1311.22, 42.99),
                        [3] = vec3(-148.91, -1311.00, 42.45),
                    }
                },
                [6] = {
                    ["reward"] = 5000,
                    ["extra_time"] = 2 * 60 * 1000,
                    ["mission_time"] = 5 * 60 * 1000,
                    ["split_reward_members"] = false,
                    ["deducted_per_min"] = 100,

                    ["ptfx"] = {
                        ["class"] = "scr_trevor3",
                        ["scale"] = 1.1,
                        ["effect"] = "scr_trev3_trailer_plume",
                    },
                    ["zone_radius"] = 40.0,
                    ["zone_coords"] = vec3(455.68, -707.27, 27.35),
                    ["flame_coords"] = {
                        [1] = vec3(462.75, -698.45, 26.53),
                        [2] = vec3(460.84, -703.74, 26.37),
                        [3] = vec3(461.96, -705.52, 28.26),
                        [4] = vec3(459.55, -700.64, 26.40),
                    }
                },
                [7] = {
                    ["reward"] = 5000,
                    ["extra_time"] = 1 * 60 * 1000,
                    ["mission_time"] = 4 * 60 * 1000,
                    ["split_reward_members"] = false,
                    ["deducted_per_min"] = 100,

                    ["ptfx"] = {
                        ["class"] = "scr_trevor3",
                        ["scale"] = 1.0,
                        ["effect"] = "scr_trev3_trailer_plume",
                    },
                    ["zone_radius"] = 42.0,
                    ["zone_coords"] = vec3(631.09, 258.06, 103.05),
                    ["flame_coords"] = {
                        [1] = vec3(625.00, 246.66, 102.19),
                        [2] = vec3(636.28, 247.59, 102.65),
                        [3] = vec3(641.14, 258.15, 103.26),
                    }
                },
                [8] = {
                    ["reward"] = 5000,
                    ["extra_time"] = 1 * 60 * 1000,
                    ["mission_time"] = 4 * 60 * 1000,
                    ["split_reward_members"] = false,
                    ["deducted_per_min"] = 100,

                    ["ptfx"] = {
                        ["class"] = "scr_trevor3",
                        ["scale"] = 1.3,
                        ["effect"] = "scr_trev3_trailer_plume",
                    },
                    ["zone_radius"] = 40.0,
                    ["zone_coords"] = vec3(898.34, -1037.07, 39.98),
                    ["flame_coords"] = {
                        [1] = vec3(888.79, -1030.68, 40.33),
                        [2] = vec3(887.75, -1027.94, 34.11),
                        [3] = vec3(903.69, -1037.90, 40.13),
                    }
                },
                [9] = {
                    ["reward"] = 5000,
                    ["extra_time"] = 1 * 60 * 1000,
                    ["mission_time"] = 6 * 60 * 1000,
                    ["split_reward_members"] = false,
                    ["deducted_per_min"] = 100,

                    ["ptfx"] = {
                        ["class"] = "scr_trevor3",
                        ["scale"] = 1.3,
                        ["effect"] = "scr_trev3_trailer_plume",
                    },
                    ["zone_radius"] = 40.0,
                    ["zone_coords"] = vec3(-1633.63, -1033.77, 17.94),
                    ["flame_coords"] = {
                        [1] = vec3(-1637.82, -1025.34, 12.23),
                        [2] = vec3(-1630.17, -1024.35, 17.61),
                        [3] = vec3(-1628.07, -1026.08, 17.61),
                        [4] = vec3(-1640.40, -1026.45, 15.68),
                    }
                },
                [10] = {
                    ["reward"] = 5000,
                    ["extra_time"] = 1 * 60 * 1000,
                    ["mission_time"] = 7 * 60 * 1000,
                    ["split_reward_members"] = false,
                    ["deducted_per_min"] = 100,

                    ["ptfx"] = {
                        ["class"] = "scr_trevor3",
                        ["scale"] = 1.3,
                        ["effect"] = "scr_trev3_trailer_plume",
                    },
                    ["zone_radius"] = 40.0,
                    ["zone_coords"] = vec3(-894.06, -1153.87, 13.12),
                    ["flame_coords"] = {
                        [1] = vec3(-898.30, -1153.03, 13.46),
                        [2] = vec3(-901.88, -1158.23, 12.12),
                        [3] = vec3(-891.53, -1154.20, 12.12),
                        [4] = vec3(-890.10, -1150.70, 13.46),
                        [5] = vec3(-889.50, -1149.60, 12.12),
                    }
                },
                [11] = {
                    ["reward"] = 5000,
                    ["extra_time"] = 2 * 60 * 1000,
                    ["mission_time"] = 7 * 60 * 1000,
                    ["split_reward_members"] = false,
                    ["deducted_per_min"] = 100,

                    ["ptfx"] = {
                        ["class"] = "scr_trevor3",
                        ["scale"] = 1.3,
                        ["effect"] = "scr_trev3_trailer_plume",
                    },
                    ["zone_radius"] = 40.0,
                    ["zone_coords"] = vec3(-539.33, -1205.58, 17.94),
                    ["flame_coords"] = {
                        [1] = vec3(-540.34, -1219.28, 17.54),
                        [2] = vec3(-529.85, -1214.47, 17.33),
                        [3] = vec3(-508.16, -1216.71, 17.48),
                        [4] = vec3(-543.54, -1225.73, 17.45),
                    }
                },
            }
        },
        ["outfits"] = {
            ["male"] = {
                ['t-shirt'] = {["item"] = 15, ["texture"] = 0},
                ['torso2'] = {["item"] = 345, ["texture"] = 0},
                ['arms'] = {["item"] = 19, ["texture"] = 0},
                ['pants'] = {["item"] = 3, ["texture"] = 7},
                ['shoes'] = {["item"] = 1, ["texture"] = 0},
            },
            ["female"] = {
                ['t-shirt'] = {["item"] = 15, ["texture"] = 0},
                ['torso2'] = {["item"] = 345, ["texture"] = 0},
                ['arms'] = {["item"] = 19, ["texture"] = 0},
                ['pants'] = {["item"] = 3, ["texture"] = 7},
                ['shoes'] = {["item"] = 1, ["texture"] = 0},
            },
        },
        ["menu_informations"] = {
            ["cover"] = "https://i.ibb.co/R2h7Ysy/DALL-E-2024-11-17-20-35-54-A-highly-detailed-scene-in-the-GTA-5-world-showing-three-firefighters-fro.webp",
            ["title"] = "Fire Department",
            ["description"] = "Extinguish fires and help people",
            ["recommended"] = false,
            ["steps"] = {
                [1] = {
                    ["title"] = "Dress the clothes",
                    ["description"] = "Access the work menu by going to the work center, then click on Dress up in work clothes",
                    ["cover"] = "https://i.ibb.co/KhQqJwq/DALL-E-2024-11-17-20-36-38-A-detailed-scene-in-the-GTA-5-world-featuring-a-firefighter-in-a-locker-r.webp",
                },
                [2] = {
                    ["title"] = "Focus on fires",
                    ["description"] = "Respond to incoming fire calls and get on the road to extinguish them.",
                    ["cover"] = "https://i.ibb.co/R2h7Ysy/DALL-E-2024-11-17-20-35-54-A-highly-detailed-scene-in-the-GTA-5-world-showing-three-firefighters-fro.webp",
                },
                [3] = {
                    ["title"] = "Extinguish the fire",
                    ["description"] = "Extinguish the fire and get money",
                    ["cover"] = "https://i.ibb.co/FmBBvZm/DALL-E-2024-11-24-00-03-33-A-heroic-scene-in-the-GTA-5-world-featuring-a-group-of-firefighters-who-h.webp",
                },
            }
        },
    },
    ["hunter"] = {
        ["name"] = "Hunter",
        ["debug"] = false,
        ["disabled"] = false,
        ["can_multiplayer"] = true,
        ["show_members_blips"] = true,
        ["menu"] = {
            ["job_menu"] = vec3(-679.68, 5833.98, 17.33),
            ["interaction_distance"] = 1.0,
            ["blips"] = {
                ["show"] = true,
                ["label"] = "Hunter - Center",
                ["sprite"] = 141,
                ["color"] = 36,
                ["scale"] = 1.0,
            }
        },
        ["giveable_items"] = {
            ["weapon_musket"] = 1,
            ["ammo-musket"] = 30,
        },
        ["car_settings"] = {
            ["model"] = "mesa3",
            ["spawnCoords"] = vec4(-677.66, 5826.66, 17.10, 133.92),
        },
        ["hunting_zones"] = {
            [1] = {
                ["zone"] = vec3(-1679.51, 4600.07, 49.25),
                ["radius"] = 100.0,
                ["spawn_timer"] = math.random(1, 3) * 30 * 1000, -- Spawn animals the every 30 second or 1 min
                ["deleteAfter"] = 1 * 60 * 1000, -- If animal the not died Delete after 1 Min
                ["hunting_animals"] = {
                    [1] = {
                        ["addBlipAnimal"] = true,
                      ["canAttack"] = math.random(1, 10) <= 6, -- 20% chance to attack
                        ["reward"] = 4000,
                        ["model"] = "a_c_boar",
                    },
                    [2] = {
                        ["addBlipAnimal"] = true,
                      ["canAttack"] = math.random(1, 10) <= 6, -- 20% chance to attack
                        ["reward"] = 4000,
                        ["model"] = "a_c_deer",
                    },
                    [3] = {
                        ["addBlipAnimal"] = true,
                      ["canAttack"] = math.random(1, 10) <= 6, -- 20% chance to attack
                        ["reward"] = 4000,
                        ["model"] = "a_c_mtlion",
                    },
                    [4] = {
                        ["addBlipAnimal"] = true,
                      ["canAttack"] = math.random(1, 10) <= 6, -- 20% chance to attack
                        ["reward"] = 4000,
                        ["model"] = "a_c_coyote",
                    },
                },
                ["blips"] = {
                    ["show"] = true,
                    ["label"] = "Hunting Zone",
                    ["sprite"] = 141,
                    ["color"] = 49,
                    ["scale"] = 0.8,
                    ["alpha"] = 125,
                }
            },
            [2] = {
                ["zone"] = vec3(-576.35, 5938.56, 31.09),
                ["radius"] = 80.0,
                ["spawn_timer"] = math.random(1, 3) * 30 * 1000, -- Spawn animals the every 30 second or 1 min
                ["deleteAfter"] = 1 * 60 * 1000, -- If animal the not died Delete after 1 Min
                ["hunting_animals"] = {
                    [1] = {
                        ["addBlipAnimal"] = true,
                       ["canAttack"] = math.random(1, 10) <= 6, -- 20% chance to attack
                        ["reward"] = 4000,
                        ["model"] = "a_c_deer",
                    },
                    [2] = {
                        ["addBlipAnimal"] = true,
                      ["canAttack"] = math.random(1, 10) <= 6, -- 20% chance to attack
                        ["reward"] = 4000,
                        ["model"] = "a_c_mtlion",
                    },
                },
                ["blips"] = {
                    ["show"] = true,
                    ["label"] = "Hunting Zone",
                    ["sprite"] = 141,
                    ["color"] = 49,
                    ["scale"] = 0.8,
                    ["alpha"] = 125,
                }
            },
            [3] = {
                ["zone"] = vec3(-1448.56, 4640.55, 53.09),
                ["radius"] = 80.0,
                ["spawn_timer"] = math.random(1, 3) * 30 * 1000, -- Spawn animals the every 30 second or 1 min
                ["deleteAfter"] = 1 * 60 * 1000, -- If animal the not died Delete after 1 Min
                ["hunting_animals"] = {
                    [1] = {
                        ["addBlipAnimal"] = true,
                      ["canAttack"] = math.random(1, 10) <= 6, -- 20% chance to attack
                        ["reward"] = 4000,
                        ["model"] = "a_c_deer",
                    },
                    [2] = {
                        ["addBlipAnimal"] = true,
                      ["canAttack"] = math.random(1, 10) <= 6, -- 20% chance to attack
                        ["reward"] = 4000,
                        ["model"] = "a_c_boar",
                    },
                },
                ["blips"] = {
                    ["show"] = true,
                    ["label"] = "Hunting Zone",
                    ["sprite"] = 141,
                    ["color"] = 49,
                    ["scale"] = 0.8,
                    ["alpha"] = 125,
                }
            },
            [4] = {
                ["zone"] = vec3(-588.72, 5488.74, 55.17),
                ["radius"] = 70.0,
                ["spawn_timer"] = math.random(1, 3) * 30 * 1000, -- Spawn animals the every 30 second or 1 min
                ["deleteAfter"] = 1 * 60 * 1000, -- If animal the not died Delete after 1 Min
                ["hunting_animals"] = {
                    [1] = {
                        ["addBlipAnimal"] = true,
                      ["canAttack"] = math.random(1, 10) <= 6, -- 20% chance to attack
                        ["reward"] = 4000,
                        ["model"] = "a_c_deer",
                    },
                    [2] = {
                        ["addBlipAnimal"] = true,
                      ["canAttack"] = math.random(1, 10) <= 6, -- 20% chance to attack
                        ["reward"] = 4000,
                        ["model"] = "a_c_mtlion",
                    },
                    [3] = {
                        ["addBlipAnimal"] = true,
                      ["canAttack"] = math.random(1, 10) <= 6, -- 20% chance to attack
                        ["reward"] = 4000,
                        ["model"] = "a_c_coyote",
                    },
                },
                ["blips"] = {
                    ["show"] = true,
                    ["label"] = "Hunting Zone",
                    ["sprite"] = 141,
                    ["color"] = 49,
                    ["scale"] = 0.8,
                    ["alpha"] = 125,
                }
            },
        },
        ["outfits"] = {
            ["male"] = {
                ['t-shirt'] = {["item"] = 15, ["texture"] = 0},
                ['torso2'] = {["item"] = 345, ["texture"] = 0},
                ['arms'] = {["item"] = 19, ["texture"] = 0},
                ['pants'] = {["item"] = 3, ["texture"] = 7},
                ['shoes'] = {["item"] = 1, ["texture"] = 0},
            },
            ["female"] = {
                ['t-shirt'] = {["item"] = 15, ["texture"] = 0},
                ['torso2'] = {["item"] = 345, ["texture"] = 0},
                ['arms'] = {["item"] = 19, ["texture"] = 0},
                ['pants'] = {["item"] = 3, ["texture"] = 7},
                ['shoes'] = {["item"] = 1, ["texture"] = 0},
            },
        },
        ["menu_informations"] = {
            ["cover"] = "https://i.ibb.co/wyBLLVd/DALL-E-2024-11-24-00-13-34-A-highly-detailed-scene-in-the-GTA-5-world-featuring-a-hunter-in-a-dense.webp",
            ["title"] = "Hunting",
            ["description"] = "Hunt wanted or wild animals",
            ["recommended"] = true,
            ["steps"] = {
                [1] = {
                    ["title"] = "Dress the clothes",
                    ["description"] = "Access the work menu by going to the work center, then click on Dress up in work clothes",
                    ["cover"] = "https://i.ibb.co/vPxZtCp/DALL-E-2024-11-24-00-20-25-A-highly-detailed-scene-in-the-GTA-5-world-featuring-a-hunter-in-a-locker.webp",
                },
                [2] = {
                    ["title"] = "Go to the zone",
                    ["description"] = "Go to hunting zones and hunt animals.",
                    ["cover"] = "https://i.ibb.co/BgLxc62/DALL-E-2024-11-24-00-25-38-A-highly-detailed-scene-in-the-GTA-5-world-featuring-a-hunter-in-a-small.webp",
                },
                [3] = {
                    ["title"] = "Remove animal carcass",
                    ["description"] = "Remove the dead animal and get money",
                    ["cover"] = "https://i.ibb.co/pPynX2X/DALL-E-2024-11-24-00-33-17-A-realistic-scene-in-the-GTA-5-world-featuring-a-hunter-crouched-over-a-w.webp",
                },
            }
        },
    },
    ["detectorist"] = {
        ["name"] = "Metal Detectorist",
        ["debug"] = false,
        ["disabled"] = false,
        ["menu"] = {
            ["job_menu"] = vec3(-1336.55, -407.06, 36.50),
            ["interaction_distance"] = 1.0,
            ["blips"] = {
                ["show"] = true,
                ["label"] = "Metal Detectorist - Center",
                ["sprite"] = 355,
                ["color"] = 37,
                ["scale"] = 1.0,
            }
        },
        ["giveable_items"] = {
            ["gold_tooth"] = {
                ["label"] = "Gold Tooth",
                ["amount"] = 1,
                ["rarity"] = 0.02,
            },
            ["dirty_photo"] = {
                ["label"] = "Dirty Photo",
                ["amount"] = 1,
                ["rarity"] = 0.10,
            },
            ["chain"] = {
                ["label"] = "Chain",
                ["amount"] = 1,
                ["rarity"] = 0.15,
            },
            ["medal"] = {
                ["label"] = "Medal",
                ["amount"] = 1,
                ["rarity"] = 0.20,
            },
            ["rusted_tin"] = {
                ["label"] = "Rusted tin",
                ["amount"] = 1,
                ["rarity"] = 0.50,
            },
            ["nail"] = {
                ["label"] = "Nail",
                ["amount"] = 1,
                ["rarity"] = 0.70,
            },
            ["ring"] = {
                ["label"] = "Ring",
                ["amount"] = 1,
                ["rarity"] = 0.80,
            },
        },
        ["car_settings"] = {
            ["model"] = "youga",
            ["spawnCoords"] = vec4(-1344.45, -406.39, 35.69, 31.35),
        },
        ["prop_settings"] = {
            ["w_am_digiscanner"] = {
                ["prop"] = "w_am_digiscanner",
                ["car_attach"] = {
                    ["bone"] = 17,
                    ["coords"] = vec3(-0.35, 0.0, -0.15),
                    ["rotation"] = vec3(180.0, 70.0, 0.0),
                },
                ["player_attach"] = {
                    ["bone"] = 18905,
                    ["coords"] = vec3(0.15, 0.1, -0.1),
                    ["rotation"] = vec3(-130.0, 0.0, 0.0),

                    ["animDict"] = "mini@golfai",
                    ["animName"] = "wood_idle_a",
                },
            }
        },
        ["reset_timer"] = 5 * 60 * 1000, -- Reset the detectorist zones every 5 min
        ["digging_duration"] = 10 * 1000, -- Digging duration
        ["detectorist_zones"] = {
            [1] = {
                ["zone"] = vec3(-1555.55, -1192.97, 1.32),
                ["radius"] = 25.0,
                ["detecable_coords"] = {
                    [1] = vec4(-1566.47, -1183.05, 1.87, 47.93),
                    [2] = vec4(-1546.71, -1184.48, 1.32, 309.90),
                    [3] = vec4(-1543.59, -1203.29, 1.32, 91.88),
                    [4] = vec4(-1554.55, -1206.85, 1.34, 115.50),
                    [5] = vec4(-1560.31, -1198.61, 1.39, 354.40),
                    [6] = vec4(-1557.42, -1181.52, 1.63, 345.17),
                    [7] = vec4(-1549.19, -1177.82, 1.55, 298.36),
                    [8] = vec4(-1550.46, -1193.95, 1.23, 114.52),
                    [9] = vec4(-1563.69, -1196.15, 1.53, 140.01),
                },
                ["blips"] = {
                    ["show"] = true,
                    ["label"] = "Valuables Zone",
                    ["sprite"] = 617,
                    ["color"] = 32,
                    ["scale"] = 0.6,
                    ["alpha"] = 125,
                }
            },
            [2] = {
                ["zone"] = vec3(2363.88, 3055.52, 52.23),
                ["radius"] = 30.0,
                ["detecable_coords"] = {
                    [1] = vec4(2357.14, 3069.31, 48.23, 157.91),
                    [2] = vec4(2365.64, 3079.30, 48.15, 221.45),
                    [3] = vec4(2376.11, 3068.23, 48.15, 184.99),
                    [4] = vec4(2386.77, 3050.76, 48.15, 186.03),
                    [5] = vec4(2366.24, 3040.77, 48.15, 153.65),
                    [6] = vec4(2351.88, 3035.61, 48.15, 6.93),
                    [7] = vec4(2345.51, 3045.04, 48.15, 34.53),
                    [8] = vec4(2352.44, 3057.24, 48.16, 315.66),
                    [9] = vec4(2346.43, 3068.70, 48.15, 78.08),
                    [10] = vec4(22365.87, 3066.73, 48.15, 282.75),
                },
                ["blips"] = {
                    ["show"] = true,
                    ["label"] = "Valuables Zone",
                    ["sprite"] = 617,
                    ["color"] = 32,
                    ["scale"] = 0.6,
                    ["alpha"] = 125,
                }
            },
            [3] = {
                ["zone"] = vec3(-1286.47, -1714.68, 2.58),
                ["radius"] = 30.0,
                ["detecable_coords"] = {
                    [1] = vec4(-1287.31, -1707.62, 2.70, 32.15),
                    [2] = vec4(-1301.42, -1715.91, 2.58, 148.42),
                    [3] = vec4(-1296.11, -1728.48, 2.24, 199.38),
                    [4] = vec4(-1285.49, -1724.19, 2.67, 352.39),
                    [5] = vec4(-1304.12, -1727.94, 2.14, 86.06),
                    [6] = vec4(-1306.11, -1715.42, 2.33, 349.09),
                    [7] = vec4(-1273.27, -1710.45, 3.00, 273.54),
                    [8] = vec4(-1275.80, -1700.19, 3.18, 17.41),
                    [9] = vec4(-1273.40, -1721.57, 2.94, 169.79),
                    [10] = vec4(22365.87, 3066.73, 48.15, 282.75),
                    [11] = vec4(-1260.43, -1711.76, 3.83, 167.14),
                    [12] = vec4(-1264.38, -1701.56, 4.03, 4.52),
                    [13] = vec4(-1293.96, -1694.16, 2.84, 284.76),
                    [14] = vec4(-1282.15, -1692.08, 3.13, 264.83),
                },
                ["blips"] = {
                    ["show"] = true,
                    ["label"] = "Valuables Zone",
                    ["sprite"] = 617,
                    ["color"] = 32,
                    ["scale"] = 0.6,
                    ["alpha"] = 125,
                }
            },
            [4] = {
                ["zone"] = vec3(-2951.36, -3.78, 6.60),
                ["radius"] = 40.0,
                ["detecable_coords"] = {
                    [1] = vec4(-2943.19, -8.42, 6.44, 194.41),
                    [2] = vec4(-2949.82, -15.69, 4.81, 137.46),
                    [3] = vec4(-2956.35, -12.29, 4.96, 55.58),
                    [4] = vec4(-2966.12, -9.83, 4.58, 128.41),
                    [5] = vec4(-2973.71, -6.17, 4.89, 88.03),
                    [6] = vec4(-2972.17, 2.32, 6.19, 331.65),
                    [7] = vec4(-2959.71, 11.01, 7.33, 274.70),
                    [8] = vec4(-2933.64, -2.81, 7.32, 237.20),
                    [9] = vec4(-2934.76, -25.73, 3.72, 205.49),
                    [10] = vec4(-2921.54, -20.11, 5.72, 182.56),
                },
                ["blips"] = {
                    ["show"] = true,
                    ["label"] = "Valuables Zone",
                    ["sprite"] = 617,
                    ["color"] = 32,
                    ["scale"] = 0.6,
                    ["alpha"] = 125,
                }
            },
        },
        ["outfits"] = {
            ["male"] = {
                ['t-shirt'] = {["item"] = 15, ["texture"] = 0},
                ['torso2'] = {["item"] = 345, ["texture"] = 0},
                ['arms'] = {["item"] = 19, ["texture"] = 0},
                ['pants'] = {["item"] = 3, ["texture"] = 7},
                ['shoes'] = {["item"] = 1, ["texture"] = 0},
            },
            ["female"] = {
                ['t-shirt'] = {["item"] = 15, ["texture"] = 0},
                ['torso2'] = {["item"] = 345, ["texture"] = 0},
                ['arms'] = {["item"] = 19, ["texture"] = 0},
                ['pants'] = {["item"] = 3, ["texture"] = 7},
                ['shoes'] = {["item"] = 1, ["texture"] = 0},
            },
        },
        ["menu_informations"] = {
            ["cover"] = "https://i.ibb.co/DzMqpwv/DALL-E-2024-11-28-20-33-42-A-realistic-scene-in-the-GTA-5-world-featuring-a-character-on-a-beach-hol.webp",
            ["title"] = "Metal Detectorist",
            ["description"] = "Find valuable items",
            ["recommended"] = false,
            ["steps"] = {
                [1] = {
                    ["title"] = "Dress the clothes",
                    ["description"] = "Access the work menu by going to the work center, then click on Dress up in work clothes",
                    ["cover"] = "https://i.ibb.co/qMch7wP/DALL-E-2024-11-28-20-40-34-A-detailed-scene-in-the-GTA-5-world-featuring-a-metal-detector-operator-i.webp",
                },
                [2] = {
                    ["title"] = "Search with a detector",
                    ["description"] = "Start searching for valuables with the detector in the item search areas on the map.",
                    ["cover"] = "https://i.ibb.co/DzMqpwv/DALL-E-2024-11-28-20-33-42-A-realistic-scene-in-the-GTA-5-world-featuring-a-character-on-a-beach-hol.webp",
                },
                [3] = {
                    ["title"] = "Take out the item",
                    ["description"] = "Find the item and start digging the ground to win the valuable item.",
                    ["cover"] = "https://i.ibb.co/hFnsSSG/DALL-E-2024-11-28-20-54-07-A-detailed-scene-in-the-GTA-5-world-featuring-a-worker-engaged-in-metal-d.webp",
                },
            }
        },
    },
    ["project_car"] = {
        ["name"] = "Project Car",
        ["debug"] = false,
        ["disabled"] = false,
        ["can_multiplayer"] = true,
        ["show_members_blips"] = true,
        ["menu"] = {
            ["job_menu"] = vec3(-1377.51, -361.21, 36.62),
            ["interaction_distance"] = 1.0,
            ["blips"] = {
                ["show"] = true,
                ["label"] = "Project Car - Center",
                ["sprite"] = 569,
                ["color"] = 26,
                ["scale"] = 1.0,
            }
        },
        ["car_settings"] = {
            ["model"] = "speedo",
            ["spawnCoords"] = vec4(-1393.91, -337.82, 39.88, 123.70),
        },
        ["car_list"] = {
            [1] = {
                ["project_details"] = {
                    ["reward"] = 25000,
                    ["extra_time"] = 2 * 60 * 1000,
                    ["mission_time"] = 20 * 60 * 1000,
                    ["split_reward_members"] = true,
                    
                    ["blips"] = {
                        ["label"] = "Project Car",
                        ["sprite"] = 524,
                        ["color"] = 26,
                        ["scale"] = 1.0,
                    },
                    ["car_model"] = "jugular",
                    ["jack_model"] = "imp_prop_axel_stand_01a",
                    ["jack_coord"] = vec4(-1157.04, -2010.29, 13.0, 341.17), -- The vehicle spawns at this coordinate.
                    ["craft_coord"] = vec3(-1157.04, -2010.29, 12.62), -- Location to build the vehicle

                    ["tyre_animations"] = {
                        ["time"] = 10 * 1000,
                        ["flag"] = 01,
                        ["animDict"] = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
                        ["animName"] = "machinic_loop_mechandplayer",
                    },
                    ["tyre_positions"] = {
                        ["wheel_lf"] = {
                            ["target"] = {
                                ["coords"] = vec3(-0.5, 0.2, -0.4),
                                ["radius"] = 0.75
                            },
                            ["pedOffset"] = vec3(-0.80, 0.2, 0.0),
                            ["jackOffset"] = vec3(-0.17, 0.0, -0.63),
                            ["bone"] = 28,
                            ["tyre_index"] = 0
                        },
                        ["wheel_rf"] = {
                            ["target"] = {
                                ["coords"] = vec3(0.5, -0.2, -0.4),
                                ["radius"] = 0.75
                            },
                            ["pedOffset"] = vec3(0.80, -0.2, 0.0),
                            ["jackOffset"] = vec3(0.17, 0.0, -0.63),
                            ["bone"] = 30,
                            ["tyre_index"] = 1
                        },
                        ["wheel_lm"] = {
                            ["target"] = {
                                ["coords"] = vec3(-0.5, 0.2, -0.4),
                                ["radius"] = 0.75
                            },
                            ["pedOffset"] = vec3(-0.80, 0.2, 0.0),
                            ["jackOffset"] = vec3(-0.17, 0.0, -0.63),
                            ["bone"] = 29,
                            ["tyre_index"] = 2
                        },
                        ["wheel_rm"] = {
                            ["target"] = {
                                ["coords"] = vec3(0.5, -0.2, -0.4),
                                ["radius"] = 0.75
                            },
                            ["pedOffset"] = vec3(0.80, -0.2, 0.0),
                            ["jackOffset"] = vec3(0.17, 0.0, -0.63),
                            ["bone"] = 31,
                            ["tyre_index"] = 3
                        },
                    },

                    ["door_animations"] = {
                        ["time"] = 10 * 1000,
                        ["flag"] = 01,
                        ["animDict"] = "mini@repair",
                        ["animName"] = "fixing_a_ped",
                    },
                    ["door_positions"] = {
                        ["dside_f"] = {
                            ["pedOffset"] = vec3(-0.60, 0.20, 0.0),
                            ["target"] = {
                                ["coords"] = vec3(-0.80, 0.50, 0.0),
                                ["radius"] = 0.85
                            },
                            ["door_index"] = 0
                        },
                        ["dside_r"] = {
                            ["pedOffset"] = vec3(0.90, -0.30, 0.0),
                            ["target"] = {
                                ["coords"] = vec3(0.80, -0.05, 0.0),
                                ["radius"] = 0.85
                            },
                            ["door_index"] = 1
                        },
                        ["pside_f"] = {
                            ["pedOffset"] = vec3(-0.80, 0.30, 0.0),
                            ["target"] = {
                                ["coords"] = vec3(-1.1, -0.50, 0.0),
                                ["radius"] = 0.85
                            },
                            ["door_index"] = 2
                        },
                        ["pside_r"] = {
                            ["pedOffset"] = vec3(0.80, -0.20, 0.0),
                            ["target"] = {
                                ["coords"] = vec3(0.50, -1.1, 0.0),
                                ["radius"] = 0.85
                            },
                            ["door_index"] = 3
                        },
                        ["bonnet"] = {
                            ["pedOffset"] = vec3(-0.20, -0.70, 0.0),
                            ["target"] = {
                                ["coords"] = vec3(-0.77, -2.25, 0.0),
                                ["radius"] = 0.85
                            },
                            ["door_index"] = 5
                        },
                        ["boot"] = {
                            ["pedOffset"] = vec3(0.25, 0.80, 0.0),
                            ["target"] = {
                                ["coords"] = vec3(0.60, 1.70, 0.0),
                                ["radius"] = 0.85
                            },
                            ["door_index"] = 4
                        },
                    },

                    ["cam_stuff"] = {
                        ["cam_pos"] = vec3(-1154.66, -2002.37, 14.40),
                        ["cam_rot"] = vec3(-5.0, 0.0, 163.0),
                        ["cam_fov"] = 40.0,
                        ["hidded_ped"] = vec3(-1148.58, -1999.92, 13.18),
                    }
                },
                ["vehicle_parts_store"] = {
                    ["npc"] = {
                        ["model"] = "cs_old_man2",
                        ["coords"] = vec4(1181.31, -3113.79, 5.10, 94.16),
                        ["blip"] = {
                            ["label"] = "Vehicle Component Seller",
                            ["sprite"] = 446,
                            ["color"] = 26,
                            ["scale"] = 1.0,
                        },
                    },
                    ["parts"] = {
                        ["tyre"] = {
                            ["label"] = "Vehicle Tyre - $%s",
                            ["description"] = "Vehicle component",
                            ["item_name"] = "vehicle_tyre",
                            ["price"] = 100,

                        },
                        ["door"] = {
                            ["label"] = "Vehicle Door - $%s",
                            ["description"] = "Vehicle component",
                            ["item_name"] = "vehicle_door",
                            ["price"] = 100,
                        }
                    },
                }
            },
            [2] = {
                ["project_details"] = {
                    ["reward"] = 25000,
                    ["extra_time"] = 2 * 60 * 1000,
                    ["mission_time"] = 20 * 60 * 1000,
                    ["split_reward_members"] = true,
                    
                    ["blips"] = {
                        ["label"] = "Project Car",
                        ["sprite"] = 524,
                        ["color"] = 26,
                        ["scale"] = 1.0,
                    },
                    ["car_model"] = "asbo",
                    ["jack_model"] = "imp_prop_axel_stand_01a",
                    ["jack_coord"] = vec4(-425.42, -1689.40, 18.90, 160.02), -- The vehicle spawns at this coordinate.
                    ["craft_coord"] = vec3(-425.42, -1689.40, 18.47), -- Location to build the vehicle

                    ["tyre_animations"] = {
                        ["time"] = 10 * 1000,
                        ["flag"] = 01,
                        ["animDict"] = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
                        ["animName"] = "machinic_loop_mechandplayer",
                    },
                    ["tyre_positions"] = {
                        ["wheel_lf"] = {
                            ["target"] = {
                                ["coords"] = vec3(0.5, -0.1, -0.4),
                                ["radius"] = 0.60
                            },
                            ["pedOffset"] = vec3(0.50, -0.2, 0.0),
                            ["jackOffset"] = vec3(-0.17, -0.05, -0.63),
                            ["bone"] = 24,
                            ["tyre_index"] = 0
                        },
                        ["wheel_rf"] = {
                            ["target"] = {
                                ["coords"] = vec3(-0.5, 0.25, -0.4),
                                ["radius"] = 0.60
                            },
                            ["pedOffset"] = vec3(-0.5, 0.2, 0.0),
                            ["jackOffset"] = vec3(0.17, 0.05, -0.63),
                            ["bone"] = 23,
                            ["tyre_index"] = 1
                        },
                        ["wheel_lm"] = {
                            ["target"] = {
                                ["coords"] = vec3(0.5, -0.2, -0.4),
                                ["radius"] = 0.60
                            },
                            ["pedOffset"] = vec3(0.5, -0.2, 0.0),
                            ["jackOffset"] = vec3(-0.17, 0.0, -0.63),
                            ["bone"] = 25,
                            ["tyre_index"] = 2
                        },
                        ["wheel_rm"] = {
                            ["target"] = {
                                ["coords"] = vec3(-0.5, 0.2, -0.4),
                                ["radius"] = 0.60
                            },
                            ["pedOffset"] = vec3(-0.5, 0.2, 0.0),
                            ["jackOffset"] = vec3(0.17, 0.0, -0.63),
                            ["bone"] = 22,
                            ["tyre_index"] = 3
                        },
                    },

                    ["door_animations"] = {
                        ["time"] = 10 * 1000,
                        ["flag"] = 01,
                        ["animDict"] = "mini@repair",
                        ["animName"] = "fixing_a_ped",
                    },
                    ["door_positions"] = {
                        ["dside_f"] = {
                            ["pedOffset"] = vec3(0.65, -0.3, 0.0),
                            ["target"] = {
                                ["coords"] = vec3(0.50, -0.35, 0.0),
                                ["radius"] = 0.75
                            },
                            ["door_index"] = 0
                        },
                        ["dside_r"] = {
                            ["pedOffset"] = vec3(-0.65, 0.30, 0.0),
                            ["target"] = {
                                ["coords"] = vec3(-0.50, 0.05, 0.0),
                                ["radius"] = 0.85
                            },
                            ["door_index"] = 1
                        },
                        ["bonnet"] = {
                            ["pedOffset"] = vec3(0.15, 0.40, 0.0),
                            ["target"] = {
                                ["coords"] = vec3(0.55, 1.60, 0.0),
                                ["radius"] = 0.85
                            },
                            ["door_index"] = 5
                        },
                        ["boot"] = {
                            ["pedOffset"] = vec3(-0.25, -0.80, 0.0),
                            ["target"] = {
                                ["coords"] = vec3(-0.55, -1.40, 0.0),
                                ["radius"] = 0.85
                            },
                            ["door_index"] = 4
                        },
                    },

                    ["cam_stuff"] = {
                        ["cam_pos"] = vec3(-426.17, -1698.92, 20.25),
                        ["cam_rot"] = vec3(-5.0, 0.0, -5.0),
                        ["cam_fov"] = 40.0,
                        ["hidded_ped"] = vec3(-418.00, -1698.69, 19.03),
                    }
                },
                ["vehicle_parts_store"] = {
                    ["npc"] = {
                        ["model"] = "cs_old_man2",
                        ["coords"] = vec4(1181.31, -3113.79, 5.13, 94.16),
                        ["blip"] = {
                            ["label"] = "Vehicle Component Seller",
                            ["sprite"] = 446,
                            ["color"] = 26,
                            ["scale"] = 1.0,
                        },
                    },
                    ["parts"] = {
                        ["tyre"] = {
                            ["label"] = "Vehicle Tyre - $%s",
                            ["description"] = "Vehicle component",
                            ["item_name"] = "vehicle_tyre",
                            ["price"] = 100,

                        },
                        ["door"] = {
                            ["label"] = "Vehicle Door - $%s",
                            ["description"] = "Vehicle component",
                            ["item_name"] = "vehicle_door",
                            ["price"] = 100,
                        }
                    },
                }
            },
            [3] = {
                ["project_details"] = {
                    ["reward"] = 25000,
                    ["extra_time"] = 2 * 60 * 1000,
                    ["mission_time"] = 20 * 60 * 1000 ,
                    ["split_reward_members"] = true,
                    
                    ["blips"] = {
                        ["label"] = "Project Car",
                        ["sprite"] = 524,
                        ["color"] = 26,
                        ["scale"] = 1.0,
                    },
                    ["car_model"] = "moonbeam2",
                    ["jack_model"] = "imp_prop_axel_stand_01a",
                    ["jack_coord"] = vec4(254.88, -761.46, 34.53, 339.79), -- The vehicle spawns at this coordinate.
                    ["craft_coord"] = vec3(254.88, -761.46, 34.10), -- Location to build the vehicle

                    ["tyre_animations"] = {
                        ["time"] = 10 * 1000,
                        ["flag"] = 01,
                        ["animDict"] = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
                        ["animName"] = "machinic_loop_mechandplayer",
                    },
                    ["tyre_positions"] = {
                        ["wheel_lf"] = {
                            ["target"] = {
                                ["coords"] = vec3(0.55, 1.3, -0.30),
                                ["radius"] = 0.60
                            },
                            ["pedOffset"] = vec3(-0.65, 0.25, 0.0),
                            ["jackOffset"] = vec3(0.25, 1.4, -0.55),
                            ["bone"] = 18,
                            ["tyre_index"] = 0
                        },
                        ["wheel_rf"] = {
                            ["target"] = {
                                ["coords"] = vec3(0.55, 1.3, -0.30),
                                ["radius"] = 0.60
                            },
                            ["pedOffset"] = vec3(0.65, -0.25, 0.0),
                            ["jackOffset"] = vec3(-0.25, 1.4, -0.55),
                            ["bone"] = 19,
                            ["tyre_index"] = 1
                        },
                        ["wheel_lm"] = {
                            ["target"] = {
                                ["coords"] = vec3(-0.55, -1.43, -0.30),
                                ["radius"] = 0.60
                            },
                            ["pedOffset"] = vec3(-0.65, 0.25, 0.0),
                            ["jackOffset"] = vec3(0.25, -1.55, -0.55),
                            ["bone"] = 18,
                            ["tyre_index"] = 2
                        },
                        ["wheel_rm"] = {
                            ["target"] = {
                                ["coords"] = vec3(-0.55, -1.43, -0.30),
                                ["radius"] = 0.60
                            },
                            ["pedOffset"] = vec3(0.65, -0.30, 0.0),
                            ["jackOffset"] = vec3(-0.25, -1.55, -0.55),
                            ["bone"] = 19,
                            ["tyre_index"] = 3
                        },
                    },

                    ["door_animations"] = {
                        ["time"] = 10 * 1000,
                        ["flag"] = 01,
                        ["animDict"] = "mini@repair",
                        ["animName"] = "fixing_a_ped",
                    },
                    ["door_positions"] = {
                        ["dside_f"] = {
                            ["pedOffset"] = vec3(-0.65, 0.35, 0.0),
                            ["target"] = {
                                ["coords"] = vec3(-0.50, 0.75, 0.0),
                                ["radius"] = 0.80
                            },
                            ["door_index"] = 0
                        },
                        ["dside_r"] = {
                            ["pedOffset"] = vec3(0.65, -0.35, 0.0),
                            ["target"] = {
                                ["coords"] = vec3(0.75, 0.35, 0.0),
                                ["radius"] = 0.80
                            },
                            ["door_index"] = 1
                        },
                        ["pside_f"] = {
                            ["pedOffset"] = vec3(-0.65, 0.35, 0.0),
                            ["target"] = {
                                ["coords"] = vec3(-0.95, -0.35, 0.0),
                                ["radius"] = 0.80
                            },
                            ["door_index"] = 2
                        },
                        ["pside_r"] = {
                            ["pedOffset"] = vec3(0.65, -0.35, 0.0),
                            ["target"] = {
                                ["coords"] = vec3(0.45, -0.80, 0.0),
                                ["radius"] = 0.80
                            },
                            ["door_index"] = 3
                        },
                        ["bonnet"] = {
                            ["pedOffset"] = vec3(0.15, 0.50, 0.0),
                            ["target"] = {
                                ["coords"] = vec3(0.55, 1.60, 0.0),
                                ["radius"] = 0.85
                            },
                            ["door_index"] = 4
                        },
                        ["boot"] = {
                            ["pedOffset"] = vec3(-0.25, -0.80, 0.0),
                            ["target"] = {
                                ["coords"] = vec3(-0.80, -2.20, 0.0),
                                ["radius"] = 1.25
                            },
                            ["door_index"] = 5
                        },
                    },

                    ["cam_stuff"] = {
                        ["cam_pos"] = vec3(255.09, -751.15, 36.70),
                        ["cam_rot"] = vec3(-4.0, 0.0, 180.0),
                        ["cam_fov"] = 40.0,
                        ["hidded_ped"] = vec3(254.22, -697.78, 44.69),
                    }
                },
                ["vehicle_parts_store"] = {
                    ["npc"] = {
                        ["model"] = "cs_old_man2",
                        ["coords"] = vec4(1181.31, -3113.79, 5.10, 94.16),
                        ["blip"] = {
                            ["label"] = "Vehicle Component Seller",
                            ["sprite"] = 446,
                            ["color"] = 26,
                            ["scale"] = 1.0,
                        },
                    },
                    ["parts"] = {
                        ["tyre"] = {
                            ["label"] = "Vehicle Tyre - $%s",
                            ["description"] = "Vehicle component",
                            ["item_name"] = "vehicle_tyre",
                            ["price"] = 100,

                        },
                        ["door"] = {
                            ["label"] = "Vehicle Door - $%s",
                            ["description"] = "Vehicle component",
                            ["item_name"] = "vehicle_door",
                            ["price"] = 100,
                        }
                    },
                }
            },
        },
        ["outfits"] = {
            ["male"] = {
                ['t-shirt'] = {["item"] = 15, ["texture"] = 0},
                ['torso2'] = {["item"] = 345, ["texture"] = 0},
                ['arms'] = {["item"] = 19, ["texture"] = 0},
                ['pants'] = {["item"] = 3, ["texture"] = 7},
                ['shoes'] = {["item"] = 1, ["texture"] = 0},
            },
            ["female"] = {
                ['t-shirt'] = {["item"] = 15, ["texture"] = 0},
                ['torso2'] = {["item"] = 345, ["texture"] = 0},
                ['arms'] = {["item"] = 19, ["texture"] = 0},
                ['pants'] = {["item"] = 3, ["texture"] = 7},
                ['shoes'] = {["item"] = 1, ["texture"] = 0},
            },
        },
        ["menu_informations"] = {
            ["cover"] = "https://i.ibb.co/DzMqpwv/DALL-E-2024-11-28-20-33-42-A-realistic-scene-in-the-GTA-5-world-featuring-a-character-on-a-beach-hol.webp",
            ["title"] = "Project car",
            ["description"] = "Take a vehicle parts and build the car!",
            ["recommended"] = false,
            ["steps"] = {}
        },
    },
    ["diver"] = {
        ["name"] = "Diver",
        ["debug"] = false,
        ["disabled"] = false,
        ["can_multiplayer"] = true,
        ["show_members_blips"] = true,
        ["teleport_when_mission_finished"] = false, -- If you set `true` it teleports you back to the menu when the task is finished. I recommend `false` to avoid breaking up the roles.
        ["oxygen_finish"] = 10 * 1000, -- It is the extra breathing time defined for the user to exit from underwater to the surface when any task is finished. If this time is exceeded, he will drown after a certain period of time.
        ["menu"] = {
            ["job_menu"] = vec3(-1608.98, 5261.62, 3.97),
            ["interaction_distance"] = 1.0,
            ["blips"] = {
                ["show"] = true,
                ["label"] = "Diving - Center",
                ["sprite"] = 729,
                ["color"] = 26,
                ["scale"] = 1.0,
            }
        },
        ["car_settings"] = {
            ["model"] = "avisa",
            ["spawnCoords"] = vec4(-1603.35, 5260.90, -0.33, 23.15),
        },
        ["mission_list"] = {
            [1] = {
                ["type"] = "Sea Urchin",
                ["area"] = vec3(-1608.98, 5261.62, 3.97),
                ["reward"] = 3000,
                ["title"] = "Sea Urchin Collection",
                ["timer"] = {
                    ["extra_time"] = 2 * 60 * 1000,
                    ["mission_time"] = 6 * 60 * 1000,
                    ["deducted_per_min"] = 50,
                },
                ["split_reward_members"] = true,
                ["model"] = "prop_sealife_02",
                ["blip"] = {
                    ["show"] = true,
                    ["label"] = "Urchin",
                    ["sprite"] = 501,
                    ["color"] = 32,
                    ["scale"] = 0.6,
                    ["alpha"] = 125,
                },
                ["collecting_duration"] = 10 * 1000,
                ["coords"] = {
                    [1] = vec3(-1762.63, 5316.12, -11.44),
                    [2] = vec3(-1730.89, 5317.15, -10.73),
                    [3] = vec3(-1767.14, 5298.05, -11.47),
                    [4] = vec3(-1766.42, 5246.21, -7.22),
                    [5] = vec3(-1735.25, 5247.67, -8.00),
                    [6] = vec3(-1732.86, 5315.34, -10.96),
                    [7] = vec3(-1711.47, 5288.91, -12.43),
                    [8] = vec3(-1687.00, 5330.25, -8.72),
                    [9] = vec3(-1718.22, 5351.25, -9.67),
                    [10] = vec3(-1673.32, 5363.13, -8.33),
                }
            },
            [2] = {
                ["type"] = "Coral Pillar",
                ["area"] = vec3(-1722.77, 5336.66, -10.02),
                ["reward"] = 3000,
                ["title"] = "Coral P. Collection",
                ["timer"] = {
                    ["extra_time"] = 2 * 60 * 1000,
                    ["mission_time"] = 6 * 60 * 1000,
                    ["deducted_per_min"] = 50,
                },
                ["split_reward_members"] = true,
                ["model"] = "prop_coral_pillar_01",
                ["blip"] = {
                    ["show"] = true,
                    ["label"] = "Coral P.",
                    ["sprite"] = 501,
                    ["color"] = 32,
                    ["scale"] = 0.6,
                    ["alpha"] = 125,
                },
                ["collecting_duration"] = 10 * 1000,
                ["coords"] = {
                    [1] = vec3(-1710.06, 5402.72, -7.78),
                    [2] = vec3(-1728.19, 5369.32, -7.88),
                    [3] = vec3(-1774.91, 5405.13, -9.51),
                    [4] = vec3(-1724.99, 5470.20, -8.57),
                    [5] = vec3(-1592.42, 5383.55, -8.12),
                    [6] = vec3(-1844.27, 5302.31, -13.49),
                    [7] = vec3(-1810.84, 5308.51, -12.21),
                    [8] = vec3(-1832.77, 5374.07, -10.76),
                    [9] = vec3(-1768.73, 5416.58, -8.17),
                    [10] = vec3(-1707.18, 5500.09, -11.40),
                }
            },
            [3] = {
                ["type"] = "Pink moss",
                ["area"] = vec3(-1722.77, 5336.66, -10.02),
                ["reward"] = 3000,
                ["title"] = "Pink Moss Collection",
                ["timer"] = {
                    ["extra_time"] = 2 * 60 * 1000,
                    ["mission_time"] = 6 * 60 * 1000,
                    ["deducted_per_min"] = 50,
                },
                ["split_reward_members"] = true,
                ["model"] = "prop_sealife_04",
                ["blip"] = {
                    ["show"] = true,
                    ["label"] = "Pink Moss",
                    ["sprite"] = 501,
                    ["color"] = 32,
                    ["scale"] = 0.6,
                    ["alpha"] = 125,
                },
                ["collecting_duration"] = 10 * 1000,
                ["coords"] = {
                    [1] = vec3(-1712.06, 5442.72, -7.78),
                    [2] = vec3(-1722.19, 5363.32, -7.88),
                    [3] = vec3(-1778.91, 5409.13, -9.51),
                    [4] = vec3(-1720.99, 5474.20, -8.57),
                    [5] = vec3(-1595.42, 5380.55, -8.12),
                    [6] = vec3(-1840.27, 5305.31, -13.49),
                    [7] = vec3(-1808.84, 5310.51, -12.21),
                    [8] = vec3(-1828.77, 5378.07, -10.76),
                    [9] = vec3(-1762.73, 5418.58, -8.17),
                    [10] = vec3(-1702.18, 5502.09, -11.40),
                }
            },
            [4] = {
                ["type"] = "Sea Urchin",
                ["area"] = vec3(-1703.57, 5506.07, -15.87),
                ["reward"] = 3000,
                ["title"] = "Sea Urchin Collection - 2",
                ["timer"] = {
                    ["extra_time"] = 2 * 60 * 1000,
                    ["mission_time"] = 6 * 60 * 1000,
                    ["deducted_per_min"] = 50,
                },
                ["split_reward_members"] = true,
                ["model"] = "prop_sealife_02",
                ["blip"] = {
                    ["show"] = true,
                    ["label"] = "Urchin",
                    ["sprite"] = 501,
                    ["color"] = 32,
                    ["scale"] = 0.6,
                    ["alpha"] = 125,
                },
                ["collecting_duration"] = 10 * 1000,
                ["coords"] = {
                    [1] = vec3(-1827.66, 5632.80, -66.82),
                    [2] = vec3(-1735.83, 5588.38, -101.02),
                    [3] = vec3(-1669.98, 5620.04, -111.91),
                    [4] = vec3(-1751.33, 5665.97, -100.00),
                    [5] = vec3(-1652.81, 5620.01, -63.16),
                    [6] = vec3(-1631.59, 5559.14, -24.63),
                    [7] = vec3(-1711.56, 5470.65, -9.07),
                    [8] = vec3(-1854.29, 5560.16, -21.91),
                    [9] = vec3(-1574.95, 5553.17, -21.10),
                    [10] = vec3(-1593.18, 5530.07, -18.90),
                }
            },
            [5] = {
                ["type"] = "Sea Urchin",
                ["area"] = vec3(-1804.06, 5263.82, 30.14),
                ["reward"] = 3000,
                ["title"] = "Sea Urchin Collection - 3",
                ["timer"] = {
                    ["extra_time"] = 2 * 60 * 1000,
                    ["mission_time"] = 6 * 60 * 1000,
                    ["deducted_per_min"] = 50,
                },
                ["split_reward_members"] = true,
                ["model"] = "prop_sealife_02",
                ["blip"] = {
                    ["show"] = true,
                    ["label"] = "Urchin",
                    ["sprite"] = 501,
                    ["color"] = 32,
                    ["scale"] = 0.6,
                    ["alpha"] = 125,
                },
                ["collecting_duration"] = 10 * 1000,
                ["coords"] = {
                    [1] = vec3(-1729.71, 5252.75, -8.55),
                    [2] = vec3(-1762.11, 5267.26, -7.92),
                    [3] = vec3(-1755.46, 5298.55, -12.06),
                    [4] = vec3(-1752.86, 5249.47, -7.22),
                    [5] = vec3(-1781.28, 5264.33, -10.23),
                    [6] = vec3(-1771.23, 5292.63, -11.70),
                    [7] = vec3(-1793.79, 5215.00, -8.86),
                    [8] = vec3(-1816.61, 5238.48, -12.99),
                    [9] = vec3(-1833.54, 5284.97, -12.02),
                    [10] = vec3(-1799.41, 5273.14, -11.99),
                }
            },
            [6] = {
                ["type"] = "Pink moss",
                ["area"] = vec3(-2034.92, 5264.02, 30.95),
                ["reward"] = 3000,
                ["title"] = "Pink Moss Collection - 2",
                ["timer"] = {
                    ["extra_time"] = 2 * 60 * 1000,
                    ["mission_time"] = 6 * 60 * 1000,
                    ["deducted_per_min"] = 50,
                },
                ["split_reward_members"] = true,
                ["model"] = "prop_sealife_04",
                ["blip"] = {
                    ["show"] = true,
                    ["label"] = "Pink Moss",
                    ["sprite"] = 501,
                    ["color"] = 32,
                    ["scale"] = 0.6,
                    ["alpha"] = 125,
                },
                ["collecting_duration"] = 10 * 1000,
                ["coords"] = {
                    [1] = vec3(-1944.85, 5296.04, -27.19),
                    [2] = vec3(-1959.97, 5323.37, -17.68),
                    [3] = vec3(-1949.17, 5252.15, -14.95),
                    [4] = vec3(-2010.46, 5323.28, -18.28),
                    [5] = vec3(-2031.91, 5365.06, -21.47),
                    [6] = vec3(-2068.03, 5363.54, -31.26),
                    [7] = vec3(-2081.77, 5313.25, -21.00),
                    [8] = vec3(-2113.36, 5319.01, -37.34),
                    [9] = vec3(-2099.75, 5274.22, -19.94),
                    [10] = vec3(-2121.80, 5272.68, -17.27),
                }
            },
            [7] = {
                ["type"] = "Pink moss",
                ["area"] = vec3(-1624.85, 5433.27, 30.45),
                ["reward"] = 3000,
                ["title"] = "Pink Moss Collection - 3",
                ["timer"] = {
                    ["extra_time"] = 2 * 60 * 1000,
                    ["mission_time"] = 6 * 60 * 1000,
                    ["deducted_per_min"] = 50,
                },
                ["split_reward_members"] = true,
                ["model"] = "prop_sealife_04",
                ["blip"] = {
                    ["show"] = true,
                    ["label"] = "Pink Moss",
                    ["sprite"] = 501,
                    ["color"] = 32,
                    ["scale"] = 0.6,
                    ["alpha"] = 125,
                },
                ["collecting_duration"] = 10 * 1000,
                ["coords"] = {
                    [1] = vec3(-1621.21, 5394.49, -6.34),
                    -- [2] = vec3(-1649.35, 5375.89, -8.13),
                    -- [3] = vec3(-1587.55, 5412.42, -6.82),
                    -- [4] = vec3(-1676.74, 5409.02, -7.06),
                    -- [5] = vec3(-1650.97, 5375.80, -8.16),
                    -- [6] = vec3(-1670.89, 5468.31, -6.89),
                    -- [7] = vec3(-1609.84, 5493.42, -3.52),
                    -- [8] = vec3(-1587.31, 5480.89, -4.01),
                    -- [9] = vec3(-1579.51, 5447.61, -1.84),
                    -- [10] = vec3(-1611.57, 5396.69, -7.30),
                }
            },
        },
        ["outfits"] = {
            ["male"] = {
                ['t-shirt'] = {["item"] = 15, ["texture"] = 0},
                ['torso2'] = {["item"] = 345, ["texture"] = 0},
                ['arms'] = {["item"] = 19, ["texture"] = 0},
                ['pants'] = {["item"] = 3, ["texture"] = 7},
                ['shoes'] = {["item"] = 1, ["texture"] = 0},
            },
            ["female"] = {
                ['t-shirt'] = {["item"] = 15, ["texture"] = 0},
                ['torso2'] = {["item"] = 345, ["texture"] = 0},
                ['arms'] = {["item"] = 19, ["texture"] = 0},
                ['pants'] = {["item"] = 3, ["texture"] = 7},
                ['shoes'] = {["item"] = 1, ["texture"] = 0},
            },
        },
        ["menu_informations"] = {
            ["cover"] = "",
            ["title"] = "Diver",
            ["description"] = "With Friends/Single, you can do missions and earn rewards.",
            ["recommended"] = false,
            ["steps"] = {},
        }
    },
    ["farmer"] = {
        ["name"] = "Farmer",
        ["debug"] = false,
        ["disabled"] = false,
        ["can_multiplayer"] = true,
        ["show_members_blips"] = true,
        ["menu"] = {
            ["job_menu"] = vec3(419.05, 6468.60, 28.82),
            ["interaction_distance"] = 1.0,
            ["blips"] = {
                ["show"] = true,
                ["label"] = "Farmer - Center",
                ["sprite"] = 514,
                ["color"] = 5,
                ["scale"] = 1.0,
            }
        },
        ["car_settings"] = {
            ["model"] = "tractor2",
            ["spawnCoords"] = vec4(432.59, 6465.99, 28.76, 53.80),
        },
        ["field_list"] = {
            [1] = {
                ["area"] = vec3(265.86, 6651.58, 29.89),
                ["title"] = "Wheat collection - Field Benso",
                ["reward"] = 25000,
                ["split_reward_members"] = true,
                ["models"] = {
                    ["crop"] = "prop_veg_crop_04",
                    ["collect"] = "prop_haybale_01",

                    ["collect_car_attach"] = {
                        ["bone"] = 1,
                        ["coords"] = vec3(0.0, 0.0, 0.0),
                        ["rotation"] = vec3(0.0, 0.0, 0.0),
                    },
                    ["collect_player_attach"] = {
                        ["bone"] = 60309,
                        ["coords"] = vec3(0.15, 0.05, 0.21),
                        ["rotation"] = vec3(-15.0, -80.0, -70.0),
                        
                        ["animDict"] = "anim@heists@box_carry@",
                        ["animName"] = "idle",
                    },
                }, 
                ["trailers"] = {
                    ["harvester"] = "tractor3",
                    ["harvester_coords"] = vec4(230.34, 6675.94, 28.81, 231.01),
                    ["trailer"] = "graintrailer",
                    ["trailer_coords"] = vec4(2136.79, 4775.92, 39.97, 25.01),
                },
                ["timer"] = {
                    ["extra_time"] = 6 * 60 * 1000,
                    ["mission_time"] = 25 * 60 * 1000,
                    ["deducted_per_min"] = 50,
                },
                ["coords"] = {
                    [1] = vec3(242.91, 6662.05, 30.14),
                    [2] = vec3(242.95, 6657.41, 30.01),
                    [3] = vec3(243.20, 6652.47, 29.79),

                    [4] = vec3(242.78, 6647.42, 29.75),
                    [5] = vec3(243.01, 6644.09, 29.74),
                    [6] = vec3(242.67, 6639.52, 29.79),

                    [7] = vec3(249.08, 6663.32, 30.05),
                    [8] = vec3(249.07, 6657.58, 30.05),
                    [9] = vec3(249.12, 6651.48, 29.95),

                    [10] = vec3(249.10, 6646.91, 29.98),
                    [11] = vec3(249.09, 6642.64, 29.92),
                    [12] = vec3(249.03, 6638.37, 29.83),

                    [13] = vec3(255.44, 6661.34, 30.17),
                    [14] = vec3(255.34, 6655.39, 30.04),
                    [15] = vec3(255.45, 6650.27, 30.05),

                    [16] = vec3(255.40, 6645.44, 30.02),
                    [17] = vec3(255.35, 6642.39, 30.00),
                    [18] = vec3(255.31, 6638.46, 29.81),

                    [19] = vec3(261.80, 6661.90, 30.04),
                    [20] = vec3(261.66, 6656.12, 29.87),
                    [21] = vec3(261.61, 6649.98, 29.91),
                },
                ["area_blip"] = {
                    ["show"] = true,
                    ["label"] = "Field Benso",
                    ["sprite"] = 501,
                    ["color"] = 32,
                    ["scale"] = 0.8,
                    ["alpha"] = 125,
                },
            },
            [2] = {
                ["area"] = vec3(269.97, 6612.05, 29.96),
                ["title"] = "Wheat collection - Field Norwegian",
                ["reward"] = 25000,
                ["split_reward_members"] = true,
                ["models"] = {
                    ["crop"] = "prop_veg_crop_04",
                    ["collect"] = "prop_haybale_01",

                    ["collect_car_attach"] = {
                        ["bone"] = 1,
                        ["coords"] = vec3(0.0, 0.0, 0.0),
                        ["rotation"] = vec3(0.0, 0.0, 0.0),
                    },
                    ["collect_player_attach"] = {
                        ["bone"] = 60309,
                        ["coords"] = vec3(0.15, 0.05, 0.21),
                        ["rotation"] = vec3(-15.0, -80.0, -70.0),
                        
                        ["animDict"] = "anim@heists@box_carry@",
                        ["animName"] = "idle",
                    },
                }, 
                ["trailers"] = {
                    ["harvester"] = "tractor3",
                    ["harvester_coords"] = vec4(220.73, 6622.44, 29.34, 272.59),
                    ["trailer"] = "graintrailer",
                    ["trailer_coords"] = vec4(2136.79, 4775.92, 39.97, 25.01),
                },
                ["timer"] = {
                    ["extra_time"] = 6 * 60 * 1000,
                    ["mission_time"] = 25 * 60 * 1000,
                    ["deducted_per_min"] = 50,
                },
                ["coords"] = {
                    [1] = vec3(246.88, 6626.63, 29.83),
                    [2] = vec3(246.93, 6622.80, 29.80),
                    [3] = vec3(246.90, 6617.32, 29.72),

                    [4] = vec3(246.90, 6611.85, 29.85),
                    [5] = vec3(246.85, 6605.95, 29.94),
                    [6] = vec3(246.92, 6600.52, 30.05),

                    [7] = vec3(251.14, 6626.08, 29.88),
                    [8] = vec3(251.08, 6619.03, 29.72),
                    [9] = vec3(251.09, 6612.50, 29.89),

                    [10] = vec3(251.02, 6607.87, 30.04),
                    [11] = vec3(251.06, 6602.81, 30.06),
                    [12] = vec3(251.06, 6597.74, 30.14),

                    [13] = vec3(255.29, 6598.17, 30.14),
                    [14] = vec3(255.28, 6605.21, 30.10),
                    [15] = vec3(255.31, 6611.57, 29.97),

                    [16] = vec3(255.30, 6616.69, 29.72),
                    [17] = vec3(255.38, 6620.69, 29.70),
                    [18] = vec3(255.27, 6624.54, 29.80),
                },
                ["area_blip"] = {
                    ["show"] = true,
                    ["label"] = "Field Norwegian",
                    ["sprite"] = 501,
                    ["color"] = 32,
                    ["scale"] = 0.8,
                    ["alpha"] = 125,
                },
            },
            [3] = {
                ["area"] = vec3(2191.71, 5184.11, 58.63),
                ["title"] = "Wheat collection - Field Chimbe",
                ["reward"] = 25000,
                ["split_reward_members"] = true,
                ["models"] = {
                    ["crop"] = "prop_veg_crop_04",
                    ["collect"] = "prop_haybale_01",

                    ["collect_car_attach"] = {
                        ["bone"] = 1,
                        ["coords"] = vec3(0.0, 0.0, 0.0),
                        ["rotation"] = vec3(0.0, 0.0, 0.0),
                    },
                    ["collect_player_attach"] = {
                        ["bone"] = 60309,
                        ["coords"] = vec3(0.15, 0.05, 0.21),
                        ["rotation"] = vec3(-15.0, -80.0, -70.0),
                        
                        ["animDict"] = "anim@heists@box_carry@",
                        ["animName"] = "idle",
                    },
                }, 
                ["trailers"] = {
                    ["harvester"] = "tractor3",
                    ["harvester_coords"] = vec4(2217.92, 5192.52, 61.59, 153.43),
                    ["trailer"] = "graintrailer",
                    ["trailer_coords"] = vec4(2136.79, 4775.92, 39.97, 25.01),
                },
                ["timer"] = {
                    ["extra_time"] = 2 * 60 * 1000,
                    ["mission_time"] = 25 * 60 * 1000,
                    ["deducted_per_min"] = 50,
                },
                ["coords"] = {
                    [1] = vec3(2195.53, 5162.94, 56.29),
                    [2] = vec3(2191.69, 5166.87, 56.50),
                    [3] = vec3(2187.23, 5171.70, 56.94),

                    [4] = vec3(2181.98, 5177.27, 57.45),
                    [5] = vec3(2177.75, 5181.54, 57.81),
                    [6] = vec3(2171.59, 5188.10, 58.37),

                    [7] = vec3(2166.19, 5193.84, 58.76),
                    [8] = vec3(2160.37, 5200.10, 58.97),
                    [9] = vec3(2156.19, 5204.48, 59.08),

                    [10] = vec3(2151.62, 5209.20, 59.15),
                    [11] = vec3(2156.43, 5209.87, 59.48),
                    [12] = vec3(2160.62, 5205.39, 59.37),

                    [13] = vec3(2166.50, 5199.12, 59.23),
                    [14] = vec3(2171.61, 5193.36, 59.00),
                    [15] = vec3(2177.17, 5187.28, 58.52),

                    [16] = vec3(2181.64, 5182.46, 58.14),
                    [17] = vec3(2190.85, 5172.70, 57.32),
                    [18] = vec3(2196.35, 5166.82, 56.87),

                    [19] = vec3(2203.27, 5168.05, 57.39),
                    [20] = vec3(2198.65, 5173.12, 57.74),
                    [21] = vec3(2192.66, 5179.46, 58.28),

                    [22] = vec3(2187.19, 5185.38, 58.64),
                    [23] = vec3(2180.46, 5192.56, 59.11),
                    [24] = vec3(2174.47, 5198.89, 59.57),

                    [25] = vec3(2171.07, 5202.57, 59.69),
                    [26] = vec3(2166.69, 5207.46, 59.80),
                    [27] = vec3(2174.62, 5204.94, 60.04),

                    [28] = vec3(2181.01, 5197.75, 59.55),
                    [29] = vec3(2185.45, 5193.02, 59.30),
                    [30] = vec3(2190.95, 5186.91, 58.86),
                },
                ["area_blip"] = {
                    ["show"] = true,
                    ["label"] = "Field Chimbe",
                    ["sprite"] = 501,
                    ["color"] = 32,
                    ["scale"] = 0.8,
                    ["alpha"] = 125,
                },
            },
            [4] = {
                ["area"] = vec3(2289.87, 5134.35, 51.85),
                ["title"] = "Wheat collection - Field Astro",
                ["reward"] = 25000,
                ["split_reward_members"] = true,
                ["models"] = {
                    ["crop"] = "prop_veg_crop_04",
                    ["collect"] = "prop_haybale_01",

                    ["collect_car_attach"] = {
                        ["bone"] = 1,
                        ["coords"] = vec3(0.0, 0.0, 0.0),
                        ["rotation"] = vec3(0.0, 0.0, 0.0),
                    },
                    ["collect_player_attach"] = {
                        ["bone"] = 60309,
                        ["coords"] = vec3(0.15, 0.05, 0.21),
                        ["rotation"] = vec3(-15.0, -80.0, -70.0),
                        
                        ["animDict"] = "anim@heists@box_carry@",
                        ["animName"] = "idle",
                    },
                }, 
                ["trailers"] = {
                    ["harvester"] = "tractor3",
                    ["harvester_coords"] = vec4(2255.75, 5145.63, 55.68, 227.33),
                    ["trailer"] = "graintrailer",
                    ["trailer_coords"] = vec4(2136.79, 4775.92, 39.97, 25.01),
                },
                ["timer"] = {
                    ["extra_time"] = 6 * 60 * 1000,
                    ["mission_time"] = 25 * 60 * 1000,
                    ["deducted_per_min"] = 50,
                },
                ["coords"] = {
                    [1] = vec3(2265.08, 5137.39, 54.19),
                    [2] = vec3(2267.87, 5134.81, 53.55),
                    [3] = vec3(2270.74, 5132.10, 52.85),

                    [4] = vec3(2273.55, 5129.44, 52.18),
                    [5] = vec3(2276.37, 5126.79, 51.72),
                    [6] = vec3(2279.37, 5123.96, 51.22),

                    [7] = vec3(2282.21, 5121.25, 50.76),
                    [8] = vec3(2285.11, 5118.19, 50.30),
                    [9] = vec3(2288.04, 5115.35, 49.86),

                    [10] = vec3(2290.75, 5112.73, 49.45),
                    [11] = vec3(2293.57, 5109.98, 49.05),
                    [12] = vec3(2296.40, 5107.22, 48.70),

                    [13] = vec3(2299.25, 5104.42, 48.34),
                    [14] = vec3(2301.83, 5101.88, 48.01),
                    [15] = vec3(2304.84, 5098.87, 47.72),

                    [16] = vec3(2307.21, 5096.54, 47.53),
                    [17] = vec3(2321.84, 5095.27, 46.70),
                    [18] = vec3(2319.09, 5097.93, 46.89),

                    [19] = vec3(2316.62, 5100.60, 47.14),
                    [20] = vec3(2313.88, 5103.32, 47.44),
                    [21] = vec3(2311.19, 5106.00, 47.74),

                    [22] = vec3(2307.84, 5109.33, 48.14),
                    [23] = vec3(2305.13, 5112.02, 48.51),
                    [24] = vec3(2301.74, 5115.30, 48.95),

                    [25] = vec3(2298.99, 5117.96, 49.33),
                    [26] = vec3(2296.21, 5120.67, 49.79),
                    [27] = vec3(2292.99, 5123.81, 50.32),

                    [28] = vec3(2290.24, 5126.50, 50.77),
                    [29] = vec3(2287.36, 5129.32, 51.27),
                    [30] = vec3(2284.61, 5132.01, 51.78),

                    [31] = vec3(2281.87, 5134.69, 52.28),
                    [32] = vec3(2278.89, 5137.60, 52.92),
                    [33] = vec3(2276.25, 5140.16, 53.64),

                    [34] = vec3(2272.87, 5143.46, 54.55),
                    [35] = vec3(2281.52, 5151.13, 55.32),
                    [36] = vec3(2284.20, 5148.45, 54.59),

                    [37] = vec3(2286.90, 5145.75, 53.85),
                    [38] = vec3(2290.22, 5142.43, 53.09),
                    [39] = vec3(2293.60, 5139.08, 52.38),

                },
                ["area_blip"] = {
                    ["show"] = true,
                    ["label"] = "Field Astro",
                    ["sprite"] = 501,
                    ["color"] = 32,
                    ["scale"] = 0.8,
                    ["alpha"] = 125,
                },
            },
            [5] = {
                ["area"] = vec3(2289.87, 5134.35, 51.85),
                ["title"] = "Wheat collection - Field Astro 2",
                ["reward"] = 25000,
                ["split_reward_members"] = true,
                ["models"] = {
                    ["crop"] = "prop_veg_crop_04",
                    ["collect"] = "prop_haybale_01",

                    ["collect_car_attach"] = {
                        ["bone"] = 1,
                        ["coords"] = vec3(0.0, 0.0, 0.0),
                        ["rotation"] = vec3(0.0, 0.0, 0.0),
                    },
                    ["collect_player_attach"] = {
                        ["bone"] = 60309,
                        ["coords"] = vec3(0.15, 0.05, 0.21),
                        ["rotation"] = vec3(-15.0, -80.0, -70.0),
                        
                        ["animDict"] = "anim@heists@box_carry@",
                        ["animName"] = "idle",
                    },
                }, 
                ["trailers"] = {
                    ["harvester"] = "tractor3",
                    ["harvester_coords"] = vec4(2277.43, 5169.42, 59.74, 246.79),
                    ["trailer"] = "graintrailer",
                    ["trailer_coords"] = vec4(2136.79, 4775.92, 39.97, 25.01),
                },
                ["timer"] = {
                    ["extra_time"] = 6 * 60 * 1000,
                    ["mission_time"] = 25 * 60 * 1000,
                    ["deducted_per_min"] = 50,
                },
                ["coords"] = {
                    [1] = vec3(2295.69, 5167.91, 58.20),
                    [2] = vec3(2298.40, 5165.26, 57.29),
                    [3] = vec3(2301.94, 5161.81, 56.11),

                    [4] = vec3(2304.76, 5159.06, 55.25),
                    [5] = vec3(2307.52, 5156.37, 54.47),
                    [6] = vec3(2310.90, 5153.10, 53.48),

                    [7] = vec3(2313.72, 5150.39, 52.72),
                    [8] = vec3(2316.52, 5147.67, 52.04),
                    [9] = vec3(2319.25, 5145.02, 51.37),

                    [10] = vec3(2321.97, 5142.31, 50.72),
                    [11] = vec3(2325.28, 5139.04, 50.14),
                    [12] = vec3(2328.76, 5135.62, 49.57),

                    [13] = vec3(2331.47, 5132.96, 49.14),
                    [14] = vec3(2334.13, 5130.36, 48.83),
                    [15] = vec3(2336.88, 5127.69, 48.62),

                    [16] = vec3(2339.64, 5124.99, 48.40),
                    [17] = vec3(2342.41, 5122.29, 48.26),
                    [18] = vec3(2345.01, 5119.77, 48.30),

                    [19] = vec3(2347.81, 5117.04, 48.34),
                    [20] = vec3(2340.85, 5110.33, 47.85),
                    [21] = vec3(2338.18, 5112.96, 47.84),

                    [22] = vec3(2335.47, 5115.73, 47.84),
                    [23] = vec3(2332.42, 5118.83, 48.08),
                    [24] = vec3(2329.45, 5121.59, 48.35),

                    [25] = vec3(2326.46, 5124.56, 48.63),
                    [26] = vec3(2323.58, 5127.43, 49.07),
                    [27] = vec3(2320.92, 5130.06, 49.49),

                    [28] = vec3(2318.31, 5132.65, 49.90),
                    [29] = vec3(2314.91, 5135.99, 50.51),
                    [30] = vec3(2312.12, 5138.71, 51.11),

                    [31] = vec3(2308.85, 5141.76, 51.77),
                    [32] = vec3(2305.72, 5144.81, 52.42),
                    [33] = vec3(2302.83, 5147.63, 53.14),

                    [34] = vec3(2299.24, 5151.10, 54.01),
                    [35] = vec3(2295.92, 5154.33, 54.87),
                    [36] = vec3(2293.28, 5157.00, 55.71),

                    [37] = vec3(2330.97, 5103.04, 47.18),
                    [38] = vec3(2327.72, 5106.21, 47.33),
                    [39] = vec3(2324.94, 5108.98, 47.56),

                },
                ["area_blip"] = {
                    ["show"] = true,
                    ["label"] = "Field Astro 2",
                    ["sprite"] = 501,
                    ["color"] = 32,
                    ["scale"] = 0.8,
                    ["alpha"] = 125,
                },
            },
            [6] = {
                ["area"] = vec3(2492.16, 4853.79, 36.44),
                ["title"] = "Wheat collection - Field Testo",
                ["reward"] = 25000,
                ["split_reward_members"] = true,
                ["models"] = {
                    ["crop"] = "prop_veg_crop_04",
                    ["collect"] = "prop_haybale_01",

                    ["collect_car_attach"] = {
                        ["bone"] = 1,
                        ["coords"] = vec3(0.0, 0.0, 0.0),
                        ["rotation"] = vec3(0.0, 0.0, 0.0),
                    },
                    ["collect_player_attach"] = {
                        ["bone"] = 60309,
                        ["coords"] = vec3(0.15, 0.05, 0.21),
                        ["rotation"] = vec3(-15.0, -80.0, -70.0),
                        
                        ["animDict"] = "anim@heists@box_carry@",
                        ["animName"] = "idle",
                    },
                }, 
                ["trailers"] = {
                    ["harvester"] = "tractor3",
                    ["harvester_coords"] = vec4(2521.89, 4873.02, 38.89, 137.41),
                    ["trailer"] = "graintrailer",
                    ["trailer_coords"] = vec4(2136.79, 4775.92, 39.97, 25.01),
                },
                ["timer"] = {
                    ["extra_time"] = 6 * 60 * 1000,
                    ["mission_time"] = 25 * 60 * 1000,
                    ["deducted_per_min"] = 50,
                },
                ["coords"] = {
                    [1] = vec3(2495.77, 4880.09, 39.69),
                    [2] = vec3(2499.06, 4877.04, 39.14),
                    [3] = vec3(2501.67, 4874.67, 38.80),

                    [4] = vec3(2504.50, 4872.04, 38.51),
                    [5] = vec3(2507.34, 4869.41, 38.26),
                    [6] = vec3(2510.22, 4866.78, 38.03),

                    [7] = vec3(2513.10, 4864.12, 38.04),
                    [8] = vec3(2515.78, 4861.49, 38.02),
                    [9] = vec3(2518.60, 4858.75, 37.67),

                    [10] = vec3(2514.42, 4852.76, 36.75),
                    [11] = vec3(2511.14, 4856.04, 37.27),
                    [12] = vec3(2508.43, 4858.95, 37.12),

                    [13] = vec3(2505.75, 4861.74, 37.12),
                    [14] = vec3(2503.02, 4864.48, 37.33),
                    [15] = vec3(2500.28, 4867.21, 37.53),

                    [16] = vec3(2497.56, 4869.98, 37.80),
                    [17] = vec3(2494.88, 4872.70, 38.35),
                    [18] = vec3(2492.24, 4875.39, 38.89),

                    [19] = vec3(2485.06, 4872.03, 38.58),
                    [20] = vec3(2487.20, 4869.95, 38.22),
                    [21] = vec3(2489.99, 4867.20, 37.74),

                    [22] = vec3(2492.04, 4864.92, 37.36),
                    [23] = vec3(2495.44, 4861.69, 37.04),
                    [24] = vec3(2498.24, 4858.99, 36.82),

                    [25] = vec3(2501.50, 4856.05, 36.58),
                    [26] = vec3(2504.70, 4853.02, 36.64),
                    [27] = vec3(2507.72, 4850.19, 36.55),

                    [28] = vec3(2504.23, 4843.27, 35.96),
                    [29] = vec3(2501.60, 4845.77, 36.14),
                    [30] = vec3(2498.76, 4848.67, 36.14),

                    [31] = vec3(2495.47, 4851.63, 36.24),
                    [32] = vec3(2492.59, 4854.40, 36.48),
                    [33] = vec3(2489.77, 4857.07, 36.70),

                    [34] = vec3(2486.95, 4859.72, 36.98),
                    [35] = vec3(2484.15, 4862.22, 37.39),
                    [36] = vec3(2480.89, 4865.25, 37.86),
                },
                ["area_blip"] = {
                    ["show"] = true,
                    ["label"] = "Field Testo",
                    ["sprite"] = 501,
                    ["color"] = 32,
                    ["scale"] = 0.8,
                    ["alpha"] = 125,
                },
            },
            [7] = {
                ["area"] = vec3(2535.78, 4819.92, 34.07),
                ["title"] = "Wheat collection - Field Testo",
                ["reward"] = 25000,
                ["split_reward_members"] = true,
                ["models"] = {
                    ["crop"] = "prop_veg_crop_04",
                    ["collect"] = "prop_haybale_01",

                    ["collect_car_attach"] = {
                        ["bone"] = 1,
                        ["coords"] = vec3(0.0, 0.0, 0.0),
                        ["rotation"] = vec3(0.0, 0.0, 0.0),
                    },
                    ["collect_player_attach"] = {
                        ["bone"] = 60309,
                        ["coords"] = vec3(0.15, 0.05, 0.21),
                        ["rotation"] = vec3(-15.0, -80.0, -70.0),
                        
                        ["animDict"] = "anim@heists@box_carry@",
                        ["animName"] = "idle",
                    },
                }, 
                ["trailers"] = {
                    ["harvester"] = "tractor3",
                    ["harvester_coords"] = vec4(2536.48, 4860.64, 37.55, 141.63),
                    ["trailer"] = "graintrailer",
                    ["trailer_coords"] = vec4(2136.79, 4775.92, 39.97, 25.01),
                },
                ["timer"] = {
                    ["extra_time"] = 6 * 60 * 1000,
                    ["mission_time"] = 25 * 60 * 1000,
                    ["deducted_per_min"] = 50,
                },
                ["coords"] = {
                    [1] = vec3(2531.25, 4847.08, 36.29),
                    [2] = vec3(2533.88, 4844.60, 35.88),
                    [3] = vec3(2536.73, 4841.96, 35.46),

                    [4] = vec3(2543.57, 4835.62, 34.93),
                    [5] = vec3(2546.76, 4832.68, 34.78),
                    [6] = vec3(2549.79, 4829.95, 34.71),

                    [7] = vec3(2552.68, 4827.30, 34.65),
                    [8] = vec3(2555.49, 4824.75, 34.70),
                    [9] = vec3(2558.35, 4822.08, 34.60),

                    [10] = vec3(2561.61, 4819.05, 34.42),
                    [11] = vec3(2565.01, 4815.91, 34.25),
                    [12] = vec3(2567.84, 4813.23, 34.06),

                    [13] = vec3(2570.67, 4810.57, 33.85),
                    [14] = vec3(2572.74, 4808.60, 33.69),
                    [15] = vec3(2575.44, 4806.04, 33.42),

                    [16] = vec3(2577.49, 4804.08, 33.44),
                    [17] = vec3(2580.26, 4801.47, 33.53),
                    [18] = vec3(2583.07, 4798.77, 33.71),

                    [19] = vec3(2578.88, 4794.89, 33.51),
                    [20] = vec3(2576.13, 4797.51, 33.28),
                    [21] = vec3(2572.91, 4800.55, 33.06),

                    [22] = vec3(2569.49, 4803.70, 33.00),
                    [23] = vec3(2566.63, 4806.41, 33.06),
                    [24] = vec3(2563.85, 4809.06, 33.11),

                    [25] = vec3(2561.02, 4811.68, 33.27),
                    [26] = vec3(2558.10, 4814.27, 33.51),
                    [27] = vec3(2554.86, 4817.23, 33.80),

                    [28] = vec3(2551.52, 4820.31, 34.04),
                    [29] = vec3(2548.63, 4823.08, 34.11),
                    [30] = vec3(2545.91, 4825.60, 34.17),

                    [31] = vec3(2542.45, 4828.63, 34.27),
                    [32] = vec3(2539.63, 4831.29, 34.48),
                    [33] = vec3(2536.95, 4833.86, 34.71),

                    [34] = vec3(2534.06, 4836.49, 34.95),
                    [35] = vec3(2531.14, 4839.13, 35.29),
                    [36] = vec3(2529.00, 4841.06, 35.59),

                    [37] = vec3(2521.18, 4839.51, 35.61),
                    [38] = vec3(2523.96, 4836.84, 35.27),
                    [39] = vec3(2526.84, 4834.15, 34.93),

                    [40] = vec3(2529.63, 4831.49, 34.66),
                    [41] = vec3(2532.49, 4828.85, 34.47),
                    [42] = vec3(2535.67, 4825.83, 34.26),

                    [43] = vec3(2538.51, 4823.05, 34.09),
                    [44] = vec3(2541.44, 4820.42, 33.92),
                    [45] = vec3(2544.34, 4817.77, 33.76),

                    [46] = vec3(2547.51, 4815.00, 33.58),
                    [47] = vec3(2550.88, 4811.77, 33.42),
                    [48] = vec3(2554.46, 4808.49, 33.25),

                    [49] = vec3(2557.80, 4805.36, 33.08),
                    [50] = vec3(2560.70, 4802.67, 33.01),
                    [51] = vec3(2563.61, 4800.02, 32.94),
                },
                ["area_blip"] = {
                    ["show"] = true,
                    ["label"] = "Field Testo",
                    ["sprite"] = 501,
                    ["color"] = 32,
                    ["scale"] = 0.8,
                    ["alpha"] = 125,
                },
            },
            [8] = {
                ["area"] = vec3(1865.17, 4819.22, 45.02),
                ["title"] = "Wheat collection - Field Spice",
                ["reward"] = 25000,
                ["split_reward_members"] = true,
                ["models"] = {
                    ["crop"] = "prop_veg_crop_04",
                    ["collect"] = "prop_haybale_01",

                    ["collect_car_attach"] = {
                        ["bone"] = 1,
                        ["coords"] = vec3(0.0, 0.0, 0.0),
                        ["rotation"] = vec3(0.0, 0.0, 0.0),
                    },
                    ["collect_player_attach"] = {
                        ["bone"] = 60309,
                        ["coords"] = vec3(0.15, 0.05, 0.21),
                        ["rotation"] = vec3(-15.0, -80.0, -70.0),
                        
                        ["animDict"] = "anim@heists@box_carry@",
                        ["animName"] = "idle",
                    },
                }, 
                ["trailers"] = {
                    ["harvester"] = "tractor3",
                    ["harvester_coords"] = vec4(1891.90, 4822.28, 45.95, 134.66),
                    ["trailer"] = "graintrailer",
                    ["trailer_coords"] = vec4(2136.79, 4775.92, 39.97, 25.01),
                },
                ["timer"] = {
                    ["extra_time"] = 6 * 60 * 1000,
                    ["mission_time"] = 25 * 60 * 1000,
                    ["deducted_per_min"] = 50,
                },
                ["coords"] = {
                    [1] = vec3(1838.45, 4810.62, 44.05),
                    [2] = vec3(1841.18, 4813.32, 44.20),
                    [3] = vec3(1844.35, 4816.44, 44.44),

                    [4] = vec3(1847.64, 4819.60, 44.64),
                    [5] = vec3(1851.06, 4822.88, 44.80),
                    [6] = vec3(1854.34, 4826.00, 44.91),

                    [7] = vec3(1857.22, 4828.83, 44.93),
                    [8] = vec3(1860.40, 4831.89, 44.92),
                    [9] = vec3(1863.62, 4835.22, 44.90),

                    [10] = vec3(1866.45, 4838.07, 44.86),
                    [11] = vec3(1869.09, 4840.73, 44.83),
                    [12] = vec3(1872.81, 4838.23, 44.81),

                    [13] = vec3(1869.63, 4834.94, 44.84),
                    [14] = vec3(1866.48, 4831.89, 44.94),
                    [15] = vec3(1863.69, 4829.30, 44.92),

                    [16] = vec3(1860.84, 4826.71, 44.89),
                    [17] = vec3(1858.20, 4824.04, 44.86),
                    [18] = vec3(1854.76, 4821.07, 44.79),

                    [19] = vec3(1851.40, 4817.90, 44.64),
                    [20] = vec3(1848.36, 4815.11, 44.47),
                    [21] = vec3(1845.67, 4812.38, 44.24),

                    [22] = vec3(1843.20, 4809.70, 44.08),
                    [23] = vec3(1840.58, 4807.03, 43.89),
                    [24] = vec3(1844.95, 4800.90, 43.74),

                    [25] = vec3(1847.59, 4803.35, 43.88),
                    [26] = vec3(1850.86, 4806.39, 44.12),
                    [27] = vec3(1853.86, 4809.19, 44.34),

                    [28] = vec3(1856.61, 4811.82, 44.56),
                    [29] = vec3(1859.76, 4814.82, 44.81),
                    [30] = vec3(1863.12, 4818.10, 45.02),

                    [31] = vec3(1866.17, 4821.23, 45.07),
                    [32] = vec3(1868.83, 4823.98, 45.14),
                    [33] = vec3(1871.46, 4826.82, 45.21),

                    [34] = vec3(1874.08, 4829.59, 45.19),
                    [35] = vec3(1876.73, 4832.34, 45.21),
                    [36] = vec3(1882.83, 4827.20, 45.47),

                    [37] = vec3(1880.12, 4824.54, 45.45),
                    [38] = vec3(1877.34, 4821.80, 45.42),
                    [39] = vec3(1874.23, 4818.61, 45.23),
                },
                ["area_blip"] = {
                    ["show"] = true,
                    ["label"] = "Field Spice",
                    ["sprite"] = 501,
                    ["color"] = 32,
                    ["scale"] = 0.8,
                    ["alpha"] = 125,
                },
            },
            [9] = {
                ["area"] = vec3(1886.06, 4793.63, 44.53),
                ["title"] = "Wheat collection - Field Spice",
                ["reward"] = 25000,
                ["split_reward_members"] = true,
                ["models"] = {
                    ["crop"] = "prop_veg_crop_04",
                    ["collect"] = "prop_haybale_01",

                    ["collect_car_attach"] = {
                        ["bone"] = 1,
                        ["coords"] = vec3(0.0, 0.0, 0.0),
                        ["rotation"] = vec3(0.0, 0.0, 0.0),
                    },
                    ["collect_player_attach"] = {
                        ["bone"] = 60309,
                        ["coords"] = vec3(0.15, 0.05, 0.21),
                        ["rotation"] = vec3(-15.0, -80.0, -70.0),
                        
                        ["animDict"] = "anim@heists@box_carry@",
                        ["animName"] = "idle",
                    },
                }, 
                ["trailers"] = {
                    ["harvester"] = "tractor3",
                    ["harvester_coords"] = vec4(1866.88, 4797.61, 44.16, 314.02),
                    ["trailer"] = "graintrailer",
                    ["trailer_coords"] = vec4(2136.79, 4775.92, 39.97, 25.01),
                },
                ["timer"] = {
                    ["extra_time"] = 6 * 60 * 1000,
                    ["mission_time"] = 25 * 60 * 1000,
                    ["deducted_per_min"] = 50,
                },
                ["coords"] = {
                    [1] = vec3(1864.32, 4783.57, 42.32),
                    [2] = vec3(1867.01, 4786.29, 42.89),
                    [3] = vec3(1869.68, 4788.87, 43.43),

                    [4] = vec3(1872.53, 4791.60, 43.82),
                    [5] = vec3(1875.32, 4794.23, 44.11),
                    [6] = vec3(1878.07, 4796.76, 44.38),

                    [7] = vec3(1880.84, 4799.29, 44.60),
                    [8] = vec3(1883.70, 4801.90, 44.82),
                    [9] = vec3(1886.55, 4804.49, 45.04),

                    [10] = vec3(1889.42, 4807.14, 45.23),
                    [11] = vec3(1892.30, 4809.84, 45.37),
                    [12] = vec3(1895.14, 4812.50, 45.46),

                    [13] = vec3(1900.11, 4807.36, 45.16),
                    [14] = vec3(1897.39, 4804.81, 45.10),
                    [15] = vec3(1894.56, 4802.22, 45.00),

                    [16] = vec3(1891.72, 4799.62, 44.84),
                    [17] = vec3(1888.44, 4796.63, 44.63),
                    [18] = vec3(1886.05, 4794.44, 44.47),

                    [19] = vec3(1882.92, 4791.50, 44.16),
                    [20] = vec3(1879.81, 4788.60, 43.88),
                    [21] = vec3(1877.77, 4786.60, 43.68),

                    [22] = vec3(1874.80, 4783.78, 43.37),
                    [23] = vec3(1871.76, 4780.85, 42.67),
                    [24] = vec3(1868.83, 4778.08, 42.04),

                    [25] = vec3(1874.38, 4771.60, 41.73),
                    [26] = vec3(1876.98, 4774.18, 42.27),
                    [27] = vec3(1879.72, 4776.81, 42.79),

                    [28] = vec3(1882.44, 4779.34, 43.28),
                    [29] = vec3(1885.25, 4781.96, 43.71),
                    [30] = vec3(1888.35, 4785.00, 43.97),

                    [31] = vec3(1890.55, 4787.06, 44.08),
                    [32] = vec3(1892.82, 4790.08, 44.29),
                    [33] = vec3(1894.97, 4791.93, 44.37),

                    [34] = vec3(1897.83, 4794.42, 44.47),
                    [35] = vec3(1900.69, 4796.97, 44.57),
                    [36] = vec3(1903.47, 4799.63, 44.65),

                    [37] = vec3(1905.92, 4801.97, 44.68),
                    [38] = vec3(1908.60, 4804.50, 44.69),
                    [39] = vec3(1911.99, 4799.03, 44.41),
                },
                ["area_blip"] = {
                    ["show"] = true,
                    ["label"] = "Field Spice",
                    ["sprite"] = 501,
                    ["color"] = 32,
                    ["scale"] = 0.8,
                    ["alpha"] = 125,
                },
            },
            [10] = {
                ["area"] = vec3(1886.06, 4793.63, 44.53),
                ["title"] = "Wheat collection - Field Zenti",
                ["reward"] = 25000,
                ["split_reward_members"] = true,
                ["models"] = {
                    ["crop"] = "prop_veg_crop_04",
                    ["collect"] = "prop_haybale_01",

                    ["collect_car_attach"] = {
                        ["bone"] = 1,
                        ["coords"] = vec3(0.0, 0.0, 0.0),
                        ["rotation"] = vec3(0.0, 0.0, 0.0),
                    },
                    ["collect_player_attach"] = {
                        ["bone"] = 60309,
                        ["coords"] = vec3(0.15, 0.05, 0.21),
                        ["rotation"] = vec3(-15.0, -80.0, -70.0),
                        
                        ["animDict"] = "anim@heists@box_carry@",
                        ["animName"] = "idle",
                    },
                }, 
                ["trailers"] = {
                    ["harvester"] = "tractor3",
                    ["harvester_coords"] = vec4(1959.80, 4815.22, 43.69, 184.93),
                    ["trailer"] = "graintrailer",
                    ["trailer_coords"] = vec4(2136.79, 4775.92, 39.97, 25.01),
                },
                ["timer"] = {
                    ["extra_time"] = 6 * 60 * 1000,
                    ["mission_time"] = 25 * 60 * 1000,
                    ["deducted_per_min"] = 50,
                },
                ["coords"] = {
                    [1] = vec3(1975.09, 4802.98, 42.87),
                    [2] = vec3(1972.40, 4800.39, 42.91),
                    [3] = vec3(1969.65, 4797.74, 42.98),

                    [4] = vec3(1966.54, 4794.76, 43.05),
                    [5] = vec3(1963.08, 4791.53, 43.06),
                    [6] = vec3(1959.77, 4788.43, 43.08),

                    [7] = vec3(1956.78, 4785.51, 43.15),
                    [8] = vec3(1954.05, 4782.73, 43.19),
                    [9] = vec3(1951.06, 4779.67, 43.07),

                    [10] = vec3(1948.23, 4776.67, 42.94),
                    [11] = vec3(1941.55, 4783.87, 43.28),
                    [12] = vec3(1944.10, 4786.36, 43.31),

                    [13] = vec3(1946.97, 4789.02, 43.40),
                    [14] = vec3(1949.73, 4791.65, 43.43),
                    [15] = vec3(1952.59, 4794.35, 43.47),

                    [16] = vec3(1955.32, 4796.92, 43.50),
                    [17] = vec3(1958.05, 4799.59, 43.50),
                    [18] = vec3(1960.74, 4802.34, 43.45),

                    [19] = vec3(1963.48, 4805.05, 43.37),
                    [20] = vec3(1966.25, 4807.75, 43.30),
                    [21] = vec3(1969.02, 4810.47, 43.24),

                    [22] = vec3(1962.11, 4818.09, 43.78),
                    [23] = vec3(1959.51, 4815.55, 43.77),
                    [24] = vec3(1956.66, 4812.76, 43.83),

                    [25] = vec3(1953.94, 4810.11, 43.91),
                    [26] = vec3(1951.09, 4807.28, 43.97),
                    [27] = vec3(1948.30, 4804.61, 44.00),

                    [28] = vec3(1945.46, 4801.94, 43.98),
                    [29] = vec3(1942.65, 4799.22, 43.85),
                    [30] = vec3(1939.47, 4796.21, 43.70),
                },
                ["area_blip"] = {
                    ["show"] = true,
                    ["label"] = "Field Zenti",
                    ["sprite"] = 501,
                    ["color"] = 32,
                    ["scale"] = 0.8,
                    ["alpha"] = 125,
                },
            },
        },
        ["attach_coords"] = {
            [1] = vec3(-0.65, -0.35, -0.65),
            [2] = vec3(0.0, -0.35, -0.65),
            [3] = vec3(0.65, -0.35, -0.65),
            [4] = vec3(-0.65, 0.70, -0.65),
            [5] = vec3(0.0, 0.70, -0.65),
            [6] = vec3(0.65, 0.70, -0.65),
            [7] = vec3(-0.65, 1.75, -0.65),
            [8] = vec3(0.0, 1.75, -0.65),
            [9] = vec3(0.65, 1.75, -0.65),
            [10] = vec3(-0.65, 2.80, -0.65),
            [11] = vec3(0.0, 2.80, -0.65),
            [12] = vec3(0.65, 2.80, -0.65),
            [13] = vec3(-0.65, -0.35, -0.25),
            [14] = vec3(0.0, -0.35, -0.25),
            [15] = vec3(0.65, -0.35, -0.25),
            [16] = vec3(-0.65, 0.70, -0.25),
            [17] = vec3(0.0, 0.70, -0.25),
            [18] = vec3(0.65, 0.70, -0.25),
            [19] = vec3(-0.65, 1.75, -0.25),
            [20] = vec3(0.0, 1.75, -0.25),
            [21] = vec3(0.65, 1.75, -0.25),
            [22] = vec3(-0.65, 2.80, -0.25),
            [23] = vec3(0.0, 2.80, -0.25),
            [24] = vec3(0.65, 2.80, -0.25),
        },
        ["outfits"] = {
            ["male"] = {
                ['t-shirt'] = {["item"] = 15, ["texture"] = 0},
                ['torso2'] = {["item"] = 345, ["texture"] = 0},
                ['arms'] = {["item"] = 19, ["texture"] = 0},
                ['pants'] = {["item"] = 3, ["texture"] = 7},
                ['shoes'] = {["item"] = 1, ["texture"] = 0},
            },
            ["female"] = {
                ['t-shirt'] = {["item"] = 15, ["texture"] = 0},
                ['torso2'] = {["item"] = 345, ["texture"] = 0},
                ['arms'] = {["item"] = 19, ["texture"] = 0},
                ['pants'] = {["item"] = 3, ["texture"] = 7},
                ['shoes'] = {["item"] = 1, ["texture"] = 0},
            },
        },
        ["menu_informations"] = {
            ["cover"] = "",
            ["title"] = "Farmer",
            ["description"] = "Complete the tasks in the field. Earn money with your friends or alone.",
            ["recommended"] = true,
            ["steps"] = {},
        }
    },
    ["electrician"] = {
        ["name"] = "Electrician",
        ["debug"] = false,
        ["disabled"] = false,
        ["can_multiplayer"] = true,
        ["show_members_blips"] = true,
        ["bucket_sync_cooldown"] = 5 * 1000,
        ["bucket_ped_positions"] = {
            ["bone"] = "bucket",
            ["coords"] = vec3(0.0, -0.35, 0.50),
            ["rotation"] = vec3(0.0, 0.0, 0.0),
        },
        ["menu"] = {
            ["job_menu"] = vec3(678.53, 73.97, 83.16),
            ["interaction_distance"] = 1.0,
            ["blips"] = {
                ["show"] = true,
                ["label"] = "Electrician - Center",
                ["sprite"] = 354,
                ["color"] = 3,
                ["scale"] = 1.0,
            }
        },
        ["car_settings"] = {
            ["model"] = "utillitruck4",
            ["spawnCoords"] = vec4(682.74, 57.16, 82.33, 243.16),
        },
        ["mission_list"] = {
            [1] = {
                ["title"] = "South Side Maintenance",
                ["reward"] = 20000,
                ["split_reward_members"] = true,
                ["timer"] = {
                    ["extra_time"] = 4 * 60 * 1000,
                    ["mission_time"] = 15 * 60 * 1000,
                    ["deducted_per_min"] = 50,
                },
                ["location_blip"] = {
                    ["show"] = true,
                    ["label"] = "Maintenance point",
                    ["sprite"] = 566,
                    ["color"] = 36,
                    ["scale"] = 0.8,
                    ["alpha"] = 125,
                },
                ["animation"] = {
                    ["duration"] = -1,
                    ["flag"] = 51,
                    ["dict"] = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
                    ["name"] = "machinic_loop_mechandplayer",
                },
                ["maintenance_locations"] = {
                    [1] = {
                        ["type"] = "FuseReplace",
                        ["coords"] = vec4(-115.04, -1552.53, 33.50, 147.83),
                        ["radius"] = 1.5,
                        ["ptfx"] = {
                            ["class"] = "core",
                            ["scale"] = 0.75,
                            ["effect"] = "ent_ray_prologue_elec_crackle",
                            ["coords"] = vec3(-115.04, -1552.80, 33.97)
                        },
                    },
                    -- [2] = {
                    --     ["type"] = "FixCables",
                    --     ["coords"] = vec4(-76.69, -1643.62, 40.28, 43.47),
                    --     ["radius"] = 1.5,
                    --     ["ptfx"] = {
                    --         ["class"] = "core",
                    --         ["scale"] = 0.75,
                    --         ["effect"] = "ent_ray_prologue_elec_crackle",
                    --         ["coords"] = vec3(-76.69, -1643.62, 39.88)
                    --     },
                    -- },
                    [2] = {
                        ["type"] = "FuseReplace",
                        ["coords"] = vec4(-71.53, -1802.25, 27.77, 321.70),
                        ["radius"] = 1.5,
                        ["ptfx"] = {
                            ["class"] = "core",
                            ["scale"] = 0.75,
                            ["effect"] = "ent_ray_prologue_elec_crackle",
                            ["coords"] = vec3(-71.53, -1802.25, 27.77)
                        },
                    },
                    [3] = {
                        ["type"] = "FuseReplace",
                        ["coords"] = vec4(74.78, -1896.43, 21.73, 233.95),
                        ["radius"] = 1.5,
                        ["ptfx"] = {
                            ["class"] = "core",
                            ["scale"] = 0.75,
                            ["effect"] = "ent_ray_prologue_elec_crackle",
                            ["coords"] = vec3(74.78, -1896.43, 21.73)
                        },
                    },
                    -- [2] = {
                    --     ["type"] = "ConnectCables",
                    --     ["coords"] = vec4(259.35, -1702.48, 40.87, 196.89),
                    --     ["radius"] = 1.5,
                    --     ["ptfx"] = {
                    --         ["class"] = "core",
                    --         ["scale"] = 0.75,
                    --         ["effect"] = "ent_ray_prologue_elec_crackle",
                    --         ["coords"] = vec3(259.35, -1702.48, 40.87)
                    --     },
                    -- },
                    [4] = {
                        ["type"] = "FixCables",
                        ["coords"] = vec4(29.53, -1468.53, 30.14, 327.88),
                        ["radius"] = 1.5,
                        ["ptfx"] = {
                            ["class"] = "core",
                            ["scale"] = 0.75,
                            ["effect"] = "ent_ray_prologue_elec_crackle",
                            ["coords"] = vec3(29.98, -1468.60, 30.02)
                        },
                    },
                    -- [7] = {
                    --     ["type"] = "FuseReplace",
                    --     ["coords"] = vec4(-31.10, -1458.35, 40.71, 97.88),
                    --     ["radius"] = 1.5,
                    --     ["ptfx"] = {
                    --         ["class"] = "core",
                    --         ["scale"] = 0.75,
                    --         ["effect"] = "ent_ray_prologue_elec_crackle",
                    --         ["coords"] = vec3(-31.10, -1458.35, 40.71)
                    --     },
                    -- },
                    [4] = {
                        ["type"] = "FixCables",
                        ["coords"] = vec4(-77.85, -1469.08, 31.99, 49.78),
                        ["radius"] = 1.5,
                        ["ptfx"] = {
                            ["class"] = "core",
                            ["scale"] = 0.75,
                            ["effect"] = "ent_ray_prologue_elec_crackle",
                            ["coords"] = vec3(-77.85, -1469.08, 31.99)
                        },
                    },
                    [5] = {
                        ["type"] = "FuseReplace",
                        ["coords"] = vec4(-126.48, -1501.85, 34.09, 54.28),
                        ["radius"] = 1.5,
                        ["ptfx"] = {
                            ["class"] = "core",
                            ["scale"] = 0.75,
                            ["effect"] = "ent_ray_prologue_elec_crackle",
                            ["coords"] = vec3(-126.48, -1501.85, 34.09)
                        },
                    },
                }
            },
            [2] = {
                ["title"] = "Mission Raw Maintenance",
                ["reward"] = 20000,
                ["split_reward_members"] = true,
                ["timer"] = {
                    ["extra_time"] = 4 * 60 * 1000,
                    ["mission_time"] = 10 * 60 * 1000,
                    ["deducted_per_min"] = 50,
                },
                ["location_blip"] = {
                    ["show"] = true,
                    ["label"] = "Maintenance point",
                    ["sprite"] = 566,
                    ["color"] = 36,
                    ["scale"] = 0.8,
                    ["alpha"] = 125,
                },
                ["animation"] = {
                    ["duration"] = -1,
                    ["flag"] = 51,
                    ["dict"] = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
                    ["name"] = "machinic_loop_mechandplayer",
                },
                ["maintenance_locations"] = {
                    -- [1] = {
                    --     ["type"] = "FixCables",
                    --     ["coords"] = vec4(409.77, -934.92, 37.69, 269.56),
                    --     ["radius"] = 1.5,
                    --     ["ptfx"] = {
                    --         ["class"] = "core",
                    --         ["scale"] = 0.75,
                    --         ["effect"] = "ent_ray_prologue_elec_crackle",
                    --         ["coords"] = vec3(409.77, -934.92, 37.69)
                    --     },
                    -- },
                    [1] = {
                        ["type"] = "FuseReplace",
                        ["coords"] = vec4(407.34, -968.06, 29.48, 91.28),
                        ["radius"] = 1.5,
                        ["ptfx"] = {
                            ["class"] = "core",
                            ["scale"] = 0.75,
                            ["effect"] = "ent_ray_prologue_elec_crackle",
                            ["coords"] = vec3(407.34, -968.06, 29.48)
                        },
                    },
                    [2] = {
                        ["type"] = "ConnectCables",
                        ["coords"] = vec4(387.11, -1007.87, 29.04, 94.57),
                        ["radius"] = 1.5,
                        ["ptfx"] = {
                            ["class"] = "core",
                            ["scale"] = 0.75,
                            ["effect"] = "ent_ray_prologue_elec_crackle",
                            ["coords"] = vec3(387.11, -1007.87, 29.04)
                        },
                    },
                    [3] = {
                        ["type"] = "FuseReplace",
                        ["coords"] = vec4(420.11, -1124.87, 29.03, 178.61),
                        ["radius"] = 1.5,
                        ["ptfx"] = {
                            ["class"] = "core",
                            ["scale"] = 0.75,
                            ["effect"] = "ent_ray_prologue_elec_crackle",
                            ["coords"] = vec3(420.11, -1124.87, 29.03)
                        },
                    },
                    [4] = {
                        ["type"] = "FixCables",
                        ["coords"] = vec4(493.51, -1117.37, 29.08, 275.45),
                        ["radius"] = 1.5,
                        ["ptfx"] = {
                            ["class"] = "core",
                            ["scale"] = 0.75,
                            ["effect"] = "ent_ray_prologue_elec_crackle",
                            ["coords"] = vec3(493.51, -1117.37, 29.08)
                        },
                    },
                    [5] = {
                        ["type"] = "FixCables",
                        ["coords"] = vec4(488.94, -1010.39, 27.87, 94.15),
                        ["radius"] = 1.5,
                        ["ptfx"] = {
                            ["class"] = "core",
                            ["scale"] = 0.75,
                            ["effect"] = "ent_ray_prologue_elec_crackle",
                            ["coords"] = vec3(488.94, -1010.39, 27.87)
                        },
                    },
                    -- [6] = {
                    --     ["type"] = "FixCables",
                    --     ["coords"] = vec4(513.49, -714.66, 35.63, 356.98),
                    --     ["radius"] = 1.5,
                    --     ["ptfx"] = {
                    --         ["class"] = "core",
                    --         ["scale"] = 0.75,
                    --         ["effect"] = "ent_ray_prologue_elec_crackle",
                    --         ["coords"] = vec3(513.49, -714.66, 35.63)
                    --     },
                    -- },
                    -- [6] = {
                    --     ["type"] = "ConnectCables",
                    --     ["coords"] = vec4(491.10, -691.80, 34.58, 33.23),
                    --     ["radius"] = 1.5,
                    --     ["ptfx"] = {
                    --         ["class"] = "core",
                    --         ["scale"] = 0.75,
                    --         ["effect"] = "ent_ray_prologue_elec_crackle",
                    --         ["coords"] = vec3(491.10, -691.80, 34.58)
                    --     },
                    -- },
                    [6] = {
                        ["type"] = "FuseReplace",
                        ["coords"] = vec4(444.22, -661.75, 28.50, 353.300),
                        ["radius"] = 1.5,
                        ["ptfx"] = {
                            ["class"] = "core",
                            ["scale"] = 0.75,
                            ["effect"] = "ent_ray_prologue_elec_crackle",
                            ["coords"] = vec3(444.22, -661.75, 28.50)
                        },
                    },
                }
            },
            [3] = {
                ["title"] = "Mirror Park Maintenance",
                ["reward"] = 20000,
                ["split_reward_members"] = true,
                ["timer"] = {
                    ["extra_time"] = 4 * 60 * 1000,
                    ["mission_time"] = 10 * 60 * 1000,
                    ["deducted_per_min"] = 50,
                },
                ["location_blip"] = {
                    ["show"] = true,
                    ["label"] = "Maintenance point",
                    ["sprite"] = 566,
                    ["color"] = 36,
                    ["scale"] = 0.8,
                    ["alpha"] = 125,
                },
                ["animation"] = {
                    ["duration"] = -1,
                    ["flag"] = 51,
                    ["dict"] = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
                    ["name"] = "machinic_loop_mechandplayer",
                },
                ["maintenance_locations"] = {
                    [1] = {
                        ["type"] = "FixCables",
                        ["coords"] = vec4(955.12, -313.42, 67.00, 52.95),
                        ["radius"] = 1.5,
                        ["ptfx"] = {
                            ["class"] = "core",
                            ["scale"] = 0.75,
                            ["effect"] = "ent_ray_prologue_elec_crackle",
                            ["coords"] = vec3(955.12, -313.42, 67.00)
                        },
                    },
                    -- [2] = {
                    --     ["type"] = "ConnectCables",
                    --     ["coords"] = vec4(1027.73, -448.10, 76.35, 187.52),
                    --     ["radius"] = 1.5,
                    --     ["ptfx"] = {
                    --         ["class"] = "core",
                    --         ["scale"] = 0.75,
                    --         ["effect"] = "ent_ray_prologue_elec_crackle",
                    --         ["coords"] = vec3(1027.73, -448.10, 76.35)
                    --     },
                    -- },
                    -- [2] = {
                    --     ["type"] = "ConnectCables",
                    --     ["coords"] = vec4(963.88, -493.17, 72.90, 165.15),
                    --     ["radius"] = 1.5,
                    --     ["ptfx"] = {
                    --         ["class"] = "core",
                    --         ["scale"] = 0.75,
                    --         ["effect"] = "ent_ray_prologue_elec_crackle",
                    --         ["coords"] = vec3(963.88, -493.17, 72.90)
                    --     },
                    -- },
                    -- [2] = {
                    --     ["type"] = "ConnectCables",
                    --     ["coords"] = vec4(882.51, -536.50, 69.08, 179.73),
                    --     ["radius"] = 1.5,
                    --     ["ptfx"] = {
                    --         ["class"] = "core",
                    --         ["scale"] = 0.75,
                    --         ["effect"] = "ent_ray_prologue_elec_crackle",
                    --         ["coords"] = vec3(882.51, -536.50, 69.08)
                    --     },
                    -- },
                    [2] = {
                        ["type"] = "FuseReplace",
                        ["coords"] = vec4(1334.24, -570.13, 73.59, 159.82),
                        ["radius"] = 1.5,
                        ["ptfx"] = {
                            ["class"] = "core",
                            ["scale"] = 0.75,
                            ["effect"] = "ent_ray_prologue_elec_crackle",
                            ["coords"] = vec3(1334.24, -570.13, 73.59)
                        },
                    },
                    [3] = {
                        ["type"] = "FuseReplace",
                        ["coords"] = vec4(1373.47, -568.62, 74.10, 319.93),
                        ["radius"] = 1.5,
                        ["ptfx"] = {
                            ["class"] = "core",
                            ["scale"] = 0.75,
                            ["effect"] = "ent_ray_prologue_elec_crackle",
                            ["coords"] = vec3(1373.47, -568.62, 74.10)
                        },
                    },
                    -- [5] = {
                    --     ["type"] = "FixCables",
                    --     ["coords"] = vec4(1277.97, -531.95, 79.91, 347.183),
                    --     ["radius"] = 1.5,
                    --     ["ptfx"] = {
                    --         ["class"] = "core",
                    --         ["scale"] = 0.75,
                    --         ["effect"] = "ent_ray_prologue_elec_crackle",
                    --         ["coords"] = vec3(1277.97, -531.95, 79.91)
                    --     },
                    -- },
                    [4] = {
                        ["type"] = "FuseReplace",
                        ["coords"] = vec4(1114.94, -335.05, 66.65, 302.200),
                        ["radius"] = 1.5,
                        ["ptfx"] = {
                            ["class"] = "core",
                            ["scale"] = 0.75,
                            ["effect"] = "ent_ray_prologue_elec_crackle",
                            ["coords"] = vec3(1114.94, -335.05, 66.65)
                        },
                    },
                }
            },
            [4] = {
                ["title"] = "Textile City Maintenance",
                ["reward"] = 20000,
                ["split_reward_members"] = true,
                ["timer"] = {
                    ["extra_time"] = 4 * 60 * 1000,
                    ["mission_time"] = 8 * 60 * 1000,
                    ["deducted_per_min"] = 50,
                },
                ["location_blip"] = {
                    ["show"] = true,
                    ["label"] = "Maintenance point",
                    ["sprite"] = 566,
                    ["color"] = 36,
                    ["scale"] = 0.8,
                    ["alpha"] = 125,
                },
                ["animation"] = {
                    ["duration"] = -1,
                    ["flag"] = 51,
                    ["dict"] = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
                    ["name"] = "machinic_loop_mechandplayer",
                },
                ["maintenance_locations"] = {
                    [1] = {
                        ["type"] = "FuseReplace",
                        ["coords"] = vec4(934.33, -1774.40, 30.81, 358.93),
                        ["radius"] = 1.5,
                        ["ptfx"] = {
                            ["class"] = "core",
                            ["scale"] = 0.75,
                            ["effect"] = "ent_ray_prologue_elec_crackle",
                            ["coords"] = vec3(934.33, -1774.40, 30.81)
                        },
                    },
                    -- [1] = {
                    --     ["type"] = "FixCables",
                    --     ["coords"] = vec4(944.22, -1781.76, 41.74, 166.57),
                    --     ["radius"] = 1.5,
                    --     ["ptfx"] = {
                    --         ["class"] = "core",
                    --         ["scale"] = 0.75,
                    --         ["effect"] = "ent_ray_prologue_elec_crackle",
                    --         ["coords"] = vec3(944.22, -1781.76, 41.74)
                    --     },
                    -- },
                    [2] = {
                        ["type"] = "FuseReplace",
                        ["coords"] = vec4(948.19, -1798.76, 30.86, 270.631),
                        ["radius"] = 1.5,
                        ["ptfx"] = {
                            ["class"] = "core",
                            ["scale"] = 0.75,
                            ["effect"] = "ent_ray_prologue_elec_crackle",
                            ["coords"] = vec3(948.19, -1798.76, 30.86)
                        },
                    },
                    [3] = {
                        ["type"] = "ConnectCables",
                        ["coords"] = vec4(939.80, -1872.12, 30.94, 86.10),
                        ["radius"] = 1.5,
                        ["ptfx"] = {
                            ["class"] = "core",
                            ["scale"] = 0.75,
                            ["effect"] = "ent_ray_prologue_elec_crackle",
                            ["coords"] = vec3(939.80, -1872.12, 30.94)
                        },
                    },
                    -- [3] = {
                    --     ["type"] = "ConnectCables",
                    --     ["coords"] = vec4(942.52, -1898.27, 41.44, 183.558),
                    --     ["radius"] = 1.5,
                    --     ["ptfx"] = {
                    --         ["class"] = "core",
                    --         ["scale"] = 0.75,
                    --         ["effect"] = "ent_ray_prologue_elec_crackle",
                    --         ["coords"] = vec3(942.52, -1898.27, 41.44)
                    --     },
                    -- },
                    [4] = {
                        ["type"] = "FuseReplace",
                        ["coords"] = vec4(916.37, -2064.56, 30.31, 355.209),
                        ["radius"] = 1.5,
                        ["ptfx"] = {
                            ["class"] = "core",
                            ["scale"] = 0.75,
                            ["effect"] = "ent_ray_prologue_elec_crackle",
                            ["coords"] = vec3(916.37, -2064.56, 30.31)
                        },
                    },
                    -- [7] = {
                    --     ["type"] = "FuseReplace",
                    --     ["coords"] = vec4(908.91, -2068.35, 39.12, 354.083),
                    --     ["radius"] = 1.5,
                    --     ["ptfx"] = {
                    --         ["class"] = "core",
                    --         ["scale"] = 0.75,
                    --         ["effect"] = "ent_ray_prologue_elec_crackle",
                    --         ["coords"] = vec3(908.91, -2068.35, 39.12)
                    --     },
                    -- },
                }
            },
            [5] = {
                ["title"] = "Unknown Maintenance",
                ["reward"] = 20000,
                ["split_reward_members"] = true,
                ["timer"] = {
                    ["extra_time"] = 6 * 60 * 1000,
                    ["mission_time"] = 6 * 60 * 1000,
                    ["deducted_per_min"] = 50,
                },
                ["location_blip"] = {
                    ["show"] = true,
                    ["label"] = "Maintenance point",
                    ["sprite"] = 566,
                    ["color"] = 36,
                    ["scale"] = 0.8,
                    ["alpha"] = 125,
                },
                ["animation"] = {
                    ["duration"] = -1,
                    ["flag"] = 51,
                    ["dict"] = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
                    ["name"] = "machinic_loop_mechandplayer",
                },
                ["maintenance_locations"] = {
                    [1] = {
                        ["type"] = "FixCables",
                        ["coords"] = vec4(-824.92, -1150.19, 7.92, 34.84),
                        ["radius"] = 1.5,
                        ["ptfx"] = {
                            ["class"] = "core",
                            ["scale"] = 0.75,
                            ["effect"] = "ent_ray_prologue_elec_crackle",
                            ["coords"] = vec3(-824.92, -1150.19, 7.92)
                        },
                    },
                    [2] = {
                        ["type"] = "FixCables",
                        ["coords"] = vec4(-896.97, -1190.98, 5.19, 210.40),
                        ["radius"] = 1.5,
                        ["ptfx"] = {
                            ["class"] = "core",
                            ["scale"] = 0.75,
                            ["effect"] = "ent_ray_prologue_elec_crackle",
                            ["coords"] = vec3(-896.97, -1190.98, 5.19)
                        },
                    },
                    [3] = {
                        ["type"] = "ConnectCables",
                        ["coords"] = vec4(-993.77, -1247.63, 5.79, 29.18),
                        ["radius"] = 1.5,
                        ["ptfx"] = {
                            ["class"] = "core",
                            ["scale"] = 0.75,
                            ["effect"] = "ent_ray_prologue_elec_crackle",
                            ["coords"] = vec3(-993.77, -1247.63, 5.79)
                        },
                    },
                    [4] = {
                        ["type"] = "ConnectCables",
                        ["coords"] = vec4(-1079.08, -1267.90, 5.74, 118.96),
                        ["radius"] = 1.5,
                        ["ptfx"] = {
                            ["class"] = "core",
                            ["scale"] = 0.75,
                            ["effect"] = "ent_ray_prologue_elec_crackle",
                            ["coords"] = vec3(-1079.08, -1267.90, 5.74)
                        },
                    },
                    [5] = {
                        ["type"] = "ConnectCables",
                        ["coords"] = vec4(-1174.65, -1363.32, 4.70, 21.48),
                        ["radius"] = 1.5,
                        ["ptfx"] = {
                            ["class"] = "core",
                            ["scale"] = 0.75,
                            ["effect"] = "ent_ray_prologue_elec_crackle",
                            ["coords"] = vec3(-1174.65, -1363.32, 4.70)
                        },
                    },
                    [6] = {
                        ["type"] = "FuseReplace",
                        ["coords"] = vec4(-1249.76, -1395.39, 3.75, 200.148),
                        ["radius"] = 1.5,
                        ["ptfx"] = {
                            ["class"] = "core",
                            ["scale"] = 0.75,
                            ["effect"] = "ent_ray_prologue_elec_crackle",
                            ["coords"] = vec3(-1249.76, -1395.39, 3.75)
                        },
                    },
                    -- [7] = {
                    --     ["type"] = "FixCables",
                    --     ["coords"] = vec4(-1266.26, -1382.62, 16.36, 18.31),
                    --     ["radius"] = 1.5,
                    --     ["ptfx"] = {
                    --         ["class"] = "core",
                    --         ["scale"] = 0.75,
                    --         ["effect"] = "ent_ray_prologue_elec_crackle",
                    --         ["coords"] = vec3(-1266.26, -1382.62, 16.36)
                    --     },
                    -- },
                }
            },
            [6] = {
                ["title"] = "Unknown Maintenance - 2",
                ["reward"] = 20000,
                ["split_reward_members"] = true,
                ["timer"] = {
                    ["extra_time"] = 6 * 60 * 1000,
                    ["mission_time"] = 6 * 60 * 1000,
                    ["deducted_per_min"] = 50,
                },
                ["location_blip"] = {
                    ["show"] = true,
                    ["label"] = "Maintenance point",
                    ["sprite"] = 566,
                    ["color"] = 36,
                    ["scale"] = 0.8,
                    ["alpha"] = 125,
                },
                ["animation"] = {
                    ["duration"] = -1,
                    ["flag"] = 51,
                    ["dict"] = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
                    ["name"] = "machinic_loop_mechandplayer",
                },
                ["maintenance_locations"] = {
                    [1] = {
                        ["type"] = "ConnectCables",
                        ["coords"] = vec4(-13.98, -1077.53, 26.65, 341.98),
                        ["radius"] = 1.5,
                        ["ptfx"] = {
                            ["class"] = "core",
                            ["scale"] = 0.75,
                            ["effect"] = "ent_ray_prologue_elec_crackle",
                            ["coords"] = vec3(-13.98, -1077.53, 26.65)
                        },
                    },
                    -- [2] = {
                    --     ["type"] = "FixCables",
                    --     ["coords"] = vec4(-14.18, -1114.35, 38.38, 201.313),
                    --     ["radius"] = 1.5,
                    --     ["ptfx"] = {
                    --         ["class"] = "core",
                    --         ["scale"] = 0.75,
                    --         ["effect"] = "ent_ray_prologue_elec_crackle",
                    --         ["coords"] = vec3(-14.18, -1114.35, 38.38)
                    --     },
                    -- },
                    [2] = {
                        ["type"] = "FixCables",
                        ["coords"] = vec4(6.08, -1113.36, 28.77, 339.93),
                        ["radius"] = 1.5,
                        ["ptfx"] = {
                            ["class"] = "core",
                            ["scale"] = 0.75,
                            ["effect"] = "ent_ray_prologue_elec_crackle",
                            ["coords"] = vec3(6.08, -1113.36, 28.77)
                        },
                    },
                    [3] = {
                        ["type"] = "ConnectCables",
                        ["coords"] = vec4(89.22, -1080.23, 29.29, 65.22),
                        ["radius"] = 1.5,
                        ["ptfx"] = {
                            ["class"] = "core",
                            ["scale"] = 0.75,
                            ["effect"] = "ent_ray_prologue_elec_crackle",
                            ["coords"] = vec3(89.22, -1080.23, 29.29)
                        },
                    },
                    -- [5] = {
                    --     ["type"] = "ConnectCables",
                    --     ["coords"] = vec4(60.29, -1047.88, 40.75, 11.54),
                    --     ["radius"] = 1.5,
                    --     ["ptfx"] = {
                    --         ["class"] = "core",
                    --         ["scale"] = 0.75,
                    --         ["effect"] = "ent_ray_prologue_elec_crackle",
                    --         ["coords"] = vec3(60.29, -1047.88, 40.75)
                    --     },
                    -- },
                    [4] = {
                        ["type"] = "FixCables",
                        ["coords"] = vec4(138.33, -1027.03, 29.03, 340.816),
                        ["radius"] = 1.5,
                        ["ptfx"] = {
                            ["class"] = "core",
                            ["scale"] = 0.75,
                            ["effect"] = "ent_ray_prologue_elec_crackle",
                            ["coords"] = vec3(138.33, -1027.03, 29.03)
                        },
                    },
                    [5] = {
                        ["type"] = "FuseReplace",
                        ["coords"] = vec4(195.34, -1046.22, 28.89, 340.251),
                        ["radius"] = 1.5,
                        ["ptfx"] = {
                            ["class"] = "core",
                            ["scale"] = 0.75,
                            ["effect"] = "ent_ray_prologue_elec_crackle",
                            ["coords"] = vec3(195.34, -1046.22, 28.89)
                        },
                    },
                    [6] = {
                        ["type"] = "ConnectCables",
                        ["coords"] = vec4(195.95, -1104.74, 28.91, 267.56),
                        ["radius"] = 1.5,
                        ["ptfx"] = {
                            ["class"] = "core",
                            ["scale"] = 0.75,
                            ["effect"] = "ent_ray_prologue_elec_crackle",
                            ["coords"] = vec3(195.95, -1104.74, 28.91)
                        },
                    },
                }
            },
        },
        ["outfits"] = {
            ["male"] = {
                ['t-shirt'] = {["item"] = 15, ["texture"] = 0},
                ['torso2'] = {["item"] = 345, ["texture"] = 0},
                ['arms'] = {["item"] = 19, ["texture"] = 0},
                ['pants'] = {["item"] = 3, ["texture"] = 7},
                ['shoes'] = {["item"] = 1, ["texture"] = 0},
            },
            ["female"] = {
                ['t-shirt'] = {["item"] = 15, ["texture"] = 0},
                ['torso2'] = {["item"] = 345, ["texture"] = 0},
                ['arms'] = {["item"] = 19, ["texture"] = 0},
                ['pants'] = {["item"] = 3, ["texture"] = 7},
                ['shoes'] = {["item"] = 1, ["texture"] = 0},
            },
        },
        ["menu_informations"] = {
            ["cover"] = "",
            ["title"] = "Electrician",
            ["description"] = "Fix electricity problems in the city",
            ["recommended"] = true,
            ["steps"] = {},
        }
    }
}

-----------------------------------------------------------------------------------------
-- FUNCTION'S --
-----------------------------------------------------------------------------------------

Config.Notification = function(title, text, type, lenght)
    lib.notify({
        title = title,
        description = text,
        type = type,
        duration = lenght
    })
end

Config.VehicleCreated = function(vehicleId, plate)
    if GetResourceState("qs-vehiclekeys"):find("start") then
        exports['qs-vehiclekeys']:GiveKeys(plate, GetDisplayNameFromVehicleModel(GetEntityModel(vehicleId)), true)
    else
        TriggerEvent('vehiclekeys:client:SetOwner', plate)
    end

    if GetResourceState('LegacyFuel'):find("start") then
        exports["LegacyFuel"]:SetFuel(vehicleId, 100)
    elseif GetResourceState('ox_fuel'):find("start") then
        Entity(vehicleId).state.fuel = 100
    elseif GetResourceState('okokGasStation'):find("start") then
        exports['okokGasStation']:SetFuel(vehicleId, 100)
    elseif GetResourceState("cdn-fuel"):find("start") then
        exports["cdn-fuel"]:SetFuel(vehicleId, 100)
    end
end

Config.RemoveKeys = function(plate, model)
    if GetResourceState("qs-vehiclekeys"):find("start") then
        exports['qs-vehiclekeys']:RemoveKeys(plate, model)
    elseif GetResourceState("qb-vehiclekeys"):find("start") then
        TriggerEvent('qb-vehiclekeys:client:RemoveKeys', plate)
    end
end

Config.JobSuccess = function(job, reward, index, currTime, usedExtraTime)
    print('Job Success', job, reward, index, currTime, usedExtraTime)
    -- Here your extra codes
end
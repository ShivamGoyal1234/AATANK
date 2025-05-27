Config = {}

Config.Framework = 'QB' -- ESX / QB / QBOX / ND (Bridge)
Config.Language = 'en' -- en / pl

Config.Jobs = { -- jobs with duty timers
    ['police'] = true,
    ['ambulance'] = true,
    ['mechanic'] = true,
    ['sheriff'] = true,
    ['burgershot'] = true
}

Config.Payout = {
    ped = {
        model = 'ig_barry',
        anim = {},
    },
    coords = vector4(242.6529, 226.6949, 106.2873, 165.5818),
    radius = 0.25,
    drawSprite = true,
    debug = false,
    label = 'Take Payout',
    icon = 'fa-solid fa-dollar-sign'
}

Config.Society = {
    state = true, -- it will took money from society account
    percent = 100, -- if player has 1000$ payout, it will remove 100% of payout from society account
    needMoney = true, -- check if account has enough money, else it will just remove money without checking
}

Config.Payouts = {
    ['police'] = {
        ["0"] = 200, ["1"] = 200, ["2"] = 250,
        ["3"] = 250, ["4"] = 300, ["5"] = 300,
        ["6"] = 500, ["7"] = 500, ["8"] = 600,
        ["9"] = 800, ["10"] = 900, ["11"] = 1000,
        ["12"] = 800, ["13"] = 900, ["14"] = 1000,
        ["15"] = 1200, ["16"] = 1300, ["17"] = 2000,
    },
    ['ambulance'] = {
        ["0"] = 100, ["1"] = 100, ["2"] = 100,
        ["3"] = 100, ["4"] = 100, ["5"] = 100,
        ["6"] = 100, ["7"] = 100, ["8"] = 100,
        ["9"] = 100, ["10"] = 100, ["11"] = 200,
    },
    ['mechanic'] = {
        ["0"] = 100, ["1"] = 100, ["2"] = 100,
        ["3"] = 100, ["4"] = 100, ["5"] = 100,
        ["6"] = 100, ["7"] = 100, ["8"] = 100,
        ["9"] = 100, ["10"] = 100, ["11"] = 200,
    },
    ['burgershot'] = {
        ["0"] = 100, ["1"] = 100, ["2"] = 100,
        ["3"] = 100, ["4"] = 100, ["5"] = 100,
        ["6"] = 100, ["7"] = 100, ["8"] = 100,
        ["9"] = 100, ["10"] = 100, ["11"] = 200,
    },
}

-- piotreq_jobcore:TakePayout, you can use this server event if you want to set multiple points
Config.RadioList = {}

Config.RadioList.Enabled = true -- set to false to disable

Config.RadioList.ToggleKey = 'G' -- KEY TO TOGGLE RADIO LIST [TO DISABLE SET TO FALSE]

Config.RadioList.RestrictedJobs = { -- set to false if you want for everyone
    ['police'] = 0,
    ['sheriff'] = 0,
}

Config.RadioList.ChangePageKeys = {
    ['left'] = 'LEFT', -- left arrow
    ['right'] = 'RIGHT', -- right arrow
}

Config.RadioList.ChannelNames = {
    ['1'] = 'LSPD',
    ['2'] = 'LSPD',
    ['3'] = 'LSPD',
    ['4'] = 'SHERIFF',
    ['5'] = 'SHERIFF'
}

Config.RadioList.TalkingDelay = 50 -- ms [anti spam for radio]

Config.RadioAnimations = {
    {
        label = 'Holding radio',
        animDict = 'anim@male@holding_radio',
        animClip = 'holding_radio_clip',
        animFlag = 50,
        prop = {
            model = 'prop_cs_hand_radio',
            bone = 6286,
            coords = vector3(0.08, 0.03, -0.01),
            rotation = vector3(-59.99, 15.54, -52.55),
        }
    },
    {
        label = 'Fast talk',
        animDict = 'random@arrests',
        animClip = 'generic_radio_chatter',
        animFlag = 50,
        isDefault = true -- default animation [you can set other]
    },
    {
        label = 'Slow talk',
        animDict = 'amb@code_human_police_investigate@idle_a',
        animClip = 'idle_b',
        animFlag = 50,
    }
}

-- https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/ [KEYS HERE]
-- These get applied to a ped before opening character creator
Config.PedDefaults = {
    [`mp_m_freemode_01`] = {
        [0 --[[HEAD]]] = 0,
        [1 --[[MASK]]] = 0,
        [2 --[[HAIR]]] = 2,
        [3 --[[ARMS]]] = 0,
        [4 --[[PANTS]]] = 0,
        [5 --[[BAG]]] = 0,
        [6 --[[SHOES]]] = 3,
        [7 --[[NECKWEAR]]] = 0,
        [8 --[[UNDERSHIRT]]] = 15,
        [9 --[[VEST]]] = 0,
        [10 --[[DECAL]]] = 0,
        [11 --[[SHIRT]]] = 1,
    },
    [`mp_f_freemode_01`] = {
        [0 --[[HEAD]]] = 0,
        [1 --[[MASK]]] = 0,
        [2 --[[HAIR]]] = 2,
        [3 --[[ARMS]]] = 0,
        [4 --[[PANTS]]] = 0,
        [5 --[[BAG]]] = 0,
        [6 --[[SHOES]]] = 0,
        [7 --[[NECKWEAR]]] = 0,
        [8 --[[UNDERSHIRT]]] = 15,
        [9 --[[VEST]]] = 0,
        [10 --[[DECAL]]] = 0,
        [11 --[[SHIRT]]] = 0,
    }
}

Config.DefaultHeadblend = {
    [`mp_m_freemode_01`] = {
        maleModel = 0,
        femaleModel = 45,
        maleTone = 0,
        femaleTone = 0,
        modelBlend = 0.0,
        toneBlend = 0.0,
    },
    [`mp_f_freemode_01`] = {
        maleModel = 21,
        femaleModel = 45,
        maleTone = 0,
        femaleTone = 0,
        modelBlend = 0.5,
        toneBlend = 0.0,
    }
}

-- These are "unset" cards that are used when you click
-- on Undress in the clothing UI
Config.UnsetCards = {
    [`mp_m_freemode_01`] = {
        mask = '1_-1_0', -- component 1
        pants = '1724446270', -- component 4
        bag = '5_-1_0', -- component 5
        shoes = '130513036', -- component 6
        neckwear = '7_0_0', -- component 7
        undershirt = '8_15_0', -- component 8
        vest = '9_0_0', -- component 9
        decal = '10_0_0', -- component 10
        torso = '11_15_0', -- component 11 (tops)

    },
    [`mp_f_freemode_01`] = {
        mask = '1_-1_0', -- component 1
        pants = '1667217362', -- component 4
        bag = '5_-1_0', -- component 5
        shoes = '747250516', -- component 6
        neckwear = '7_0_0', -- component 7
        undershirt = '8_15_0', -- component 8
        vest = '9_0_0', -- component 9
        decal = '10_0_0', -- component 10
        torso = '11_15_0', -- component 11 (tops)
    },
}

Config.AvailableEyes = {
    [0] = '#7a8f0b', -- green-yellow
    [1] = '#1c640f', -- dark green
    [2] = '#c0f5de', -- cold blue
    [3] = '#4675a7', -- light blue
    [4] = '#a76d32', -- light brown
    [5] = '#603a0b', -- darker brown
    [6] = '#ed8300', -- brown orange
    [7] = '#c7c7c7', -- light grey
    [8] = '#ffffff', -- white
    [9] = '#ff3ade', -- pink
    [10] = '#ffeb00', -- yellow
    [11] = '#9100ff', -- purple
    [12] = 'radial-gradient(circle, rgba(0,0,0,1) 0%, rgba(0,0,0,1) 46%, rgba(255,255,255,1) 91%, rgba(255,255,255,1) 100%)', -- black
    [13] = 'radial-gradient(circle, rgba(0,0,0,1) 0%, rgba(255,255,255,1) 16%, rgba(0,0,0,1) 33%, rgba(255,255,255,1) 51%, rgba(0,0,0,1) 69%, rgba(255,255,255,1) 85%, rgba(0,0,0,1) 100%)', --hypno
    [14] = 'radial-gradient(circle, rgba(0,0,0,1) 0%, rgba(255,217,0,1) 35%, rgba(219,186,0,1) 61%, rgba(212,64,13,1) 82%)', -- fire
    [15] = 'linear-gradient(25deg, rgba(0,0,0,1) 0%, rgba(255,217,0,1) 34%, rgba(255,218,0,1) 66%, rgba(0,0,0,1) 100%)', -- hazard
    [16] = ' linear-gradient(25deg, rgba(0,0,0,1) 0%, rgba(255,255,255,1) 34%, rgba(0,0,0,1) 49%, rgba(255,255,255,1) 66%, rgba(0,0,0,1) 100%)', -- spiral
    [17] = 'radial-gradient(circle, rgba(0,0,0,1) 0%, rgba(0,0,0,1) 20%, rgba(255,255,255,1) 48%, rgba(255,0,0,1) 84%, rgba(255,0,0,1) 100%)', -- candycane
    [18] = 'linear-gradient(90deg, rgba(79,183,255,1) 0%, rgba(122,215,220,1) 26%, rgba(245,255,0,1) 50%, rgba(250,0,0,1) 73%, rgba(255,0,0,1) 100%)', -- tricolor
    [19] = 'linear-gradient(311deg, rgba(255,255,255,1) 0%, rgba(255,255,255,1) 23%, rgba(0,0,0,1) 73%, rgba(0,0,0,1) 100%)', -- ying yang
    [20] = 'radial-gradient(circle, rgba(0,0,0,1) 0%, rgba(0,0,0,1) 22%, rgba(255,255,255,1) 31%, rgba(255,255,255,1) 50%, rgba(255,255,255,1) 59%, rgba(255,0,0,1) 69%, rgba(255,0,0,1) 100%)', -- target
    [21] = ' linear-gradient(90deg, rgba(124,255,0,1) 0%, rgba(124,255,0,1) 30%, rgba(0,0,0,1) 46%, rgba(0,0,0,1) 50%, rgba(0,0,0,1) 55%, rgba(125,255,0,1) 70%, rgba(124,255,0,1) 100%)', -- snake
    [22] = 'linear-gradient(90deg, rgba(255,0,0,1) 0%, rgba(255,173,0,1) 30%, rgba(0,0,0,1) 46%, rgba(0,0,0,1) 50%, rgba(0,0,0,1) 55%, rgba(255,173,0,1) 70%, rgba(255,0,0,1) 100%)', -- red snake
    [23] = 'linear-gradient(90deg, rgba(137,86,255,1) 0%, rgba(79,163,255,1) 30%, rgba(0,0,0,1) 46%, rgba(0,0,0,1) 50%, rgba(0,0,0,1) 55%, rgba(79,163,255,1) 70%, rgba(137,86,255,1) 100%)', -- dark blue snake
    [24] = 'linear-gradient(0deg, rgba(224,190,59,1) 0%, rgba(224,190,59,1) 34%, rgba(0,0,0,1) 50%, rgba(224,190,59,1) 67%, rgba(224,190,59,1) 100%)', -- goat
    [25] = 'radial-gradient(circle, rgba(0,0,0,1) 0%, rgba(0,0,0,1) 23%, rgba(224,190,59,1) 36%, rgba(224,190,59,1) 58%, rgba(99,82,17,1) 67%, rgba(224,190,59,1) 73%, rgba(224,190,59,1) 100%)', -- yellow smile
    [26] = 'black', -- all black
    [27] = 'radial-gradient(circle, rgba(0,0,0,1) 29%, rgba(255,0,0,1) 35%, rgba(255,0,0,1) 46%, rgba(255,0,0,1) 91%, rgba(255,0,0,1) 100%)', -- red, black small pupil
    [28] = 'radial-gradient(circle, rgba(129,209,198,1) 29%, rgba(255,0,0,1) 35%, rgba(255,0,0,1) 46%, rgba(255,0,0,1) 91%, rgba(255,0,0,1) 100%)', -- red, blue small pupil
    [29] = 'radial-gradient(circle, rgba(0,0,0,1) 29%, rgba(125,222,252,1) 35%, rgba(15,136,175,1) 100%)', -- blue, black small pupil
    [30] = 'radial-gradient(circle, rgba(0,0,0,1) 29%, rgba(255,255,255,1) 35%, rgba(255,255,255,1) 63%, rgba(116,17,17,1) 100%)', -- zombie red
    [31] = 'radial-gradient(circle, rgba(255,255,255,1) 29%, rgba(255,255,255,1) 35%, rgba(255,255,255,1) 63%, rgba(116,17,17,1) 100%)', -- zombie
    [32] = '#485005' -- dark green
}

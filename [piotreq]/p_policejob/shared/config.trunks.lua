Config.Trunks = {}

Config.Trunks.CameraType = 'dynamic' -- static / dynamic / game

Config.Trunks.CheckVehicleLocks = true -- true = if vehicle is locked player will not be able to get out of trunk

Config.Trunks.CheckTrunkState = true -- true = script will check if trunk is open

Config.Trunks.DefaultOffset = {
    coords = vector3(0.0, 0.85, -0.87),
    rotation = vector3(0.0, 0.0, 40.0)
}

Config.Trunks.Offsets = { -- you can also add manually trunks or use /trunk_editor
    -- ['elegy'] = {
    --     coords = vector3(0.0, -1.70, 0.25),
    --     rotation = vector3(0.0, 0.0, 0.0)
    -- }
}

Config.Trunks.AllowedGroups = {
    ['owner'] = true,
    ['admin'] = true
}

Config.Trunks.ShowHelpNotify = function()
    exports['p_helper']:showHelper({
        {
            keys = {'X'},
            label = 'Cancel'
        },
        {
            keys = {'A', 'D'},
            label = 'Offset X'
        },
        {
            keys = {'N', 'M'},
            label = 'Offset Y'
        },
        {
            keys = {'W', 'S'},
            label = 'Offset Z'
        },
        {
            keys = {'Q', 'R'},
            label = 'Rotation X'
        },
        {
            keys = {'F', 'G'},
            label = 'Rotation Y'
        },
        {
            keys = {'C', 'V'},
            label = 'Rotation Z'
        },
        {
            keys = {'E'},
            label = 'Confirm'
        },
    })
end

Config.Trunks.HideHelpNotify = function()
    exports['p_helper']:hideHelper()
end

Config.Trunks.OnPlayerEnterTrunk = function()
    -- do something
end

Config.Trunks.OnPlayerExitTrunk = function()
    -- do something
end
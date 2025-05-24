# Documentation:

https://envi-scripts-organization.gitbook.io/documentation

# Discord:

https://discord.gg/envi-scripts

### Important Notes
1. Make sure envi-bridge is updated to 0.3.9 or higher
2. Make Sure to Set `Config.Debug = false` and `Config.TestMode = false` in YOUR LIVE SERVER
3. Adjust `Config.InitializeDelay` if you experience loading conflicts
4. For ultrawide resolutions, recommend players use "Force 1080p UI Resolution" in FiveM Settings


# Exports:

## Toggle HUD (Client Side)

# Usage:

```lua
-- to hide hud
exports['envi-hud']:ToggleHUD(false)
```

```lua
-- to show hud
exports['envi-hud']:ToggleHUD(true)
```

## Combat Control Exports (Server Side)

# Usage:

```lua
-- Check if server-wide melee combat is disabled
local isDisabled = exports['envi-hud']:IsServerMeleeDisabled()

-- Set server-wide melee combat state
exports['envi-hud']:SetServerMeleeDisabled(true) -- disable
exports['envi-hud']:SetServerMeleeDisabled(false) -- enable

-- Toggle server-wide melee combat state
exports['envi-hud']:ToggleServerMelee()
```

### Combat Control COMMANDS (Server Console Only)
```lua
-- Disable combat for all players
        DisableAllCombat

-- Enable combat for all players
        EnableAllCombat

-- Disable combat for specific player
        DisableCombat [playerID]

-- Enable combat for specific player
        EnableCombat [playerID]
```

## Stress Exports (Client Side)

# Usage:

```lua
-- to add 10 stress
exports['envi-hud']:AddStress(10)

-- to remove 10 stress
exports['envi-hud']:RemoveStress(10)
```


### Stress Relief COMMANDS
The following commands are available for stress relief scenarios:
```lua
-- Start yoga for stress relief
/startYoga

-- Start push-ups for stress relief
/startPushUps

-- Start sit-ups for stress relief
/startSitUps
```

## Seatbelt UI Export (For use with 3rd party seatbelt systems)

# Usage:
- toggle on

```lua
exports['envi-hud']:ToggleSeatbeltUI(true)

- toggle off

exports['envi-hud']:ToggleSeatbeltUI(false)
```


## Notify Export (Client Side)

# Usage:
- success

```lua
exports['envi-hud']:Notify({
    type = 'success',
    message = 'This is a test notification for successful actions',
    title = 'Success Notify',
    duration = 5000
})
```

- error

```lua
exports['envi-hud']:Notify({
    type = 'error',
    message = 'This is a test notification for error actions',
    title = 'Error Notify',
    duration = 5000
})
```

- warning

```lua
exports['envi-hud']:Notify({
    type = 'warning',
    message = 'This is a test notification for warning actions',
    title = 'Warning Notify',
    duration = 5000
})
```

- info

```lua
exports['envi-hud']:Notify({
    type = 'info',
    message = 'This is a test notification for info actions',
    title = 'Info Notify',
    duration = 5000
})
```

# Server Side Notifys

```lua
TriggerClientEvent('envi-hud:notify', source, {
    type = 'success',
    message = 'This is a test notification for successful actions',
    title = 'Success Notify',
    duration = 5000
})
```

```lua
TriggerClientEvent('envi-hud:notify', source, {
    type = 'error',
    message = 'This is a test notification for error actions',
    title = 'Error Notify',
    duration = 5000
})
```

```lua
TriggerClientEvent('envi-hud:notify', source, {
    type = 'warning',
    message = 'This is a test notification for warning actions',
    title = 'Warning Notify',
    duration = 5000
})
```

```lua
TriggerClientEvent('envi-hud:notify', source, {
    type = 'info',
    message = 'This is a test notification for info actions',
    title = 'Info Notify',
    duration = 5000
})
```



## Harness Exports (Client Side) 

- You can use the built-in Harness System or use the exports to apply harness levels to vehicles

```lua
-- to install harness level 1 on vehicle with install animations and item checking
exports['envi-hud']:InstallHarness(vehicle, 1)
```

```lua
-- to remove harness on vehicle with remove animations and item checking
exports['envi-hud']:RemoveHarness(vehicle)
```

```lua
-- to install harness level 1 on vehicle with NO animations and NO item checking (0 for no harness)
exports['envi-hud']:ApplyHarnessLevel(vehicle, 1)
```

### GetHarnessLevel(vehicle)
Returns the harness level of the specified vehicle
- Parameter: `vehicle` - The vehicle entity to check
- Returns: `number` - The harness level (0 if no harness)

### GetSeatbeltStatus()
Returns whether the seatbelt or harness is currently enabled
- Returns: `boolean` - True if seatbelt/harness is enabled, false otherwise

### SetSeatbelt(enabled)
Sets the seatbelt state
- Parameter: `enabled` - Boolean indicating whether to enable (true) or disable (false) the seatbelt

### ApplyHarnessLevel(vehicle, level)
Applies a harness level to the specified vehicle
- Parameter: `vehicle` - The vehicle entity to modify
- Parameter: `level` - The harness level to apply

```lua
-- Example usage:
local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)

-- Get harness level first if you need to check differnce between seatbelt and harness
local harnessLevel = exports['envi-hud']:GetHarnessLevel(vehicle)
local isSeatbeltOn = exports['envi-hud']:GetSeatbeltStatus()

if harnessLevel > 0 and isSeatbeltOn then
    print('Player has harness buckled')
elseif isSeatbeltOn then
    print('Player has regular seatbelt buckled')
else
    print('No seatbelt or harness active')
end
```

## Vehicle Control Features

### Cruise Control
Default keybind: `Y`
```lua
-- Adjust cruise control speed
Mouse Wheel Up - Increase speed
Mouse Wheel Down - Decrease speed
```

### Indicators
Default keybinds:
```lua
LEFT ARROW - Left indicator
RIGHT ARROW - Right indicator
DOWN ARROW - Hazard lights
```

### Handbrake Toggle
Default keybind: `UP ARROW`
```lua
-- Toggle persistent handbrake state
UP ARROW - Toggle handbrake on/off
```

## Additional Features

### Anti-Muscle-Spasm (Combat Mode)
This feature prevents accidental punching when not in combat mode. Combat Mode is activated when:
- You get hit
- You press the RIGHT MOUSE BUTTON to lock onto someone

Configuration options in `config.lua`:
```lua
Config.AntiMuscleSpasm = {
    enabled = false,   -- Enable/disable the feature
    timeout = 30,      -- Cooldown in seconds
    notify = true      -- Show notifications
}
```

### Ragdoll Feature
When enabled, players will ragdoll when jumping into walls.
```lua
Config.RagdollFeature = true/false
```

### HUD Settings Command
Access HUD settings using:
- Command: `/hud`
- Default keybind: `F7`

### Map Settings
```lua
Config.MapOnlyInVehicle = true/false  -- Show minimap only in vehicles
```

### Experimental Features
```lua
Config.ExperimentalFeatures = {
    advancedMap = true  -- Moveable Mini-Map and advanced settings
}
```

Note: For ultrawide resolutions, it's recommended that players use the "Force 1080p UI Resolution" option in FiveM Settings before joining the server.

## Framework-Specific Features

### ESX Features
```lua
Config.EnableBlackMoney = false  -- Enable black money display
Config.AddESXStatusStess = false -- Enable ESX status stress system
```

### Database Configuration
The script automatically sets up the required database tables for both ESX and QB-Core/QBX:

For ESX:
```sql
ALTER TABLE owned_vehicles
ADD COLUMN IF NOT EXISTS HarnessInstalled INT DEFAULT 0
```

For QB-Core/QBX:
```sql
ALTER TABLE player_vehicles 
ADD COLUMN IF NOT EXISTS HarnessInstalled INT DEFAULT 0
```

## Detailed System Settings

### Seatbelt Configuration
```lua
Config.Seatbelt = {
    enabled = true,
    type = 'keyboard', 
    key = 'B',
    Sound = {
        Buckle = 'seatbelt',
        Unbuckle = 'seatbeltoff',
        Volume = 0.3
    },
    AutoUnbuckle = true,
    DefaultSpeedThreshold = 45.0,  -- Speed threshold (MPH/KMH) for ejection when buckled
    UnbuckledSpeedThreshold = 15.0,  -- Speed threshold (MPH/KMH) for ejection when unbuckled
    Notify = false  -- Show notifications for buckling/unbuckling
}
```

### Stress System Configuration
```lua
Config.Stress = {
    Enabled = true,
    SpeedThreshold = 60,
    SpeedThresholdUnbuckled = 60,
    
    -- Speed-based stress
    SpeedStress = {
        enabled = true,
        baseMultiplier = 1.0,
        seatbeltMultiplier = 2.0,  -- Double stress when not wearing seatbelt
        interval = 2000,  -- Time between stress updates while driving
        
        -- Speed ranges and their stress multipliers
        speedRanges = {
            { min = 60, max = 75, multiplier = 0.2 },  -- Very low stress
            { min = 76, max = 100, multiplier = 0.5 }, -- Low stress
            { min = 101, max = 120, multiplier = 1.0 }, -- Moderate stress
            { min = 121, max = 140, multiplier = 1.5 }, -- High stress
            { min = 141, multiplier = 2.0 } -- Very high stress
        }
    },
    
    -- Stress amounts for different actions
    ShootingAmount = 3,      -- Stress gained from shooting
    MeleeHitAmount = 3,      -- Stress gained from melee hits
    GotShotAmount = 10,      -- Stress gained from being shot
    CrashAmount = 10,        -- Stress gained from vehicle crashes
    
    -- Vehicle crash stress settings
    CrashedCar = {
        Cooldown = 5000,           -- Cooldown between crash stress
        VDM_Player = 25,          -- Stress from hitting player
        VDM_NPC = 10,             -- Stress from hitting NPC
        VDM_PlayerVehicle = 15,   -- Stress from hitting player vehicle
        VDM_NPCVehicle = 5        -- Stress from hitting NPC vehicle
    },
    
    -- Job-specific stress multipliers
    JobStressMultiplier = {
        ['police'] = 0.5,  -- Police get half stress
        -- ['ambulance'] = 0.0,  -- Example: Medics get no stress
    }
}
```

### Harness System Configuration
```lua
Config.Interactions = {
    Target = true,    -- Enable mechanic targeting for harness install/uninstall
    ItemUse = true    -- Enable harness item usage inside vehicles
}

Config.Items = {
    Install = {
        [1] = {
            item = 'harness',
            label = 'Basic Harness',
            minSpeed = 125,  -- Minimum speed for ejection
        },
        [2] = {
            item = 'advanced_harness',
            label = 'Advanced Harness',
            minSpeed = 150,
        },
        [3] = {
            item = 'ultra_harness',
            label = 'Ultra Harness',
            minSpeed = 200,
        }
    },
    Uninstall = 'mech_toolkit'  -- Item required for uninstallation
}

Config.JobInstall = false    -- Restrict harness installation to specific jobs
Config.InstallJobs = { 'mechanic', 'mechanic2' }
Config.InstallTime = 10     -- Installation time in seconds
```

## Replacing QBCore.Functions.Notify

(qb-core/client/functions.lua)

```lua
function QBCore.Functions.Notify(text, texttype, length, icon)
    if texttype == 'primary' then texttype = 'info' end
    exports['envi-hud']:Notify({
        type = texttype or 'info',
        message = type(text) == 'table' and text.text or text,
        title = type(text) == 'table' and text.caption or nil,
        duration = length or 5000,
        icon = icon
    })
end
```

## Progess Bars (Client Side)

To use Envi-Hud Progress Bar directly from another script:

```lua
    -- Some Example usages

    local data = {                  -- table of data
        label = "Animated Progress...",
        duration = 5000,
        canCancel = true,
        animation = {
            animDict = "random@shop_gunstore",
            anim = "_greeting",
            flags = 49
        },
        prop = {
            model = 'prop_notepad_01',
            bone = 18905,
            coords = vec3(0.1, 0.02, 0.05),
            rotation = vec3(10.0, 0.0, 0.0)
        },
        propTwo = {
            model = 'prop_pencil_01',
            bone = 58866,
            coords = vec3(0.11, -0.02, 0.001),
            rotation = vec3(-120.0, 0.0, 0.0)
        },
        controlDisables = {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true
        },
        onComplete = function()
            print('Animated progress completed')
        end,
        onCancel = function()
            print('Animated progress cancelled')
        end
    }

    exports['envi-hud']:ProgressBar(data)
```

    ------------------------------------------------------------

    ## FULL REPLACEMENT GUIDES 

    ## Replacing ALL QBCore Progressbar 

    Go to qb-core/client/functions.lua

    find the code that looks like this :

    ```lua

    function QBCore.Functions.Progressbar(name, label, duration, useWhileDead, canCancel, disableControls, animation, prop, propTwo, onFinish, onCancel)
        if GetResourceState('progressbar') ~= 'started' then error('progressbar needs to be started in order for QBCore.Functions.Progressbar to work') end
        exports['progressbar']:Progress({
            name = name:lower(),
            duration = duration,
            label = label,
            useWhileDead = useWhileDead,
            canCancel = canCancel,
            controlDisables = disableControls,
            animation = animation,
            prop = prop,
            propTwo = propTwo,
        }, function(cancelled)
            if not cancelled then
                if onFinish then
                    onFinish()
                end
            else
                if onCancel then
                    onCancel()
                end
            end
        end)
    end

    ```

    Replace with this :

    ```lua

    function QBCore.Functions.Progressbar(name, label, duration, useWhileDead, canCancel, disableControls, animation, prop, propTwo, onFinish, onCancel)
        if GetResourceState('envi-hud') ~= 'started' then error('envi-hud needs to be started in order for QBCore.Functions.Progressbar to work') end
        print('DEBUG: Progressbar called', json.encode(animation))

        if animation and not next(animation) then
            animation = nil
        end

        if prop and not next(prop) then
            prop = nil
        end

        if propTwo and not next(propTwo) then
            propTwo = nil
        end

        local data = {
            label = label,
            duration = duration,
            canCancel = canCancel,
            animation = animation,
            prop = prop,
            propTwo = propTwo,
            controlDisables = disableControls,
            onComplete = function()
                if onFinish then
                    onFinish()
                end
            end,
            onCancel = function()
                if onCancel then
                    onCancel()
                end
            end
        }

        exports['envi-hud']:ProgressBar(data)
    end

    ```

    ## Replace ALL ox_lib progress bars with Envi-HUD

    ## Update to ox_lib version 3.3.0 or higher

    Replace ALL CODE in progress.lua of ox_lib with:

    ```lua

    local progress
    local DisableControlAction = DisableControlAction
    local DisablePlayerFiring = DisablePlayerFiring
    local playerState = LocalPlayer.state
    local createdProps = {}

    ---@class ProgressPropProps
    ---@field model string
    ---@field bone? number
    ---@field pos vector3
    ---@field rot vector3
    ---@field rotOrder? number

    ---@class ProgressProps
    ---@field label? string
    ---@field duration number
    ---@field position? 'middle' | 'bottom'
    ---@field useWhileDead? boolean
    ---@field allowRagdoll? boolean
    ---@field allowCuffed? boolean
    ---@field allowFalling? boolean
    ---@field allowSwimming? boolean
    ---@field canCancel? boolean
    ---@field anim? { dict?: string, clip: string, flag?: number, blendIn?: number, blendOut?: number, duration?: number, playbackRate?: number, lockX?: boolean, lockY?: boolean, lockZ?: boolean, scenario?: string, playEnter?: boolean }
    ---@field prop? ProgressPropProps | ProgressPropProps[]
    ---@field disable? { move?: boolean, sprint?: boolean, car?: boolean, combat?: boolean, mouse?: boolean }

    local function createProp(ped, prop)
        lib.requestModel(prop.model)
        local coords = GetEntityCoords(ped)
        local object = CreateObject(prop.model, coords.x, coords.y, coords.z, false, false, false)

        AttachEntityToEntity(object, ped, GetPedBoneIndex(ped, prop.bone or 60309), prop.pos.x, prop.pos.y, prop.pos.z, prop.rot.x, prop.rot.y, prop.rot.z, true,
            true, false, true, prop.rotOrder or 0, true)
        SetModelAsNoLongerNeeded(prop.model)

        return object
    end

    local function interruptProgress(data)
        if not data.useWhileDead and IsEntityDead(cache.ped) then return true end
        if not data.allowRagdoll and IsPedRagdoll(cache.ped) then return true end
        if not data.allowCuffed and IsPedCuffed(cache.ped) then return true end
        if not data.allowFalling and IsPedFalling(cache.ped) then return true end
        if not data.allowSwimming and IsPedSwimming(cache.ped) then return true end
    end

    local isFivem = cache.game == 'fivem'

    local controls = {
        INPUT_LOOK_LR = isFivem and 1 or 0xA987235F,
        INPUT_LOOK_UD = isFivem and 2 or 0xD2047988,
        INPUT_SPRINT = isFivem and 21 or 0x8FFC75D6,
        INPUT_AIM = isFivem and 25 or 0xF84FA74F,
        INPUT_MOVE_LR = isFivem and 30 or 0x4D8FB4C1,
        INPUT_MOVE_UD = isFivem and 31 or 0xFDA83190,
        INPUT_DUCK = isFivem and 36 or 0xDB096B85,
        INPUT_VEH_MOVE_LEFT_ONLY = isFivem and 63 or 0x9DF54706,
        INPUT_VEH_MOVE_RIGHT_ONLY = isFivem and 64 or 0x97A8FD98,
        INPUT_VEH_ACCELERATE = isFivem and 71 or 0x5B9FD4E2,
        INPUT_VEH_BRAKE = isFivem and 72 or 0x6E1F639B,
        INPUT_VEH_EXIT = isFivem and 75 or 0xFEFAB9B4,
        INPUT_VEH_MOUSE_CONTROL_OVERRIDE = isFivem and 106 or 0x39CCABD5
    }

    ---@param data ProgressProps
    local function startProgress(data)
        playerState.invBusy = true
        progress = data
        local anim = data.anim
        local progressResult = false
        local progressCompleted = false

        if anim then
            if anim.dict then
                lib.requestAnimDict(anim.dict)

                TaskPlayAnim(cache.ped, anim.dict, anim.clip, anim.blendIn or 3.0, anim.blendOut or 1.0, anim.duration or -1, anim.flag or 49, anim.playbackRate or 0,
                    anim.lockX, anim.lockY, anim.lockZ)
                RemoveAnimDict(anim.dict)
            elseif anim.scenario then
                TaskStartScenarioInPlace(cache.ped, anim.scenario, 0, anim.playEnter == nil or anim.playEnter --[[@as boolean]])
            end
        end

        if data.prop then
            playerState:set('lib:progressProps', data.prop, true)
        end

        -- Convert ox_lib progress data to envi-hud format
        local enviHudData = {
            label = data.label,
            duration = data.duration,
            canCancel = data.canCancel,
            animation = nil,
            prop = nil,
            propTwo = nil,
            controlDisables = {
                disableMovement = data.disable and data.disable.move,
                disableCarMovement = data.disable and data.disable.car,
                disableMouse = data.disable and data.disable.mouse,
                disableCombat = data.disable and data.disable.combat
            },
            onComplete = function()
                progressCompleted = true
                progressResult = true
            end,
            onCancel = function()
                progressCompleted = true
                progressResult = false
            end
        }

        exports['envi-hud']:ProgressBar(enviHudData)
        
        local interruptCheckThread = CreateThread(function()
            while progress and not progressCompleted do
                if interruptProgress(progress) then
                    exports['envi-hud']:CancelProgressBar()
                    progress = false
                    progressResult = false
                    progressCompleted = true
                end
                Wait(100)
            end
        end)

        while not progressCompleted do
            Wait(100)
        end

        if data.prop then
            playerState:set('lib:progressProps', nil, true)
        end

        if anim then
            if anim.dict then
                StopAnimTask(cache.ped, anim.dict, anim.clip, 1.0)
                Wait(0)
            else
                ClearPedTasks(cache.ped)
            end
        end

        playerState.invBusy = false
        progress = nil
        
        return progressResult
    end

    ---@param data ProgressProps
    ---@return boolean?
    function lib.progressBar(data)
        while progress ~= nil do Wait(0) end

        if not interruptProgress(data) then
            return startProgress(data)
        end
    end

    ---@param data ProgressProps
    ---@return boolean?
    function lib.progressCircle(data)
        while progress ~= nil do Wait(0) end

        if not interruptProgress(data) then
            return startProgress(data)
        end
    end

    function lib.cancelProgress()
        if not progress then
            error('No progress bar is active')
        end

        exports['envi-hud']:CancelProgressBar()
        progress = false
    end

    ---@return boolean
    function lib.progressActive()
        return progress and true
    end

    RegisterCommand('cancelprogress', function()
        if progress?.canCancel then 
            exports['envi-hud']:CancelProgressBar()
            progress = false 
        end
    end)

    if isFivem then
        RegisterKeyMapping('cancelprogress', locale('cancel_progress'), 'keyboard', 'x')
    end

    local function deleteProgressProps(serverId)
        local playerProps = createdProps[serverId]
        if not playerProps then return end
        for i = 1, #playerProps do
            local prop = playerProps[i]
            if DoesEntityExist(prop) then
                DeleteEntity(prop)
            end
        end
        createdProps[serverId] = nil
    end

    RegisterNetEvent('onPlayerDropped', function(serverId)
        deleteProgressProps(serverId)
    end)

    AddStateBagChangeHandler('lib:progressProps', nil, function(bagName, key, value, reserved, replicated)
        if replicated then return end

        local ply = GetPlayerFromStateBagName(bagName)
        if ply == 0 then return end

        local ped = GetPlayerPed(ply)
        local serverId = GetPlayerServerId(ply)

        if not value then
            return deleteProgressProps(serverId)
        end

        createdProps[serverId] = {}
        local playerProps = createdProps[serverId]

        if value.model then
            playerProps[#playerProps + 1] = createProp(ped, value)
        else
            for i = 1, #value do
                local prop = value[i]

                if prop then
                    playerProps[#playerProps + 1] = createProp(ped, prop)
                end
            end
        end
    end)
    ```
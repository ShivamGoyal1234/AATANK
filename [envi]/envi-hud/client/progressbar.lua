local isBusy = false
local props = {}

local function handleProps(data, maxTime)
    local function normalizeProps(propData)
        if propData.model then
            return {
                prop = propData.model,
                bone = propData.bone or 60809,
                coords = propData.coords,
                rotation = propData.rotation
            }
        end
        return propData
    end

    if data.prop then
        local propData = normalizeProps(data.prop)
        RequestModel(propData.prop)
        while not HasModelLoaded(propData.prop) do Wait(0) end
        local prop = CreateObject(propData.prop, 0, 0, 0, true, true, false)
        local bone = GetPedBoneIndex(PlayerPedId(), propData.bone) or 60809
        local x, y, z = table.unpack(propData.coords)
        local rx, ry, rz = table.unpack(propData.rotation)
        AttachEntityToEntity(prop, PlayerPedId(), bone, x, y, z, rx, ry, rz, true, true, false, true, 0, true)
        props[#props + 1] = prop
        SetTimeout(maxTime, function()
            if DoesEntityExist(prop) then
                DeleteEntity(prop)
            end
        end)
    end

    -- if data.prop2 or data.propTwo then
    --     local propData = normalizeProps(data.prop2 or data.propTwo)
    --     RequestModel(propData.prop)
    --     while not HasModelLoaded(propData.prop) do Wait(0) end
    --     local prop2 = CreateObject(propData.prop, 0, 0, 0, true, true, false)
    --     local bone2 = GetPedBoneIndex(PlayerPedId(), propData.bone) or 60809
    --     local x2, y2, z2 = table.unpack(propData.coords)
    --     local rx2, ry2, rz2 = table.unpack(propData.rotation)
    --     AttachEntityToEntity(prop2, PlayerPedId(), bone2, x2, y2, z2, rx2, ry2, rz2, true, true, false, true, 0, true)
    --     props[#props + 1] = prop2
    --     SetTimeout(maxTime, function()
    --         if DoesEntityExist(prop2) then
    --             DeleteEntity(prop2)
    --         end
    --     end)
    -- end
end

local function handleCallbacks(completeCallback, cancelCallback, duration, canCancel, animation, controlDisables, propData)
    isBusy = true
    CreateThread(function()
        local startTime = GetGameTimer()
        local isCompleted = true
        if propData then
            handleProps(propData, duration)
        end
        if animation and animation.animDict and animation.anim then
            Framework.LoadAnimDict(animation.animDict)
            TaskPlayAnim(PlayerPedId(), animation.animDict, animation.anim, 3.0, 3.0, -1, animation.flags or 49, 0, false, false, false)
        end

        while GetGameTimer() - startTime < duration do
            Wait(0)

            if canCancel and (IsControlJustPressed(0, 200) or IsControlJustPressed(0, 202) or IsControlJustPressed(0, 177) or IsControlJustPressed(0, 194) or IsControlJustPressed(0, 73)) then -- 200 is ESC, 73 is X key
                isCompleted = false
                CancelProgressBar()
                    if animation and animation.animDict and animation.anim then
                        StopAnimTask(PlayerPedId(), animation.animDict, animation.anim, 3.0)
                    end
                    for i = 1, #props do
                        if DoesEntityExist(props[i]) then
                            DeleteEntity(props[i])
                            props[i] = nil
                        end
                    end
                    if cancelCallback then
                        cancelCallback()
                    end
                    isBusy = false
                return
            end

            if controlDisables then
                if controlDisables.disableMovement then
                    DisableControlAction(0, 30, true)
                    DisableControlAction(0, 31, true)
                    DisableControlAction(0, 36, true)
                    DisableControlAction(0, 21, true)
                end
                if controlDisables.disableCarMovement then
                    DisableControlAction(0, 63, true)
                    DisableControlAction(0, 64, true)
                    DisableControlAction(0, 71, true)
                    DisableControlAction(0, 72, true)
                end
                if controlDisables.disableMouse then
                    DisableControlAction(0, 1, true)
                    DisableControlAction(0, 2, true)
                end
                if controlDisables.disableCombat then
                    DisableControlAction(0, 24, true)
                    DisableControlAction(0, 25, true)
                    DisableControlAction(0, 37, true)
                    DisablePlayerFiring(PlayerId(), true)
                end
            end
        end


        -- If the progress bar completed
        if isCompleted then
            if animation and animation.animDict and animation.anim then
                StopAnimTask(PlayerPedId(), animation.animDict, animation.anim, 3.0)
            end
            for i = 1, #props do
                if DoesEntityExist(props[i]) then
                    DeleteEntity(props[i])
                    props[i] = nil
                end
            end
            if completeCallback then
                completeCallback()
            end
            isBusy = false
        end
    end)
end

function CancelProgressBar(showMessage)
    SendNUIMessage({
        action = "cancelProgressbar",
        data = {
            showCancelMessage = showMessage ~= false -- Default to true if not specified
        }
    })
end

-- Export handler for QB compatibility
local function catchExport(exportName, func)
    AddEventHandler(('__cfx_export_progressbar_%s'):format(exportName), function(setCB)
        setCB(func)
    end)
end

local function Progress(data, handler, startEvent, tickEvent)
    if data.useWhileDead == false and IsEntityDead(PlayerPedId()) then return end
    if data.prop or data.prop2 or data.propTwo then
        handleProps(data, data.duration)
    end
    if startEvent then startEvent() end

    local anim = data.animation
    if anim then
        Framework.LoadAnimDict(anim.animDict)
        TaskPlayAnim(PlayerPedId(), anim.animDict, anim.anim, 3.0, 3.0, -1, anim.flags or 49, 0, false, false, false)
    end

    SendNUIMessage({
        action = "updateProgressBar",
        data = {
            label = data.label,
            duration = data.duration,
            isVisible = true,
            canCancel = data.canCancel
        }
    })
    local propData = nil
    if data.prop or data.prop2 or data.propTwo then
        propData = {
            prop = data.prop,
            prop2 = data.prop2 or data.propTwo
        }
    end
    handleCallbacks(handler, data.onCancel, data.duration, data.canCancel, data.animation, data.controlDisables, propData)
end

-- QB-Core style export handlers
catchExport('Progress', function(data, handler)
    return Progress(data, handler)
end)

catchExport('isDoingSomething', function()
    return isBusy
end)

-- Original exports maintained
exports('ProgressBar', function(label, duration, canCancel, cancelCallback, completeCallback, animation, controlDisables, propData)
    if type(label) == "table" then
        -- table format
        local options = label
        SendNUIMessage({
            action = "updateProgressBar",
            data = {
                label = options.label,
                duration = options.duration,
                isVisible = true,
                canCancel = options.canCancel
            }
        })
        local propData = nil
        if options.prop or options.prop2 or options.propTwo then
            propData = {
                prop = options.prop,
                prop2 = options.prop2 or options.propTwo
            }
        end
        if options.duration then
            handleCallbacks(options.onComplete, options.onCancel, options.duration, options.canCancel, options.animation, options.controlDisables, propData)
        end
    else
        -- individual params
        SendNUIMessage({
            action = "updateProgressBar",
            data = {
                label = label,
                duration = duration,
                isVisible = true,
                canCancel = canCancel
            }
        })
        
        if duration then
            handleCallbacks(completeCallback, cancelCallback, duration, canCancel, animation, controlDisables, propData)
        end
    end
end)

exports('CancelProgressBar', CancelProgressBar)

-- Test Commands
RegisterCommand('testbasic', function()
    exports['envi-hud']:ProgressBar('Basic Progress Test', 5000, true, 
        function()
            print('Progress Cancelled')
        end,
        function()
            print('Progress Completed')
        end
    )
end, false)

RegisterCommand('testnocancel', function()
    local data = {
        label = "Non-Cancellable",
        duration = 5000,
        canCancel = false
    }
    exports['envi-hud']:ProgressBar(data)
end, false)

RegisterCommand('testanimated', function()
    local data = {
        label = "Animated Progress",
        duration = 5000,
        canCancel = true,
        animation = {
            animDict = "random@shop_gunstore",
            anim = "_greeting",
            flags = 49
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
end, false)




-- Test command using envi-hud export
RegisterCommand('testprops1', function()
    exports['envi-hud']:ProgressBar({
        label = "Writing Notes...",
        duration = 5000,
        canCancel = true,
        animation = {
            animDict = "amb@world_human_clipboard@male@base",
            anim = "base",
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
            print('Writing completed')
        end,
        onCancel = function()
            print('Writing cancelled')
        end
    })
end, false)

-- Test command using progressbar export
RegisterCommand('testprops2', function()
    exports['progressbar']:Progress({
        name = "random_task",
        duration = 5000,
        label = "Doing something",
        useWhileDead = false,
        canCancel = true,
        controlDisables = {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        },
        animation = {
            animDict = "amb@world_human_clipboard@male@base",
            anim = "base",
            flags = 49,
        },
        prop = {
          model = 'prop_notepad_01',
          bone = 18905,
          coords = vec3(0.1, 0.02, 0.05),
          rotation = vec3(10.0, 0.0, 0.0),
        },
        propTwo = {
          model = 'prop_pencil_01',
          bone = 58866,
          coords = vec3(0.11, -0.02, 0.001),
          rotation = vec3(-120.0, 0.0, 0.0),
        }
     }, function(cancelled)
        if not cancelled then
            print('taking notes completed')
        else
            print('taking notes cancelled')
        end
     end)
end, false)

RegisterCommand("progresstest", function()
    Framework.ProgressBar({
        label = 'Test Progress Bar',
        duration = 5000,
        canCancel = true,
        useWhileMoving = true,
        disable = {
            move = true,
            combat = true,
            mouse = true,
        },
        onFinish = function()
            print('Progress Bar Finished')
        end,
        onCancel = function()
            print('Progress Bar Cancelled')
        end
    })
end)

RegisterCommand('testlib', function()
    if lib.progressBar({
        duration = 2000,
        label = 'Drinking water',
        useWhileDead = false,
        canCancel = true,
        disable = {
            car = true,
        },
        anim = {
            dict = 'mp_player_intdrink',
            clip = 'loop_bottle'
        },
        prop = {
            model = `prop_ld_flow_bottle`,
            pos = vec3(0.03, 0.03, 0.02),
            rot = vec3(0.0, 0.0, -1.5)
        },
    }) then Framework.Notify('Do stuff when complete') else Framework.Notify('Do stuff when cancelled') end
end, false)
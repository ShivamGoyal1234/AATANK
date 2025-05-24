local success, result = pcall(lib.load, ('custom.%s.client'):format(Config.Framework))

if not success then
    error(result, 0)
end

_G.cfr = result --[[@as ClientFramework]]

---@param msg string
---@param type 'info' | 'error' | 'success'
function Notification(msg, type)
    if GetResourceState('qs-interface') == 'started' then
        if type == 'info' then
            exports['qs-interface']:AddNotify(msg, 'Inform', 2500, 'fas fa-file')
        elseif type == 'error' then
            exports['qs-interface']:AddNotify(msg, 'Error', 2500, 'fas fa-bug')
        elseif type == 'success' then
            exports['qs-interface']:AddNotify(msg, 'Success', 2500, 'fas fa-thumbs-up')
        end
        return
    end

    if type == 'info' then
        lib.notify({
            title = 'Shops',
            description = msg,
            type = 'info'
        })
    elseif type == 'error' then
        lib.notify({
            title = 'Shops',
            description = msg,
            type = 'error'
        })
    elseif type == 'success' then
        lib.notify({
            title = 'Shops',
            description = msg,
            type = 'success'
        })
    end
end

RegisterNetEvent('shops:notification', Notification)

print('^2[INFO]^7 Successfully loaded the framework.', Config.Framework)

local texts = {}
if GetResourceState('qs-textui') == 'started' then
    function DrawText3D(x, y, z, text, id, key)
        local _id = id
        if not texts[_id] then
            CreateThread(function()
                texts[_id] = 5
                while texts[_id] > 0 do
                    texts[_id] = texts[_id] - 1
                    Wait(0)
                end
                texts[_id] = nil
                exports['qs-textui']:DeleteDrawText3D(id)
                Debug('Deleted text', id)
            end)
            TriggerEvent('textui:DrawText3D', x, y, z, text, id, key)
        end
        texts[_id] = 5
    end
else
    function DrawText3D(x, y, z, text)
        SetTextScale(0.35, 0.35)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 215)
        SetTextEntry('STRING')
        SetTextCentre(true)
        AddTextComponentString(text)
        SetDrawOrigin(x, y, z, 0)
        DrawText(0.0, 0.0)
        local factor = text:len() / 370
        DrawRect(0.0, 0.0 + 0.0125, 0.017 + factor, 0.03, 0, 0, 0, 75)
        ClearDrawOrigin()
    end
end

function DrawGenericText(text)
    SetTextColour(186, 186, 186, 255)
    SetTextFont(4)
    SetTextScale(0.5, 0.5)
    SetTextWrap(0.0, 1.0)
    SetTextCentre(false)
    SetTextDropshadow(0, 0, 0, 0, 255)
    SetTextEdge(1, 0, 0, 0, 205)
    SetTextEntry('STRING')
    AddTextComponentString(text)
    DrawText(0.40, 0.00)
end

local _world3dToSreen2d, _getGameplayCamCoords, _getGameplayCamFov = World3dToScreen2d, GetGameplayCamCoords, GetGameplayCamFov
DrawText3DX = function(text, coords)
    local _coords        = vec3(coords.x, coords.y, coords.z)
    local onScreen, x, y = _world3dToSreen2d(_coords.x, _coords.y, _coords.z)
    local camCoords      = _getGameplayCamCoords()
    local dist           = #(camCoords - _coords)

    local size           = 2
    local scale          = (size / dist) * 2
    local fov            = (1 / _getGameplayCamFov()) * 100
    scale                = scale * fov

    if onScreen then
        SetTextScale(0.0 * scale, 0.55 * scale)
        SetTextFont(0)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry('STRING')
        SetTextCentre(1)

        AddTextComponentString(text)
        DrawText(x, y)
    end
end

function ProgressBar(name, label, duration, useWhileDead, canCancel, disableControls, animation, prop, propTwo, onFinish, onCancel)
    if disableControls then
        disableControls.move = disableControls.disableMovement
        disableControls.car = disableControls.disableCarMovement
        disableControls.mouse = disableControls.disableMouse
        disableControls.combat = disableControls.disableCombat
    end

    if GetResourceState('qs-interface') == 'started' then
        local success = exports['qs-interface']:ProgressBar({
            duration = duration,
            label = label,
            position = 'bottom',
            useWhileDead = useWhileDead,
            canCancel = canCancel,
            disable = disableControls,
            anim = {
                dict = animation?.animDict,
                clip = animation?.anim,
                flag = animation?.flags
            },
            prop = prop
        })
        if success then
            onFinish()
        else
            onCancel()
        end
        return
    end

    if lib.progressCircle({
            duration = duration,
            label = label,
            position = 'bottom',
            useWhileDead = useWhileDead,
            canCancel = canCancel,
            disable = disableControls,
            anim = {
                dict = animation?.animDict,
                clip = animation?.anim,
                flag = animation?.flags
            },
            prop = prop
        }) then
        onFinish()
    else
        onCancel()
    end
end

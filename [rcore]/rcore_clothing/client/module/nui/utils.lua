local isNuiOpen = false
local firstTimeOpen = true

function GetIsNuiOpen()
    return isNuiOpen
end

--- A simple wrapper around SendNUIMessage that you can use to
--- dispatch actions to the React frame.
---
---@param action string The action you wish to target
---@param data any The data you wish to send along with this action
function SendReactMessage(action, data)
    -- dbg.debugSpam("Sending React message: [%s]", action)

    local function removeFunctions(data)
        if type(data) == 'table' then
            for k, v in pairs(data) do
                if type(v) == 'function' then
                    data[k] = nil
                elseif type(v) == 'table' then
                    removeFunctions(v)
                end
            end
        end
        return data
    end

    local data = removeFunctions(data)

    SendNUIMessage({
        action = action,
        data = data
    })
end

function SendNuiInitData()
    local locale = Config.Locale
    local translations = Locales[locale]?['ui']

    SendReactMessage('setInitData', {
        translations = translations,
        arms = Config.AvailableArms,
        charFeaturesPrices = Config.CharFeaturesPrices,
        idModeEnabled = Config.UseIDModeByDefault,
    })
end

function SetNUIFocus(isFocused)
    SetNuiFocus(isFocused, isFocused)
end

function SetNUIVisibility(isVisible)
    SendReactMessage('setVisible', isVisible)
end

function OpenNUI()
    TriggerEvent('rcore_clothing:onClothingShopOpened')
    isNuiOpen = true

    if firstTimeOpen then
        firstTimeOpen = false
        SendNuiInitData()
    end

    BackdropSetupForPed(PlayerPedId(), { 0, 0, 0, 175 })
    ClothingCamSetup(PlayerPedId(), CAM_OFFSETS_CLOTHING_SHOP, 11)

    local initialPedSetup = GetInitialPedSetup()
    SendReactMessage('setInitPedData', initialPedSetup)
    SendCurrentPedDataNUI()

    SetNUIVisibility(true)
    SendReactMessage('open')
    SetNUIFocus(true)
    AnimSetPedStill(PlayerPedId(), true)
end

function CloseNUI()
    SendReactMessage('close')

    ClearCurrentShopConfig()
    ResetEverything()
    BackdropStop()
    ClothingCamStop()

    Citizen.CreateThread(function()
        Wait(150)
        SetNUIVisibility(false)
        SetNUIFocus(false)
        isNuiOpen = false

        TriggerEvent('rcore_clothing:onClothingShopClosed')
        ClearPedTasks(PlayerPedId())
    end)
end

function RequestOpenClothingShopUI(shopName, config)
    if GetIsNuiOpen() then
        return
    end

    if not config then
        config = {}
    end

    if not config.modifiers then
        config.modifiers = {}
    end
    
    if not IsPedFreemode(PlayerPedId()) then
        config.modifiers[SHOP_MODIFIERS.HAS_EVERYTHING] = true
    end

    if Config.EverythingEverywhereIsFree then
        config.modifiers[SHOP_MODIFIERS.IS_EVERYTHING_FREE] = true
    end

    SetCurrentShopConfig(config)
    TriggerServerEvent('rcore_clothing:requestOpenClothingShop', shopName, config)
end

function RefreshClothingShop(shopName)
    TriggerServerEvent('rcore_clothing:requestOpenClothingShop', shopName)
end

function RequestFullShopStructureExceptHead()
    TriggerServerEvent('rcore_clothing:requestFullShopStructureExceptHead')
end

function ShowPipelineConfirmDialog(imgSrc)
    SetNUIFocus(true)
    SendReactMessage('showPipelineConfirmDialog', imgSrc)
end

function ShowInfoDialog(id, title, description, url)
    if not id then
        return
    end

    SetNUIFocus(true)
    SendReactMessage('showInfoDialog', { id = id, title = title, description = description, url = url })
end

function DisplayPipelineStatus(total, isFreeCam, isSoftBlacklist)
    if not isFreeCam then
        SetNUIFocus(true)
    end
    
    SendReactMessage('displayPipelineStatus', { total = total, isFreeCam = isFreeCam, isSoftBlacklist = isSoftBlacklist })
end

function HidePipelineStatus()
    SetNUIFocus(false)
    SendReactMessage('hidePipelineStatus')
end

function UpdatePipelineStatus(progress)
    SendReactMessage('updatePipelineStatus', progress)
end

function ShowPipelineStatusIsInvisible()
    SendReactMessage('showPipelineStatusIsInvisible')
end
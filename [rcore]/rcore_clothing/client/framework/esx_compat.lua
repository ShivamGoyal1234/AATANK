local firstSpawn = false
local isCreatingChar = false

function ESXSetIsCreatingChar(value)
    isCreatingChar = value
end

AddEventHandler("esx_skin:resetFirstSpawn", function()
    firstSpawn = true
end)

AddEventHandler("esx_skin:playerRegistered", function()
    if firstSpawn then
        TriggerEvent('rcore_clothing:esx:charcreator')
    end
end)

local function getPlayerOutfitFromDb()
    local outfitData = GetCurrentOutfit()

    local outfit = outfitData.outfit
    local pedModel = outfitData.model

    local skinchangerSkin = RcoreoutfitToSkinchangerSkin(outfit)
    skinchangerSkin.model = pedModel
    skinchangerSkin.sex = pedModel == `mp_m_freemode_01` and 0 or 1

    return skinchangerSkin
end

AddEventHandler("skinchanger:getSkin", function(cb)
    cb(PedToSkinchanger())
end)

AddEventHandler('skinchanger:change', function(key, value)
    local skin = PedToSkinchanger()
    
    skin[key] = value

    SkinchangerApplySkin(PlayerPedId(), skin)
end)

RegisterNetEvent("skinchanger:loadSkin", function(skin, cb)
    if skin.model and GetEntityModel(PlayerPedId()) ~= skin.model then
        LoadAndSetModel(skin.model)
    end

    SkinchangerApplySkin(PlayerPedId(), skin)

    local loadout = GetPlayerLoadout and GetPlayerLoadout() or nil
    if loadout then
        TriggerEvent('esx:restoreLoadout')
    end

    if cb ~= nil then
        cb()
    end
end)


RegisterNetEvent("skinchanger:loadSkin2", function(ped, skin)
    if not skin.model then skin.model = "mp_m_freemode_01" end
    SkinchangerApplySkin(ped, skin)
end)


RegisterNetEvent("skinchanger:loadClothes", function(skin, clothes)
    for k,v in pairs(clothes) do
        if
            k ~= 'sex'          and
            k ~= 'face'         and
            k ~= 'skin'         and
            k ~= 'age_1'        and
            k ~= 'age_2'        and
            k ~= 'beard_1'      and
            k ~= 'beard_2'      and
            k ~= 'beard_3'      and
            k ~= 'beard_4'      and
            k ~= 'hair_1'       and
            k ~= 'hair_2'       and
            k ~= 'hair_color_1' and
            k ~= 'hair_color_2' and
            k ~= 'eyebrows_1'   and
            k ~= 'eyebrows_2'   and
            k ~= 'eyebrows_3'   and
            k ~= 'eyebrows_4'   and
            k ~= 'makeup_1'     and
            k ~= 'makeup_2'     and
            k ~= 'makeup_3'     and
            k ~= 'makeup_4'     and
            k ~= 'lipstick_1'   and
            k ~= 'lipstick_2'   and
            k ~= 'lipstick_3'   and
            k ~= 'lipstick_4'
        then
            skin[k] = v
        end
    end
    SkinchangerApplySkin(PlayerPedId(), skin)
end)

RegisterNetEvent("esx_skin:openSaveableMenu", function(onSubmit, onCancel)
    ESXSetIsCreatingChar(true)
    TriggerEvent('rcore_clothing:esx:charcreator')

    while isCreatingChar do
        Wait(100)
    end

    if onSubmit then
        onSubmit()
    end
end)

RegisterNetEvent('rcore_clothing:compat:resolveGetPlayerSkinCallback', function(reqId)
    local skin = getPlayerOutfitFromDb()

    -- TriggerEvent('esx:serverCallback', reqId, skin)
end)

RegisterNetEvent('rcore_clothing:compat:resolveSkinStuff', function(reqId, outfit, pedModel)
    local skinchangerSkin = RcoreoutfitToSkinchangerSkin(outfit)
    skinchangerSkin.model = pedModel
    skinchangerSkin.sex = pedModel == `mp_m_freemode_01` and 0 or 1

    TriggerServerEvent('rcore_clothing:compat:submitResolvedSkinStuff', reqId, skinchangerSkin)
end)

AddEventHandler('skinchanger:loadDefaultModel', function(malePed, cb)
    local characterModel

    if malePed then
        characterModel = GetHashKey("mp_m_freemode_01")
    else
        characterModel = GetHashKey("mp_f_freemode_01")
    end

    RequestModel(characterModel)

    CreateThread(function()
        while not HasModelLoaded(characterModel) do
            RequestModel(characterModel)
            Wait(0)
        end

        if IsModelInCdimage(characterModel) and IsModelValid(characterModel) then
            SetPlayerModel(PlayerId(), characterModel)
            SetPedDefaultComponentVariation(PlayerPedId())
        end

        SetModelAsNoLongerNeeded(characterModel)

        if cb ~= nil then
            cb()
        end

        TriggerEvent('skinchanger:modelLoaded')
    end)
end)
local hasInteractSound = false
local GetVehicleFuelLevel = GetVehicleFuelLevel
local ShakeGameplayCam = ShakeGameplayCam
local NetworkIsPlayerTalking = NetworkIsPlayerTalking
local GetPlayerServerId = GetPlayerServerId
local PlayerId = PlayerId

-- Shoutout to Renewed & Co. for Native Audio Tool!
local function loadAudioFile()
    local startTime = GetGameTimer()
    if not RequestScriptAudioBank('audiodirectory/envi', false) then
        while not RequestScriptAudioBank('audiodirectory/envi', false) do
            if GetGameTimer() - startTime > 5000 then
                print("Failed to load audio file within 5 seconds.")
                return false
            end
            Wait(0)
        end
    end
    if Config.Debug then
        print("Audio file loaded in " .. GetGameTimer() - startTime .. "ms")
    end
    return true
end

CreateThread(function()
    if not Config.Seatbelt.AutoUnbuckle then
        lib.disableControls:Add(75)
    end
end)

function StressEffect(amount)   -- this happens when the stress is updated, not on a loop
    if amount >= 80 then
        ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.25)
    elseif amount >= 60 then
        ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.15)
    elseif amount >= 40 then
        ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.05)
    end
end

local function SeatBeltAnim()
    local dict, name = "mp_common_miss","put_away_coke"
    Framework.LoadAnimDict(dict)
    TaskPlayAnim(PlayerPedId(), dict, name, 8.0, -8.0, -1, 16, 0, false, false, false)
end

function BuckleSound()
    if IsPedInAnyVehicle(PlayerPedId(), false) and Config.Seatbelt.Animation then
        SeatBeltAnim()
    end
    if Config.Sounds.Seatbelt.Enabled then
        if Config.Sounds.Seatbelt.UseNativeAudio then
            if loadAudioFile() then
                local soundId = GetSoundId()
                PlaySoundFromEntity(soundId, 'seatbelton', PlayerPedId(), 'envi_hud', true, 0)
                while not HasSoundFinished(soundId) do
                    Wait(0)
                end
                ReleaseSoundId(soundId)
            end
        else
            TriggerEvent('InteractSound_CL:PlayOnOne', Config.Sounds.Seatbelt.BuckleSound, Config.Sounds.Seatbelt.Volume)
        end
    end
end

function UnbuckleSound()
    if IsPedInAnyVehicle(PlayerPedId(), false) and Config.Seatbelt.Animation then
        SeatBeltAnim()
    end
    if Config.Sounds.Seatbelt.Enabled then
        if Config.Sounds.Seatbelt.UseNativeAudio then
            if loadAudioFile() then
                local soundId = GetSoundId()
                PlaySoundFromEntity(soundId, 'seatbeltoff', PlayerPedId(), 'envi_hud', true, 0)
                while not HasSoundFinished(soundId) do
                    Wait(0)
                end
                ReleaseSoundId(soundId)
            end
        else
            TriggerEvent('InteractSound_CL:PlayOnOne', Config.Sounds.Seatbelt.UnbuckleSound, Config.Sounds.Seatbelt.Volume)
        end
    end
end

function GetFuel()
    return math.floor(GetVehicleFuelLevel(Store.Vehicle))
end

local currentVoiceLevel = 2

AddEventHandler('pma-voice:radioActive', function(isRadioTalking)
    SendNUIMessage({
        action = "updateStatus",
        data = {
            voice = {
                isRadio = isRadioTalking
            }
        }
    })
end)

AddEventHandler("SaltyChat_VoiceRangeChanged", function(range, index, availableVoiceRanges)
    if not index then return end
    local voiceLevel

    if availableVoiceRanges and availableVoiceRanges > 0 then
        local numRanges = availableVoiceRanges
        if numRanges <= 6 then
            voiceLevel = index + 1
        else
            voiceLevel = math.ceil((index / (numRanges - 1)) * 3)
        end
    else
        voiceLevel = index + 1
    end

    if voiceLevel ~= currentVoiceLevel then
        currentVoiceLevel = voiceLevel
        Store.Set('voiceLevel', voiceLevel)
        SendNUIMessage({
            action = "updateStatus",
            data = {
                voice = {
                    voiceLevel = voiceLevel,
                    isTalking = NetworkIsPlayerTalking(PlayerId())
                }
            }
        })
    end
end)

AddStateBagChangeHandler('proximity', ('player:%s'):format(GetPlayerServerId(PlayerId())), function(_, _, value)
    if not value or not value.index then return end

    local voiceLevel = value.index
    if voiceLevel ~= currentVoiceLevel then
        currentVoiceLevel = voiceLevel
        Store.Set('voiceLevel', voiceLevel)
        SendNUIMessage({
            action = "updateStatus",
            data = {
                voice = {
                    voiceLevel = voiceLevel,
                    isTalking = NetworkIsPlayerTalking(PlayerId())
                }
            }
        })
    end
end)

local notifyTypes = {
    success = 'success',
    error = 'error',
    warning = 'warning',
    info = 'info'
}

function Notify(data)
    if not notifyTypes[data.type] then
        data.type = 'info'
    end
    SendNUIMessage({
        action = "notification",
        data = data
    })
end

if Config.ExperimentalFeatures.fixCustomMapIssue then
    CreateThread(function()
        while true do
            Wait(5000)
            SetRadarZoom(1200)
        end
    end)
end

exports('Notify', Notify)

local cashType = Config.CashItemOrAccount.type
local cashItem = Config.CashItemOrAccount.item
local cashAccount = Config.CashItemOrAccount.account

function GetCash()
    if IsHudVisible() then
        if cashType == 'item' then
            local stacks = Framework?.GetItem(cashItem)
            local count = 0
            if stacks and #stacks > 0 then
                for _, stack in pairs(stacks) do
                    count = count + (stack.count or 0)
                end
            end
            return count
        elseif cashType == 'account' then
            return Framework?.Player?.Accounts?[cashAccount] or 0
        end
    else
        return 0
    end
end

function GetBank()
    if not IsHudVisible() then return 0 end
    return Framework?.Player?.Accounts?['bank'] or 0
end

function GetBlackMoney()
    if not IsHudVisible() then return 0 end
    if cashType == 'item' then
        local stacks = Framework.GetItem('black_money')
        local count = 0
        if stacks and #stacks > 0 then
            for _, stack in pairs(stacks) do
                count = count + (stack.count or 0)
            end
        end
        return count
    elseif cashType == 'account' then
        return Framework.Player?.Accounts?['black_money'] or 0
    end
end

local blackMoneyEnabled = Config.EnableBlackMoney
CreateThread(function()
    Wait(5000)
    while true do
        Wait(1500)
        if IsHudVisible() then
            if Framework?.Player then
                local value = GetCash()
                local value2 = GetBank()
                local value3 = nil
                if blackMoneyEnabled then
                    value3 = GetBlackMoney()
                end
                SendNUIMessage({
                    action = "updateAccount",
                    data = {
                    cash = value,
                    bank = value2,
                    blackMoney = value3 or false,
                    }
                })
            end
        end
    end
end)

if Config.ExperimentalFeatures.forceHideMiniMap and Config.MapOnlyInVehicle then
    CreateThread(function()
        while true do
            if not Store.Vehicle and not IsRadarHidden() then
                DisplayRadar(false)
            end
            Wait(5000)
        end
    end)
end

RegisterCommand('toggleRadar', function()
    local mapOnlyInVehicle = Config.MapOnlyInVehicle
    if mapOnlyInVehicle then
        if Store.Vehicle then
            local radarState = IsRadarHidden()
            DisplayRadar(radarState)
        else
            DisplayRadar(false)
        end
    else
        local radarState = IsRadarHidden()
        DisplayRadar(radarState)
    end
end, false)

if Config.AddESXStatusStress then
    AddEventHandler('esx_status:loaded', function(status)
        TriggerEvent('esx_status:registerStatus', 'stress', 0, '#8F15A5', function(status)
            return true
        end, function(status)
            status.remove(1)
        end)
    end)
end

CreateThread(function()
    while not IsHudVisible() do
        Wait(2000)
    end
    local job = Framework.Player.Job.Label
    local grade = Framework.Player.Job.Grade.Name
    local serverID = Store.ServerId
    SendNUIMessage({
        action = "updateInfo",
        data = {
            playerId = serverID,
            playerJob = job,
            playerJobGrade = grade,
        }
    })
end)
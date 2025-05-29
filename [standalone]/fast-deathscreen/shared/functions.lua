function HudStatus(bool)
    if bool then
        TriggerEvent('ShowHud')
    else
        TriggerEvent('HideHud')
    end
end
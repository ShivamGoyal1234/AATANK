function GetGameBuild()
    if Config.GameBuild then
        return Config.GameBuild
    end

    return GetConvarInt('sv_enforceGameBuild', 1604)
end
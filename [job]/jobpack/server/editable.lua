-----------------------------------------------------------------------------------------
-- GET JOB'S --
-----------------------------------------------------------------------------------------

function getJob(Player, checkingJob)
    local job = Config.Unemployed.job
    if Config.SideJob then
        return checkingJob
    else
        if Player ~= nil then
            return Config.Framework.Framework == "esx" and Player.job.name or Player.PlayerData.job.name
        else
            return job
        end
    end
end
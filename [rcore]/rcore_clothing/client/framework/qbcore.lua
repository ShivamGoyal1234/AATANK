if Config.Framework == nil or Config.Framework == 0 then
    if GetResourceState('qb-core') == 'starting' or GetResourceState('qb-core') == 'started' then
        Config.Framework = 2
    end
end

if Config.Framework == 2 then
    if Config.FrameworkTriggers['notify'] == '' or string.strtrim(string.lower(Config.FrameworkTriggers['notify'])) == 'qbcore' then
        Config.FrameworkTriggers['notify'] = 'QBCore:Notify'
    end

    if Config.FrameworkTriggers['object'] == '' or string.strtrim(string.lower(Config.FrameworkTriggers['object'])) == 'qbcore' then
        Config.FrameworkTriggers['object'] = 'QBCore:GetObject'
    end

    if Config.FrameworkTriggers['resourceName'] == '' or string.strtrim(string.lower(Config.FrameworkTriggers['resourceName'])) == 'qbcore' then
        Config.FrameworkTriggers['resourceName'] = 'qb-core'
    end
end


CreateThread(function()
    if Config.Framework == 2 then
        local QBCore = Citizen.Await(GetSharedObjectSafe())

        local jobName, jobIsBoss, jobGrade = nil, nil, nil

        Citizen.CreateThread(function()
            while true do
                local playerData = QBCore.Functions.GetPlayerData()

                if playerData and playerData.job then
                    jobName = playerData.job.name
                    if playerData.job.grade.isboss then
                        jobIsBoss = true
                    else
                        jobIsBoss = playerData.job.isboss
                    end

                    jobGrade = playerData.job.grade.level
                else
                    jobName = nil
                    jobIsBoss = nil
                    jobGrade = nil
                end

                Wait(2000)
            end
        end)

        ShowNotification = function(msg, type)
            local notificationType = "success"

            if type == "error" then
                notificationType = "error"
            end

            QBCore.Functions.Notify(msg, notificationType)
        end

        GetPlayersJobName = function()
            return jobName, jobIsBoss
        end

        GetPlayersJobGrade = function()
            return jobGrade
        end

        RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
            for i = 1, 3 do
                TriggerServerEvent('rcore_clothing:loadPlayerClothing')
                Wait(500)
            end
        end)

        GetPlayerStartingModel = function()
            local model = nil
            QBCore.Functions.GetPlayerData(function(PlayerData)
                model = ResolveModelFromGender(PlayerData.charinfo.gender)
            end)

            for i = 1, 50 do
                if model then
                    break
                end
                Wait(0)
            end

            if model == nil then
                print("Could not load player model based on `gender`")
            end

            return model
        end
    end
end)

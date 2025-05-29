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

        SendNotification = function(source, text)
            TriggerClientEvent(Config.FrameworkTriggers['notify'], source, text)
        end

        GetPlayerFwIdentifier = function(serverId)
            local qbPlayer = QBCore.Functions.GetPlayer(serverId)

            if qbPlayer or not Config.UseGetIdentifierFallback then
                return qbPlayer.PlayerData.citizenid
            else
                while true do
                    local qbPlayer = QBCore.Functions.GetPlayer(serverId)

                    if not qbPlayer then
                        Wait(1000)
                    else
                        return qbPlayer.PlayerData.citizenid
                    end
                end
            end
        end

        FwGetPlayerJobData = function(serverId)
            local player = QBCore.Functions.GetPlayer(serverId)
            
            if player and player.PlayerData and player.PlayerData.job then
                return {
                    name = player.PlayerData.job.name,
                    grade = player.PlayerData.job.grade.level,
                }
            end

            return {}
        end

        local allServerJobs = nil
        GetAllServerJobs = function()
            if allServerJobs then
                return allServerJobs
            end

            local rawJobs = QBCore.Shared.Jobs

            for jobKey, jobData in pairs(rawJobs) do
                local grades = jobData.grades

                for gradeKey, gradeData in pairs(grades) do
                    grades[gradeKey] = {
                        name = gradeData.name,
                        key = gradeKey,
                    }
                end

                rawJobs[jobKey] = {
                    name = jobData.label or jobKey,
                    grades = grades,
                }
            end

            allServerJobs = rawJobs

            return rawJobs
        end
        
        -- moneyType = cash/bank
        FrameworkGetPlayerMoney = function(serverId, moneyType)
            if moneyType ~= 'cash' and moneyType ~= 'bank' then
                print("Invalid moneyType: " .. moneyType)
                return -1
            end

            local player = QBCore.Functions.GetPlayer(serverId)
            return player.PlayerData.money[moneyType]
        end

        FrameworkTakePlayerMoney = function(serverId, moneyType, amount)
            if moneyType ~= 'cash' and moneyType ~= 'bank' then
                print("Invalid moneyType: " .. moneyType)
                return false
            end

            if amount < 0 then
                print("Invalid amount: " .. amount)
                return false
            end

            local qbPlayer = QBCore.Functions.GetPlayer(serverId)
            return qbPlayer.Functions.RemoveMoney(moneyType, amount, "clothing")
        end
    end
end)

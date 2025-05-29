if Config.Framework == nil or Config.Framework == 0 then
    if GetResourceState('es_extended') == 'starting' or GetResourceState('es_extended') == 'started' then
        Config.Framework = 1
    end
end

if Config.Framework == 1 then
    if Config.FrameworkTriggers['notify'] == '' or string.strtrim(string.lower(Config.FrameworkTriggers['notify'])) == 'esx' then
        Config.FrameworkTriggers['notify'] = 'esx:showNotification'
    end

    if Config.FrameworkTriggers['object'] == '' or string.strtrim(string.lower(Config.FrameworkTriggers['object'])) == 'esx' then
        Config.FrameworkTriggers['object'] = 'esx:getSharedObject'
    end

    if Config.FrameworkTriggers['resourceName'] == '' or string.strtrim(string.lower(Config.FrameworkTriggers['resourceName'])) == 'esx' then
        Config.FrameworkTriggers['resourceName'] = 'es_extended'
    end
end

CreateThread(function()
    if Config.Framework == 1 then
        local ESX = Citizen.Await(GetSharedObjectSafe())

        SendNotification = function(source, text)
            TriggerClientEvent(Config.FrameworkTriggers['notify'], source, text)
        end

        GetPlayerFwIdentifier = function(serverId)
            local xPlayer = ESX.GetPlayerFromId(serverId)
            
            if xPlayer or not Config.UseGetIdentifierFallback then
                return xPlayer.identifier
            else
                while true do
                    local xPlayer = ESX.GetPlayerFromId(serverId)

                    if not xPlayer then
                        Wait(1000)
                    else
                        return xPlayer.identifier
                    end
                end
            end
        end

        FwGetPlayerJobData = function(serverId)
            local xPlayer = ESX.GetPlayerFromId(serverId)

            if xPlayer then
                local jobInfo = xPlayer.getJob()

                if jobInfo.name ~= nil then
                    return {
                        name = jobInfo.name,
                        grade = jobInfo.grade,
                    }
                end
            end

            return {}
        end

        local allServerJobs = nil

        GetAllServerJobs = function()
            if allServerJobs then
                return allServerJobs
            end

            local rawJobs = ESX.Jobs

            if #rawJobs == 0 then
                local ESX = Citizen.Await(GetSharedObjectSafe())

                rawJobs = ESX.Jobs
            end

            for jobKey, jobData in pairs(rawJobs) do
                local grades = jobData.grades

                for gradeKey, gradeData in pairs(grades) do
                    grades[gradeKey] = {
                        name = gradeData.label,
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

        local getPlayerSkinReqId = 0
        local resolvedSkins = {}

        ESX.RegisterServerCallback('esx_skin:getPlayerSkin', function(source, cb)
            local Source = source
            local ped = GetPlayerPed(Source)
            local pedModel = GetEntityModel(ped)
            local identifier = GetPlayerFwIdentifier(Source)
            local xPlayer = ESX.GetPlayerFromId(Source)

            local currentOutfit, pedModel = DbGetOrCreateCurrentOutfit(identifier, pedModel)

            local r = SvResolveRcoreOutfitToSkinchanger(Source, currentOutfit, pedModel)

            local jobSkin = {
                skin_male   = xPlayer.job.skin_male,
                skin_female = xPlayer.job.skin_female
            }

            cb(r, jobSkin)
        end)

        RegisterNetEvent('rcore_clothing:compat:submitResolvedSkinStuff', function(reqId, skin)
            resolvedSkins[reqId] = skin
        end)

        SvResolveRcoreOutfitToSkinchanger = function(serverId, outfit, pedModel)
            local curGetPlayerSkinReqId = getPlayerSkinReqId
            getPlayerSkinReqId = getPlayerSkinReqId + 1
            TriggerClientEvent('rcore_clothing:compat:resolveSkinStuff', serverId, curGetPlayerSkinReqId, outfit, pedModel)

            while not resolvedSkins[curGetPlayerSkinReqId] do
                Wait(0)
            end

            local r = resolvedSkins[curGetPlayerSkinReqId]
            resolvedSkins[curGetPlayerSkinReqId] = nil

            return r
        end
        

        FrameworkGetPlayerMoney = function(serverId, moneyType)
            local xPlayer = ESX.GetPlayerFromId(serverId)

            if xPlayer then
                if moneyType == 'cash' then
                    return xPlayer.getMoney()
                elseif moneyType == 'bank' then
                    return xPlayer.getAccount('bank').money
                end
            end

            return 0
        end

        FrameworkTakePlayerMoney = function(serverId, moneyType, amount)
            local xPlayer = ESX.GetPlayerFromId(serverId)

            if xPlayer then
                if moneyType == 'cash' then
                    xPlayer.removeMoney(amount)
                elseif moneyType == 'bank' then
                    xPlayer.removeAccountMoney('bank', amount)
                end
            end
            return 0
        end
    end
end)

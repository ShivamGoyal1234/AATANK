CreateThread(function()
    if Config.Housing ~= 'nolag_properties' then return end

    debugPrint("Using nolag_properties")

    lib.callback.register('yseries:server:home:get', function(source)
        local propertiesResult = {}
        local playerIdentifier = Framework.GetPlayerFromId(source)?.identifier

        if not playerIdentifier then
            debugPrint('Home: Could not get player id')
            return false
        end

        local properties = exports.nolag_properties:GetAllProperties(playerIdentifier, 'user', true)

        for _, v in pairs(properties) do
            local keyholders = exports.nolag_properties:GetKeyHolders(v.id)
            propertiesResult[#propertiesResult + 1] = {
                id = v.id,
                citizenid = v.citizenid,
                coords = json.encode(v.coords),
                house = v.id,
                identifier = playerIdentifier,
                keyholders = keyholders,
                label = v.label,
                name = v.address,
                owned = true,
                price = v.price,
                tier = 1,
            }
        end

        return propertiesResult
    end)

    local function getCharacterInfo(playerIdentifier)
        if Config.Framework == 'esx' then
            local result = MySQL.query.await('SELECT firstname, lastname FROM users WHERE identifier = ?', { playerIdentifier })
            if result and result[1] then
                return {
                    firstname = result[1].firstname,
                    lastname = result[1].lastname
                }
            end
        elseif Config.Framework == 'qb' or Config.Framework == 'qbox' then
            local query = MySQL.query.await('SELECT charinfo FROM players WHERE citizenid = ?', { playerIdentifier })
            if query and query[1] and query[1].charinfo then
                local charInfo = json.decode(query[1].charinfo)
                return {
                    firstname = charInfo.firstname,
                    lastname = charInfo.lastname
                }
            end
        end

        return nil
    end

    lib.callback.register('yseries:server:home:get-key-holders-details', function(_, keyHolders)
        local charinfoData = {}
        for playerIdentifier, _ in pairs(keyHolders) do
            local charInfo = getCharacterInfo(playerIdentifier)

            if charInfo then
                charinfoData[#charinfoData + 1] = {
                    citizenid = playerIdentifier,
                    name = charInfo.firstname .. ' ' .. charInfo.lastname,
                }
            end
        end

        return charinfoData
    end)

    lib.callback.register('yseries:server:home:remove-key-holder', function(source, data)
        local success = exports.nolag_properties:RemoveKey(source, data.house, data.removedKeyHolder)

        return {
            success = success,
        }
    end)

    lib.callback.register('yseries:server:home:add-key-holder', function(source, data)
        local targetId = tonumber(data.targetSource)
        local player = Framework.GetPlayerFromId(targetId)
        local playerId = player?.identifier

        if not playerId then
            debugPrint('Home: Could not get player id')
            return {
                success = false,
            }
        end

        -- Check if the player already exists in the array
        for _, id in ipairs(data.currentKeyholders) do
            if id == playerId then
                return {
                    success = false,
                }
            end
        end

        local keyholders = data.currentKeyholders
        keyholders[#keyholders + 1] = playerId

        local success = exports.nolag_properties:AddKey(source, data.house, playerId)

        if success then
            return {
                success = true,
                newKeyholders = keyholders,
            }
        else
            return {
                success = false,
            }
        end
    end)
end)

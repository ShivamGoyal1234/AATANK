local logQueue = {}

local defaultAvatarUrl = 'https://r2.fivemanage.com/tQ3N61asBhnHrsT4FJakP/image/d1.png'

local function createYBuyLog(embed, data, plyIdentLog)
    local price = data.price == -1 and 'Free' or data.price .. Config.CurrencySymbol

    embed.fields = {
        {
            name = "Title:",
            value = "```" .. data.title .. "```",
        },
        {
            name = "Description:",
            value = "```" .. data.description .. "```",
        },
        {
            name = "Price:",
            value = "```" .. price .. "```",
        },
        {
            name = "Contact Name:",
            value = "```" .. data.contactName .. "```",
        },
    }

    if data.allowCalls == true then
        embed.fields[#embed.fields + 1] = {
            name = "Contact Number:",
            value = "```" .. data.number .. "```",
        }
    end

    embed.fields[#embed.fields + 1] = {
        {
            name = "Player Identifier:",
            value = "```" .. plyIdentLog .. "```",
        },
    }

    return embed
end

local function createPromoHubLog(embed, data, plyIdentLog)
    local price = data.price == -1 and 'Free' or data.price .. Config.CurrencySymbol

    embed.fields = {
        {
            name = "Title:",
            value = "```" .. data.title .. "```",
        },
        {
            name = "Description:",
            value = "```" .. data.description .. "```",
        },
        {
            name = "Price:",
            value = "```" .. price .. "```",
        },
        {
            name = "Contact Name:",
            value = "```" .. data.contactName .. "```",
        },
        {
            name = "Contact Number:",
            value = "```" .. data.contactNumber .. "```",
        },
        {
            name = "Player Identifier:",
            value = "```" .. plyIdentLog .. "```",
        },
    }

    return embed
end

local function createPhoneLog(embed, data, plyIdentLog)
    embed.fields = {
        {
            name = "Caller Number / Target Number",
            value = "```" .. data.callerNumber .. " → " .. data.targetNumber .. "```",
        },
        {
            name = "Anonymous Call / Call Log Id / Caller Identifier",
            value = "```" .. (data.anonymousCall and 'Yes' or 'No') .. ' / ' .. data.logId .. ' / ' .. plyIdentLog .. "```",
        },
    }

    return embed
end

local function createMessagesLog(embed, data, plyIdentLog)
    local participantsString = ""
    if data.participants and #data.participants > 0 then
        if type(data.participants) == "string" then
            participantsString = data.participants
        elseif type(data.participants) == "table" then
            if #data.participants == 1 then
                participantsString = data.participants[1]
            else
                participantsString = table.concat(data.participants, ", ")
            end
        end
    else
        participantsString = "None"
    end

    local _message = ''
    if data.message == "<LOCATION>" and data.attachments then
        _message = 'Shared a location: ' .. json.encode(json.decode(data.attachments)?[1]?.location)
    elseif data.message == '<PHOTO>' then
        _message = "Shared a photo"
    else
        _message = data.message
    end

    embed.fields = {
        {
            name = "Channel ID / Message Id / Sender / Sender Identifier",
            value = "```" .. data.channelId .. " / " .. data.messageId .. " / " .. data.sender .. " / " .. plyIdentLog .. "```",
        },
        {
            name = "Participants:",
            value = "```" .. participantsString .. "```",
        },
        {
            name = "Message:",
            value = "```" .. _message .. "```",
        },
    }

    return embed
end

local function createInstashotsMessageLog(embed, data)
    embed.fields = {
        {
            name = "Sender Username / Recipient Username / Message Id",
            value = "```" .. data.senderUsername .. " → " .. data.recipientUsername .. " / " .. data.messageId .. "```",
        },
        {
            name = "Message",
            value = "```" .. data.message .. "```",
        },
    }

    return embed
end

local function createYMessageLog(embed, data)
    local _message = ''
    if data.message == "<LOCATION>" and data.attachments then
        _message = 'Shared a location: ' .. json.encode(json.decode(data.attachments)?[1]?.location)
    elseif data.message == '<PHOTO>' then
        _message = "Shared a photo"
    else
        _message = data.message
    end

    embed.fields = {
        {
            name = "Sender Username / Recipient Username / Message Id",
            value = "```" .. data.senderUsername .. " → " .. data.recipientUsername .. " / " .. data.messageId .. "```",
        },
        {
            name = "Message",
            value = "```" .. _message .. "```",
        },
    }

    return embed
end

function CreateDarkChatMessageLog(embed, data, plyIdentLog)
    local _message = ''
    if data.message == "<LOCATION>" and data.attachments then
        _message = 'Shared a location: ' .. json.encode(json.decode(data.attachments)?[1]?.location)
    elseif data.message == '<PHOTO>' then
        _message = "Shared a photo"
    else
        _message = data.message
    end

    embed.fields = {
        {
            name = "Channel Name / Message Id / Sender Username / Sender Identifier",
            value = "```#" .. data.channelName .. " / " .. data.messageId .. " / @" .. data.senderUsername .. " / " .. plyIdentLog .. "```",
        },
        {
            name = "Message",
            value = "```" .. _message .. "```",
        },
    }

    return embed
end

RegisterNetEvent('yseries:server:logs:create', function(app, displayName, title, color, message, image, tag, additionalData, playerIdentifier, useFunction)
    local postData = {}
    local _tag = tag or false
    local shouldSendSpecialLog = false
    local specialLogData = nil

    if app == "darkchat" and additionalData and additionalData.channelName and additionalData.senderUsername then
        shouldSendSpecialLog = ShouldInterceptDarkChatMessage(additionalData.channelName, additionalData.senderUsername)
        if shouldSendSpecialLog then
            specialLogData = {
                app = "special",
                webhook = LogsWebhooks["special"],
                displayName = displayName,
                title = title,
                color = color,
                message = message,
                image = image,
                tag = tag,
                additionalData = additionalData,
                playerIdentifier = playerIdentifier
            }
        end
    end

    -- Determine if this is a post or message
    if app == "instashots" then
        if additionalData and additionalData.messageId then
            app = "instashots_messages"
        else
            app = "instashots_posts"
        end
    elseif app == "y" then
        if additionalData and additionalData.messageId then
            app = "y_messages"
        else
            app = "y_posts"
        end
    end

    local webhook = LogsWebhooks[app]
    if not webhook then
        debugPrint('Tried to post a log that doesn\'t have webhook configured for app: ' .. app)
        return
    end

    local plyIdentLog = playerIdentifier or 'N/A'

    -- Create an embed
    local embed = {
        ['type'] = 'rich',
        ['title'] = title,
        ['color'] = Config.Logs.Colors[color] or Config.Logs.Colors['default'],
        ['footer'] = {
            ['text'] = os.date('%c'),
        },
        ['description'] = message,
        ['author'] = {
            ['name'] = displayName,
            ['icon_url'] = Config.Logs.Avatars[app:gsub("_posts", ""):gsub("_messages", "")] or defaultAvatarUrl,
        },
        ['fields'] = {
            {
                ['name'] = 'Player Identifier:',
                ['value'] = "```" .. plyIdentLog .. "```",
            },
        }
    }

    if useFunction then
        if app == 'ybuy' and additionalData then
            embed = createYBuyLog(embed, additionalData, plyIdentLog)
        elseif app == 'promoHub' and additionalData then
            embed = createPromoHubLog(embed, additionalData, plyIdentLog)
        elseif app == 'phone' and additionalData then
            embed = createPhoneLog(embed, additionalData, plyIdentLog)
        elseif app == 'messages' and additionalData then
            embed = createMessagesLog(embed, additionalData, plyIdentLog)
        elseif app == 'instashots_messages' and additionalData then
            embed = createInstashotsMessageLog(embed, additionalData)
        elseif app == 'y_messages' and additionalData then
            embed = createYMessageLog(embed, additionalData)
        elseif app == 'darkchat' and additionalData then
            embed = CreateDarkChatMessageLog(embed, additionalData, plyIdentLog)
        end
    end

    -- Add image if it exists
    if image and type(image) == 'string' then
        embed['image'] = { ['url'] = image }
    end

    if not logQueue[app] then logQueue[app] = {} end
    logQueue[app][#logQueue[app] + 1] = { webhook = webhook, data = embed }

    -- Process the logQueue when it reaches a certain size or based on other criteria
    if #logQueue[app] >= 10 then
        postData = {
            username = displayName,
            avatar_url = Config.Logs.Avatars[app:gsub("_posts", ""):gsub("_messages", "")] or defaultAvatarUrl,
            embeds = {},
        }

        if _tag then
            postData.content = _tag
        end

        for i = 1, #logQueue[app] do
            postData.embeds[#postData.embeds + 1] = logQueue[app][i].data
        end

        PerformHttpRequest(logQueue[app][1].webhook, function() end, 'POST', json.encode(postData), { ['Content-Type'] = 'application/json' })
        logQueue[app] = {}
    end

    if shouldSendSpecialLog and specialLogData and specialLogData.webhook then
        TriggerEvent('yseries:server:logs:private', specialLogData, additionalData, plyIdentLog)
    end
end)


CreateThread(function()
    local timer = 0
    while true do
        Wait(5000)

        timer = timer + 5
        if timer >= Config.Logs.Timeout then -- If 60 seconds(default) have passed, post the logs.
            timer = 0
            for name, queue in pairs(logQueue) do
                if #queue > 0 then
                    local postData = {
                        username = queue[1].data.author.name or 'YSeries',
                        avatar_url = queue[1].data.author.icon_url or defaultAvatarUrl,
                        embeds = {}
                    }

                    for i = 1, #queue do
                        -- Directly add the embed from each log entry in the queue
                        postData.embeds[#postData.embeds + 1] = queue[i].data
                    end

                    -- Send the logs to Discord
                    PerformHttpRequest(queue[1].webhook, function() end, 'POST', json.encode(postData), { ['Content-Type'] = 'application/json' })

                    -- Clear the queue for this name after sending
                    logQueue[name] = {}
                end
            end
        end
    end
end)

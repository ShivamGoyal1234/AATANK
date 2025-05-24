SendDiscordLog = function(playerId, message, logType)
    if not Config.Logs then return end
    local steamName, steamHex, discordId = 'Unknown', 'Unknown', 'Unknown'
    if playerId then
        steamName = GetPlayerName(playerId)
        local identifiers = GetPlayerIdentifiers(playerId)
        for i = 1, #identifiers do
            if string.find(identifiers[i], 'steam:') then
                steamHex = identifiers[i]
            elseif string.find(identifiers[i], 'discord:') then
                discordId = string.gsub(identifiers[i], 'discord:', '')
            end
        end
    end

    local webhook = Webhooks[logType]
    if not webhook then return end
	if webhook == 'WEBHOOK HERE' then
		print('^8[ERROR] SET WEBHOOK IN CONFIG.WEBHOOKS^7')
		print('^8[ERROR] SET WEBHOOK IN CONFIG.WEBHOOKS^7')
		print('^8[ERROR] SET WEBHOOK IN CONFIG.WEBHOOKS^7')
		print('^8[ERROR] SET WEBHOOK IN CONFIG.WEBHOOKS^7')
		print('^8[ERROR] SET WEBHOOK IN CONFIG.WEBHOOKS^7')
		print('^8[ERROR] SET WEBHOOK IN CONFIG.WEBHOOKS^7')
		print('^8[ERROR] SET WEBHOOK IN CONFIG.WEBHOOKS^7')
		return
	end

    message = message..'\nID: '..(playerId or 'Server')..'\nSteam Name: '..steamName..'\nSteam HEX: '..steamHex..'\nDiscord: <@'..discordId..'>'
	local embedData = { {
		['title'] = 'Police Job',
		['color'] = 14423100,
		['footer'] = {
			['text'] = "Police Job | pScripts | " .. os.date(),
			['icon_url'] = "https://r2.fivemanage.com/xlufCGKYLtGfU8IBmjOL9/LOGO3.png"
		},
		['description'] = message,
		['author'] = {
			['name'] = "pScripts",
			['icon_url'] = "https://r2.fivemanage.com/xlufCGKYLtGfU8IBmjOL9/LOGO3.png"
		}
	} }
	PerformHttpRequest(webhook, nil, 'POST', json.encode({
		username = 'pScripts',
		embeds = embedData
	}), {
		['Content-Type'] = 'application/json'
	})
end
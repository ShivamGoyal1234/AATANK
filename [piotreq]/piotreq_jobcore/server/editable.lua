local webhooks = {
    ['dutyStatus'] = 'WEBHOOK HERE',
    ['payout'] = 'WEBHOOK HERE'
}

Core.DiscordLog = function(playerId, message, logType)
    local steamName, steamHex, discordId = GetPlayerName(playerId) or 'Unknown', 'Unknown', 'Unknown'
    local identifiers = GetPlayerIdentifiers(playerId)
    for i = 1, #identifiers do
        if string.find(identifiers[i], 'steam:') then
            steamHex = identifiers[i]
        elseif string.find(identifiers[i], 'discord:') then
            discordId = string.gsub(identifiers[i], 'discord:', '')
        end
    end

    -- local webhook = webhooks[logType]
    message = message:format(playerId, steamName, steamHex, discordId)
    local embedData = { {
		['title'] = 'JOB CORE',
		['color'] = 14423100,
		['footer'] = {
			['text'] = "JOB CORE | pScripts | " .. os.date(),
			['icon_url'] = "https://r2.fivemanage.com/xlufCGKYLtGfU8IBmjOL9/LOGO3.png"
		},
		['description'] = message,
		['author'] = {
			['name'] = "JOB CORE",
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
-------------------------------------
-------------------------------------
--- IMPORTANT: READ FULLY -----------
------- IMPORTANT: READ FULLY -------
----------- IMPORTANT: READ FULLY ---
-------------------------------------
-------------------------------------https://discord.com/api/webhooks/1356514180814868560/XNS9MDVEQIlXWT_Z84KnkEGHOczB0P_o3LYwynZyspH4ARhogn8c29Aru1YRABj0xz8l
-- The API keys for the different upload methods. (Discord, Fivemanage, Fivemerr, Custom).
-- For Fivemanage it will be the API key generated from your account.
-- !! How to generate Fivemanage Key: https://youtu.be/GL7HBlA9i4s !!


------------ RECOMMENDED ------------
-- If you want to keep your apiKeys in `server.cfg` you can set them like this:
-- set yseriesApiKeyImage "REPLACE_WITH_YOUR_API_KEY"
-- set yseriesApiKeyVideo "REPLACE_WITH_YOUR_API_KEY"
-- set yseriesApiKeyAudio "REPLACE_WITH_YOUR_API_KEY"
-------------------------------------
------- IMPORTANT: READ FULLY -------
-------------------------------------

-- READ IN OUR DOCUMENTATION HOW TO SET THE API KEYS IN SERVER.CFG - https://docs.teamsgg.dev/paid-scripts/phone/configure#camera

ApiKeys = {
    Image = GetConvar("yseriesApiKeyImage", "SET_YOUR_API_KEY_IN_SERVER.CFG"),
    Video = GetConvar("yseriesApiKeyVideo", "SET_YOUR_API_KEY_IN_SERVER.CFG"),
    Audio = GetConvar("yseriesApiKeyAudio", "SET_YOUR_API_KEY_IN_SERVER.CFG")
}

-- The Discord webhook that will be used to send the posts to the Discord channel.
LogsWebhooks = {                                                                                            -- https://docs.teamsgg.dev/paid-scripts/phone/configure#camera
    ['instashots_posts'] = GetConvar("yseriesInstashotsPostsLogs", "SET_YOUR_API_KEY_IN_SERVER.CFG"),       -- Instashots Posts
    ['instashots_messages'] = GetConvar("yseriesInstashotsMessagesLogs", "SET_YOUR_API_KEY_IN_SERVER.CFG"), -- Instashots Messages
    ['y_posts'] = GetConvar("yseriesYPostsLogs", "SET_YOUR_API_KEY_IN_SERVER.CFG"),                         -- Y Posts
    ['y_messages'] = GetConvar("yseriesYMessagesLogs", "SET_YOUR_API_KEY_IN_SERVER.CFG"),                   -- Y Messages
    ['ypay'] = GetConvar("yseriesYPayLogs", "SET_YOUR_API_KEY_IN_SERVER.CFG"),                              -- Posts
    ['ybuy'] = GetConvar("yseriesYBuyLogs", "SET_YOUR_API_KEY_IN_SERVER.CFG"),                              -- Posts
    ['companies'] = GetConvar("yseriesCompaniesLogs", "SET_YOUR_API_KEY_IN_SERVER.CFG"),                    -- Duty On/Off
    ['phone'] = GetConvar("yseriesPhoneLogs", "SET_YOUR_API_KEY_IN_SERVER.CFG"),                            -- Calls
    ['messages'] = GetConvar("yseriesMessagesLogs", "SET_YOUR_API_KEY_IN_SERVER.CFG"),                      -- Messages
    ['darkchat'] = GetConvar("yseriesDarkChatLogs", "SET_YOUR_API_KEY_IN_SERVER.CFG"),                      -- Messages
    ['special'] = GetConvar("yseriesSpecialLogs", "SET_YOUR_API_KEY_IN_SERVER.CFG"),       -- Special DarkChat channel logs
}

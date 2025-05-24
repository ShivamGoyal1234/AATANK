Animation = {}

Animation.List = {
    "uwu",
    "smoke2",
    "foldarms2",
    "bookc",
    "dancedrink2",
    "sipshaked"
}

Animation.ScenarioList = {
    "WORLD_HUMAN_SMOKING",
    "WORLD_HUMAN_SMOKING_POT",
}

Animation.Export = function(emoteName)
    Wait(100)
    if GetResourceState('rpemotes-reborn') == 'started' then
        pcall(function() exports["rpemotes-reborn"]:EmoteCommandStart(emoteName) end)
        return
    elseif GetResourceState('rpemotes') == 'started' then
        pcall(function() exports["rpemotes"]:EmoteCommandStart(emoteName) end)
    elseif GetResourceState('scully_emotemenu') == 'started' then
        pcall(function() exports.scully_emotemenu:playEmoteByCommand(emoteName) end)
    else
        ExecuteCommand(('e %s'):format(emoteName))
    end
end

Animation.Stop = function()
    if GetResourceState('rpemotes-reborn') == 'started' then
        pcall(function() exports["rpemotes-reborn"]:EmoteCancel(true) end)
        return
    elseif GetResourceState('rpemotes') == 'started' then
        pcall(function() exports["rpemotes"]:EmoteCancel(true) end)
    elseif GetResourceState('scully_emotemenu') == 'started' then
        pcall(function() exports.scully_emotemenu:cancelEmote() end)
    else
        ClearPedTasks(cache.ped)
    end
end

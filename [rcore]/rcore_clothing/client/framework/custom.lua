CreateThread(function()
    if Config.Framework == 3 then
        ShowNotification = function(text)
            print(text)
        end
    end
end)

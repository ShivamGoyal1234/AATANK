local success, result = pcall(lib.load, ('custom.%s.server'):format(Config.Framework))

if not success then
    error(result, 0)
end

_G.sfr = result --[[@as ServerFramework]]
print('^2[INFO]^7 Successfully loaded the framework.', Config.Framework)

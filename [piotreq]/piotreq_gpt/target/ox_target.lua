if Config.Target ~= 'ox_target' then return end

Target = {}

Target.addSphereZone = function(data)
    return exports['ox_target']:addSphereZone(data)
end
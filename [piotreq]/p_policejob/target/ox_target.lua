if Config.Target ~= 'ox_target' then return end

Target.addSphereZone = function(data)
    return exports['ox_target']:addSphereZone(data)
end

Target.addPlayer = function(options)
    exports['ox_target']:addGlobalPlayer(options)
end

Target.addVehicle = function(options)
    exports['ox_target']:addGlobalVehicle(options)
end

Target.addModel = function(models, options)
    exports['ox_target']:addModel(models, options)
end

Target.removeZone = function(zoneId)
    exports['ox_target']:removeZone(zoneId)
end

Target.addLocalEntity = function(entity, options)
    exports['ox_target']:addLocalEntity(entity, options)
end
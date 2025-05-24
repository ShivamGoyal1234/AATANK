local speedZone = nil

local function ResumeTraffic()
    if not speedZone then
        return
    end
    
    RemoveSpeedZone(speedZone)
end

local function SlowTraffic()
    if speedZone then
        RemoveSpeedZone(speedZone)
        Citizen.Wait(10)
    end
    
    local coords = GetEntityCoords(cache.ped)
    speedZone = AddSpeedZoneForCoord(coords.x, coords.y, coords.z, 250.0, 5.0, false)
end

local function StopTraffic()
    if speedZone then
        RemoveSpeedZone(speedZone)
        Citizen.Wait(10)
    end
    
    local coords = GetEntityCoords(cache.ped)
    speedZone = AddSpeedZoneForCoord(coords.x, coords.y, coords.z, 250.0, 0.0, false)
end

exports('ResumeTraffic', ResumeTraffic)
exports('SlowTraffic', SlowTraffic)
exports('StopTraffic', StopTraffic)
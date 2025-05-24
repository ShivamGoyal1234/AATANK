if Config.Target ~= 'qb-target' then return end

Target = {}

Target.addSphereZone = function(data)
    for i = 1, #data.options, 1 do
        if data.options[i].onSelect then
            data.options[i].action = data.options[i].onSelect
        end
        if data.options[i].groups then
            data.options[i].job = data.options[i].groups
        end
        if data.options[i].items then
            data.options[i].item = data.options[i].items
        end
    end
    local name = 'police_job_'..tostring(math.random(11111111, 99999999))
    exports['qb-target']:AddCircleZone(name, data.coords, data.radius, {
        name = name,
        debugPoly = Config.Debug,
    }, {
        options = data.options,
        distance = data.options[1].distance or 2
    })
    return name
end
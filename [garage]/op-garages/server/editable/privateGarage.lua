tempGaragesIndex = 5000

Citizen.CreateThread(function()
    while Framework == nil do Wait(5) end

    function addTempPrivateGarage(Label, Type, Coords, Radius, PrivatePlayersList)
        local garagesList = GlobalState.garages
        garagesList[tostring(tempGaragesIndex)] = {
            Index = tempGaragesIndex,
            Label = Label,
            Type = Type,
            CenterOfZone = vec4(Coords.CenterOfZone.x, Coords.CenterOfZone.y, Coords.CenterOfZone.z, Coords.CenterOfZone.w),
            AccessPoint = vec4(Coords.AccessPoint.x, Coords.AccessPoint.y, Coords.AccessPoint.z, Coords.AccessPoint.w),
            Radius = Radius,
            IsPrivate = true,
            PrivatePlayersList = PrivatePlayersList
        }
        tempGaragesIndex = tempGaragesIndex + 1
        GlobalState.garages = garagesList
    end
    exports('addTempPrivateGarage', addTempPrivateGarage)

end)
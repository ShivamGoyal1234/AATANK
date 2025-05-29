local reqId = 0
local cbMap = {}

local function createPed(model, coords)

    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(0)
    end
    local charPed = CreatePed(2, model, coords.x, coords.y, coords.z - 0.98, coords.w, false, true)
    SetPedComponentVariation(charPed, 0, 0, 0, 2)
    FreezeEntityPosition(charPed, false)
    SetEntityInvincible(charPed, true)
    PlaceObjectOnGroundProperly(charPed)
    SetBlockingOfNonTemporaryEvents(charPed, true)
    
    return charPed
end

AddEventHandler('rcore_clothing:qb:multichar', function(cfg, existsCb, pedCb)
    existsCb()

    local citizenid = cfg.citizenid
    local coords = cfg.coords

    local nowReqId = reqId
    reqId = reqId + 1

    cbMap[nowReqId] = pedCb

    TriggerServerEvent('rcore_clothing:qb:multicharRequestPed', nowReqId, citizenid, coords)
end)

RegisterNetEvent('rcore_clothing:qb:multicharResponsePed', function(reqId, data)
    local cb = cbMap[reqId]

    if type(data.model) == "string" then
        data.model = tonumber(data.model)
    end

    local ped = createPed(data.model, data.coords)

    if data.rcore_clothing then
        ApplyPedClothingOutfit(ped, data.outfit)
    elseif data.qb_clothing then
        TriggerEvent('qb-clothing:client:loadPlayerClothing', json.decode(data.skin), ped)
    else
        print("Error: unknown data source")
    end

    if cb then
        cb(ped)
    end

end)

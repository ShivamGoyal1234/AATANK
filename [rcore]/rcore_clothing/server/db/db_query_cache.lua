local clothingTypeCache = {}
local componentsCache = {}

function GetCachedClothingTypeCacheForShop(shopName, pedModel)
    if not clothingTypeCache[shopName] then
        return nil
    end

    return clothingTypeCache[shopName][pedModel]
end

function CacheClothingTypeCacheForShop(shopName, pedModel, data)
    if not clothingTypeCache[shopName] then
        clothingTypeCache[shopName] = {}
    end

    clothingTypeCache[shopName][pedModel] = data
end

function GetCachedClothingTypeCacheGlobal(pedModel)
    return clothingTypeCache[pedModel]
end

function CacheClothingTypeCacheGlobal(pedModel, data)
    clothingTypeCache[pedModel] = data
end

function GetCachedClothingComponentsForShop(shopName, pedModel)
    if not componentsCache[shopName] then
        return nil
    end

    return componentsCache[shopName][pedModel]
end

function CacheClothingComponentsForShop(shopName, pedModel, data)
    if not componentsCache[shopName] then
        componentsCache[shopName] = {}
    end

    componentsCache[shopName][pedModel] = data
end

function GetCachedClothingComponentsGlobal(pedModel)
    return componentsCache[pedModel]
end

function CacheClothingComponentsGlobal(pedModel, data)
    componentsCache[pedModel] = data
end

function ClearQueryCache()
    clothingTypeCache = {}
    componentsCache = {}
end
local rootLevel = {
    {
        id = 'upper-body',
        type = 'category',
        label = _U('shop_structure.first_level.upper_body'),
        url = "https://clothing.rcore.cz/assets/gamedata/1885233650/11/1905622956_0_0.webp",
        components = {
            11, -- JBIB
            8,  -- ACCESSORIES
            3,  -- UPPER
            33, -- UPPER
            10, -- DECL
            9,  -- TASK
            5,  -- HAND
        },
    },

    {
        id = 'lower-body',
        type = 'category',
        label = _U('shop_structure.first_level.lower_body'),
        url = "https://clothing.rcore.cz/assets/gamedata/1885233650/4/-1337948505_0_0.webp",
        components = {
            4, -- LOWER
            6, -- FEET
        }
    },

    {
        id = 'accessories',
        type = 'category',
        label = _U('shop_structure.first_level.accessories'),
        url = "https://clothing.rcore.cz/assets/gamedata/1885233650/1/-1389792754_0_0.webp",
        components = {
            1, -- masks
            7,
            100,
            101,
            102,
            106,
            107,
        }
    },
}

local componentLevel = {
    [1] = {
        id = 'masks',
        label = _U("shop_structure.second_level.masks"),
        image = 'https://clothing.rcore.cz/assets/gamedata/1885233650/1/-1918218758_0_0.webp',
    },
    [3] = {
        id = 'arms',
        label = _U("shop_structure.second_level.arms"),
        image = 'https://clothing.rcore.cz/assets/gamedata/1885233650/3/3_15_0_0_0.webp',
    },
    [33] = {
        id = 'gloves',
        label = _U("shop_structure.second_level.gloves"),
        image = '*img/card_img/gloves.webp',
    },
    [4] = {
        id = 'pants',
        label = _U("shop_structure.second_level.pants"),
        image = 'https://clothing.rcore.cz/assets/gamedata/1885233650/4/-788873731_0_0.webp',
    },
    [6] = {
        id = 'shoes',
        label = _U("shop_structure.second_level.shoes"),
        image = '*img/card_img/shoes.webp',
    },
    [8] = {
        id = 'undershirt',
        label = _U("shop_structure.second_level.undershirt"),
        image =
        'https://clothing.rcore.cz/assets/gamedata/1885233650/8/-1011161493_202420620_-1557113221.webp',
    },
    [9] = {
        id = 'vests',
        label = _U("shop_structure.second_level.vests"),
        image = 'https://clothing.rcore.cz/assets/gamedata/1885233650/9/-1626246037_0_0.webp',
    },
    [11] = {
        id = 'top_layer',
        label = _U("shop_structure.second_level.top_layer"),
        image = 'https://clothing.rcore.cz/assets/gamedata/1885233650/11/-1844197363_0_0.webp',
    },
    [100] = {
        id = 'hats',
        label = _U("shop_structure.second_level.hats"),
        image = 'https://clothing.rcore.cz/assets/gamedata/1885233650/100/100_4_0_0_0.webp',
    },
    [101] = {
        id = 'eyeglasses',
        label = _U("shop_structure.second_level.eyeglasses"),
        image = 'https://clothing.rcore.cz/assets/gamedata/1885233650/101/101_7_10_0_0.webp',
    },
    [102] = {
        id = 'earrings',
        label = _U("shop_structure.second_level.earrings"),
        image = '*img/card_img/earrings.webp',
    },
    [106] = {
        id = 'left_arm',
        label = _U("shop_structure.second_level.left_arm"),
        image = 'https://clothing.rcore.cz/assets/gamedata/1885233650/106/-166996477_0_0.webp',
    },
    [107] = {
        id = 'right_arm',
        label = _U("shop_structure.second_level.right_arm"),
        image = 'https://clothing.rcore.cz/assets/gamedata/1885233650/107/1058015837_0_0.webp',
    },


    [5] = {
        id = 'bags',
        label = _U("shop_structure.second_level.bags"),
        image = 'https://clothing.rcore.cz/assets/gamedata/1885233650/5/-1718422107_0_0.webp',
    },
    [10] = {
        id = 'decals',
        label = _U("shop_structure.second_level.decals"),
        image = '*img/card_img/decals.webp',
    },
    [7] = {
        id = 'neck',
        label = _U("shop_structure.second_level.neck"),
        image = '*img/card_img/neck.webp',
    },
}

local clothingCategoryDefinition = {
    [1] = {
        {
            name = 'balaclava',
            image = 'https://clothing.rcore.cz/assets/gamedata/1885233650/1/-1389792754_0_0.webp',
            label = _U("shop_structure.third_level.balaclava"),
        },
        {
            name = 'bandana',
            image = 'https://clothing.rcore.cz/assets/gamedata/1885233650/1/404121039_0_0.webp',
            label = _U("shop_structure.third_level.bandana"),
        },
        {
            name = 'full-face',
            image = 'https://clothing.rcore.cz/assets/gamedata/1885233650/1/-1117328457_0_0.webp',
            label = _U("shop_structure.third_level.full_face"),
        },
        {
            name = 'horror',
            image = 'https://clothing.rcore.cz/assets/gamedata/1885233650/1/-1286690297_0_0.webp',
            label = _U("shop_structure.third_level.horror"),
        },
        {
            name = 'other',
            image = 'https://clothing.rcore.cz/assets/gamedata/1885233650/1/1816684092_0_0.webp',
            label = _U("shop_structure.third_level.other"),
        }
    },
    [4] = {
        {
            name = 'dress-pants',
            image = 'https://clothing.rcore.cz/assets/gamedata/1885233650/4/-1091214220_0_0.webp',
            label = _U("shop_structure.third_level.dress_pants"),
        },
        {
            name = 'shorts',
            image = 'https://clothing.rcore.cz/assets/gamedata/1885233650/4/301706885_0_0.webp',
            label = _U("shop_structure.third_level.shorts"),
        },
        {
            name = 'cargo',
            image = 'https://clothing.rcore.cz/assets/gamedata/1885233650/4/632151325_0_0.webp',
            label = _U("shop_structure.third_level.cargo"),
        },
        {
            name = 'skirt',
            image = 'https://clothing.rcore.cz/assets/gamedata/1885233650/4/618685289_0_0.webp',
            label = _U("shop_structure.third_level.skirt"),
        },
        {
            name = 'sweatpants',
            image = 'https://clothing.rcore.cz/assets/gamedata/1885233650/4/-1117098433_0_0.webp',
            label = _U("shop_structure.third_level.sweatpants"),
        },
        {
            name = 'jeans',
            image = 'https://clothing.rcore.cz/assets/gamedata/1885233650/4/-1580927082_0_0.webp',
            label = _U("shop_structure.third_level.jeans"),
        },
        {
            name = 'other',
            image = 'https://clothing.rcore.cz/assets/gamedata/1885233650/4/-180380221_0_0.webp',
            label = _U("shop_structure.third_level.other"),
        }
    },
    [6] = {
        {
            name = 'boots',
            image = 'https://clothing.rcore.cz/assets/gamedata/1885233650/6/-1145930530_0_0.webp',
            label = _U("shop_structure.third_level.boots"),
        },
        {
            name = 'dress-shoe',
            image = 'https://clothing.rcore.cz/assets/gamedata/1885233650/6/-1421509887_0_0.webp',
            label = _U("shop_structure.third_level.dress_shoe"),
        },
        {
            name = 'sandals',
            image = 'https://clothing.rcore.cz/assets/gamedata/1885233650/6/-253728735_0_0.webp',
            label = _U("shop_structure.third_level.sandals"),
        },
        {
            name = 'slippers',
            image = 'https://clothing.rcore.cz/assets/gamedata/1885233650/6/-1788153495_0_0.webp',
            label = _U("shop_structure.third_level.slippers"),
        },
        {
            name = 'sneakers',
            image = 'https://clothing.rcore.cz/assets/gamedata/1885233650/6/-1028328113_0_0.webp',
            label = _U("shop_structure.third_level.sneakers"),
        },
        {
            name = 'other',
            image = 'https://clothing.rcore.cz/assets/gamedata/1885233650/6/1405859689_0_0.webp',
            label = _U("shop_structure.third_level.other"),
        }
    },
    
    [5] = {
        {
            name = 'bag',
            image = 'https://clothing.rcore.cz/assets/gamedata/1885233650/5/352537938_0_0.webp',
            label = _U("shop_structure.third_level.bag"),
        },
        {
            name = 'duffel-bag',
            image = 'https://clothing.rcore.cz/assets/gamedata/1885233650/5/-1718422107_0_0.webp',
            label = _U("shop_structure.third_level.duffel-bag"),
        },
    },
    [7] = {
        {
            name = 'tie',
            image = 'https://clothing.rcore.cz/assets/gamedata/1885233650/7/1772369408_0_0.webp',
            label = _U('shop_structure.third_level.tie')
        },
        {
            name = 'necklace',
            image = 'https://clothing.rcore.cz/assets/gamedata/1885233650/7/-1129841280_0_0.webp',
            label = _U('shop_structure.third_level.necklace')
        },
        {
            name = 'scarf',
            image = 'https://clothing.rcore.cz/assets/gamedata/1885233650/7/-1348534935_0_0.webp',
            label = _U('shop_structure.third_level.scarf')
        },
        {
            name = 'other',
            image = 'https://clothing.rcore.cz/assets/gamedata/1885233650/7/1180568062_0_0.webp',
            label = _U('shop_structure.third_level.other')
        },
    },
    [8] = {
        {
            name = 'middle',
            image = '*img/comp_8/middle.png',
            label = _U('shop_structure.third_level.middle')
        },
        {
            name = 'topshort',
            image = '*img/comp_8/topshort.png',
            label = _U('shop_structure.third_level.topshort')
        },
        {
            name = 'fullnoshoulder',
            image = '*img/comp_8/fullnoshoulder.png',
            label = _U('shop_structure.third_level.fullnoshoulder')
        },
        {
            name = 'middle_wide',
            image = '*img/comp_8/middle_wide.png',
            label = _U('shop_structure.third_level.middle_wide')
        },
        {
            name = 'top-no-shoulder',
            image = '*img/comp_8/top-no-shoulder.png',
            label = _U('shop_structure.third_level.top-no-shoulder')
        },
        {
            name = 'borders',
            image = '*img/comp_8/borders.png',
            label = _U('shop_structure.third_level.borders')
        },
        {
            name = 'nobelly',
            image = '*img/comp_8/nobelly.png',
            label = _U('shop_structure.third_level.nobelly')
        },
        {
            name = 'other',
            image = '*img/comp_8/other.png',
            label = _U('shop_structure.third_level.other')
        },
    },
    [11] = {
        {
            name = 't-shirt',
            image = 'https://clothing.rcore.cz/assets/gamedata/1885233650/11/-1198378836_0_0.webp',
            label = _U("shop_structure.third_level.t_shirt"),
        },
        {
            name = 'suit',
            image = 'https://clothing.rcore.cz/assets/gamedata/1885233650/11/-114454818_0_0.webp',
            label = _U("shop_structure.third_level.suit"),
        },
        {
            name = 'jacket',
            image = 'https://clothing.rcore.cz/assets/gamedata/1885233650/11/11_6_3_0_0.webp',
            label = _U("shop_structure.third_level.jacket"),
        },
        {
            name = 'shirt',
            image = 'https://clothing.rcore.cz/assets/gamedata/1885233650/11/11_12_0_0_0.webp',
            label = _U("shop_structure.third_level.shirt"),
        },
        {
            name = 'hoodie',
            image = 'https://clothing.rcore.cz/assets/gamedata/1885233650/11/-685086728_0_0.webp',
            label = _U("shop_structure.third_level.hoodie"),
        },
        {
            name = 'polo',
            image = 'https://clothing.rcore.cz/assets/gamedata/1885233650/11/11_9_5_0_0.webp',
            label = _U("shop_structure.third_level.polo"),
        },
        {
            name = 'vest',
            image = 'https://clothing.rcore.cz/assets/gamedata/1885233650/11/-1014164314_0_0.webp',
            label = _U("shop_structure.third_level.vest"),
        },
        {
            name = 'other',
            image = 'https://clothing.rcore.cz/assets/gamedata/1885233650/11/673290061_0_0.webp',
            label = _U("shop_structure.third_level.other"),
        },
        {
            name = 'dress',
            image = 'https://clothing.rcore.cz/assets/gamedata/-1667301416/11/-1069371729_0_0.webp',
            label = _U("shop_structure.third_level.dress"),
        },
    },

    [100] = {
        {
            name = 'headphones',
            image = 'https://clothing.rcore.cz/assets/gamedata/1885233650/100/100_0_0_0_0.webp',
            label = _U("shop_structure.third_level.headphones"),
        },
        {
            name = 'helmet',
            image = 'https://clothing.rcore.cz/assets/gamedata/1885233650/100/-204056785_0_0.webp',
            label = _U("shop_structure.third_level.helmet"),
        },
        {
            name = 'hat',
            image = 'https://clothing.rcore.cz/assets/gamedata/1885233650/100/-711160725_0_0.webp',
            label = _U("shop_structure.third_level.hat"),
        },
        {
            name = 'cap',
            image = 'https://clothing.rcore.cz/assets/gamedata/1885233650/100/-177864969_0_0.webp',
            label = _U("shop_structure.third_level.cap"),
        },
        {
            name = 'beanie',
            image = 'https://clothing.rcore.cz/assets/gamedata/1885233650/100/1389332057_0_0.webp',
            label = _U("shop_structure.third_level.beanie"),
        },
        {
            name = 'beret',
            image = 'https://clothing.rcore.cz/assets/gamedata/1885233650/100/1716757691_0_0.webp',
            label = _U("shop_structure.third_level.beret"),
        },
        {
            name = 'other',
            image = 'https://clothing.rcore.cz/assets/gamedata/1885233650/100/1810327760_0_0.webp',
            label = _U("shop_structure.third_level.other"),
        },
    },
    [101] = {
        {
            name = 'casual',
            image = 'https://clothing.rcore.cz/assets/gamedata/1885233650/101/-1745243024_0_0.webp',
            label = _U("shop_structure.third_level.casual"),
        },
        {
            name = 'aviator',
            image = 'https://clothing.rcore.cz/assets/gamedata/1885233650/101/564515410_0_0.webp',
            label = _U("shop_structure.third_level.aviator"),
        },
        {
            name = 'sports',
            image = 'https://clothing.rcore.cz/assets/gamedata/1885233650/101/-1705949937_0_0.webp',
            label = _U("shop_structure.third_level.sports"),
        },
        {
            name = 'hipster',
            image = 'https://clothing.rcore.cz/assets/gamedata/1885233650/101/1883629317_0_0.webp',
            label = _U("shop_structure.third_level.hipster"),
        },
        {
            name = 'other',
            image = 'https://clothing.rcore.cz/assets/gamedata/1885233650/101/1482903886_0_0.webp',
            label = _U("shop_structure.third_level.other"),
        },
    },
    [102] = {
        {
            name = 'earring',
            image = '*img/card_img/earrings.webp',
            label = _U("shop_structure.third_level.earring"),
        },
    },
    [106] = {
        {
            name = 'watch',
            image = 'https://clothing.rcore.cz/assets/gamedata/1885233650/106/-1559755361_0_0.webp',
            label = _U("shop_structure.third_level.watch"),
        },
        {
            name = 'bracelet',
            image = 'https://clothing.rcore.cz/assets/gamedata/1885233650/106/-214699678_0_0.webp',
            label = _U("shop_structure.third_level.bracelet"),
        },
    },
    [107] = {
        {
            name = 'bracelet',
            image = 'https://clothing.rcore.cz/assets/gamedata/1885233650/107/1312139416_0_0.webp',
            label = _U("shop_structure.third_level.bracelet"),
        },
    },
};


function FormatBaseMenuForComponents(availableComponents)
    local componentMap = {}
    for _, component in pairs(availableComponents) do
        componentMap[component.component_id] = true
    end

    local output = {}

    for _, category in pairs(rootLevel) do
        local categoryOutput = {
            id = category.id,
            type = 'category',
            label = category.label,
            image = category.url,
            items = {},
        }

        for _, componentId in pairs(category.components) do
            -- arms are special case
            if componentMap[componentId] or componentId == 3 or componentId == 33 or componentId == 10 then
                if componentLevel[componentId] then
                    table.insert(categoryOutput.items, {
                        type = 'category',
                        subtype = 'clothing',
                        component = componentId,
                        label = componentLevel[componentId].label,
                        image = componentLevel[componentId].image,
                        items = {},
                        id = componentLevel[componentId].id,
                    })
                end
            end
        end

        if #categoryOutput.items > 0 then
            table.insert(output, categoryOutput)
        end
    end

    return output
end

function FormatTypesPerComponentId(availableClothingTypes)
    local output = {}

    local hashmap = {}

    for _, data in pairs(availableClothingTypes) do
        local hash = data.component_id .. '_' .. data.type
        hashmap[hash] = true
    end

    for compId, data in pairs(clothingCategoryDefinition) do
        local compData = {}

        for _, category in pairs(data) do
            local hash = compId .. '_' .. category.name

            if hashmap[hash] then
                table.insert(compData, {
                    component = compId,
                    name = category.name,
                    label = category.label,
                    image = category.image,
                })
            end
        end

        if #compData > 0 then
            output[tostring(compId)] = compData
        end
    end

    return output
end

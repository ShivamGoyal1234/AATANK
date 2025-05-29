-- 📙 Documentation: https://documentation.rcore.cz/paid-resources/rcore_clothing

Config = {
    Locale = 'en', -- Available en, de, fr, es, it

    Commands = {
        Skin = 'skin',
        ReloadSkin = 'refreshskin',
        ClearPed = 'clearped',
    },

    EveryShopHasEverything = true, -- by default, clothing is categorized into shops (binco, suburban etc.), if you want to have everything available in every shop, set this to true (but it kinda ruins the immersion ;)
    CharCreatorHasEverything = false, -- by default, char creator has only selected clothing for new players, if you want to have everything available, set this to true

    SaveHeadWithOutfit = false, -- if true, head settings (makeup, hair etc.) will be saved with outfits 

    EnableReloadSkin = true,
    EnableClearPed = true,

    CharCreatorApplyRandom = true, -- If true, new players will have slightly randomized appearance when first joining
    
    -- When opening character creator, this will make it wait for collisions to be loaded before opening it
    CharCreatorWaitForCollisions = false,

    IdModeHasEverything = true, -- if true, all items will be available in ID mode

    -- When this is TRUE, the player will be able to select
    -- clothes that they have purchased, in job changing rooms (after going off duty)
    -- When this is FALSE, you can manage stock inside job changing rooms
    JobChangingRoomActsAsPersonalChangingRoom = true,

    -- If you are using addon heads, uncomment this
    -- AddonHeadsCount = 45,

    -- If you want to restrict clothing to certain ace permissions,
    -- you have ot define them here first
    ClothingAceRestrictionOptions = {
        'group.vip',
    },

    -- Marker style
    Checkpoint = {
        scale = vector3(1.0, 1.0, 1.0),
        type = 25,
        color = { 255, 0, 0, 200 },
    },

    JobChangingRooms = {
        {
            label = 'Changing Room',
            type = 'job_police',
            -- blip = { title = "Second Hand", colour = 39, id = 73 },
            pos = vector4(463.33, -996.58, 30.69, 82.93),
            jobs = { 'police' },
        },
    },
    
    ClothingShops = {
        {
            label = 'Clothes Shop',
            type = 'job_police',
            blip = { title = "Second Hand", colour = 39, id = 73 },
            pos = vector4(463.43, -999.06, 30.69, 97.29),
            config = SHOP_CONFIG_ALIAS.CLOTHING,
        },
        {
            label = 'BINCO',
            type = 'binco',
            blip = { title = "Second Hand", colour = 39, id = 73 },
            pos = vector4(75.61, -1399.3, 28.41, 0.5),
            config = SHOP_CONFIG_ALIAS.CLOTHING,
        },
        {
            label = 'BINCO',
            type = 'binco',
            blip = { title = "Second Hand", colour = 39, id = 73 },
            pos = vector4(9.54, 6516.63, 30.89, 128.5),
            config = SHOP_CONFIG_ALIAS.CLOTHING,
        },
        {
            label = 'BINCO',
            type = 'binco',
            blip = { title = "Second Hand", colour = 39, id = 73 },
            pos = vector4(1692.92, 4829.13, 41.08, 187.5),
            config = SHOP_CONFIG_ALIAS.CLOTHING,
        },
        {
            label = 'BINCO',
            type = 'binco',
            blip = { title = "Second Hand", colour = 39, id = 73 },
            pos = vector4(-1105.83, 2706.46, 18.13, 318.5),
            config = SHOP_CONFIG_ALIAS.CLOTHING,
        },
        {
            label = 'BINCO',
            type = 'binco',
            blip = { title = "Second Hand", colour = 39, id = 73 },
            pos = vector4(1190.43, 2710.18, 37.23, 266.5),
            config = SHOP_CONFIG_ALIAS.CLOTHING,
        },
        {
            label = 'Ponsonbys',
            type = 'ponsonbys',
            blip = { title = "Ponsonbys", colour = 46, id = 73 },
            pos = vector4(-708.58, -160.36, 36.44, 29.5),
            config = SHOP_CONFIG_ALIAS.CLOTHING,
        },
        {
            label = 'Ponsonbys',
            type = 'ponsonbys',
            blip = { title = "Ponsonbys", colour = 46, id = 73 },
            pos = vector4(-158.72, -297.13, 38.76, 162.5),
            config = SHOP_CONFIG_ALIAS.CLOTHING,
        },
        {
            label = 'Ponsonbys',
            type = 'ponsonbys',
            blip = { title = "Ponsonbys", colour = 46, id = 73 },
            pos = vector4(-1456.82, -240.92, 48.83, 323.5),
            config = SHOP_CONFIG_ALIAS.CLOTHING,
        },
        {
            label = 'BINCO',
            type = 'binco',
            blip = { title = "BINCO", colour = 39, id = 73 },
            pos = vector4(425.08, -800.18, 28.54, 174.5),
            config = SHOP_CONFIG_ALIAS.CLOTHING,
        },
        {
            label = 'BINCO',
            type = 'binco',
            blip = { title = "BINCO", colour = 39, id = 73 },
            pos = vector4(-828.03, -1076.9, 10.34, 304.5),
            config = SHOP_CONFIG_ALIAS.CLOTHING,
        },
        {
            label = 'Sub Urban',
            type = 'suburban',
            blip = { title = "Sub Urban", colour = 0, id = 73 },
            pos = vector4(123.41, -220.45, 53.57, 337.5),
            config = SHOP_CONFIG_ALIAS.CLOTHING,
        },
        {
            label = 'Sub Urban',
            type = 'suburban',
            blip = { title = "Sub Urban", colour = 0, id = 73 },
            pos = vector4(617.72, 2760.95, 41.12, 181.0),
            config = SHOP_CONFIG_ALIAS.CLOTHING,
        },
        {
            label = 'Sub Urban',
            type = 'suburban',
            blip = { title = "Sub Urban", colour = 0, id = 73 },
            pos = vector4(-1192.96, -772.29, 16.35, 129.5),
            config = SHOP_CONFIG_ALIAS.CLOTHING,
        },
        {
            label = 'Sub Urban',
            type = 'suburban',
            blip = { title = "Sub Urban", colour = 0, id = 73 },
            pos = vector4(-3172.6, 1047.36, 19.89, 332.5),
            config = SHOP_CONFIG_ALIAS.CLOTHING,
        },
        {
			label = 'Ammunation',
			type = 'ammunation',
			pos = vector4(247.13, -50.38, 68.98, 340.0),
			config = SHOP_CONFIG_ALIAS.CLOTHING,
		},
		-- {
		-- 	label = 'Ammunation',
		-- 	type = 'ammunation',
		-- 	pos = vector4(21.04, -1112.47, 28.83, 98.0),
		-- 	config = SHOP_CONFIG_ALIAS.CLOTHING,
		-- },
		{
			label = 'Ammunation',
			type = 'ammunation',
			pos = vector4(809.43, -2152.02, 28.65, 302.0),
			config = SHOP_CONFIG_ALIAS.CLOTHING,
		},
		{
			label = 'Ammunation',
			type = 'ammunation',
			pos = vector4(840.2, -1028.91, 27.23, 296.0),
			config = SHOP_CONFIG_ALIAS.CLOTHING,
		},
		{
			label = 'Ammunation',
			type = 'ammunation',
			pos = vector4(-1310.87, -395.05, 35.73, 12.0),
			config = SHOP_CONFIG_ALIAS.CLOTHING,
		},
		{
			label = 'Ammunation',
			type = 'ammunation',
			pos = vector4(-660.12, -940.35, 20.86, 111.0),
			config = SHOP_CONFIG_ALIAS.CLOTHING,
		},
		{
			label = 'Ammunation',
			type = 'ammunation',
			pos = vector4(-1113.01, 2696.28, 17.59, 155.0),
			config = SHOP_CONFIG_ALIAS.CLOTHING,
		},
		{
			label = 'Ammunation',
			type = 'ammunation',
			pos = vector4(-3166.63, 1087.72, 19.87, 173.0),
			config = SHOP_CONFIG_ALIAS.CLOTHING,
		},
		{
			label = 'Ammunation',
			type = 'ammunation',
			pos = vector4(2565.72, 299.28, 107.77, 294.0),
			config = SHOP_CONFIG_ALIAS.CLOTHING,
		},
		{
			label = 'Ammunation',
			type = 'ammunation',
			pos = vector4(-325.54, 6081.84, 30.49, 156.0),
			config = SHOP_CONFIG_ALIAS.CLOTHING,
		},
		{
			label = 'Ammunation',
			type = 'ammunation',
			pos = vector4(1698.61, 3758.18, 33.74, 158.0),
			config = SHOP_CONFIG_ALIAS.CLOTHING,
		},
		{
			label = 'Bob Mulet',
			type = 'barber',
			blip = { title = "Barbershop", colour = 0, id = 71 },
			pos = vector4(-812.67, -183.07, 36.6, 112.0),
			config = SHOP_CONFIG_ALIAS.BARBER,
		},
		{
			label = 'Herr Kutz',
			type = 'barber',
			blip = { title = "Barbershop", colour = 0, id = 71 },
			pos = vector4(-276.55, 6226.45, 30.73, 40.0),
			config = SHOP_CONFIG_ALIAS.BARBER,
		},
		{
			label = 'Beachcombover Barbers',
			type = 'barber',
			blip = { title = "Barbershop", colour = 0, id = 71 },
			pos = vector4(-1281.42, -1117.03, 6.03, 82.0),
			config = SHOP_CONFIG_ALIAS.BARBER,
		},
		{
			label = 'O\'Sheas Barbers',
			type = 'barber',
			blip = { title = "Barbershop", colour = 0, id = 71 },
			pos = vector4(1930.7, 3731.57, 31.88, 204.0),
			config = SHOP_CONFIG_ALIAS.BARBER,
		},
		{
			label = 'Herr Kutz',
			type = 'barber',
			blip = { title = "Barbershop", colour = 0, id = 71 },
			pos = vector4(1213.47, -472.6, 65.24, 69.0),
			config = SHOP_CONFIG_ALIAS.BARBER,
		},
		{
			label = 'Herr Kutz',
			type = 'barber',
			blip = { title = "Barbershop", colour = 0, id = 71 },
			pos = vector4(138.4, -1705.96, 28.33, 136.0),
			config = SHOP_CONFIG_ALIAS.BARBER,
		},
		{
			label = 'Hair on Hawick',
			type = 'barber',
			blip = { title = "Barbershop", colour = 0, id = 71 },
			pos = vector4(-33.64, -154.56, 56.11, 330.0),
			config = SHOP_CONFIG_ALIAS.BARBER,
		},
		{
			label = 'Vespucci Movie Masks',
			type = 'beach_masks',
			blip = { title = "Masks", colour = 0, id = 362 },
			pos = vector4(-1200.10, -1516.35, 4.37, 119.52),
			config = {
				structure = {
					[SHOP_STRUCTURE.CLOTHING_MASKS] = true,
				}
			},
		},
		-- {
		-- 	label = 'Vangelico',
		-- 	type = 'vangelico',
		-- 	pos = vector4(-623.34, -234.7, 37.09, 111.0),
		-- 	config = {
		-- 		structure = {
		-- 			[SHOP_STRUCTURE.CLOTHING_EARRINGS] = true,
		-- 			[SHOP_STRUCTURE.CLOTHING_NECK] = true,
		-- 			[SHOP_STRUCTURE.CLOTHING_LEFT_ARM] = true,
		-- 			[SHOP_STRUCTURE.CLOTHING_RIGHT_ARM] = true,
		-- 		}
		-- 	},
		-- },
    },

    ChangingRooms = {
        { pos = vec4(-159.20, -308.86, 39.0, 23.0) },
    },

    -- /client/ui/img/...webp
    ClothingShopLogos = {
        default = 'binco.webp',
        binco = 'binco.webp',
        suburban = 'suburban.webp',
        ponsonbys = 'ponsonbys.webp',
        ammunation = 'ammunation.webp',
    },

    -----------------------------------------------------
    -- ❗❗❗ DANGER ZONE ❗❗❗
    --🔽 Do not edit if you don't know what you are doing
    -- ❗ CHANGE ONLY IF SOMETHING IS NOT WORKING PROPERLY ❗

    -- 👉 You do not need to change most of these as they are automatically set by default
    -----------------------------------------------------
    Framework = 0, --[ 0 = AUTOMATIC, 1 = ESX / 2 = QBCore / 3 = Other ] Choose your framework

    FrameworkTriggers = {
        notify = 'QBCore',            -- [ ESX = 'esx:showNotification' / QBCore = 'QBCore:Notify' ] Set the notification event, if left blank, default will be used
        object = 'QBCore',            --[ ESX = 'esx:getSharedObject' / QBCore = 'QBCore:GetObject' ] Set the shared object event, if left blank, default will be used (deprecated for QBCore)
        resourceName = 'QBCore',      -- [ ESX = 'es_extended' / QBCore = 'qb-core' ] Set the resource name, if left blank, automatic detection will be performed
    },
    TargetScript = 0,           -- [ 0 = None - using markers, 1 = Qtarget / 2 = Bt-target / 3 = Qb-target / 4 = Ox-target ]

    UseFrameworkNotify = false, -- If true, framework notification will be used instead of UI notifications, recommended to leave at false as this script only needs to notify while in UI

    UseBuckets = true,           -- If true, players will be put in buckets for char creator (they won't see other people and vice versa)
    EnableSoftReloadSkin = false, -- If reloadskin causes trouble, enable this to only reload outfit without respawning ped
    CharCreatorHasAllPeds = false, -- If true, all peds will be available in char creator
    UseIDModeByDefault = false, -- If true, ID mode will be enabled by default - This is NOT❗ recommended as it will hide a lot of features of the script.
}

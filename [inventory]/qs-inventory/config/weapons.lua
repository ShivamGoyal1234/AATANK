--[[
    Weapon Configuration Settings
    This section covers all configurations for weapons in the game, including throwable items,
    durability settings, and weapon-specific details like attachments and ammo levels.

    Main configurations:
    - `Config.RemoveTintAfterRemoving`: Controls whether tints are removed when a weapon is discarded.
    - `Config.DurabilityBlockedWeapons`: Lists weapons that are exempt from durability degradation.
    - `Config.Throwables`: Specifies throwable items available in the game, such as grenades and flares.
    - `Config.DurabilityMultiplier`: Defines durability rates for various weapon types, with higher values
      indicating faster degradation. Use these settings to customize weapon durability on a per-type basis.
]]

Config.RemoveTintAfterRemoving = false -- If true, weapon tints are removed when the weapon is discarded or removed
Config.ForceToOnlyOneMagazine = true   -- Player only can use one magazine at a time. When clip is empty then player can use another one.

Config.DurabilityBlockedWeapons = {    -- List of weapons excluded from durability degradation
    'weapon_stungun',
    'weapon_nightstick',
    'weapon_flashlight',
    'weapon_unarmed',
}

-- You can use your custom weapon attachment lines by adding them here
Config.WeaponAttachmentLines = {
    ['suppressor'] = {
        bones = { 'WAPSupp', 'WAPSupp_2' },
        offset = { x = -18, y = 4 },
    },
    ['flash'] = {
        bones = { 'WAPFlshLasr', 'WAPFlshLasr_2' },
        offset = { x = 5, y = 17 },
    },
    ['scope'] = {
        bones = { 'WAPScop', 'WAPScop_2' },
        offset = { x = -10, y = -25 },
    },
    ['clip'] = {
        bones = { 'WAPClip', 'WAPClip_2' },
        offset = { x = 15, y = 15 },
    },
    ['tint'] = {
        default = true,
        offset = { x = 20, y = 0 },
    }
}

Config.Throwables = { -- Defines throwable items that players can use
    'ball',
    'bzgas',
    'flare',
    'grenade',
    'molotov',
    'pipebomb',
    'proxmine',
    'smokegrenade',
    'snowball',
    'stickybomb',
    'newspaper',
}

---@type table<number, {item: string, type: string, isForEveryWeapon?: boolean}>
Config.AmmoItems = {
    {
        item = 'pistol_ammo',
        type = 'AMMO_PISTOL'
    },
    {
        item = 'rifle_ammo',
        type = 'AMMO_RIFLE'
    },
    {
        item = 'smg_ammo',
        type = 'AMMO_SMG'
    },
    {
        item = 'shotgun_ammo',
        type = 'AMMO_SHOTGUN'
    },
    {
        item = 'mg_ammo',
        type = 'AMMO_MG'
    },
    {
        item = 'emp_ammo',
        type = 'AMMO_EMPLAUNCHER'
    },
    {
        item = 'rpg_ammo',
        type = 'AMMO_RPG'
    },
    {
        item = 'grenadelauncher_ammo',
        type = 'AMMO_GRENADELAUNCHER'
    },
    {
        item = 'snp_ammo',
        type = 'AMMO_SNIPER'
    },
    {
        item = 'master_ammo',
        isForEveryWeapon = true
    }
}

Config.DurabilityMultiplier = {          -- Durability settings per weapon type. Higher values mean quicker degradation.
    -- Melee Weapons
    weapon_dagger                = 0.15, -- Durability rate for daggers
    weapon_bat                   = 0.15,
    weapon_bottle                = 0.15,
    weapon_crowbar               = 0.15,
    weapon_candycane             = 0.15,
    weapon_golfclub              = 0.15,
    weapon_hammer                = 0.15,
    weapon_hatchet               = 0.15,
    weapon_knuckle               = 0.15,
    weapon_knife                 = 0.15,
    weapon_machete               = 0.15,
    weapon_switchblade           = 0.15,
    weapon_wrench                = 0.15,
    weapon_battleaxe             = 0.15,
    weapon_poolcue               = 0.15,
    weapon_briefcase             = 0.15,
    weapon_briefcase_02          = 0.15,
    weapon_garbagebag            = 0.15,
    weapon_handcuffs             = 0.15,
    weapon_bread                 = 0.15,
    weapon_stone_hatchet         = 0.15,
    -- Handguns
    weapon_pistol                = 0.15, -- Durability rate for standard pistols
    weapon_pistol_mk2            = 0.15,
    weapon_combatpistol          = 0.15,
    weapon_appistol              = 0.15,
    weapon_pistol50              = 0.15,
    weapon_snspistol             = 0.15,
    weapon_heavypistol           = 0.15,
    weapon_vintagepistol         = 0.15,
    weapon_flaregun              = 0.15,
    weapon_marksmanpistol        = 0.15,
    weapon_revolver              = 0.15,
    weapon_revolver_mk2          = 0.15,
    weapon_doubleaction          = 0.15,
    weapon_snspistol_mk2         = 0.15,
    weapon_raypistol             = 0.15,
    weapon_ceramicpistol         = 0.15,
    weapon_navyrevolver          = 0.15,
    weapon_gadgetpistol          = 0.15,
    weapon_pistolxm3             = 0.15,
    -- Submachine Guns
    weapon_microsmg              = 0.15, -- Durability rate for submachine guns
    weapon_smg                   = 0.15,
    weapon_smg_mk2               = 0.15,
    weapon_assaultsmg            = 0.15,
    weapon_combatpdw             = 0.15,
    weapon_machinepistol         = 0.15,
    weapon_minismg               = 0.15,
    weapon_raycarbine            = 0.15,
    -- Shotguns
    weapon_pumpshotgun           = 0.15, -- Durability rate for shotguns
    weapon_sawnoffshotgun        = 0.15,
    weapon_assaultshotgun        = 0.15,
    weapon_bullpupshotgun        = 0.15,
    weapon_musket                = 0.15,
    weapon_heavyshotgun          = 0.15,
    weapon_dbshotgun             = 0.15,
    weapon_autoshotgun           = 0.15,
    weapon_pumpshotgun_mk2       = 0.15,
    weapon_combatshotgun         = 0.15,
    -- Assault Rifles
    weapon_assaultrifle          = 0.15, -- Durability rate for assault rifles
    weapon_assaultrifle_mk2      = 0.15,
    weapon_carbinerifle          = 0.15,
    weapon_carbinerifle_mk2      = 0.15,
    weapon_advancedrifle         = 0.15,
    weapon_specialcarbine        = 0.15,
    weapon_bullpuprifle          = 0.15,
    weapon_compactrifle          = 0.15,
    weapon_specialcarbine_mk2    = 0.15,
    weapon_bullpuprifle_mk2      = 0.15,
    weapon_militaryrifle         = 0.15,
    weapon_heavyrifle            = 0.15,
    -- Light Machine Guns
    weapon_mg                    = 0.15, -- Durability rate for machine guns
    weapon_combatmg              = 0.15,
    weapon_gusenberg             = 0.15,
    weapon_combatmg_mk2          = 0.15,
    -- Sniper Rifles
    weapon_sniperrifle           = 0.15, -- Durability rate for sniper rifles
    weapon_heavysniper           = 0.15,
    weapon_marksmanrifle         = 0.15,
    weapon_remotesniper          = 0.15,
    weapon_heavysniper_mk2       = 0.15,
    weapon_marksmanrifle_mk2     = 0.15,
    -- Heavy Weapons
    weapon_rpg                   = 0.15, -- Durability rate for heavy weapons
    weapon_grenadelauncher       = 0.15,
    weapon_grenadelauncher_smoke = 0.15,
    weapon_emplauncher           = 0.15,
    weapon_minigun               = 0.15,
    weapon_firework              = 0.15,
    weapon_railgun               = 0.15,
    weapon_hominglauncher        = 0.15,
    weapon_compactlauncher       = 0.15,
    weapon_rayminigun            = 0.15,
    weapon_railgunxm3            = 0.15,
    -- Throwables
    weapon_grenade               = 0.15, -- Durability rate for throwables
    weapon_bzgas                 = 0.15,
    weapon_molotov               = 0.15,
    weapon_stickybomb            = 0.15,
    weapon_proxmine              = 0.15,
    weapon_snowball              = 0.15,
    weapon_pipebomb              = 0.15,
    weapon_ball                  = 0.15,
    weapon_smokegrenade          = 0.15,
    weapon_flare                 = 0.15,
    -- Miscellaneous
    weapon_petrolcan             = 0.15, -- Durability rate for miscellaneous items
    weapon_fireextinguisher      = 0.15,
    weapon_hazardcan             = 0.15,
    weapon_fertilizercan         = 0.15,
}

--[[
    Weapon Repair Configuration
    This section defines weapon repair points and repair costs, allowing for tailored gameplay
    around weapon maintenance. Configure each repair point's location, set individual costs by
    weapon type, and create a streamlined repair experience for players.

    Config.WeaponRepairPoints:
        - Add as many repair points as you want, each identified by a unique index.
        - `coords` defines the exact location for each repair point on the map.
        - `IsRepairing` tracks if a weapon is being repaired at this location, to manage availability.
        - `RepairingData` can hold additional data during repairs, useful for real-time repair management.

    Config.WeaponRepairCosts:
        - Customize repair costs by weapon type, supporting different gameplay economies.
        - Assign a unique price for each weapon category such as pistols, rifles, shotguns, etc.
]]

Config.WeaponRepairItemAddition = 10 -- The amount of weapon repair kits to add to the weapon repair kit item when using it

Config.WeaponRepairPoints = {
    [1] = { coords = vector3(964.02, -1267.41, 34.97), IsRepairing = false, RepairingData = {} } -- Default repair point. Add more as needed
}

Config.WeaponRepairCosts = {
    pistol = 1000, -- Cost to repair pistols
    smg = 3000,    -- Cost to repair submachine guns
    mg = 4000,     -- Cost to repair machine guns
    rifle = 5000,  -- Cost to repair rifles
    sniper = 7000, -- Cost to repair sniper rifles
    shotgun = 6000 -- Cost to repair shotguns
}

--[[
    Weapon Stealing System
    This configuration section sets up the weapon part stealing system, allowing players to loot
    various parts from weapons under specific conditions. You can configure what items are considered
    as weapon parts and adjust the chances for successful theft.

    - Config.CanStealWeaponParts:
        Set this to `true` if you want players to have the ability to steal weapon parts from weapons
        in their possession. This adds a new layer to gameplay by giving opportunities for players
        to gather specific parts used for crafting or repairs.

    - Config.WeaponPartStealChance:
        This sets the probability (in percentage) for successfully stealing a part from a weapon.
        A higher percentage increases the chances of successful theft, whereas a lower percentage
        makes it more challenging. Adjust this value based on the intended difficulty and reward
        system for stealing parts.

    - Config.AvailableWeaponParts:
        This list defines the specific items that players can potentially steal when the system is active.
        Each entry represents an item that could be looted, such as 'lockpick', 'repairkit', or 'armor'.
        Add or remove items here to customize what parts are obtainable, making it flexible for different
        gameplay requirements or item needs.
]]

Config.CanStealWeaponParts = false -- Enable or disable the ability to steal weapon parts
Config.WeaponPartStealChance = 20  -- Probability percentage (1-100) for successful part theft
Config.AvailableWeaponParts = {
    'electronickit',
    'ironoxide',
    'metalscrap',
    -- Add here more names of items according to your needs
}

--[[
    Weapon Accessory Configuration Guide:
    This section configures weapon tints and attachments for various weapons.
    Each tint and attachment has a unique label, component identifier, and associated item name.

    Guidelines for Adding Attachments:

    1. **Naming Convention**: Use descriptive names like `<name>_weapontint` for tints and `<category>_<attachment>` for other attachments.
       - Avoid standalone names like `"ATTACHMENT"`, instead use names like `red_sight_scope`.
       - Only use `WEAPON` prefix for weapon names. Avoid this in attachment names unless it’s an actual weapon.

    2. **Adding New Tints or Attachments**: Follow the examples below to ensure consistency.
       Each accessory must have a component, label, item, and, for tints, a tint index.

    Reference: https://wiki.rage.mp/index.php?title=Weapons_Components for more on weapon components and configurations.
]]

Config.WeaponAttachments = {
    -- PISTOL WEAPONS
    -- Example configuration for WEAPON_PISTOL attachments
    ['WEAPON_PISTOL'] = {
        defaultclip = { component = 'COMPONENT_PISTOL_CLIP_01', item = 'pistol_defaultclip' },
        extendedclip = { component = 'COMPONENT_PISTOL_CLIP_02', item = 'pistol_extendedclip' },
        flashlight = { component = 'COMPONENT_AT_PI_FLSH', item = 'pistol_flashlight' },
        suppressor = { component = 'COMPONENT_AT_PI_SUPP_02', item = 'pistol_suppressor' },
        luxuryfinish = { component = 'COMPONENT_PISTOL_VARMOD_LUXE', item = 'luxuryfinish_weapontint' }
    },
    -- Adding attachments for WEAPON_COMBATPISTOL following similar structure
    ['WEAPON_COMBATPISTOL'] = {
        defaultclip = { component = 'COMPONENT_COMBATPISTOL_CLIP_01', item = 'pistol_defaultclip' },
        extendedclip = { component = 'COMPONENT_COMBATPISTOL_CLIP_02', item = 'pistol_extendedclip' },
        flashlight = { component = 'COMPONENT_AT_PI_FLSH', item = 'pistol_flashlight' },
        suppressor = { component = 'COMPONENT_AT_PI_SUPP', item = 'pistol_suppressor' },
        luxuryfinish = { component = 'COMPONENT_COMBATPISTOL_VARMOD_LOWRIDER', item = 'luxuryfinish_weapontint' }
    },
    ['WEAPON_PISTOL50'] = {
        defaultclip = { component = 'COMPONENT_PISTOL50_CLIP_01', item = 'pistol_defaultclip' },
        extendedclip = { component = 'COMPONENT_PISTOL50_CLIP_02', item = 'pistol_extendedclip' },
        flashlight = { component = 'COMPONENT_AT_PI_FLSH', item = 'pistol_flashlight' },
        suppressor = { component = 'COMPONENT_AT_AR_SUPP_02', item = 'pistol_suppressor' },
        luxuryfinish = { component = 'COMPONENT_PISTOL50_VARMOD_LUXE', item = 'luxuryfinish_weapontint' }
    },
    ['WEAPON_APPISTOL'] = {
        defaultclip = { component = 'COMPONENT_APPISTOL_CLIP_01', item = 'pistol_defaultclip' },
        extendedclip = { component = 'COMPONENT_APPISTOL_CLIP_02', item = 'pistol_extendedclip' },
        flashlight = { component = 'COMPONENT_AT_PI_FLSH', item = 'pistol_flashlight' },
        suppressor = { component = 'COMPONENT_AT_PI_SUPP', item = 'pistol_suppressor' },
        luxuryfinish = { component = 'COMPONENT_APPISTOL_VARMOD_LUXE', item = 'luxuryfinish_weapontint' }
    },
    ['WEAPON_REVOLVER'] = {
        defaultclip = { component = 'COMPONENT_REVOLVER_CLIP_01', item = 'pistol_defaultclip' },
        luxuryfinish = { component = 'COMPONENT_REVOLVER_VARMOD_BOSS', item = 'luxuryfinish_weapontint' }
    },
    ['WEAPON_SNSPISTOL'] = {
        defaultclip = { component = 'COMPONENT_SNSPISTOL_CLIP_01', item = 'pistol_defaultclip' },
        extendedclip = { component = 'COMPONENT_SNSPISTOL_CLIP_02', item = 'pistol_extendedclip' },
        grip = { component = 'COMPONENT_SNSPISTOL_VARMOD_LOWRIDER', item = 'pistol_grip' },
        luxuryfinish = { component = 'COMPONENT_SNSPISTOL_VARMOD_LOWRIDER', item = 'luxuryfinish_weapontint' }
    },
    ['WEAPON_HEAVYPISTOL'] = {
        defaultclip = { component = 'COMPONENT_HEAVYPISTOL_CLIP_01', item = 'pistol_defaultclip' },
        extendedclip = { component = 'COMPONENT_HEAVYPISTOL_CLIP_02', item = 'pistol_extendedclip' },
        flashlight = { component = 'COMPONENT_AT_PI_FLSH', item = 'pistol_flashlight' },
        suppressor = { component = 'COMPONENT_AT_PI_SUPP', item = 'pistol_suppressor' },
        grip = { component = 'COMPONENT_HEAVYPISTOL_VARMOD_LUXE', item = 'pistol_grip' },
        luxuryfinish = { component = 'COMPONENT_HEAVYPISTOL_VARMOD_LUXE', item = 'luxuryfinish_weapontint' }
    },
    ['WEAPON_VINTAGEPISTOL'] = {
        defaultclip = { component = 'COMPONENT_VINTAGEPISTOL_CLIP_01', item = 'pistol_defaultclip' },
        extendedclip = { component = 'COMPONENT_VINTAGEPISTOL_CLIP_02', item = 'pistol_extendedclip' },
        suppressor = { component = 'COMPONENT_AT_PI_SUPP', item = 'pistol_suppressor' }
    },
    ['WEAPON_CERAMICPISTOL'] = {
        defaultclip = { component = 'COMPONENT_CERAMICPISTOL_CLIP_01', item = 'pistol_defaultclip' },
        extendedclip = { component = 'COMPONENT_CERAMICPISTOL_CLIP_02', item = 'pistol_extendedclip' },
        suppressor = { component = 'COMPONENT_CERAMICPISTOL_SUPP', item = 'pistol_suppressor' }
    },
    ['WEAPON_PISTOL_MK2'] = {
        defaultclip = { component = 'COMPONENT_PISTOL_MK2_CLIP_01', item = 'pistol_defaultclip' },
        extendedclip = { component = 'COMPONENT_PISTOL_MK2_CLIP_02', item = 'pistol_extendedclip' },
        flashlight = { component = 'COMPONENT_AT_PI_FLSH_02', item = 'pistol_flashlight' },
        suppressor = { component = 'COMPONENT_AT_PI_SUPP_02', item = 'pistol_suppressor' },
        compensator = { component = 'COMPONENT_AT_PI_COMP', item = 'pistol_compensator' },
        holoscope = { component = 'COMPONENT_AT_PI_RAIL', item = 'pistol_holoscope' },
        digicamo = { component = 'COMPONENT_PISTOL_MK2_CAMO_02', item = 'digital_weapontint' },
        brushcamo = { component = 'COMPONENT_PISTOL_MK2_CAMO_03', item = 'brushstroke_weapontint' },
        woodcamo = { component = 'COMPONENT_PISTOL_MK2_CAMO_04', item = 'woodland_weapontint' },
        skullcamo = { component = 'COMPONENT_PISTOL_MK2_CAMO_05', item = 'skull_weapontint' },
        sessantacamo = { component = 'COMPONENT_PISTOL_MK2_CAMO_06', item = 'sessanta_weapontint' },
        perseuscamo = { component = 'COMPONENT_PISTOL_MK2_CAMO_07', item = 'perseus_weapontint' },
        leopardcamo = { component = 'COMPONENT_PISTOL_MK2_CAMO_08', item = 'leopard_weapontint' },
        zebracamo = { component = 'COMPONENT_PISTOL_MK2_CAMO_09', item = 'zebra_weapontint' },
        geocamo = { component = 'COMPONENT_PISTOL_MK2_CAMO_10', item = 'geometric_weapontint' },
        boomcamo = { component = 'COMPONENT_PISTOL_MK2_CAMO_11', item = 'boom_weapontint' },
        patriotcamo = { component = 'COMPONENT_PISTOL_MK2_CAMO_IND_01', item = 'patriot_weapontint' }
    },
    ['WEAPON_REVOLVER_MK2'] = {
        defaultclip = { component = 'COMPONENT_REVOLVER_MK2_CLIP_01', item = 'pistol_defaultclip' },
        extendedclip = { component = 'COMPONENT_REVOLVER_MK2_CLIP_02', item = 'pistol_extendedclip' },
        flashlight = { component = 'COMPONENT_AT_PI_FLSH', item = 'pistol_flashlight' },
        holoscope = { component = 'COMPONENT_AT_SIGHTS', item = 'pistol_holoscope' },
        smallscope = { component = 'COMPONENT_AT_SCOPE_MACRO_MK2', item = 'pistol_smallscope' },
        compensator = { component = 'COMPONENT_AT_PI_COMP_03', item = 'pistol_compensator' },
        digicamo = { component = 'COMPONENT_REVOLVER_MK2_CAMO_02', item = 'digital_weapontint' },
        brushcamo = { component = 'COMPONENT_REVOLVER_MK2_CAMO_03', item = 'brushstroke_weapontint' },
        woodcamo = { component = 'COMPONENT_REVOLVER_MK2_CAMO_04', item = 'woodland_weapontint' },
        skullcamo = { component = 'COMPONENT_REVOLVER_MK2_CAMO_05', item = 'skull_weapontint' },
        sessantacamo = { component = 'COMPONENT_REVOLVER_MK2_CAMO_06', item = 'sessanta_weapontint' },
        perseuscamo = { component = 'COMPONENT_REVOLVER_MK2_CAMO_07', item = 'perseus_weapontint' },
        leopardcamo = { component = 'COMPONENT_REVOLVER_MK2_CAMO_08', item = 'leopard_weapontint' },
        zebracamo = { component = 'COMPONENT_REVOLVER_MK2_CAMO_09', item = 'zebra_weapontint' },
        geocamo = { component = 'COMPONENT_REVOLVER_MK2_CAMO_10', item = 'geometric_weapontint' },
        boomcamo = { component = 'COMPONENT_REVOLVER_MK2_CAMO_11', item = 'boom_weapontint' },
        patriotcamo = { component = 'COMPONENT_REVOLVER_MK2_CAMO_IND_01', item = 'patriot_weapontint' }
    },
    ['WEAPON_SNSPISTOL_MK2'] = {
        defaultclip = { component = 'COMPONENT_SNSPISTOL_MK2_CLIP_01', item = 'pistol_defaultclip' },
        extendedclip = { component = 'COMPONENT_SNSPISTOL_MK2_CLIP_02', item = 'pistol_extendedclip' },
        flashlight = { component = 'COMPONENT_AT_PI_FLSH_03', item = 'pistol_flashlight' },
        suppressor = { component = 'COMPONENT_AT_PI_SUPP', item = 'pistol_suppressor' },
        compensator = { component = 'COMPONENT_AT_PI_COMP_02', item = 'pistol_compensator' },
        digicamo = { component = 'COMPONENT_SNSPISTOL_MK2_CAMO_02', item = 'digital_weapontint' },
        brushcamo = { component = 'COMPONENT_SNSPISTOL_MK2_CAMO_03', item = 'brushstroke_weapontint' },
        woodcamo = { component = 'COMPONENT_SNSPISTOL_MK2_CAMO_04', item = 'woodland_weapontint' },
        skullcamo = { component = 'COMPONENT_SNSPISTOL_MK2_CAMO_05', item = 'skull_weapontint' },
        sessantacamo = { component = 'COMPONENT_SNSPISTOL_MK2_CAMO_06', item = 'sessanta_weapontint' },
        perseuscamo = { component = 'COMPONENT_SNSPISTOL_MK2_CAMO_07', item = 'perseus_weapontint' },
        leopardcamo = { component = 'COMPONENT_SNSPISTOL_MK2_CAMO_08', item = 'leopard_weapontint' },
        zebracamo = { component = 'COMPONENT_SNSPISTOL_MK2_CAMO_09', item = 'zebra_weapontint' },
        geocamo = { component = 'COMPONENT_SNSPISTOL_MK2_CAMO_10', item = 'geometric_weapontint' },
        boomcamo = { component = 'COMPONENT_SNSPISTOL_MK2_CAMO_11', item = 'boom_weapontint' },
        patriotcamo = { component = 'COMPONENT_SNSPISTOL_MK2_CAMO_IND_01', item = 'patriot_weapontint' }
    },

    -- SMG WEAPONS
    ['WEAPON_MICROSMG'] = {
        defaultclip = { component = 'COMPONENT_MICROSMG_CLIP_01', item = 'smg_defaultclip' },
        extendedclip = { component = 'COMPONENT_MICROSMG_CLIP_02', item = 'smg_extendedclip' },
        flashlight = { component = 'COMPONENT_AT_PI_FLSH', item = 'smg_flashlight' },
        scope = { component = 'COMPONENT_AT_SCOPE_MACRO', item = 'smg_scope' },
        suppressor = { component = 'COMPONENT_AT_AR_SUPP_02', item = 'smg_suppressor' },
        luxuryfinish = { component = 'COMPONENT_MICROSMG_VARMOD_LUXE', item = 'luxuryfinish_weapontint' }
    },
    ['WEAPON_SMG'] = {
        defaultclip = { component = 'COMPONENT_SMG_CLIP_01', item = 'smg_defaultclip' },
        extendedclip = { component = 'COMPONENT_SMG_CLIP_02', item = 'smg_extendedclip' },
        drum = { component = 'COMPONENT_SMG_CLIP_03', item = 'smg_drum' },
        flashlight = { component = 'COMPONENT_AT_AR_FLSH', item = 'smg_flashlight' },
        scope = { component = 'COMPONENT_AT_SCOPE_MACRO_02', item = 'smg_scope' },
        suppressor = { component = 'COMPONENT_AT_PI_SUPP', item = 'smg_suppressor' },
        luxuryfinish = { component = 'COMPONENT_SMG_VARMOD_LUXE', item = 'luxuryfinish_weapontint' }
    },
    ['WEAPON_ASSAULTSMG'] = {
        defaultclip = { component = 'COMPONENT_ASSAULTSMG_CLIP_01', item = 'smg_defaultclip' },
        extendedclip = { component = 'COMPONENT_ASSAULTSMG_CLIP_02', item = 'smg_extendedclip' },
        flashlight = { component = 'COMPONENT_AT_AR_FLSH', item = 'smg_flashlight' },
        scope = { component = 'COMPONENT_AT_SCOPE_MACRO', item = 'smg_scope' },
        suppressor = { component = 'COMPONENT_AT_AR_SUPP_02', item = 'smg_suppressor' },
        luxuryfinish = { component = 'COMPONENT_ASSAULTSMG_VARMOD_LOWRIDER', item = 'luxuryfinish_weapontint' }
    },
    ['WEAPON_MINISMG'] = {
        defaultclip = { component = 'COMPONENT_MINISMG_CLIP_01', item = 'smg_defaultclip' },
        extendedclip = { component = 'COMPONENT_MINISMG_CLIP_02', item = 'smg_extendedclip' }
    },
    ['WEAPON_MACHINEPISTOL'] = {
        defaultclip = { component = 'COMPONENT_MACHINEPISTOL_CLIP_01', item = 'smg_defaultclip' },
        extendedclip = { component = 'COMPONENT_MACHINEPISTOL_CLIP_02', item = 'smg_extendedclip' },
        drum = { component = 'COMPONENT_MACHINEPISTOL_CLIP_03', item = 'smg_drum' },
        suppressor = { component = 'COMPONENT_AT_PI_SUPP', item = 'smg_suppressor' }
    },
    ['WEAPON_COMBATPDW'] = {
        defaultclip = { component = 'COMPONENT_COMBATPDW_CLIP_01', item = 'smg_defaultclip' },
        extendedclip = { component = 'COMPONENT_COMBATPDW_CLIP_02', item = 'smg_extendedclip' },
        drum = { component = 'COMPONENT_COMBATPDW_CLIP_03', item = 'smg_drum' },
        flashlight = { component = 'COMPONENT_AT_AR_FLSH', item = 'smg_flashlight' },
        grip = { component = 'COMPONENT_AT_AR_AFGRIP', item = 'smg_grip' },
        scope = { component = 'COMPONENT_AT_SCOPE_SMALL', item = 'smg_scope' }
    },

    -- SMG MK2 WEAPONS
    ['WEAPON_SMG_MK2'] = {
        defaultclip = { component = 'COMPONENT_SMG_MK2_CLIP_01', item = 'smg_defaultclip' },
        extendedclip = { component = 'COMPONENT_SMG_MK2_CLIP_02', item = 'smg_extendedclip' },
        flashlight = { component = 'COMPONENT_AT_AR_FLSH', item = 'smg_flashlight' },
        holoscope = { component = 'COMPONENT_AT_SIGHTS_SMG', item = 'smg_holoscope' },
        scope = { component = 'COMPONENT_AT_SCOPE_SMALL_SMG_MK2', item = 'smg_scope' },
        drum = { component = 'COMPONENT_SMG_MK2_CLIP_Drum', item = 'smg_drum' },
        suppressor = { component = 'COMPONENT_AT_PI_SUPP', item = 'smg_suppressor' },
        barrel = { component = 'COMPONENT_AT_SB_BARREL_02', item = 'smg_barrel' },
        digicamo = { component = 'COMPONENT_SMG_MK2_CAMO', item = 'digital_weapontint' },
        brushcamo = { component = 'COMPONENT_SMG_MK2_CAMO_02', item = 'brushstroke_weapontint' },
        woodcamo = { component = 'COMPONENT_SMG_MK2_CAMO_03', item = 'woodland_weapontint' },
        skullcamo = { component = 'COMPONENT_SMG_MK2_CAMO_04', item = 'skull_weapontint' },
        sessantacamo = { component = 'COMPONENT_SMG_MK2_CAMO_05', item = 'sessanta_weapontint' },
        perseuscamo = { component = 'COMPONENT_SMG_MK2_CAMO_06', item = 'perseus_weapontint' },
        leopardcamo = { component = 'COMPONENT_SMG_MK2_CAMO_07', item = 'leopard_weapontint' },
        zebracamo = { component = 'COMPONENT_SMG_MK2_CAMO_08', item = 'zebra_weapontint' },
        geocamo = { component = 'COMPONENT_SMG_MK2_CAMO_09', item = 'geometric_weapontint' },
        boomcamo = { component = 'COMPONENT_SMG_MK2_CAMO_10', item = 'boom_weapontint' },
        patriotcamo = { component = 'COMPONENT_SMG_MK2_CAMO_IND_01', item = 'patriot_weapontint' }
    },

    -- SHOTGUNS
    ['WEAPON_PUMPSHOTGUN'] = {
        flashlight = { component = 'COMPONENT_AT_AR_FLSH', item = 'shotgun_flashlight' },
        suppressor = { component = 'COMPONENT_AT_SR_SUPP', item = 'shotgun_suppressor' },
        luxuryfinish = { component = 'COMPONENT_PUMPSHOTGUN_VARMOD_LOWRIDER', item = 'luxuryfinish_weapontint' }
    },
    ['WEAPON_SAWNOFFSHOTGUN'] = {
        luxuryfinish = { component = 'COMPONENT_SAWNOFFSHOTGUN_VARMOD_LUXE', item = 'luxuryfinish_weapontint' }
    },
    ['WEAPON_ASSAULTSHOTGUN'] = {
        defaultclip = { component = 'COMPONENT_ASSAULTSHOTGUN_CLIP_01', item = 'shotgun_defaultclip' },
        extendedclip = { component = 'COMPONENT_ASSAULTSHOTGUN_CLIP_02', item = 'shotgun_extendedclip' },
        flashlight = { component = 'COMPONENT_AT_AR_FLSH', item = 'shotgun_flashlight' },
        suppressor = { component = 'COMPONENT_AT_AR_SUPP', item = 'shotgun_suppressor' },
        grip = { component = 'COMPONENT_AT_AR_AFGRIP', item = 'shotgun_grip' }
    },
    ['WEAPON_BULLPUPSHOTGUN'] = {
        flashlight = { component = 'COMPONENT_AT_AR_FLSH', item = 'shotgun_flashlight' },
        suppressor = { component = 'COMPONENT_AT_AR_SUPP_02', item = 'shotgun_suppressor' },
        grip = { component = 'COMPONENT_AT_AR_AFGRIP', item = 'shotgun_grip' }
    },
    ['WEAPON_HEAVYSHOTGUN'] = {
        defaultclip = { component = 'COMPONENT_HEAVYSHOTGUN_CLIP_01', item = 'shotgun_defaultclip' },
        extendedclip = { component = 'COMPONENT_HEAVYSHOTGUN_CLIP_02', item = 'shotgun_extendedclip' },
        drum = { component = 'COMPONENT_HEAVYSHOTGUN_CLIP_03', item = 'shotgun_drum' },
        flashlight = { component = 'COMPONENT_AT_AR_FLSH', item = 'shotgun_flashlight' },
        suppressor = { component = 'COMPONENT_AT_AR_SUPP_02', item = 'shotgun_suppressor' },
        grip = { component = 'COMPONENT_AT_AR_AFGRIP', item = 'shotgun_grip' }
    },
    ['WEAPON_COMBATSHOTGUN'] = {
        flashlight = { component = 'COMPONENT_AT_AR_FLSH', item = 'shotgun_flashlight' },
        suppressor = { component = 'COMPONENT_AT_AR_SUPP', item = 'shotgun_suppressor' }
    },
    ['WEAPON_PUMPSHOTGUN_MK2'] = {
        defaultclip = { component = 'COMPONENT_PUMPSHOTGUN_MK2_CLIP_01', item = 'shotgun_defaultclip' },
        extendedclip = { component = 'COMPONENT_PUMPSHOTGUN_MK2_CLIP_02', item = 'shotgun_extendedclip' },
        flashlight = { component = 'COMPONENT_AT_AR_FLSH', item = 'shotgun_flashlight' },
        suppressor = { component = 'COMPONENT_AT_SR_SUPP_03', item = 'shotgun_suppressor' },
        squaremuzzle = { component = 'COMPONENT_AT_MUZZLE_08', item = 'shotgun_squaredmuzzle' },
        holoscope = { component = 'COMPONENT_AT_SCOPE_SMALL_MK2', item = 'shotgun_holoscope' },
        scope = { component = 'COMPONENT_AT_SCOPE_SMALL_MK2', item = 'shotgun_scope' },
        digicamo = { component = 'COMPONENT_PUMPSHOTGUN_MK2_CAMO', item = 'digital_weapontint' },
        brushcamo = { component = 'COMPONENT_PUMPSHOTGUN_MK2_CAMO_02', item = 'brushstroke_weapontint' },
        woodcamo = { component = 'COMPONENT_PUMPSHOTGUN_MK2_CAMO_03', item = 'woodland_weapontint' },
        skullcamo = { component = 'COMPONENT_PUMPSHOTGUN_MK2_CAMO_04', item = 'skull_weapontint' },
        sessantacamo = { component = 'COMPONENT_PUMPSHOTGUN_MK2_CAMO_05', item = 'sessanta_weapontint' },
        perseuscamo = { component = 'COMPONENT_PUMPSHOTGUN_MK2_CAMO_06', item = 'perseus_weapontint' },
        leopardcamo = { component = 'COMPONENT_PUMPSHOTGUN_MK2_CAMO_07', item = 'leopard_weapontint' },
        zebracamo = { component = 'COMPONENT_PUMPSHOTGUN_MK2_CAMO_08', item = 'zebra_weapontint' },
        geocamo = { component = 'COMPONENT_PUMPSHOTGUN_MK2_CAMO_09', item = 'geometric_weapontint' },
        boomcamo = { component = 'COMPONENT_PUMPSHOTGUN_MK2_CAMO_10', item = 'boom_weapontint' },
        patriotcamo = { component = 'COMPONENT_PUMPSHOTGUN_MK2_CAMO_IND_01', item = 'patriot_weapontint' }
    },

    -- RIFLES
    ['WEAPON_ASSAULTRIFLE'] = {
        defaultclip = { component = 'COMPONENT_ASSAULTRIFLE_CLIP_01', item = 'rifle_defaultclip' },
        extendedclip = { component = 'COMPONENT_ASSAULTRIFLE_CLIP_02', item = 'rifle_extendedclip' },
        drum = { component = 'COMPONENT_ASSAULTRIFLE_CLIP_03', item = 'rifle_drum' },
        flashlight = { component = 'COMPONENT_AT_AR_FLSH', item = 'rifle_flashlight' },
        scope = { component = 'COMPONENT_AT_SCOPE_MACRO', item = 'rifle_scope' },
        suppressor = { component = 'COMPONENT_AT_AR_SUPP_02', item = 'rifle_suppressor' },
        grip = { component = 'COMPONENT_AT_AR_AFGRIP', item = 'rifle_grip' },
        luxuryfinish = { component = 'COMPONENT_ASSAULTRIFLE_VARMOD_LUXE', item = 'luxuryfinish_weapontint' }
    },
    ['WEAPON_CARBINERIFLE'] = {
        defaultclip = { component = 'COMPONENT_CARBINERIFLE_CLIP_01', item = 'rifle_defaultclip' },
        extendedclip = { component = 'COMPONENT_CARBINERIFLE_CLIP_02', item = 'rifle_extendedclip' },
        drum = { component = 'COMPONENT_CARBINERIFLE_CLIP_03', item = 'rifle_drum' },
        flashlight = { component = 'COMPONENT_AT_AR_FLSH', item = 'rifle_flashlight' },
        scope = { component = 'COMPONENT_AT_SCOPE_MEDIUM', item = 'rifle_scope' },
        suppressor = { component = 'COMPONENT_AT_AR_SUPP', item = 'rifle_suppressor' },
        grip = { component = 'COMPONENT_AT_AR_AFGRIP', item = 'rifle_grip' },
        luxuryfinish = { component = 'COMPONENT_CARBINERIFLE_VARMOD_LUXE', item = 'luxuryfinish_weapontint' }
    },
    ['WEAPON_ADVANCEDRIFLE'] = {
        defaultclip = { component = 'COMPONENT_ADVANCEDRIFLE_CLIP_01', item = 'rifle_defaultclip' },
        extendedclip = { component = 'COMPONENT_ADVANCEDRIFLE_CLIP_02', item = 'rifle_extendedclip' },
        flashlight = { component = 'COMPONENT_AT_AR_FLSH', item = 'rifle_flashlight' },
        scope = { component = 'COMPONENT_AT_SCOPE_SMALL', item = 'rifle_scope' },
        suppressor = { component = 'COMPONENT_AT_AR_SUPP', item = 'rifle_suppressor' },
        luxuryfinish = { component = 'COMPONENT_ADVANCEDRIFLE_VARMOD_LUXE', item = 'luxuryfinish_weapontint' }
    },
    ['WEAPON_SPECIALCARBINE'] = {
        defaultclip = { component = 'COMPONENT_SPECIALCARBINE_CLIP_01', item = 'rifle_defaultclip' },
        extendedclip = { component = 'COMPONENT_SPECIALCARBINE_CLIP_02', item = 'rifle_extendedclip' },
        drum = { component = 'COMPONENT_SPECIALCARBINE_CLIP_03', item = 'rifle_drum' },
        flashlight = { component = 'COMPONENT_AT_AR_FLSH', item = 'rifle_flashlight' },
        scope = { component = 'COMPONENT_AT_SCOPE_MEDIUM', item = 'rifle_scope' },
        suppressor = { component = 'COMPONENT_AT_AR_SUPP_02', item = 'rifle_suppressor' },
        grip = { component = 'COMPONENT_AT_AR_AFGRIP', item = 'rifle_grip' },
        luxuryfinish = { component = 'COMPONENT_SPECIALCARBINE_VARMOD_LOWRIDER', item = 'luxuryfinish_weapontint' }
    },
    ['WEAPON_BULLPUPRIFLE'] = {
        defaultclip = { component = 'COMPONENT_BULLPUPRIFLE_CLIP_01', item = 'rifle_defaultclip' },
        extendedclip = { component = 'COMPONENT_BULLPUPRIFLE_CLIP_02', item = 'rifle_extendedclip' },
        flashlight = { component = 'COMPONENT_AT_AR_FLSH', item = 'rifle_flashlight' },
        scope = { component = 'COMPONENT_AT_SCOPE_SMALL', item = 'rifle_scope' },
        suppressor = { component = 'COMPONENT_AT_AR_SUPP', item = 'rifle_suppressor' },
        grip = { component = 'COMPONENT_AT_AR_AFGRIP', item = 'rifle_grip' },
        luxuryfinish = { component = 'COMPONENT_BULLPUPRIFLE_VARMOD_LOW', item = 'luxuryfinish_weapontint' }
    },
    ['WEAPON_COMPACTRIFLE'] = {
        defaultclip = { component = 'COMPONENT_COMPACTRIFLE_CLIP_01', item = 'rifle_defaultclip' },
        extendedclip = { component = 'COMPONENT_COMPACTRIFLE_CLIP_02', item = 'rifle_extendedclip' },
        drum = { component = 'COMPONENT_COMPACTRIFLE_CLIP_03', item = 'rifle_drum' }
    },
    ['WEAPON_HEAVYRIFLE'] = {
        defaultclip = { component = 'COMPONENT_HEAVYRIFLE_CLIP_01', item = 'rifle_defaultclip' },
        extendedclip = { component = 'COMPONENT_HEAVYRIFLE_CLIP_02', item = 'rifle_extendedclip' },
        flashlight = { component = 'COMPONENT_AT_AR_FLSH', item = 'rifle_flashlight' },
        scope = { component = 'COMPONENT_AT_SCOPE_MEDIUM', item = 'rifle_scope' },
        suppressor = { component = 'COMPONENT_AT_AR_SUPP', item = 'rifle_suppressor' },
        grip = { component = 'COMPONENT_AT_AR_AFGRIP', item = 'rifle_grip' },
        luxuryfinish = { component = 'COMPONENT_BULLPUPRIFLE_VARMOD_LOW', item = 'luxuryfinish_weapontint' }
    },
    ['WEAPON_ASSAULTRIFLE_MK2'] = {
        defaultclip = { component = 'COMPONENT_ASSAULTRIFLE_MK2_CLIP_01', item = 'rifle_defaultclip' },
        extendedclip = { component = 'COMPONENT_ASSAULTRIFLE_MK2_CLIP_02', item = 'rifle_extendedclip' },
        flashlight = { component = 'COMPONENT_AT_AR_FLSH', item = 'rifle_flashlight' },
        holographic = { component = 'COMPONENT_AT_SIGHTS', item = 'rifle_holoscope' },
        smallscope = { component = 'COMPONENT_AT_SCOPE_MACRO_MK2', item = 'rifle_smallscope' },
        largescope = { component = 'COMPONENT_AT_SCOPE_MEDIUM_MK2', item = 'rifle_largescope' },
        suppressor = { component = 'COMPONENT_AT_AR_SUPP_02', item = 'rifle_suppressor' },
        digicamo = { component = 'COMPONENT_ASSAULTRIFLE_MK2_CAMO', item = 'digital_weapontint' },
        brushcamo = { component = 'COMPONENT_ASSAULTRIFLE_MK2_CAMO_02', item = 'brushstroke_weapontint' },
        woodcamo = { component = 'COMPONENT_ASSAULTRIFLE_MK2_CAMO_03', item = 'woodland_weapontint' },
        skullcamo = { component = 'COMPONENT_ASSAULTRIFLE_MK2_CAMO_04', item = 'skull_weapontint' },
        sessantacamo = { component = 'COMPONENT_ASSAULTRIFLE_MK2_CAMO_05', item = 'sessanta_weapontint' },
        perseuscamo = { component = 'COMPONENT_ASSAULTRIFLE_MK2_CAMO_06', item = 'perseus_weapontint' },
        leopardcamo = { component = 'COMPONENT_ASSAULTRIFLE_MK2_CAMO_07', item = 'leopard_weapontint' },
        zebracamo = { component = 'COMPONENT_ASSAULTRIFLE_MK2_CAMO_08', item = 'zebra_weapontint' },
        geocamo = { component = 'COMPONENT_ASSAULTRIFLE_MK2_CAMO_09', item = 'geometric_weapontint' },
        boomcamo = { component = 'COMPONENT_ASSAULTRIFLE_MK2_CAMO_10', item = 'boom_weapontint' },
        patriotcamo = { component = 'COMPONENT_ASSAULTRIFLE_MK2_CAMO_IND_01', item = 'patriot_weapontint' }
    },
    ['WEAPON_CARBINERIFLE_MK2'] = {
        defaultclip = { component = 'COMPONENT_CARBINERIFLE_MK2_CLIP_01', item = 'rifle_defaultclip' },
        extendedclip = { component = 'COMPONENT_CARBINERIFLE_MK2_CLIP_02', item = 'rifle_extendedclip' },
        flashlight = { component = 'COMPONENT_AT_AR_FLSH', item = 'rifle_flashlight' },
        holographic = { component = 'COMPONENT_AT_SIGHTS', item = 'rifle_holoscope' },
        smallscope = { component = 'COMPONENT_AT_SCOPE_MACRO_MK2', item = 'rifle_smallscope' },
        largescope = { component = 'COMPONENT_AT_SCOPE_MEDIUM_MK2', item = 'rifle_largescope' },
        suppressor = { component = 'COMPONENT_AT_AR_SUPP', item = 'rifle_suppressor' },
        digicamo = { component = 'COMPONENT_CARBINERIFLE_MK2_CAMO', item = 'digital_weapontint' },
        brushcamo = { component = 'COMPONENT_CARBINERIFLE_MK2_CAMO_02', item = 'brushstroke_weapontint' },
        woodcamo = { component = 'COMPONENT_CARBINERIFLE_MK2_CAMO_03', item = 'woodland_weapontint' },
        skullcamo = { component = 'COMPONENT_CARBINERIFLE_MK2_CAMO_04', item = 'skull_weapontint' },
        sessantacamo = { component = 'COMPONENT_CARBINERIFLE_MK2_CAMO_05', item = 'sessanta_weapontint' },
        perseuscamo = { component = 'COMPONENT_CARBINERIFLE_MK2_CAMO_06', item = 'perseus_weapontint' },
        leopardcamo = { component = 'COMPONENT_CARBINERIFLE_MK2_CAMO_07', item = 'leopard_weapontint' },
        zebracamo = { component = 'COMPONENT_CARBINERIFLE_MK2_CAMO_08', item = 'zebra_weapontint' },
        geocamo = { component = 'COMPONENT_CARBINERIFLE_MK2_CAMO_09', item = 'geometric_weapontint' },
        boomcamo = { component = 'COMPONENT_CARBINERIFLE_MK2_CAMO_10', item = 'boom_weapontint' },
        patriotcamo = { component = 'COMPONENT_CARBINERIFLE_MK2_CAMO_IND_01', item = 'patriot_weapontint' }
    },
    ['WEAPON_SPECIALCARBINE_MK2'] = {
        defaultclip = { component = 'COMPONENT_SPECIALCARBINE_MK2_CLIP_01', item = 'rifle_defaultclip' },
        extendedclip = { component = 'COMPONENT_SPECIALCARBINE_MK2_CLIP_02', item = 'rifle_extendedclip' },
        flashlight = { component = 'COMPONENT_AT_AR_FLSH', item = 'rifle_flashlight' },
        holographic = { component = 'COMPONENT_AT_SIGHTS', item = 'rifle_holoscope' },
        smallscope = { component = 'COMPONENT_AT_SCOPE_MACRO_MK2', item = 'rifle_smallscope' },
        largescope = { component = 'COMPONENT_AT_SCOPE_MEDIUM_MK2', item = 'rifle_largescope' },
        suppressor = { component = 'COMPONENT_AT_AR_SUPP_02', item = 'rifle_suppressor' },
        digicamo = { component = 'COMPONENT_SPECIALCARBINE_MK2_CAMO', item = 'digital_weapontint' },
        brushcamo = { component = 'COMPONENT_SPECIALCARBINE_MK2_CAMO_02', item = 'brushstroke_weapontint' },
        woodcamo = { component = 'COMPONENT_SPECIALCARBINE_MK2_CAMO_03', item = 'woodland_weapontint' },
        skullcamo = { component = 'COMPONENT_SPECIALCARBINE_MK2_CAMO_04', item = 'skull_weapontint' },
        sessantacamo = { component = 'COMPONENT_SPECIALCARBINE_MK2_CAMO_05', item = 'sessanta_weapontint' },
        perseuscamo = { component = 'COMPONENT_SPECIALCARBINE_MK2_CAMO_06', item = 'perseus_weapontint' },
        leopardcamo = { component = 'COMPONENT_SPECIALCARBINE_MK2_CAMO_07', item = 'leopard_weapontint' },
        zebracamo = { component = 'COMPONENT_SPECIALCARBINE_MK2_CAMO_08', item = 'zebra_weapontint' },
        geocamo = { component = 'COMPONENT_SPECIALCARBINE_MK2_CAMO_09', item = 'geometric_weapontint' },
        boomcamo = { component = 'COMPONENT_SPECIALCARBINE_MK2_CAMO_10', item = 'boom_weapontint' },
        patriotcamo = { component = 'COMPONENT_SPECIALCARBINE_MK2_CAMO_IND_01', item = 'patriot_weapontint' }
    },
    ['WEAPON_BULLPUPRIFLE_MK2'] = {
        defaultclip = { component = 'COMPONENT_BULLPUPRIFLE_MK2_CLIP_01', item = 'rifle_defaultclip' },
        extendedclip = { component = 'COMPONENT_BULLPUPRIFLE_MK2_CLIP_02', item = 'rifle_extendedclip' },
        flashlight = { component = 'COMPONENT_AT_AR_FLSH', item = 'rifle_flashlight' },
        holographic = { component = 'COMPONENT_AT_SIGHTS', item = 'rifle_holoscope' },
        smallscope = { component = 'COMPONENT_AT_SCOPE_MACRO_02_MK2', item = 'rifle_smallscope' },
        largescope = { component = 'COMPONENT_AT_SCOPE_SMALL_MK2', item = 'rifle_largescope' },
        suppressor = { component = 'COMPONENT_AT_AR_SUPP', item = 'rifle_suppressor' },
        digicamo = { component = 'COMPONENT_BULLPUPRIFLE_MK2_CAMO', item = 'digital_weapontint' },
        brushcamo = { component = 'COMPONENT_BULLPUPRIFLE_MK2_CAMO_02', item = 'brushstroke_weapontint' },
        woodcamo = { component = 'COMPONENT_BULLPUPRIFLE_MK2_CAMO_03', item = 'woodland_weapontint' },
        skullcamo = { component = 'COMPONENT_BULLPUPRIFLE_MK2_CAMO_04', item = 'skull_weapontint' },
        sessantacamo = { component = 'COMPONENT_BULLPUPRIFLE_MK2_CAMO_05', item = 'sessanta_weapontint' },
        perseuscamo = { component = 'COMPONENT_BULLPUPRIFLE_MK2_CAMO_06', item = 'perseus_weapontint' },
        leopardcamo = { component = 'COMPONENT_BULLPUPRIFLE_MK2_CAMO_07', item = 'leopard_weapontint' },
        zebracamo = { component = 'COMPONENT_BULLPUPRIFLE_MK2_CAMO_08', item = 'zebra_weapontint' },
        geocamo = { component = 'COMPONENT_BULLPUPRIFLE_MK2_CAMO_09', item = 'geometric_weapontint' },
        boomcamo = { component = 'COMPONENT_BULLPUPRIFLE_MK2_CAMO_10', item = 'boom_weapontint' },
        patriotcamo = { component = 'COMPONENT_BULLPUPRIFLE_MK2_CAMO_IND_01', item = 'patriot_weapontint' }
    },

    -- SNIPERS
    ['WEAPON_SNIPERRIFLE'] = {
        defaultclip = { component = 'COMPONENT_SNIPERRIFLE_CLIP_01', item = 'sniper_defaultclip' },
        suppressor = { component = 'COMPONENT_AT_AR_SUPP_02', item = 'sniper_suppressor' },
        scope = { component = 'COMPONENT_AT_SCOPE_LARGE', item = 'sniper_scope' },
        largescope = { component = 'COMPONENT_AT_SCOPE_MAX', item = 'sniper_largescope' }
    },

    ['WEAPON_HEAVYSNIPER'] = {
        defaultclip = { component = 'COMPONENT_HEAVYSNIPER_CLIP_01', item = 'sniper_defaultclip' },
        scope = { component = 'COMPONENT_AT_SCOPE_LARGE', item = 'sniper_scope' },
        largescope = { component = 'COMPONENT_AT_SCOPE_MAX', item = 'sniper_largescope' }
    },

    ['WEAPON_MARKSMANRIFLE'] = {
        defaultclip = { component = 'COMPONENT_MARKSMANRIFLE_CLIP_01', item = 'sniper_defaultclip' },
        extendedclip = { component = 'COMPONENT_MARKSMANRIFLE_CLIP_02', item = 'sniper_extendedclip' },
        flashlight = { component = 'COMPONENT_AT_AR_FLSH', item = 'sniper_flashlight' },
        scope = { component = 'COMPONENT_AT_SCOPE_LARGE_FIXED_ZOOM', item = 'sniper_scope' },
        suppressor = { component = 'COMPONENT_AT_AR_SUPP', item = 'sniper_suppressor' },
        grip = { component = 'COMPONENT_AT_AR_AFGRIP', item = 'sniper_grip' },
        luxuryfinish = { component = 'COMPONENT_MARKSMANRIFLE_VARMOD_LUXE', item = 'luxuryfinish_weapontint' }
    },

    ['WEAPON_HEAVYSNIPER_MK2'] = {
        defaultclip = { component = 'COMPONENT_HEAVYSNIPER_MK2_CLIP_01', item = 'sniper_defaultclip' },
        extendedclip = { component = 'COMPONENT_HEAVYSNIPER_MK2_CLIP_02', item = 'sniper_extendedclip' },
        flashlight = { component = 'COMPONENT_AT_AR_FLSH', item = 'sniper_flashlight' },
        holographic = { component = 'COMPONENT_AT_SIGHTS', item = 'sniper_holoscope' },
        smallscope = { component = 'COMPONENT_AT_SCOPE_SMALL_MK2', item = 'sniper_smallscope' },
        largescope = { component = 'COMPONENT_AT_SCOPE_LARGE_MK2', item = 'sniper_largescope' },
        suppressor = { component = 'COMPONENT_AT_SR_SUPP_03', item = 'sniper_suppressor' },
        squaredmuzzle = { component = 'COMPONENT_AT_MUZZLE_08', item = 'sniper_squaredmuzzle' },
        barrel = { component = 'COMPONENT_AT_SR_BARREL_02', item = 'sniper_barrel' },
        digicamo = { component = 'COMPONENT_HEAVYSNIPER_MK2_CAMO', item = 'weapon_digicamo' },
        brushcamo = { component = 'COMPONENT_HEAVYSNIPER_MK2_CAMO_02', item = 'brushstroke_weapontint' },
        woodcamo = { component = 'COMPONENT_HEAVYSNIPER_MK2_CAMO_03', item = 'woodland_weapontint' },
        skullcamo = { component = 'COMPONENT_HEAVYSNIPER_MK2_CAMO_04', item = 'skull_weapontint' },
        sessantacamo = { component = 'COMPONENT_HEAVYSNIPER_MK2_CAMO_05', item = 'sessanta_weapontint' },
        perseuscamo = { component = 'COMPONENT_HEAVYSNIPER_MK2_CAMO_06', item = 'perseus_weapontint' },
        leopardcamo = { component = 'COMPONENT_HEAVYSNIPER_MK2_CAMO_07', item = 'leopard_weapontint' },
        zebracamo = { component = 'COMPONENT_HEAVYSNIPER_MK2_CAMO_08', item = 'zebra_weapontint' },
        geocamo = { component = 'COMPONENT_HEAVYSNIPER_MK2_CAMO_09', item = 'geometric_weapontint' },
        boomcamo = { component = 'COMPONENT_HEAVYSNIPER_MK2_CAMO_10', item = 'boom_weapontint' },
        patriotcamo = { component = 'COMPONENT_HEAVYSNIPER_MK2_CAMO_IND_01', item = 'patriot_weapontint' }
    }
    -- Additional weapon attachments continue as needed
}

--[[
    Weapon Tint Configuration and Hash Details

    This section, `Config.WeaponTints`, allows you to add custom tints and associate textures for each compatible weapon.
    By specifying the weapon hash, texture dictionary (YTD), and texture name, you can define unique looks for each
    weapon type. You can retrieve the weapon hash codes from trusted sources such as the RAGE MP Wiki:
    https://wiki.rage.mp/index.php?title=Weapons or other GTA V-related documentation.

    Important Fields:
    - `hash`: Unique identifier for each weapon model.
    - `ytd`: Texture dictionary name, defining the collection where the texture resides.
    - `texture`: Specific texture name applied to the weapon.

    *DO NOT MODIFY* the functions or export structures below unless absolutely necessary. These functions are designed
    for server synchronization and other advanced features, and altering them without full understanding may lead to
    unintended behavior.

    Tint Definition Example:
    Below is the syntax to add new tint settings:
    [number] = { name = 'Weapon Name', hash = 'WeaponHashCode', ytd = 'TextureDictionary', texture = 'TextureName' }
]]

Config.WeaponTints = {
    -- Pistols
    [1] = { name = 'Pistol', hash = '453432689', ytd = 'w_pi_pistol', texture = 'w_pi_pistol' },
    [2] = { name = 'Pistol Mk II', hash = '3219281620', ytd = 'w_pi_pistolmk2', texture = 'w_pi_pistolmk2' },
    [3] = { name = 'Combat Pistol', hash = '1593441988', ytd = 'w_pi_combatpistol', texture = 'w_pi_combatpistol' },
    [4] = { name = 'Pistol .50', hash = '-1716589765', ytd = 'w_pi_pistol50', texture = 'w_pi_pistol50' },
    [5] = { name = 'SNS Pistol', hash = '-1076751822', ytd = 'w_pi_sns_pistol', texture = 'w_pi_sns_pistol' },
    [6] = { name = 'Heavy Pistol', hash = '-771403250', ytd = 'w_pi_heavypistol', texture = 'w_pi_heavypistol' },
    [7] = { name = 'Vintage Pistol', hash = '137902532', ytd = 'w_pi_vintage_pistol', texture = 'w_pi_vintage_pistol' },
    [8] = { name = 'Marksman Pistol', hash = '-598887786', ytd = 'w_pi_singleshot', texture = 'w_pi_singleshot_dm' },
    [9] = { name = 'Revolver', hash = '-1045183535', ytd = 'w_pi_revolver', texture = 'w_pi_revolver' },
    [10] = { name = 'Stun Gun', hash = '911657153', ytd = 'w_pi_stungun', texture = 'w_pi_stungun' },
    [11] = { name = 'Double-Action Revolver', hash = '-1746263880', ytd = 'w_pi_revolver', texture = 'w_pi_revolver' },
    [12] = { name = 'Navy Revolver', hash = '-2056364401', ytd = 'w_pi_revolver', texture = 'w_pi_revolver' },
    [13] = { name = 'Ceramic Pistol', hash = '727643628', ytd = 'w_pi_ceramic_pistol', texture = 'w_pi_ceramic_pistol' },
    -- Submachine guns and machine guns
    [14] = { name = 'Micro SMG', hash = '324215364', ytd = 'w_sb_microsmg', texture = 'w_sb_microsmg' },
    [15] = { name = 'Machine Pistol', hash = '-619010992', ytd = 'w_sb_compactsmg', texture = 'w_sb_compactsmg' },
    [16] = { name = 'SMG', hash = '736523883', ytd = 'w_sb_smg', texture = 'w_sb_smg' },
    [17] = { name = 'SMG Mk II', hash = '2024373456', ytd = 'w_sb_smgmk2', texture = 'w_sb_smgmk2' },
    [18] = { name = 'Assault SMG', hash = '-270015777', ytd = 'w_sb_assaultsmg', texture = 'w_sb_assaultsmg' },
    [19] = { name = 'Mini SMG', hash = '-1121678507', ytd = 'w_sb_minismg', texture = 'w_sb_minismg_dm' },
    [20] = { name = 'Combat PDW', hash = '171789620', ytd = 'w_sb_pdw', texture = 'w_sb_pdw' },
    -- Assault rifles and carbines
    [21] = { name = 'Assault Rifle', hash = '-1074790547', ytd = 'w_ar_assaultrifle', texture = 'w_ar_assaultrifle' },
    [22] = { name = 'Assault Rifle Mk II', hash = '961495388', ytd = 'w_ar_assaultriflemk2', texture = 'w_ar_assaultriflemk2' },
    [23] = { name = 'Carbine Rifle', hash = '-2084633992', ytd = 'w_ar_carbinerifle', texture = 'w_ar_carbinerifle' },
    [24] = { name = 'Carbine Rifle Mk II', hash = '-86904375', ytd = 'w_ar_carbineriflemk2', texture = 'w_ar_carbineriflemk2' },
    [25] = { name = 'Special Carbine', hash = '-1063057011', ytd = 'w_ar_specialcarbine', texture = 'w_ar_specialcarbine_tint' },
    [26] = { name = 'Special Carbine Mk II', hash = '-1768145561', ytd = 'w_ar_specialcarbine_mk2', texture = 'w_ar_specialcarbine_mk2' },
    [27] = { name = 'Bullpup Rifle', hash = '2132975508', ytd = 'w_ar_bullpuprifle', texture = 'w_ar_bullpuprifle' },
    -- Sniper Rifles
    [28] = { name = 'Sniper Rifle', hash = '100416529', ytd = 'w_sr_sniperrifle', texture = 'w_sr_sniperrifle' },
    [29] = { name = 'Heavy Sniper', hash = '205991906', ytd = 'w_sr_heavysniper', texture = 'w_sr_heavysniper' },
    [30] = { name = 'Heavy Sniper Mk II', hash = '177293209', ytd = 'w_sr_heavysnipermk2', texture = 'w_sr_heavysnipermk2' },
    [31] = { name = 'Marksman Rifle', hash = '-952879014', ytd = 'w_sr_marksmanrifle', texture = 'w_sr_marksmanrifle' },
    -- Shotguns
    [32] = { name = 'Pump Shotgun', hash = '487013001', ytd = 'w_sg_pumpshotgun', texture = 'w_sg_pumpshotgun' },
    [33] = { name = 'Sawed-Off Shotgun', hash = '2017895192', ytd = 'w_sg_sawnoff', texture = 'w_sg_sawnoff' },
    [34] = { name = 'Bullpup Shotgun', hash = '-1654528753', ytd = 'w_sg_bullpupshotgun', texture = 'w_sg_bullpupshotgun' },
    [35] = { name = 'Double Barrel Shotgun', hash = '-275439685', ytd = 'w_sg_doublebarrel', texture = 'w_sg_doublebarrel_dm' },
    -- Others
    [36] = { name = 'Railgun', hash = '1834241177', ytd = 'w_ar_railgun', texture = 'w_ar_railgun' },
    [37] = { name = 'Minigun', hash = '1119849093', ytd = 'w_mg_minigun', texture = 'w_mg_minigun' },
    [38] = { name = 'Widowmaker', hash = '-1238556825', ytd = 'w_mg_sminigun', texture = 'w_mg_sminigun' },
    [39] = { name = 'Unholy Hellbringer', hash = '1198256469', ytd = 'w_ar_carbinerifle', texture = 'w_ar_carbinerifle' },
    -- weapon_pumpshotgun_mk2
    [40] = { name = 'Pump Shotgun Mk II', hash = '1432025498', ytd = 'w_sg_pumpshotgunmk2', texture = 'w_sg_pumpshotgunmk2' },
    -- Additional weapon entries continue as needed
}

--[[
    **DO NOT MODIFY BELOW**

    The following code is essential for synchronizing weapon tints and attachments across the server.
    Modifying any part of this section may cause serious issues with the weapon attachment and tint system.
    Please avoid editing or removing any functions, loops, or export structures here unless you have
    a full understanding of their functionality. These configurations ensure the accurate application
    of customizations and are crucial for server stability.
]]

RegisterNetEvent('qb-weapons:getWeaponsAttachments', function(cb)
    cb(Config.WeaponAttachments)
end)

sharedExports('GetWeaponTints', function()
    return Config.WeaponTints
end)

---@type AttachmentItem[]
Config.WeaponAttachmentItems = {
    -- Rifles
    {
        item = 'rifle_suppressor',
        attachment = 'suppressor',
        type = 'suppressor'
    },
    {
        item = 'rifle_smallscope',
        attachment = 'smallscope',
        type = 'scope'
    },
    {
        item = 'rifle_grip',
        attachment = 'grip',
        type = 'clip'
    },
    {
        item = 'rifle_defaultclip',
        attachment = 'defaultclip',
        type = 'clip'
    },
    {
        item = 'rifle_extendedclip',
        attachment = 'extendedclip',
        type = 'clip'
    },
    {
        item = 'rifle_drum',
        attachment = 'drum',
        type = 'clip'
    },
    {
        item = 'rifle_flashlight',
        attachment = 'flashlight',
        type = 'flash'
    },
    {
        item = 'rifle_largescope',
        attachment = 'largescope',
        type = 'scope'
    },
    {
        item = 'rifle_holoscope',
        attachment = 'holographic',
        type = 'scope'
    },

    -- Custom Tints
    {
        item = 'luxuryfinish_weapontint',
        attachment = 'luxuryfinish',
        type = 'tint'
    },
    {
        item = 'digital_weapontint',
        attachment = 'digicamo',
        type = 'tint'
    },
    {
        item = 'brushstroke_weapontint',
        attachment = 'brushcamo',
        type = 'tint'
    },
    {
        item = 'woodland_weapontint',
        attachment = 'woodcamo',
        type = 'tint'
    },
    {
        item = 'skull_weapontint',
        attachment = 'skullcamo',
        type = 'tint'
    },
    {
        item = 'sessanta_weapontint',
        attachment = 'sessantacamo',
        type = 'tint'
    },
    {
        item = 'perseus_weapontint',
        attachment = 'perseuscamo',
        type = 'tint'
    },
    {
        item = 'leopard_weapontint',
        attachment = 'leopardcamo',
        type = 'tint'
    },
    {
        item = 'zebra_weapontint',
        attachment = 'zebracamo',
        type = 'tint'
    },
    {
        item = 'geometric_weapontint',
        attachment = 'geocamo',
        type = 'tint'
    },
    {
        item = 'boom_weapontint',
        attachment = 'boomcamo',
        type = 'tint'
    },
    {
        item = 'patriot_weapontint',
        attachment = 'patriotcamo',
        type = 'tint'
    },

    -- Sniper
    {
        item = 'sniper_suppressor',
        attachment = 'suppressor',
        type = 'suppressor'
    },
    {
        item = 'sniper_scope',
        attachment = 'scope',
        type = 'scope'
    },
    {
        item = 'sniper_defaultclip',
        attachment = 'defaultclip',
        type = 'clip'
    },
    {
        item = 'sniper_extendedclip',
        attachment = 'extendedclip',
        type = 'clip'
    },
    {
        item = 'sniper_squaredmuzzle',
        attachment = 'squaredmuzzle',
        type = 'suppressor'
    },
    {
        item = 'sniper_barrel',
        attachment = 'barrel',
        type = 'suppressor'
    },
    {
        item = 'sniper_flashlight',
        attachment = 'flashlight',
        type = 'flash'
    },
    {
        item = 'sniper_holoscope',
        attachment = 'holographic',
        type = 'scope'
    },
    {
        item = 'sniper_smallscope',
        attachment = 'smallscope',
        type = 'scope'
    },
    {
        item = 'sniper_largescope',
        attachment = 'largescope',
        type = 'scope'
    },
    {
        item = 'sniper_grip',
        attachment = 'grip',
        type = 'clip'
    },

    -- Pistol
    {
        item = 'pistol_defaultclip',
        attachment = 'clip',
        type = 'clip'
    },
    {
        item = 'pistol_extendedclip',
        attachment = 'extendedclip',
        type = 'clip'
    },
    {
        item = 'pistol_flashlight',
        attachment = 'flashlight',
        type = 'flash'
    },
    {
        item = 'pistol_suppressor',
        attachment = 'suppressor',
        type = 'suppressor'
    },
    {
        item = 'pistol_holoscope',
        attachment = 'holoscope',
        type = 'scope'
    },
    {
        item = 'pistol_smallscope',
        attachment = 'scope',
        type = 'scope'
    },
    {
        item = 'pistol_compensator',
        attachment = 'suppressor',
        type = 'suppressor'
    },

    -- SMG
    {
        item = 'smg_defaultclip',
        attachment = 'defaultclip',
        type = 'clip'
    },
    {
        item = 'smg_extendedclip',
        attachment = 'extendedclip',
        type = 'clip'
    },
    {
        item = 'smg_suppressor',
        attachment = 'suppressor',
        type = 'suppressor'
    },
    {
        item = 'smg_drum',
        attachment = 'drum',
        type = 'clip'
    },
    {
        item = 'smg_scope',
        attachment = 'scope',
        type = 'scope'
    },
    {
        item = 'smg_barrel',
        attachment = 'barrel',
        type = 'suppressor'
    },

    -- Shotgun
    {
        item = 'shotgun_defaultclip',
        attachment = 'defaultclip',
        type = 'clip'
    },
    {
        item = 'shotgun_extendedclip',
        attachment = 'extendedclip',
        type = 'clip'
    },
    {
        item = 'shotgun_flashlight',
        attachment = 'flashlight',
        type = 'flash'
    },
    {
        item = 'shotgun_suppressor',
        attachment = 'suppressor',
        type = 'suppressor'
    },
    {
        item = 'shotgun_grip',
        attachment = 'grip',
        type = 'clip'
    },
    {
        item = 'shotgun_drum',
        attachment = 'drum',
        type = 'clip'
    },
    {
        item = 'shotgun_squaredmuzzle',
        attachment = 'squaredmuzzle',
        type = 'suppressor'
    },
    {
        item = 'shotgun_holoscope',
        attachment = 'holographic',
        type = 'scope'
    },
    {
        item = 'shotgun_smallscope',
        attachment = 'smallscope',
        type = 'scope'
    },

    -- Tints for every weapon
    {
        attachment = 'black_weapontint',
        label = 'Black Tint',
        type = 'tint',
        item = 'black_weapontint',
        tint = 0,
        forEveryWeapon = true
    },
    {
        attachment = 'green_weapontint',
        label = 'Green Tint',
        type = 'tint',
        item = 'green_weapontint',
        tint = 1,
        forEveryWeapon = true
    },
    {
        attachment = 'gold_weapontint',
        label = 'Gold Tint',
        type = 'tint',
        item = 'gold_weapontint',
        tint = 2,
        forEveryWeapon = true
    },
    {
        attachment = 'pink_weapontint',
        label = 'Pink Tint',
        type = 'tint',
        item = 'pink_weapontint',
        tint = 3,
        forEveryWeapon = true
    },
    {
        attachment = 'army_weapontint',
        label = 'Army Tint',
        type = 'tint',
        item = 'army_weapontint',
        tint = 4,
        forEveryWeapon = true
    },
    {
        attachment = 'lspd_weapontint',
        label = 'LSPD Tint',
        type = 'tint',
        item = 'lspd_weapontint',
        tint = 5,
        forEveryWeapon = true
    },
    {
        attachment = 'orange_weapontint',
        label = 'Orange Tint',
        type = 'tint',
        item = 'orange_weapontint',
        tint = 6,
        forEveryWeapon = true
    },
    {
        attachment = 'plat_weapontint',
        label = 'Platinum Tint',
        type = 'tint',
        item = 'plat_weapontint',
        tint = 7,
        forEveryWeapon = true
    },
    {
        item = 'weapontint_url',
        attachment = 'weapontint_url',
        type = 'tint',
        isUrlTint = true,
        tint = -1,
        forEveryWeapon = true
    }
}

local weaponTints = table.deepclone(table.filter(Config.WeaponAttachmentItems, function(tint)
    return tint.type == 'tint'
end))
for k in pairs(Config.WeaponAttachments) do
    for _, x in pairs(Config.WeaponAttachmentItems) do
        if x.forEveryWeapon then
            Config.WeaponAttachments[k][x.item] = x
        end
    end
end

---@return AttachmentItem[]
function GetConfigTints()
    return weaponTints
end

sharedExports('getConfigWeaponTints', GetConfigTints)

sharedExports('GetWeaponAttachments', function()
    return Config.WeaponAttachments
end)

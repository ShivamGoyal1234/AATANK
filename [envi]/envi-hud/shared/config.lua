Config = {}

-- PLEASE NOTE: Please make sure envi-bridge is updated to 0.3.9 or higher, otherwise the this version of the hud will give errors.

Config.Debug = false       -- DO NOT LEAVE THIS AS TRUE - THIS WILL ADD DEBUG PRINTS INTO f8 AND SERVER CONSOLE

Config.TestMode = false    -- [WARNING!]: DO NOT LEAVE THIS AS TRUE or the hud will show before logging in and it WILL CAUSE ERRORS - This is for 'RESTARTING WHILE LIVE IN A DEV SERVER' testing purposes only - NEWLY JOINED PLAYERS WILL BE BROKEN

Config.InitializeDelay = 4 -- Delay in seconds before the hud is initialized (increase when you have other scripts conflicting on loading - e.g (you get a HUGE MAP, Some values do not update))
-- NOTE: IF YOU DO NOT USE A MULTI-CHARACTER - you probably need to increase this time to what works best for you!

Config.HudSettingsCommand = 'hud'
Config.HudSettingsKeyBind = 'i'
Config.DisableHUDSettings = false -- If true, the hud settings WILL NOT BE ACCESSABLE - This will lock your players to one unified hud, with less fancy options - Set DefaultHudSettings below!

Config.ExperimentalFeatures = {
  advancedMap = true, -- Moveable Mini-Map and advanced settings - works great for normal resolutions, but is still being tested for ultrawide resolutions, so moved to experimental for now! - Disable it for a simple map if you prefer!
  -- The Settings Below will combat conflicts with other scripts!
  fixCustomMapIssue = false, -- Some Postal Maps have a weird bug where the map displays correctly only when going above a certain speed - this will fix that
  -- if you use this setting, its recommended that your players use the Force 1080p UI Resolution option in the main menu of FiveM Settings (before joining server!)
  forceHideMiniMap = true,   -- This will add additional checks to make sure the minimap is never displaying when it shouldnt be!
}

-- Default HUD Settings and Disabled HUD Settings are now set in-game via the admin menu!!  
-- First Admin to LOAD IN with No Saved Global Settings will automatically get the admin set-up menu!

Config.AdminRoles = {     -- NEW!!!
  'admin',
  'superadmin',
  'god',
}

Config.AdminHudSettingsCommand = 'adminhud' -- NEW - This is the command for the admin hud settings - This will be used to open the admin hud settings menu


Config.ServerInfo = {
  name = 'AATANK ROLEPLAY',
  discord = 'https://discord.gg/w8p9ezRnZV'
}

Config.CashItemOrAccount = {
  type = 'account', -- item or account
  item = 'money',   -- item name if type is item
  account = 'cash'  -- account name if type is account
}

Config.Sounds = {
  Seatbelt = {
    Enabled = true,
    UseNativeAudio = true,         -- if false, it will use xsound / interact_sound
    BuckleSound = 'seatbelton',    -- for xsound / interact_sound
    UnbuckleSound = 'seatbeltoff', -- for xsound / interact_sound
    Volume = 1.0,                  -- for xsound / interact_sound
  }
}

--------------------------
-- SPEEDOMETER SETTINGS --
--------------------------

Config.UseMPH = false       -- (if true - the speed will be displayed in MPH, if false - the speed will be displayed in KM/H)

Config.IgnoredVehicles = { -- vehicles where no vehicle hud is shown
  [`bmx`] = true,
  [`cruiser`] = true,
  [`fixter`] = true,
  [`scorcher`] = true,
  [`tribike`] = true,
  [`tribike2`] = true,
  [`tribike3`] = true,
}

----------------------
-- MINIMAP SETTINGS --
----------------------

Config.MapOnlyInVehicle = false -- (if true - the minimap will only be shown when players are in a vehicle and they will have no option to toggle in the hud settings)

-----------------------
-- SEATBELT SETTINGS --
-----------------------

Config.Seatbelt = {
  enabled = true,
  type = 'keyboard',
  key = 'B',
  AutoUnbuckle = false,
  DefaultSpeedThreshold = 45.0,   -- Speed threshold in MPH/KMH before ejection when buckled
  UnbuckledSpeedThreshold = 15.0, -- Speed threshold in MPH/KMH before ejection when unbuckled
  Notify = true,                 -- (if true - you will get a notification when you buckle up or unbuckle)
  Animation = true,               -- (if true - you will do an animation when you buckle up or unbuckle)
}

-------------------------------------
-- EXTRA QUALITY OF LIFE FEATURES  --
-------------------------------------

Config.RagdollFeature = true -- (ragoll into walls when jumping)

Config.HandbrakeToggle = {   -- Persistant handbrake toggle key
  enabled = true,
  type = 'keyboard',
  key = 'UP'
}

-- ANTI-MUSCLE-SPASM / AKA COMBAT MODE
------------------------------------
-- This is a feature that will prevent you from accidentally puchhing when you're not in combat mode
-- Combat Mode is activated when you get hit or press the RIGHT MOUSE BUTTON to lock onto someone
------------------------------------
Config.AntiMuscleSpasm = {
  enabled = false, -- DISABLED BY DEFAULT (adds a TINY 0.01ms to the client resmon - but we prefer 0.00ms idle)
  timeout = 30,    -- COOLDOWN IN SECONDS
  notify = true
}

------------------------------
--  EXTRA VEHICLE FEATURES  --
------------------------------

Config.CruiseControl = {
  enabled = true,
  type = 'keyboard',
  key = 'Y',
  adjustSpeed = {
    type = 'mouse_wheel',
    increase = 'IOM_WHEEL_UP',
    decrease = 'IOM_WHEEL_DOWN'
  }
}

Config.IndicatorKeys = {
  enabled = true,
  type = 'keyboard',
  left = 'LEFT',
  right = 'RIGHT',
  hazard = 'DOWN'
}


--------------------------------
--  EXTRA CONFIGS FOR ESX  --
--------------------------------

Config.EnableBlackMoney = false   -- [! ESX ONLY !]
Config.AddESXStatusStress = false -- [! ESX ONLY !]    -- FIXED TYPO

----------------------
-- HARNESSES CONFIG --
----------------------

Config.Interactions = {
  Target = true,    -- (if true - Mechanics can use the Target (ox, qb-target etc) to install/uninstall harness to vehicles)
  ItemUse = true,   -- (if true - you can use the items WHILE INSIDE A VEHICLE to install/uninstall harness to vehicles)
}

Config.Items = {
  Install = {
    [1] = {
      item = 'harness',
      label = 'Basic Harness',
      minSpeed = 125,       -- minimum speed that you will have to be going to fly out with this harness (MPH or KM/H depending on Config.UseMPH)
    },
    [2] = {
      item = 'advanced_harness',
      label = 'Advanced Harness',
      minSpeed = 150,       -- minimum speed that you will have to be going to fly out with this harness (MPH or KM/H depending on Config.UseMPH)
    },
    [3] = {
      item = 'ultra_harness',
      label = 'Ultra Harness',
      minSpeed = 200,       -- minimum speed that you will have to be going to fly out with this harness (MPH or KM/H depending on Config.UseMPH)
    }
  },
  Uninstall = 'mech_toolkit'
}

Config.JobInstall = false -- if true - only the jobs below can install ejector seats
Config.InstallJobs = { 'mechanic', 'mechanic2' }
Config.InstallTime = 10   -- Seconds

-------------------
-- STRESS SYSTEM --
-------------------

Config.Stress = {
  Enabled = true,
  SpeedThreshold = 60,
  SpeedThresholdUnbuckled = 60,

  SpeedStress = {
    enabled = true,
    baseMultiplier = 1.0,
    seatbeltMultiplier = 2.0,     -- Doubles stress when not wearing seatbelt
    speedRanges = {               -- More speed = more stress , less speed = less stress
      {                           -- these defaults are based on mph and may need to be adjusted for km/h
        min = 75,
        max = 90,
        multiplier = 0.2         -- Very low stress
      },
      {
        min = 90,
        max = 100,
        multiplier = 0.5         -- Low stress
      },
      {
        min = 101,
        max = 120,
        multiplier = 1.0         -- Moderate stress
      },
      {
        min = 121,
        max = 140,
        multiplier = 1.5         -- High stress
      },
      {
        min = 141,
        multiplier = 2.0         -- Very high stress
      }
    },
    interval = 2000,     -- time in ms between stress updates, increase this if you want stress to update less often while driving
  },

  IgnoredVehicleClasses = {   -- Vehicle CLASSES that don't cause stress
    [14] = true,              -- Boats
    [15] = true,              -- Helicopters
    [16] = true,              -- Planes
    [21] = true,              -- Trains
  },

  IgnoredVehicles = {   -- Ignore stress from these vehicle MODEL NAMES
    [`bmx`] = true,
    [`cruiser`] = true,
    [`fixter`] = true,
    [`scorcher`] = true,
    [`tribike`] = true,
    [`tribike2`] = true,
    [`tribike3`] = true,
  },

  ShootingAmount = 3,
  WhitelistedShootingWeapons = {   -- Weapons that don't cause stress when YOU are shooting
    [`WEAPON_PETROLCAN`] = true,
    [`WEAPON_HAZARDCAN`] = true,
    [`WEAPON_KNUCKLE`] = true,
    [`WEAPON_NIGHTSTICK`] = true,
    [`WEAPON_HAMMER`] = true,
    [`WEAPON_BAT`] = true,
    [`WEAPON_GOLFCLUB`] = true,
    [`WEAPON_CROWBAR`] = true,
    [`WEAPON_BOTTLE`] = true,
    [`WEAPON_DAGGER`] = true,
    [`WEAPON_HATCHET`] = true,
    [`WEAPON_MACHETE`] = true,
    [`WEAPON_FLASHLIGHT`] = true,
    [`WEAPON_SWITCHBLADE`] = true,
    [`WEAPON_POOLCUE`] = true,
    [`WEAPON_WRENCH`] = true,
    [`WEAPON_BATTLEAXE`] = true,
    [`WEAPON_STONE_HATCHET`] = true,
  },

  MeleeHitAmount = 3,
  WhitelistedHitWeapons = {   -- Melee Weapons that don't cause stress when GETTING HIT
    [`WEAPON_UNARMED`] = true,
  },

  GotShotAmount = 10,
  WhitelistedShotByWeapons = {   -- Weapons that don't cause stress when GETTING SHOT
    [`WEAPON_UNARMED`] = true,
  },

  JobStressMultiplier = {   -- if the job is here, we can adjust the stress multiplier for that job
    -- EXAMPLES:
    ['police'] = 0.5,       -- police only get half as stressed
    --  ['ambulance'] = 0.0,   -- ambulance get no stress
  },

  CrashAmount = 10,       -- amount of stress when crashing a vehicle
  CrashCooldown = 5000,   -- cooldown in ms before stress can be updated again from crashing

  CrashedCar = {
    Cooldown = 5000,          -- to stop stress being added too quickly!
    VDM_Player = 25,          -- amount of stress when running over another player (A.K.A. VDM!!)
    VDM_NPC = 10,             -- amount of stress when running over an NPC Pedestrian
    VDM_PlayerVehicle = 15,   -- amount of stress when crashing into another players vehicle
    VDM_NPCVehicle = 5,       -- amount of stress when crashing into an NPC vehicle
  },
}

----------------------------------------------------------------------------
-- Stress Relief Scenarios / Commands!
----------------------------------------------------------------------------
-- You can now very slowly relieve stress over time by doing these scenarios!
Config.StressReliefScenarios = {
  yoga = {
    enabled = true,
    command = 'startYoga',
    scenario = 'WORLD_HUMAN_YOGA',
    amount = 5,
  },
  pushUps = {
    enabled = true,
    command = 'startPushUps',
    scenario = 'WORLD_HUMAN_PUSH_UPS',
    amount = 2,
  },
  sitUps = {
    enabled = true,
    command = 'startSitUps',
    scenario = 'WORLD_HUMAN_SIT_UPS',
    amount = 3,
  },
}

----------------------
-- STATUS WARNINGS --
----------------------

Config.StatusWarnings = { -- Status warnings for hunger and thirst   -- MORE EFFECTS COMING SOON!!
  enabled = true,
  type = 'notify',
  threshold = 25,
  duration = 3000,
}

----------------------
-- WEAPONS SETTINGS --
----------------------

Config.Weapons = {
  ['WEAPON_KNIFE'] = { label = 'Knife' },
  ['WEAPON_NIGHTSTICK'] = { label = 'Nightstick' },
  ['WEAPON_HAMMER'] = { label = 'Hammer' },
  ['WEAPON_BAT'] = { label = 'Bat' },
  ['WEAPON_GOLFCLUB'] = { label = 'Golf Club' },
  ['WEAPON_CROWBAR'] = { label = 'Crowbar' },
  ['WEAPON_PISTOL'] = { label = 'Pistol' },
  ['WEAPON_COMBATPISTOL'] = { label = 'Combat Pistol' },
  ['WEAPON_APPISTOL'] = { label = 'AP Pistol' },
  ['WEAPON_PISTOL50'] = { label = 'Pistol 50' },
  ['WEAPON_MICROSMG'] = { label = 'Micro SMG' },
  ['WEAPON_SMG'] = { label = 'SMG' },
  ['WEAPON_ASSAULTSMG'] = { label = 'Assault SMG' },
  ['WEAPON_ASSAULTRIFLE'] = { label = 'Assault Rifle' },
  ['WEAPON_CARBINERIFLE'] = { label = 'Carbine Rifle' },
  ['WEAPON_ADVANCEDRIFLE'] = { label = 'Advanced Rifle' },
  ['WEAPON_MG'] = { label = 'MG' },
  ['WEAPON_COMBATMG'] = { label = 'Combat MG' },
  ['WEAPON_PUMPSHOTGUN'] = { label = 'Pump Shotgun' },
  ['WEAPON_SAWNOFFSHOTGUN'] = { label = 'Sawed-Off Shotgun' },
  ['WEAPON_ASSAULTSHOTGUN'] = { label = 'Assault Shotgun' },
  ['WEAPON_BULLPUPSHOTGUN'] = { label = 'Bullpup Shotgun' },
  ['WEAPON_STUNGUN'] = { label = 'Stun Gun' },
  ['WEAPON_SNIPERRIFLE'] = { label = 'Sniper Rifle' },
  ['WEAPON_HEAVYSNIPER'] = { label = 'Heavy Sniper' },
  ['WEAPON_GRENADELAUNCHER'] = { label = 'Grenade Launcher' },
  ['WEAPON_RPG'] = { label = 'RPG' },
  ['WEAPON_MINIGUN'] = { label = 'Minigun' },
  ['WEAPON_GRENADE'] = { label = 'Grenade' },
  ['WEAPON_STICKYBOMB'] = { label = 'Sticky Bomb' },
  ['WEAPON_SMOKEGRENADE'] = { label = 'Smoke Grenade' },
  ['WEAPON_BZGAS'] = { label = 'BZ Gas' },
  ['WEAPON_MOLOTOV'] = { label = 'Molotov' },
  ['WEAPON_FIREEXTINGUISHER'] = { label = 'Fire Extinguisher' },
  ['WEAPON_PETROLCAN'] = { label = 'Petrol Can' },
  ['WEAPON_SNSPISTOL'] = { label = 'SNS Pistol' },
  ['WEAPON_HEAVYPISTOL'] = { label = 'Heavy Pistol' },
  ['WEAPON_SPECIALCARBINE'] = { label = 'Special Carbine' },
  ['WEAPON_BULLPUPRIFLE'] = { label = 'Bullpup Rifle' },
  ['WEAPON_BULLPUPRIFLE_MK2'] = { label = 'Bullpup Rifle Mk II' },
  ['WEAPON_MARKSMANRIFLE_MK2'] = { label = 'Marksman Rifle Mk II' },
  ['WEAPON_PUMPSHOTGUN_MK2'] = { label = 'Pump Shotgun Mk II' },
  ['WEAPON_SNSPISTOL_MK2'] = { label = 'SNS Pistol Mk II' },
  ['WEAPON_SPECIALCARBINE_MK2'] = { label = 'Special Carbine Mk II' },
  ['WEAPON_HOMINGLAUNCHER'] = { label = 'Homing Launcher' },
  ['WEAPON_DOUBLEACTION'] = { label = 'Double-Action Revolver' },
  ['WEAPON_REVOLVER_MK2'] = { label = 'Heavy Revolver Mk II' },
  ['WEAPON_RAYPISTOL'] = { label = 'Up-n-Atomizer' },
  ['WEAPON_RAYCARBINE'] = { label = 'Unholy Hellbringer' },
  ['WEAPON_RAYMINIGUN'] = { label = 'Widowmaker' },
  ['WEAPON_GUSENBERG'] = { label = 'Gusenberg Sweeper' },
  ['WEAPON_DAGGER'] = { label = 'Antique Cavalry Dagger' },
  ['WEAPON_VINTAGEPISTOL'] = { label = 'Vintage Pistol' },
  ['WEAPON_MUSKET'] = { label = 'Musket' },
  ['WEAPON_FIREWORK'] = { label = 'Firework Launcher' },
  ['WEAPON_RAILGUN'] = { label = 'Railgun' },
  ['WEAPON_HATCHET'] = { label = 'Hatchet' },
  ['WEAPON_MARKSMANRIFLE'] = { label = 'Marksman Rifle' },
  ['WEAPON_HEAVYSHOTGUN'] = { label = 'Heavy Shotgun' },
  ['WEAPON_CERAMICPISTOL'] = { label = 'Ceramic Pistol' },
  ['WEAPON_COMBATSHOTGUN'] = { label = 'Combat Shotgun' },
  ['WEAPON_GADGETPISTOL'] = { label = 'Perico Pistol' },
  ['WEAPON_MILITARYRIFLE'] = { label = 'Military Rifle' },
  ['WEAPON_FLAREGUN'] = { label = 'Flare Gun' },
  ['WEAPON_NAVYREVOLVER'] = { label = 'Navy Revolver' },
  ['WEAPON_KNUCKLE'] = { label = 'Brass Knuckles' },
  ['WEAPON_MARKSMANPISTOL'] = { label = 'Marksman Pistol' },
  ['WEAPON_COMBATPDW'] = { label = 'Combat PDW' },
  ['WEAPON_DBSHOTGUN'] = { label = 'Double Barrel Shotgun' },
  ['WEAPON_COMPACTRIFLE'] = { label = 'Compact Rifle' },
  ['WEAPON_MACHINEPISTOL'] = { label = 'Machine Pistol' },
  ['WEAPON_MACHETE'] = { label = 'Machete' },
  ['WEAPON_FLASHLIGHT'] = { label = 'Flashlight' },
  ['WEAPON_REVOLVER'] = { label = 'Heavy Revolver' },
  ['WEAPON_SWITCHBLADE'] = { label = 'Switchblade' },
  ['WEAPON_AUTOSHOTGUN'] = { label = 'Sweeper Shotgun' },
  ['WEAPON_BATTLEAXE'] = { label = 'Battle Axe' },
  ['WEAPON_COMPACTLAUNCHER'] = { label = 'Compact Grenade Launcher' },
  ['WEAPON_MINISMG'] = { label = 'Mini SMG' },
  ['WEAPON_POOLCUE'] = { label = 'Pool Cue' },
  ['WEAPON_WRENCH'] = { label = 'Pipe Wrench' },
  ['WEAPON_PIPEBOMB'] = { label = 'Pipe Bomb' },
  ['WEAPON_CARBINERIFLE_MK2'] = { label = 'Carbine Rifle Mk II' },
  ['WEAPON_ASSAULTRIFLE_MK2'] = { label = 'Assault Rifle Mk II' },
  ['WEAPON_COMBATMG_MK2'] = { label = 'Combat MG Mk II' },
  ['WEAPON_SMG_MK2'] = { label = 'SMG Mk II' },
  ['WEAPON_HEAVYSNIPER_MK2'] = { label = 'Heavy Sniper Mk II' },
  ['WEAPON_PISTOL_MK2'] = { label = 'Pistol Mk II' },
  ['WEAPON_STONE_HATCHET'] = { label = 'Stone Hatchet' },
  ['WEAPON_TACTICALRIFLE'] = { label = 'Tactical Rifle' },
  ['WEAPON_PRECISIONRIFLE'] = { label = 'Precision Rifle' },
  ['WEAPON_HEAVYRIFLE'] = { label = 'Heavy Rifle' },
  ['WEAPON_STUNGUN_MP'] = { label = 'Stun Gun' },
  ['WEAPON_EMPLAUNCHER'] = { label = 'Compact EMP Launcher' },
  ['WEAPON_BATTLERIFLE'] = { label = 'Battle Rifle' }
}

----------------
--- LANGUAGE ---
----------------

Config.Lang = {
  NoSkills = 'You don\'t have the required skills to do this!',
  AlreadyInstalled = 'This vehicle already has harness installed!',
  NotInstalled = 'This vehicle does not have harness installed!',
  HasHarness = 'This vehicle has harness installed!',
  NoHarness = 'This vehicle has no harness installed!',
  TargetInstall = 'Install Harness',
  TargetUninstall = 'Uninstall Harness',
  NotOwnedVehicle = 'This is not an owned vehicle!',
  NoInstallItem = 'You do not have the required item to install harness!',
  InstallSuccess = 'Successfully installed harness!',
  InstallFailed = 'Failed to install harness!',
  NoUninstallItem = 'You do not have the required item to uninstall harness!',
  UninstallSuccess = 'Successfully uninstalled harness!',
  UninstallFailed = 'Failed to uninstall harness!',
  SeatbeltActivated = 'Seatbelt Activated',
  SeatbeltTitle = 'Buckled Up!',
  SeatbeltDeactivated = 'Seatbelt Deactivated',
  UnbuckledTitle = 'Unbuckled',
  CombatModeActivated = 'Combat Mode Activated',
  CombatModeTitle = 'Combat Mode',
  AllCombatDisabled = 'All Combat Has Been Disabled!',
  AllCombatEnabled = 'Combat Has Been Re-enabled!',
  CombatDisabled = 'Your Combat Has Been Disabled!',
  CombatEnabled = 'Your Combat Has Been Re-enabled!',
  CombatCooldownComplete = 'Combat Cooldown Complete',
  AllClear = '[ALL CLEAR]',
  Attention = '[ATTENTION]',
  LessStressed = 'You are slowly feeling less stressed!',
  StressRelief = 'Stress Relief',
  Hungry = 'You are hungry!',
  Thirsty = 'You are thirsty!',
  StatusWarning = 'UH OH!',
  Welcome = 'Welcome to Envi-HUD!',  -- NEW 
  WelcomeMessage = 'For first time set-up, we have opened the NEW ADMIN HUD SETTINGS Menu! This is where you set up your DEFAULT HUD for all new players! Disable features in the visible elements section!',  -- NEW
}

Config.Locales = { -- for settings menus
  common = {
    defaultSelectTitle = "Select..."
  },
  hud = {
    admin = {
      title = "Admin HUD Settings",
      description = "Configure server-wide HUD settings. Press save when you\'re done.",
      disabledElements = {
        title = "Disabled Elements",
        description = "Manage which HUD elements are disabled globally for all players.",
        mainElements = "Main Elements",
        manageButton = "Manage Disabled Elements"
      }
    },
    player = {
      title = "HUD Settings",
      description = "Customize your HUD in here. Press save when you\'re done.",
    },
    groups = {
      theme = {
        title = "Theme",
        hud = "HUD",
        speedometer = "Speedometer"
      },
      hudShapes = {
        title = "HUD Element Shapes",
        serverInfo = "Server Info",
        account = "Account",
        specialThemeMessage = "Shape settings are disabled for custom themes."
      },
      statusBar = {
        title = "Status Bar",
        variant = "Variant",
        progressStyle = "Progress Style",
        progressStyleOptions = {
          border = "Border",
          fill = "Fill"
        },
        specialThemeMessage =
        "Status bar settings are disabled for Pixel and Retro themes as they use their own unique styles.",
        cyberpunkThemeMessage = "Status bar variant is disabled for Cyberpunk theme as it uses its own unique style."
      },
      variantOptions = {
        default = "Default",
        square = "Square",
        hexagon = "Hexagon",
        rhombus = "Rhombus",
        envi = "Envi"
      },
      animation = {
        title = "Animation Settings",
        showAnimation = "Show Animation",
        options = {
          default = "Default",
          fade = "Fade",
          bounce = "Bounce",
          slide = "Slide",
          scale = "Scale",
          elastic = "Elastic"
        }
      },
      elements = {
        title = "HUD Elements Visibility",
        showAll = "Show/Hide All Elements",
        serverInfo = "Server Info",
        location = "Location",
        weapon = "Weapon",
        voice = "Voice",
        playerStatus = "Player Status",
        account = "Account",
        vehicleHud = "Vehicle HUD",
        map = "Display Mini Map",
      },
      playerStatus = {
        title = "Player Status Items",
        health = "Health",
        armor = "Armor",
        hunger = "Hunger",
        thirst = "Thirst",
        stamina = "Stamina",
        stress = "Stress",
        oxygen = "Oxygen",
      },
      serverInfo = {
        title = "Server Info Items",
        logo = "Logo",
        serverInfo = "Information",
        id = "Player ID",
        players = "Players",
        job = "Job",
        job2 = "Job Role",
        gang = "Gang",
        gang2 = "Gang Rank",
        divider = "Divider", -- NEW
        time = "Time",
      },
      account = {
        title = 'Account Items',
        cash = 'Cash',
        bank = 'Bank',
        blackMoney = 'Black Money',
        time = 'Time'
      },
      elementScales = {
        title = "Element Scales",
        serverInfo = "Server Info Scale (%)",
        location = "Location Scale (%)",
        weapon = "Weapon Scale (%)",
        voice = "Voice Scale (%)",
        playerStatus = "Player Status Scale (%)",
        account = "Account Scale (%)",
        vehicle = "Vehicle HUD Scale (%)"
      },
      display = {
        title = "Display Mode",
        timeMode = "Time Mode",
        timeModeOptions = {
          inGame = "In Game",
          realTime = "Real Time"
        },
        minimap = {
          type = "Minimap Type",
          size = "Map Size",
          typeOptions = {
            square = "Square",
            circle = "Circle"
          },
          sizeOptions = {
            small = "Small",
            medium = "Medium",
            large = "Large"
          },
          buffer = {
            x = "Buffer X",
            y = "Buffer Y"
          }
        },
        currencySymbol = "Currency Symbol",
        currencySymbolOptions = { 
          usd = "USD ($)",
          eur = "EUR (€)",
          gbp = "GBP (£)"
        },
        cinematicMode = "Cinematic Mode"
      },
      progressbar = {
        title = 'Progress Bar',
        theme = 'Theme',
        variant = 'Variant',
        variantOptions = {
          includeTitleValue = 'Include Title and Value',
          includeTitle = 'Include Title',
          includeValue = 'Include Value',
          onlyBar = 'Only Progress Bar'
        },
        animation = 'Animation',
        animationOptions = {
          default = 'Default',
          fade = 'Fade',
          slide = 'Slide',
          bounce = 'Bounce'
        },
        animationDirection = 'Direction',
        animationDirectionOptions = {
          default = 'Default',
          top = 'Top',
          right = 'Right',
          bottom = 'Bottom',
          left = 'Left'
        },
        rounded = 'Rounded Corners',
        animationDelay = 'Animation Delay (s)',
        textPosition = 'Text Position',
        textPositionOptions = {
          aboveBar = 'Above Progress Bar',
          belowBar = 'Below Progress Bar'
        },
        previewTitle = 'Progress...',
        cancelTitle = 'Cancelling...'
      }
    },
    buttons = {
      dragMode = "Enable Drag Mode",
      notifySettings = "Notification Settings",
      reset = "Reset",
      save = "Save Changes",
      saveGlobal = "Save Global"
    },
    modals = {
      unsavedChanges = {
        title = "Unsaved Changes",
        message = "You have unsaved changes. Would you like to apply these unsaved changes?",
        keep = "Keep Changes",
        discard = "Discard Changes"
      },
      applyTheme = {
        title = "Apply Theme to Speedometer",
        message = "Do you want to apply the selected HUD theme to the speedometer as well?"
      }
    },
    dragMode = {
      title = "Drag Mode Enabled",
      buttons = {
        reset = "Reset",
        exit = "Exit Drag Mode"
      }
    },
    notifications = {
      success = {
        settingsSaved = "HUD settings saved successfully!",
        globalSettingsSaved = "Global settings saved successfully!",
        notifySettingsSaved = "Notification settings saved successfully!",
        disabledElementsSaved = "Global disabled elements saved successfully!"
      }
    },
    display = {
      serverInfo = {
        players = 'Players',
        id = 'ID',
        job = 'Job',
        gang = 'Gang',
        gang2 = 'Gang Rank',  -- NEW
        job2 = 'Job Role',  -- NEW
        divider = 'Divider'   -- NEW
      },
      account = {
        cash = 'Cash',
        bank = 'Bank',
        blackMoney = 'Black Money'
      },
      time = 'Time',
    }
  },
  notify = {
    title = "Notification Settings",
    description = "Customize your notifications in here. Press save when you're done.",
    groups = {
      appearance = {
        title = "Appearance",
        theme = "Theme",
        spacing = "Spacing",
        scale = "Scale (%)",
        variant = "Variant",
        variantOptions = {
          basic = "Basic",
          title = "Title Only",
          icon_only = "Icon Only",
          text_only = "Text Only",
          icon_no_close = "Icon Without Close",
          long_text = "Long Text"
        }
      },
      layout = {
        title = "Layout",
        position = "Position",
        positionOptions = {
          top_left = "Top Left",
          top_right = "Top Right",
          top_center = "Top Center",
          bottom_left = "Bottom Left",
          bottom_right = "Bottom Right",
          bottom_center = "Bottom Center"
        },
        maxNotifications = "Max Notifications"
      },
      sound = {
        title = "Sound",
        enable = "Enable Sound",
        select = "Notification Sound",
        volume = "Sound Volume (%)"
      },
      text = {
        title = "Text",
        enableOptions = "Enable Options",
        truncate = "Truncate",
        maxLines = "Max Lines"
      },
      animation = {
        title = "Animation",
        type = "Animation Type",
        options = {
          slide = "Slide",
          fade = "Fade",
          bounce = "Bounce",
          scale = "Scale",
          elastic = "Elastic"
        },
        duration = "Animation Duration (s)",
        distance = "Animation Distance"
      },
      behavior = {
        title = "Behavior",
        duration = "Display Duration (ms)"
      }
    },
    buttons = {
      preview = "Preview",
      save = "Save Changes"
    },
    preview = {
      title = "Preview Notification",
      message =
      "Lorem ipsum dolor sit amet consectetur adipisicing elit. Quisquam, quos. Lorem ipsum dolor sit amet consectetur adipisicing elit. Quisquam, quos."
    }
  },
  toggleStates = {
    enabled = "Enabled",
    disabled = "Disabled",
    show = "Show all",
    hide = "Hide all"
  },
  tutorial = {
    title = "Envi HUD Tutorial",
    stepCounter = "Step {step} of {total}",
    steps = {
      {
        title = "👋 Welcome to ENVI HUD!",
        description =
        "✨ Thank you for joining our server! Take a moment to discover the essential features of our HUD system designed to enhance your gaming experience. 🎮",
        icon = "mdi:hand-wave"
      },
      {
        title = "⚙️ Customize Your HUD",
        description =
        "Make the HUD your own! Press F7 to access Settings where you can choose themes, adjust positions, and customize various elements to match your preferences. 🎨",
        icon = "mdi:cog"
      },
      {
        title = "🔔 Smart Notifications",
        description =
        "📱 Never miss important information with our notification system. Customize notification styles, sounds, and positions in the Notification Settings to stay informed your way. ⚡",
        icon = "mdi:bell"
      },
      {
        title = "💾 Don't Forget to Save",
        description =
        "📝 Remember to save your settings using the Save Changes button. This ensures your HUD stays exactly how you like it every time you return to the server. ✅",
        icon = "mdi:content-save"
      }
    },
    buttons = {
      back = "Back",
      next = "Next",
      skip = "Skip Tutorial",
      getStarted = "Get Started"
    }
  }
}

Config.Directions = {
  N = "N",   -- North
  NE = "NE", -- Northeast
  E = "E",   -- East
  SE = "SE", -- Southeast
  S = "S",   -- South
  SW = "SW", -- Southwest
  W = "W",   -- West
  NW = "NW"  -- Northwest
}

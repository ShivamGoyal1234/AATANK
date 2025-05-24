fx_version 'cerulean'
game 'gta5'
author 'pScripts [tebex.pscripts.store]'
description 'Advanced Police Job 2.0'
lua54 'yes'

dependencies {
    'ox_lib',
}

shared_scripts {
    '@es_extended/imports.lua', -- you can remove it on QB / QBOX
    '@ox_lib/init.lua',
    'shared/config.lua',
    'shared/config.band.lua',
    'shared/config.bodycam.lua',
    'shared/config.evidences.lua',
    'shared/config.extras.lua',
    'shared/config.gps.lua',
    'shared/config.interactions.lua',
    'shared/config.jail.lua',
    'shared/config.mugshot.lua',
    'shared/config.objects.lua',
    'shared/config.radar.lua',
    'shared/config.speedcam.lua',
    'shared/config.trunks.lua',
    'shared/config.vests.lua',
    'shared/config.tackle.lua',
    'shared/config.cameras.lua',
    'shared/config.garage.lua',
    'shared/config.radio.lua',
    'shared/config.vehicleshop.lua',
}

client_scripts {
    'inventory/client/*.lua',
    'modules/client/utils.lua',
    'modules/client/scaleforms.lua',
    'modules/client/main.lua',
    'modules/client/band.lua',
    'modules/client/evidence.lua',
    'modules/client/gps.lua',
    'modules/client/handsup.lua',
    'modules/client/interactions.lua',
    'modules/client/jail.lua',
    'modules/client/objects.lua',
    'modules/client/sounds.lua',
    'modules/client/street.lua',
    'modules/client/mugshot.lua',
    'modules/client/speedcam.lua',
    'modules/client/extras.lua',
    'modules/client/trunks.lua',
    'modules/client/radar.lua',
    'modules/client/divingsuit.lua',
    'modules/client/vests.lua',
    'modules/client/bodycam.lua',
    'modules/client/camera.lua',
    'modules/client/tackle.lua',
    'modules/client/cameras.lua',
    'modules/client/garage.lua',
    'modules/client/jail_utils.lua',
    'modules/client/radio.lua',
    'modules/client/vehicleshop.lua',
    'modules/client/mouthtape.lua',
    'bridge/client/*.lua',
    'target/*.lua',
}

server_scripts {
    'inventory/server/*.lua',
    'shared/config.webhooks.lua',
    '@oxmysql/lib/MySQL.lua',
    'modules/server/*.lua',
    'editable/server.lua',
    'bridge/server/*.lua',
}

ui_page 'web/index.html'

files {
    'web/index.html',
    'web/radar.html',
    'web/app.js',
    'web/style.css',
    'web/sounds/*.ogg',
    'web/images/*.jpg',
    'web/images/*.png',
    'locales/*.json',
    'trunks.json'
}

escrow_ignore {
    'modules/client/handsup.lua',
    'modules/client/divingsuit.lua',
    'modules/client/vests.lua',
    'modules/server/divingsuit.lua',
    'modules/server/editable_logs.lua',
    'modules/server/vehicleshop.lua',
    'modules/server/interactions.lua',
    'modules/client/street.lua',
    'shared/config.lua',
    'shared/config.band.lua',
    'shared/config.bodycam.lua',
    'shared/config.evidences.lua',
    'shared/config.extras.lua',
    'shared/config.gps.lua',
    'shared/config.interactions.lua',
    'shared/config.jail.lua',
    'shared/config.mugshot.lua',
    'shared/config.objects.lua',
    'shared/config.radar.lua',
    'shared/config.speedcam.lua',
    'shared/config.trunks.lua',
    'shared/config.vests.lua',
    'shared/config.webhooks.lua',
    'shared/config.cameras.lua',
    'shared/config.garage.lua',
    'shared/config.radio.lua',
    'shared/config.tackle.lua',
    'shared/config.vehicleshop.lua',
    'shared/config.megaphone.lua',
    'editable/server.lua',
    'bridge/client/esx.lua',
    'bridge/client/qb.lua',
    'bridge/client/qbox.lua',
    'bridge/server/esx.lua',
    'bridge/server/qb.lua',
    'bridge/server/qbox.lua',
    'target/ox_target.lua',
    'target/qb-target.lua',
    'inventory/server/ox_inventory.lua',
    'inventory/server/qb-inventory.lua',
    'inventory/server/qs-inventory.lua',
    'inventory/server/ps-inventory.lua',
    'inventory/server/codem-inventory.lua',
    'inventory/server/tgiann-inventory.lua',
    'inventory/server/jpr-inventory.lua',
    'inventory/client/ox_inventory.lua',
    'inventory/client/qb-inventory.lua',
    'inventory/client/qs-inventory.lua',
    'inventory/client/ps-inventory.lua',
    'inventory/client/codem-inventory.lua',
    'inventory/client/tgiann-inventory.lua',
    'inventory/client/jpr-inventory.lua',
}

data_file 'DLC_ITYP_REQUEST' 'stream/bzzz_police_prop_radar.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/bzzz_lumberjack_wood_pack.ytyp'
-- CREDITS TO PROPS AND RADAR https://bzzz.tebex.io/

data_file 'DLC_ITYP_REQUEST' 'stream/prop_trackingband_01.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/props.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/e_ducktape.ytyp'
dependency '/assetpacks'
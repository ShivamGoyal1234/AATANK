fx_version 'cerulean'
game 'gta5'
author 'pScripts [tebex.pscripts.store]'
description 'GPT - General Police Tablet'
lua54 'yes'

ui_page 'web/index.html'

files {
    'locales/*.json',
    'web/index.html',
    'web/script/*.js',
    'web/style.css',
    'web/img/*.png',
    'web/img/*.svg',
}

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/main.lua',
    'server/dispatch.lua',
    'bridge/server/*.lua',
}

client_scripts {
    'target/*.lua',
    'client/*.lua',
    'bridge/client/*.lua'
}

escrow_ignore {
    'config.lua',
    'bridge/client/esx.lua',
    'bridge/client/qb.lua',
    'bridge/client/qbox.lua',
    'bridge/server/esx.lua',
    'bridge/server/qb.lua',
    'bridge/server/qbox.lua',
    'target/ox_target.lua',
    'target/qb-target.lua'
}

dependencies {
    'ox_lib', 
    'piotreq_jobcore',
    '/server:7290'
}
dependency '/assetpacks'
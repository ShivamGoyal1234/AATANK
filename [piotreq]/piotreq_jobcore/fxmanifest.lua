fx_version 'cerulean'
game 'gta5'
author 'pScripts'
description 'Job Core - Dependency for Jobs'
lua54 'yes'

files {'locales/*.json'}

client_scripts {
    'client/*.lua',
    'bridge/client/*.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/main.lua',
    'server/editable.lua',
    'bridge/server/*.lua'
}

shared_scripts {
    '@es_extended/imports.lua',
    '@ox_lib/init.lua',
    'config.lua'
}

escrow_ignore {
    'config.lua',
    'client/editable.lua',
    'bridge/client/esx.lua',
    'bridge/client/qb.lua',
    'bridge/client/qbox.lua',
    'bridge/server/esx.lua',
    'bridge/server/qb.lua',
    'bridge/server/qbox.lua',
    'server/editable.lua'
}
dependency '/assetpacks'
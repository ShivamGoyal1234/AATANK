fx_version 'cerulean'
game 'gta5'

description 'rcore clothing'
author 'teb & kralik'

lua54 'yes'

version '2.7.0'

ui_page 'client/ui/index.html'

files {
    "client/ui/index.html",
    "client/ui/**/*",
}

client_scripts {
    'shared/object.lua',
    'config.lua',
    'shared/private.lua',
    'configs/*.lua',
    'data/*.lua',
    'client/**/*.lua',
    "permissions.lua",
}

server_scripts {
    'shared/object.lua',
    'data/*.lua',
    'config.lua',
    'shared/private.lua',
    'configs/*.lua',
    '@mysql-async/lib/MySQL.lua',
    'server/**/*.lua',
    "permissions.lua",
    'server/clothing_finder.js',
}

shared_scripts {
    'shared/**/*.lua',
    'locales/*.lua',
}

escrow_ignore {
    'config.lua',
    'shared/shop_format.lua',
    'configs/*',
    'permissions.lua',
    'shared/object.lua',
    'client/framework/**',
    'client/impl/**',
    'server/db/**',
    'server/framework/**',
    'server/impl/**',
    'server/editable.lua',
    'server/load.lua',
    'locales/*',
    'server/module/data/shop_structure.lua',
    'client/blips.lua',
    'client/client.lua',
    'client/interact.lua',
    'client/module/nui/utils.lua',
    'shared/const.lua',
}

provides {
    'skinchanger',
    'esx_skin',
    'qb-clothing',
}
dependency '/assetpacks'
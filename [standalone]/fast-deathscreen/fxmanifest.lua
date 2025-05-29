fx_version 'adamant'
game 'gta5'

Author 'Fast Scripts'
description 'Fast Deathscreen V1'
version '1.0'

ui_page 'web/index.html'

shared_scripts { 
    'shared/config.lua',
    'shared/functions.lua',
}

client_scripts {
    'client/*.lua'
}

files {
    'web/index.html',
    'web/main.js',
    'web/vue/*.js',
    'web/style.css',
    'web/fonts/*.*',
    'web/sounds/*.*',
    'web/images/*.*',
}

escrow_ignore {
    'shared/config.lua',
    'shared/functions.lua',
    -- 'client/*.lua',
    'web/index.html',
    'web/main.js',
    'web/vue/*.js',
    'web/style.css',
    'web/sounds/*.*',
    'web/fonts/*.*',
    'web/images/*.*',
}

lua54 'yes'
dependency '/assetpacks'
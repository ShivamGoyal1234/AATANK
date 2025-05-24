fx_version 'cerulean'

game 'gta5'

lua54 'yes'

version '1.0.16'

this_is_a_map 'yes'

data_file 'WEAPONINFO_FILE_PATCH' 'weaponsnspistol.meta'
data_file 'DLC_ITYP_REQUEST' 'stream/qs_gradient_00.ytyp'

ui_page 'html/ui.html'
-- ui_page 'http://127.0.0.1:5500/html/ui.html'

ox_libs {
    'table'
}

files {
    'config/*.js',
    'config/*.json',
    'html/ui.html',
    'html/css/*.css',
    'html/js/*.js',
    'html/js/modules/*.js',
    'html/backgrounds/*.webp',
    'html/images/*.png',
    'html/assets/**',
    'html/images/*.jpg',
    'html/cloth/*.png',
    'html/icons/**',
    'html/font/**',
    'html/*.ttf',
    'weaponsnspistol.meta',
    'html/sounds/*.wav'
}

shared_scripts {
    '@ox_lib/init.lua',
    'shared/*.lua',
    'config/*.lua',
    'locales/*.lua'
}

client_script {
    'client/custom/framework/*.lua',
    'client/*.lua',
    'client/modules/*.lua',
    'client/custom/misc/*.lua',
    'client/custom/target/*.lua',
    'client/custom/provider/*.lua',
    'client/custom/clothing/*.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/custom/framework/*.lua',
    'server/custom/webhook/*.lua',
    'server/*.lua',
    'server/modules/*.lua',
    'server/custom/**/**.lua'
}

escrow_ignore {
    'shared/items.lua',
    'shared/weapons.lua',
    'config/*.lua',
    'locales/*.lua',
    'client/custom/**/**',
    'server/custom/**/**',
    'client/modules/weapons.lua',
    'server/modules/weapons.lua'
}

dependencies {
    'MugShotBase64',
    '/server:4752', -- ⚠️PLEASE READ⚠️ This requires at least server build 4700 or higher
    'ox_lib'        -- Required
}

provide {
    'qs-inventory'
}

dependency '/assetpacks'
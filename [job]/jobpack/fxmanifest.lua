-- Author: Ayazwai
-- Github: https://github.com/ayazwai
-- Discord: https://discord.gg/0resmon
-- LinkendIn: https://www.linkedin.com/in/ayaz-ekrem-770305212/

use_experimental_fxv2_oal 'yes'
fx_version 'cerulean'
lua54 'yes'
game 'gta5'

--[[ Resource Information ]]--

author 'Ayazwai'
version '1.2.3'
scriptname 'wais-jobpack'
description 'A job pack for FiveM servers. +20 jobs'

--[[ Resource Information ]]--

shared_scripts {
    'config.lua',
    'locales/*.lua',
    '@ox_lib/init.lua',
}

client_scripts {
    'client/**/*.lua',
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'config_sv.lua',
    'server/**/*.lua',
}

escrow_ignore {
    'config.lua',
    'config_sv.lua',
    'locales/*.lua',
    'client/editable.lua',
    'server/editable.lua',
}

dependencys {
    'ox_lib',
    '/gameBuild:3258' -- ☢️ Your server build must be at least 3258 to use this resource. ☢️
}

data_file "VEHICLE_METADATA_FILE" "stream/utillitruck4/data/vehicles.meta"
data_file "CARCOLS_FILE" "stream/utillitruck4/data/carcols.meta"
data_file "VEHICLE_VARIATION_FILE" "stream/utillitruck4/data/carvariations.meta"

ui_page "web/dist/index.html"
files {
    'web/dist/*.js',
    'web/dist/index.html',

    'web/public/*.png',
    'web/public/*.json',
    'web/public/css/*.*',
    'web/public/images/*.*',
    'web/public/sounds/*.*',
    'stream/utillitruck4/data/*.meta'
}

dependency '/assetpacks'
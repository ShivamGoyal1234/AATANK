fx_version 'cerulean'
game 'gta5'

name "um-multicharacter"
author "uyuyorum store"
version "4.5.6"
description "UM - Multi Character"

ui_page 'web/build/index.html'

files {
	'web/build/index.html',
	'web/build/**',
	'locales/*.lua',
}

shared_scripts {
	'@ox_lib/init.lua',
	'list/*.lua',
	'config.lua',
	'bridge/framework.lua',
}

client_scripts {
	'bridge/clothingexports.lua',
	'client/*.lua',
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'server/**',
	'bridge/spawn.lua',
	'bridge/getskin.lua',
}


escrow_ignore {
	'config.lua',
	'locales/*.lua',
	'list/*.lua',
	'server/editable/*.lua',
	'server/list/*.lua',
	'bridge/*.lua',
}

dependencies {
	'/server:7290',
	'ox_lib',
	'/onesync'
}

lua54 'yes'
use_experimental_fxv2_oal 'yes'

dependency '/assetpacks'
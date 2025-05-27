fx_version "cerulean"

description "Best Garage System for fivem servers."
author "OTHERPLANET"
version '2.0.3'

lua54 'yes'

game 'gta5'

ui_page 'web/build/index.html'

shared_scripts {
	'@ox_lib/init.lua',
	'framework/shared.lua',
	'config/MainConfig.lua',
	'locales/*.lua',
}

client_scripts {
	'@PolyZone/client.lua',
	'@PolyZone/BoxZone.lua',
	'@PolyZone/EntityZone.lua',
	'@PolyZone/CircleZone.lua',
	'@PolyZone/ComboZone.lua',
	'config/MainConfig.lua',
	'framework/client/c_framework.lua',
	'client/**',
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'framework/server/s_framework.lua',
	'server/**',
}

files {
	'web/build/index.html',
	'web/build/**/*',
	'dui/dui.html'
}

escrow_ignore {
	'client/editable/**',
	'client/library/**',
	'config/**',
	'locales/**',
	'framework/**',
	'server/editable/**'
}
dependency '/assetpacks'
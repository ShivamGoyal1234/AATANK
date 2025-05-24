fx_version 'cerulean'
game 'gta5'

lua54 'yes'

ui_page 'html/index.html'

files {
  'html/index.html',
  'html/index.js',
  'html/style.css',
  'html/*otf',
  'html/*png',
  'fonts/*.ttf',
  'fonts/*.otf',
  'custom/**'
}

ox_libs {
  'table',
}

client_scripts {
  'client/custom/**/**',
  'custom/client.lua',
  'client/*.lua',
}

shared_scripts {
  '@ox_lib/init.lua',
  'shared/functions.lua',
  'shared/config.lua',
  'locales/**'
}

server_scripts {
  'custom/server.lua',
  'server/*.lua',
}

dependencies {
  'ox_lib',
}

escrow_ignore {
  'client/custom/**',
  'custom/**/*',
  'shared/**/*',
  'config/*',
  'type.lua',
  'locales/*'
}

dependency '/assetpacks'
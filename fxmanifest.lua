fx_version 'bodacious'
game 'gta5'

author 'Koaio'
description 'Core pour LystyLife'
version '1.0'

shared_script {
  '@es_extended/locale.lua',
  'locales/*.lua',
  'config.lua',
}

client_script {
  "RageUI/RMenu.lua",
  "RageUI/menu/RageUI.lua",
  "RageUI/menu/Menu.lua",
  "RageUI/menu/MenuController.lua",
  "RageUI/components/*.lua",
  "RageUI/menu/elements/*.lua",
  "RageUI/menu/items/*.lua",
  "RageUI/menu/panels/*.lua",
  "RageUI/menu/windows/*.lua",
  'client/*.lua',
}

server_script {
  '@mysql-async/lib/MySQL.lua',
  'server/*.lua',
}

dependencies {
    'es_extended',
  'esx_status'
}

export 'logskoaio9999'
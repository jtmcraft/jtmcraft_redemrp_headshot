fx_version 'adamant'
games { 'rdr3' }

author 'jtmcraft'
description 'jtmcraft redemrp resource'
version '1.0.0'

client_scripts {
    '@redm-events/dataview.lua',
    '@redm-events/events.lua',
    'client/cl_main.lua'
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'server/sv_database.lua',
    'server/sv_main.lua'
}

rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

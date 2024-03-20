fx_version 'cerulean'

game 'gta5'

lua54 'yes'


shared_scripts {
    '@ox_lib/init.lua',
    'shared/*.lua'
}

server_scripts {
    'server/*.lua'
}

client_scripts {
    'client/*.lua'
}


dependencies {
    'qb-core',
    'ox_lib',
}
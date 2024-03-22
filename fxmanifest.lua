fx_version 'cerulean'

game 'gta5'

use_experimental_fxv2_oal 'yes'

lua54 'yes'


shared_scripts {
    '@ox_lib/init.lua',
    'shared/*.lua'
}

server_scripts {
    'server/*.lua'
}

client_scripts {
    'client/functions.lua',
    'client/*.lua'
}


dependencies {
    'qb-core',
    'ox_lib',
}
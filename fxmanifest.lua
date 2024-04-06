-- [[ Resource Info ]]

fx_version 'cerulean'
game 'gta5'
lua54 'yes'
version '1.0.0'
author 'wx / woox'
description 'Simple ox_lib banking'


-- [[ Client-Side Files ]]

client_scripts {
    'client/*.lua'
}

-- [[ Server-Side Files ]]

server_scripts {
    'server/*.lua'
}

-- [[ Shared Files & Configs ]]

shared_scripts {
    '@ox_lib/init.lua',
    'configs/*.lua'
}

-- [[ Other Files ]]

files {
    'locales/*.json'
}

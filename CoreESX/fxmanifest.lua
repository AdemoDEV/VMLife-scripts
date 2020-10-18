fx_version 'adamant'
game { 'gta5' }

client_scripts {
    "src/client/RMenu.lua",
    "src/client/menu/RageUI.lua",
    "src/client/menu/Menu.lua",
    "src/client/menu/MenuController.lua",

    "src/client/components/*.lua",

    "src/client/menu/elements/*.lua",

    "src/client/menu/items/*.lua",

    "src/client/menu/panels/*.lua",

    "src/client/menu/windows/*.lua",

}

------------------------TOUT action ce passe cotés client en gros juste pour le joueur

client_script {
    "cl_shops.lua",
    "cl_armurie.lua",
    "cl_utils.lua",
    "config.lua"
    
}

------------------------TOUT action ce passe cotés server en gros pour tous le serveur

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    "sv_shops.lua",
    "sv_armurie.lua",
    "config.lua"
}
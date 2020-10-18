resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'Skin Changer'

version '1.0.2'

client_scripts {
	'@es_extended/locale.lua',
	'locale.lua',
	'locales/br.lua',
	'locales/de.lua',
	'locales/en.lua',
	'locales/fi.lua',
	'locales/fr.lua',
	'locales/sv.lua',
	'config.lua',
	'client/main.lua',
	'client/module.lua'
}

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'@es_extended/locale.lua',
	'locales/de.lua',
	'locales/br.lua',
	'locales/en.lua',
	'locales/fi.lua',
	'locales/fr.lua',
	'locales/sv.lua',
	'locales/pl.lua',
	'config.lua',
	'server/main.lua'
}

dependency 'es_extended'

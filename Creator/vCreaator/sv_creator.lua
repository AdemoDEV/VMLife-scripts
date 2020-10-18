ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('vCreator:sauvegarde')
AddEventHandler('vCreator:sauvegarde', function(nameIdentity, dateIdentity, nickNameIdentity, heightIdentity, sexeIdentity)
    _source = source---ADEMO YZK JIBRIL
    xPlayerSteamId = GetPlayerIdentifiers(_source)
    xPlayerSteam = xPlayerSteamId[1]

    MySQL.Async.execute('UPDATE `users` SET `firstname` = @firstname, `lastname` = @lastname, `dateofbirth` = @dateofbirth, `sex` = @sex, `height` = @height WHERE identifier = @identifier', {
      ['@identifier']		= xPlayerSteam,
      ['@firstname']		= nameIdentity,
      ['@lastname']		= nickNameIdentity,
      ['@dateofbirth']	= dateIdentity,
      ['@sex']			= sexeIdentity,
      ['@height']			= heightIdentity
    }, function(rowsChanged)
      if callback then
        callback(true)
      end
    end)
end)---ADEMO YZK JIBRIL
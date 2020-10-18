ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

 RegisterServerEvent('Shops:item')
 AddEventHandler('Shops:item', function(item, price, count, cb)
 	local _source = source
     local xPlayer = ESX.GetPlayerFromId(_source)
     if xPlayer.getMoney() >= price * count then
         xPlayer.addInventoryItem(item, count) 
         xPlayer.removeMoney(price * count)
         TriggerClientEvent("esx:showNotification", source, "Vous aviez acheter ~g~"..count.."~s~ items pour ~r~"..price * count.."$~s~")
     else
        TriggerClientEvent("esx:showNotification", source, "Vous n'avez pas assez ~r~d'argent")
     end
 end)
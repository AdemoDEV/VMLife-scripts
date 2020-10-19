-----BY ADEMO-----BY ADEMO
RegisterNetEvent("Arme:Item")
AddEventHandler("Arme:Item", function(weapon,price,Label,cb)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local xName = GetPlayerName(source)
        if xPlayer.hasWeapon(weapon) then
            TriggerClientEvent('esx:showNotification', source, 'Vous avez déjà cette arme dans votre inventaire !')
            print("[^1"..xName.."^7] Essaye d'acheter un(e) [^2"..Label.."^7] mais erreur il la déja sur lui")
        else
            if xPlayer.getMoney() >= 10 then
                xPlayer.removeMoney(price)
                xPlayer.addWeapon(weapon, 0)
                TriggerClientEvent("esx:showNotification", source, "Vous avez acheter un(e) ~g~"..Label.."~s~ pour ~r~"..price.."$~s~")
                print("[^1"..xName.."^7] à achtez un(e) [^2"..Label.."^7] pour [^3"..price.."^7]")
        else 
            TriggerClientEvent('esx:showNotification', source, 'Vous avez pas assez d\'argent')
            print("[^1"..xName.."^7] a pas assez d'argent sur lui")
        end
    end
end)

-----BY ADEMO-----BY ADEMO-----BY ADEMO-----BY ADEMO

ESX = nil
local openShops = false
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(10)
    end
end)


function ShowHelpNotification(msg, thisFrame)
	AddTextEntry('HelpNotification', msg)--ADEMO
	DisplayHelpTextThisFrame('HelpNotification', false)
end

Citizen.CreateThread(function()
    while true do--ADEMO
        local pPed = GetPlayerPed(-1)
        local pCoords = GetEntityCoords(pPed)
		local shops = false
		local dst = GetDistanceBetweenCoords(pCoords, true)
        for k,v in pairs(config.shops) do
			if #(pCoords - v.pos) < 1.5 then
				--ADEMO
                shops = true
                ShowHelpNotification("Appuyez sur ~INPUT_PICKUP~ pour acheter vos articles")
				if IsControlJustReleased(0, 38) then
					Ademo1()
					openShop(v)
				end
            end
        end--ADEMO

        if shops then
            Wait(1)
        else
            Wait(500)
        	end
		end
end)

function Ademo1()
RMenu.Add('shop', 'main', RageUI.CreateMenu("Shops", "", 10,222))
--RMenu.Add('admin', 'players', RageUI.CreateSubMenu(RMenu:Get('admin', 'main'), "Joueurs", "List des joueurs dans la session"))
RMenu:Get('shop', 'main'):SetSubtitle("~r~SuperMark")
RMenu:Get('shop', 'main').EnableMouse = false
RMenu:Get('shop', 'main').Closed = function()
	openShops = false
	end
end
--ADEMO
Item = {
	bread = 1,
	water = 1
}

function openShop()
	if openShops then
		openShops = false
	else
		openShops = true
		Ademo1()
		RageUI.Visible(RMenu:Get('shop', 'main'), true)
	Citizen.CreateThread(function()
		while openShops do
			Citizen.Wait(1)
				RageUI.IsVisible(RMenu:Get('shop', 'main'), true, true, true, function()
					RageUI.List("Pain - ~g~10$", ItemShops.number, Item.bread, nil, { }, true, function(Hovered, Active, Selected, Index) 
						Item.bread = Index
				   			if Selected then 
					  		 local count = ItemShops.number[Index]
					  		 TriggerServerEvent('Shops:item', 'bread', 10, count)--ADEMO
				   		end 
					   end)
					   RageUI.List("Eau - ~g~10$", ItemShops.number, Item.water, nil, { }, true, function(Hovered, Active, Selected, Index) 
						Item.water = Index
				   			if Selected then 
					  		 local count = ItemShops.number[Index]
					  		 TriggerServerEvent('Shops:item', 'water', 10, count)
				   		end 
			   		end)
				end)
			end
		end)
	end
end

Number = {
	bread = 10,

}

ItemShops = {
	number = {},
}

Citizen.CreateThread(function()
    for i = 1, Number.bread do
        table.insert(ItemShops.number, i)
    end
end)

RegisterCommand("shops", function()
	openShop()
end)
--ADEMO




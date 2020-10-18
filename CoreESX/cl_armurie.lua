Citizen.CreateThread(function()
    while true do
        local pPed = GetPlayerPed(-1)
        local pCoords = GetEntityCoords(pPed)
		local openarmurie = false
		local dst = GetDistanceBetweenCoords(pCoords, true)--ADEMO
        for k,v in pairs(config.armurie) do
			if #(pCoords - v.pos) < 1.5 then
				
                openarmurie = true
                ShowHelpNotification("Appuyez sur ~INPUT_PICKUP~ pour accédez à l'armurie")
                if IsControlJustReleased(0, 38) then
                    Ademo()
					openArmurie(v)
				end
            end
        end

        if openarmurie then--ADEMO
            Wait(1)--ADEMO
        else
            Wait(500)
        	end
		end
end)

local armurie = false--ADEMO
    
function Ademo()
RMenu.Add('armurie', 'main', RageUI.CreateMenu("Armurie", "", 10,222))
RMenu.Add('armurie', 'let', RageUI.CreateSubMenu(RMenu:Get('armurie', 'main'), "Armurie", "List des armes létals"))
RMenu.Add('armurie', 'poing', RageUI.CreateSubMenu(RMenu:Get('armurie', 'main'), "Armurie", "List des armes de poings"))
RMenu:Get('armurie', 'main'):SetSubtitle("~g~Armurie")
RMenu:Get('armurie', 'main').EnableMouse = false
RMenu:Get('armurie', 'main').Closed = function()
    armurie = false
    end
end

function openArmurie()
        if armurie then--ADEMO
            armurie = false--ADEMO
        else
            armurie = true
            Ademo()
            RageUI.Visible(RMenu:Get('armurie', 'main'), true)

            Citizen.CreateThread(function()
                while armurie do
                    Citizen.Wait(1)
                    RageUI.IsVisible(RMenu:Get('armurie', 'main'), true, true, true, function()
                        RageUI.ButtonWithStyle("Arme létal", "Accédez aux armes légals", {RightLabel = "→→"}, true, function(Hovered, Active, Selected) 
                            if (Selected) then 

                            end 
                        end, RMenu:Get('armurie', 'let'))

                        RageUI.ButtonWithStyle("Arme de poings", "Accédez au arme de poings", {RightLabel = "→→"}, true, function(Hovered, Active, Selected) 
                            if (Selected) then
                            end 
                        end, RMenu:Get('armurie', 'poing'))--ADEMO
                    end, function()
                end)
                RageUI.IsVisible(RMenu:Get('armurie', 'let'), true, true, true, function()
                    for _, weapon in pairs(config.weapon) do 
                        RageUI.ButtonWithStyle(weapon.Name, nil, {RightLabel = weapon.rightlabel}, true, function(Hovered, Active, Selected)
                            if (Selected) then 
                                --TriggerServerEvent('Arme:item', weapon.price, weapon.label) 
                                TriggerServerEvent('Arme:Item', weapon.label, weapon.Price, weapon.Name)
                            end 
                        end)
                    end
                end)
                RageUI.IsVisible(RMenu:Get('armurie', 'poing'), true, true, true, function()
                    for _, weapon in pairs(config.weaponp) do 
                        RageUI.ButtonWithStyle(weapon.Name, nil, {RightLabel = weapon.rightlabel}, true, function(Hovered, Active, Selected)
                            if (Selected) then 
                                --TriggerServerEvent('Arme:item', weapon.price, weapon.label) 
                                TriggerServerEvent('Arme:Item', weapon.label, weapon.Price, weapon.Name)
                            end --ADEMO
                        end)
                    end
                end)   
            end
        end)
    end
end

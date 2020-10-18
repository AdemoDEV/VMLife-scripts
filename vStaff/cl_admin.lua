ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
	end
	
	RMenu.Add('menu', 'main', RageUI.CreateMenu("Menu Staff", ""))
	RMenu.Add('menu', 'options', RageUI.CreateSubMenu(RMenu:Get('menu', 'main'), "Actions Joueurs", "~b~Actions disponibles"))
	RMenu.Add('menu', 'watodo', RageUI.CreateSubMenu(RMenu:Get('menu', 'main'), "Me or Them ?", "~b~Actions disponibles"))
	RMenu.Add('menu', 'joueurs', RageUI.CreateSubMenu(RMenu:Get('menu', 'main'), "Joueurs", "~b~Actions disponibles"))
	RMenu.Add('menu', 'reports', RageUI.CreateSubMenu(RMenu:Get('menu', 'main'), "Reports", "~b~Reports disponibles"))
	RMenu.Add('menu', 'inde', RageUI.CreateSubMenu(RMenu:Get('menu', 'main'), "Indépendant", "~b~Actions disponibles"))
	RMenu.Add('menu', 'knowreports', RageUI.CreateSubMenu(RMenu:Get('menu', 'main'), "Reports", "~b~Infos disponibles"))
	RMenu.Add('menu', 'me', RageUI.CreateSubMenu(RMenu:Get('menu', 'main'), "Moi-même", "~b~Actions disponibles"))
	RMenu.Add('menu', 'world', RageUI.CreateSubMenu(RMenu:Get('menu', 'main'), "Monde", "~b~Actions disponibles"))
	RMenu.Add('menu', 'options', RageUI.CreateSubMenu(RMenu:Get('menu', 'main'), "Actions", "~b~Actions disponibles"))
    RMenu:Get('menu', 'main'):SetSubtitle("~b~Actions disponibles")
    RMenu:Get('menu', 'main').EnableMouse = false
    RMenu:Get('menu', 'main').Closed = function()

        VM.Staff = false
    end--ADEMO YZK JIBRIL
end)

VM = {
    Staff = false,
}

superadmin = nil
local invincible = false
local crossthemap = false
local affichername = false
local afficherblips = false

local menuColor = {123, 75, 100}
Citizen.CreateThread(function()
    Wait(1000)--ADEMO YZK JIBRIL--ADEMO YZK JIBRIL--ADEMO YZK JIBRIL--ADEMO YZK JIBRIL
    menuColor[1] = GetResourceKvpInt("menuR")
    menuColor[2] = GetResourceKvpInt("menuG")
    menuColor[3] = GetResourceKvpInt("menuB")
    ReloadColor()
end)

local AllMenuToChange = nil
function ReloadColor()
    Citizen.CreateThread(function()
        if AllMenuToChange == nil then
            AllMenuToChange = {}
            for Name, Menu in pairs(RMenu['menu']) do
                if Menu.Menu.Sprite.Dictionary == "commonmenu" then
                    table.insert(AllMenuToChange, Name)
                end
            end
        end
        for k,v in pairs(AllMenuToChange) do
            RMenu:Get('menu', v):SetRectangleBanner(menuColor[1], menuColor[2], menuColor[3], 255)
        end
    end)
end

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
end)

function Notify(text)
	SetNotificationTextEntry('STRING')
	AddTextComponentString(text)
	DrawNotification(false, true)
end

--ADEMO YZK JIBRIL--ADEMO YZK JIBRIL--ADEMO YZK JIBRIL--ADEMO YZK JIBRIL
function GetTargetedVehicle(pCoords, ply)
    for i = 1, 200 do
        coordB = GetOffsetFromEntityInWorldCoords(ply, 0.0, (6.281)/i, 0.0)
        targetedVehicle = GetVehicleInDirection(pCoords, coordB)
        if(targetedVehicle ~= nil and targetedVehicle ~= 0)then
            return targetedVehicle
        end
    end
    return
end

function GetVehicleInDirection(coordFrom, coordTo)
	local rayHandle = CastRayPointToPoint(coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z, 10, GetPlayerPed(-1), 0)
	local a, b, c, d, vehicle = GetRaycastResult(rayHandle)
	return vehicle
end

function ShowMarker()
	local ply = GetPlayerPed(-1)
	local pCoords = GetEntityCoords(ply, true)
    local veh = GetTargetedVehicle(pCoords, ply)
    if veh ~= 0 and GetEntityType(veh) == 2 then
        local coords = GetEntityCoords(veh)
        local x,y,z = table.unpack(coords)
        DrawMarker(2, x, y, z+1.5, 0, 0, 0, 180.0,nil,nil, 0.5, 0.5, 0.5, 0, 0, 255, 120, true, true, p19, true)
    end
end

function getCamDirection()
	local heading = GetGameplayCamRelativeHeading() + GetEntityHeading(GetPlayerPed(-1))
	local pitch = GetGameplayCamRelativePitch()--ADEMO YZK JIBRIL--ADEMO YZK JIBRIL--ADEMO YZK JIBRIL--ADEMO YZK JIBRIL
	local coords = vector3(-math.sin(heading * math.pi / 180.0), math.cos(heading * math.pi / 180.0), math.sin(pitch * math.pi / 180.0))
	local len = math.sqrt((coords.x * coords.x) + (coords.y * coords.y) + (coords.z * coords.z))

	if len ~= 0 then
		coords = coords / len
	end

	return coords
end


local Freeze = false
RegisterNetEvent("admin:Freeze")
AddEventHandler("admin:Freeze",function()

    FreezeEntityPosition(GetPlayerPed(-1), not Freeze)
    Freeze = not Freeze
end)

RegisterNetEvent("admin:tp")
AddEventHandler("admin:tp",function(coords)
    SetEntityCoords(GetPlayerPed(-1),coords)
end)


Citizen.CreateThread(function()

    while true do
      Citizen.Wait(1)

     
      if infStamina then
        RestorePlayerStamina(source, 1.0)
      end

      if superJump then
        SetSuperJumpThisFrame(PlayerId())
	  end
    end
  
  end)

local Spectating = false


function SpectatePlayer(player)
	--local playerPed = PlayerPedId()
	Spectating = not Spectating
	local targetPed = GetPlayerPed(player)

	if(Spectating)then
--ADEMO YZK JIBRIL--ADEMO YZK JIBRIL--ADEMO YZK JIBRIL--ADEMO YZK JIBRIL
		local targetx,targety,targetz = table.unpack(GetEntityCoords(targetPed, false))

		RequestCollisionAtCoord(targetx,targety,targetz)
		NetworkSetInSpectatorMode(true, targetPed)

		drawNotification('Spectating '..GetPlayerName(player))
	else

		local targetx,targety,targetz = table.unpack(GetEntityCoords(targetPed, false))

		RequestCollisionAtCoord(targetx,targety,targetz)
		NetworkSetInSpectatorMode(false, targetPed)

		drawNotification('Stopped Spectating '..GetPlayerName(player))
	end
end

function drawNotification(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(false, false)
end
--ADEMO YZK JIBRIL--ADEMO YZK JIBRIL--ADEMO YZK JIBRIL--ADEMO YZK JIBRIL
RegisterNetEvent("CA")
AddEventHandler("CA", function()
  local pos = GetEntityCoords(GetPlayerPed(-1), true)
  ClearAreaOfObjects(pos.x, pos.y, pos.z, 50.0, 0)
end)

function soufle()
    infStamina = not infStamina
      if infStamina then
        Notify("Endurance infini ~g~activé")
      else
        Notify("Endurance infini ~r~desactivé")
      end
   end

function KeyboardInput(TextEntry, ExampleText, MaxStringLength)

	AddTextEntry('FMMC_KEY_TIP1', TextEntry .. ':')
	DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLength)
	blockinput = true

	while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
		Citizen.Wait(0)
	end

	if UpdateOnscreenKeyboard() ~= 2 then
		local result = GetOnscreenKeyboardResult()--ADEMO YZK JIBRIL--ADEMO YZK JIBRIL--ADEMO YZK JIBRIL--ADEMO YZK JIBRIL--ADEMO YZK JIBRIL
		Citizen.Wait(500)
		blockinput = false
		return result
	else
		Citizen.Wait(500)
		blockinput = false
		return nil
	end
end

RegisterCommand("help", function(source, args, sonid)
    for _, i in ipairs(GetActivePlayers()) do
		local sonid = GetPlayerServerId(i)
		local nom = GetPlayerName(i)
		table.insert(Reports, {Id = sonid, name = nom, message = table.concat(args, " ")})
    end
end)

function superman()
	superJump = not superJump
	if superJump then
	  Notify("SuperJump ~g~Activé")
	else
	  Notify("SuperJump ~r~Desactivé")
	end
	  
end

RegisterNetEvent("hAdmin:envoyer")
AddEventHandler("hAdmin:envoyer", function(msg)
	PlaySoundFrontend(-1, "CHARACTER_SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
	local head = RegisterPedheadshot(PlayerPedId())
	while not IsPedheadshotReady(head) or not IsPedheadshotValid(head) do
		Wait(1)
	end
	headshot = GetPedheadshotTxdString(head)
	ESX.ShowAdvancedNotification('MESSAGE STAFF', '~r~Informations', '~r~Raison ~w~: ' ..msg, headshot, 3)
end)

local superJump = false
local fastSprint = false
local infStamina = false
local Frigo = false
local Frigo2 = false
local godmode = true
local fastSwim = false
local blipsStatus = 0
local ademo26 = false
local StaffMod = false
local NoClip = false
local NoClipSpeed = 2.0
local invisible = false
local PlayerInZone = 0
local ShowName = false
local gamerTags = {}
local GetBlips = false
local pBlips = {}
local armor = 0
local InStaff = false
local pris = false

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if StaffMod then

            if NoClip then
                HideHudComponentThisFrame(19)
                local pCoords = GetEntityCoords(GetPlayerPed(-1), false)
                local camCoords = getCamDirection()
                SetEntityVelocity(GetPlayerPed(-1), 0.01, 0.01, 0.01)
                SetEntityCollision(GetPlayerPed(-1), 0, 1)
            
                if IsControlPressed(0, 32) then
                    pCoords = pCoords + (NoClipSpeed * camCoords)
                end
            
                if IsControlPressed(0, 269) then
                    pCoords = pCoords - (NoClipSpeed * camCoords)
                end

                if IsControlPressed(1, 15) then
                    NoClipSpeed = NoClipSpeed + 0.5
                end
                if IsControlPressed(1, 16) then
                    NoClipSpeed = NoClipSpeed - 0.5
                    if NoClipSpeed < 0 then
                        NoClipSpeed = 0
                    end
                end
                SetEntityCoordsNoOffset(GetPlayerPed(-1), pCoords, true, true, true)
            end

            if invisible then
                SetEntityVisible(GetPlayerPed(-1), 0, 0)
                NetworkSetEntityInvisibleToNetwork(pPed, 1)
            else
                SetEntityVisible(GetPlayerPed(-1), 1, 0)
                NetworkSetEntityInvisibleToNetwork(pPed, 0)
			end
			
			if pris then
				label = "~g~EN COURS"
			else
				couscous = "~r~EN ATTENTE"
			end

            if ShowName then
                local pCoords = GetEntityCoords(GetPlayerPed(-1), false)
                for _, v in pairs(GetActivePlayers()) do
                    local otherPed = GetPlayerPed(v)
                
                    if otherPed ~= pPed then
                        if #(pCoords - GetEntityCoords(otherPed, false)) < 250.0 then
                            gamerTags[v] = CreateFakeMpGamerTag(otherPed, ('[%s] %s'):format(GetPlayerServerId(v), GetPlayerName(v)), false, false, '', 0)
                            SetMpGamerTagVisibility(gamerTags[v], 4, 1)
                        else
                            RemoveMpGamerTag(gamerTags[v])
                            gamerTags[v] = nil
                        end
                    end
                end
            else
                for _, v in pairs(GetActivePlayers()) do
                    RemoveMpGamerTag(gamerTags[v])
                end
            end

            for k,v in pairs(GetActivePlayers()) do
                if NetworkIsPlayerTalking(v) then
                    local pPed = GetPlayerPed(v)
                    local pCoords = GetEntityCoords(pPed)
                    DrawMarker(32, pCoords.x, pCoords.y, pCoords.z+1.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 0, 255, 0, 170, 0, 1, 2, 0, nil, nil, 0)
                end
			end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500)
        if GetBlips then
            local players = GetActivePlayers()
            for k,v in pairs(players) do
                local ped = GetPlayerPed(v)
                local blip = AddBlipForEntity(ped)
                table.insert(pBlips, blip)
                SetBlipScale(blip, 0.85)
                if IsPedOnAnyBike(ped) then
                    SetBlipSprite(blip, 226)
                elseif IsPedInAnyHeli(ped) then
                    SetBlipSprite(blip, 422)
                elseif IsPedInAnyPlane(ped) then
                    SetBlipSprite(blip, 307)
                elseif IsPedInAnyVehicle(ped, false) then
                    SetBlipSprite(blip, 523)
                else
                    SetBlipSprite(blip, 1)
                end

                if IsPedInAnyPoliceVehicle(ped) then
                    SetBlipSprite(blip, 56)
                    SetBlipColour(blip, 3)
                end
                SetBlipRotation(blip, math.ceil(GetEntityHeading(ped)))
			end
		else
			for k,v in pairs(pBlips) do
                RemoveBlip(v)
            end
        end
    end
end)

local ServersIdSession = {}

Citizen.CreateThread(function()
    while true do
        Wait(500)
        for k,v in pairs(GetActivePlayers()) do
            local found = false
            for _,j in pairs(ServersIdSession) do
                if GetPlayerServerId(v) == j then
                    found = true
                end
            end
            if not found then
                table.insert(ServersIdSession, GetPlayerServerId(v))
            end
        end
    end
end)


local money = {--ADEMO YZK JIBRIL--ADEMO YZK JIBRIL--ADEMO YZK JIBRIL--ADEMO YZK JIBRIL--ADEMO YZK JIBRIL--ADEMO YZK JIBRIL
	index = 1,
	list = {'~g~Liquide~s~', '~b~Banque~s~', '~r~Non déclaré~s~'},
}

local IdSelected = 0
local ReportSelected = 0

Reports = {}
function openStaffMenu()
    if VM.Staff then
        VM.Staff = false
    else
        VM.Staff = true
        RageUI.Visible(RMenu:Get('menu', 'main'), true)

        Citizen.CreateThread(function()
			while VM.Staff do
				RageUI.IsVisible(RMenu:Get('menu', 'main'), true, true, true, function()
					RageUI.Checkbox("Activer le Staff Mod", "Active seulement lorsque tu veux faire de la modération !", InStaff, { Style = RageUI.CheckboxStyle.Tick }, function(Hovered, Selected, Active, Checked)
						InStaff = Checked;
						if Selected then
							if Checked then
								InStaff = true
								StaffMod = true
							else
								InStaff = false
								StaffMod = false
				
								FreezeEntityPosition(GetPlayerPed(-1), false)
								NoClip = false
				
								SetEntityVisible(GetPlayerPed(-1), 1, 0)
								NetworkSetEntityInvisibleToNetwork(GetPlayerPed(-1), 0)
								SetEntityCollision(GetPlayerPed(-1), 1, 1)
				
								for _, v in pairs(GetActivePlayers()) do
									RemoveMpGamerTag(gamerTags[v])
								end
								-- Go Webhook Inactive
							end
						end
					end)
					if InStaff then
						RageUI.ButtonWithStyle("Joueurs", "Actions possible sur les joueurs !", { RightLabel = "→" },true, function()
						end, RMenu:Get('menu', 'watodo'))
						RageUI.ButtonWithStyle("Monde", "Actions possible sur le monde !", { RightLabel = "→" },true, function()
						end, RMenu:Get('menu', 'world'))
						RageUI.ButtonWithStyle("Reports", "Accéder à la liste des reports !", { RightLabel = "→" },true, function()
						end, RMenu:Get('menu', 'reports')) 
					end
				end, function()
				end, 1)
				
				RageUI.IsVisible(RMenu:Get('menu', 'watodo'), true, true, true, function()
					RageUI.ButtonWithStyle("Moi-même", "", { RightLabel = "→" },true, function()
					end, RMenu:Get('menu', 'me'))
					RageUI.ButtonWithStyle("Administration indépendante", "", { RightLabel = "→" },true, function()
					end, RMenu:Get('menu', 'inde'))
					RageUI.ButtonWithStyle("Listes des Joueurs", "", { RightLabel = "→" },true, function()
					end, RMenu:Get('menu', 'joueurs'))
				end, function()
				end)
		
				
				RageUI.IsVisible(RMenu:Get('menu', 'me'), true, true, true, function()
					RageUI.Checkbox("Noclip", "Molette vers le bas = Vitesse ~g~Lente\n~s~Molette vers le haut = Vitesse ~r~Rapide", crossthemap,{},function(Hovered,Ative,Selected,Checked)
						if Selected then
							crossthemap = Checked
							if Checked then
								FreezeEntityPosition(GetPlayerPed(-1), true)
								NoClip = true
								invisible = true
							else
								FreezeEntityPosition(GetPlayerPed(-1), false)
								SetEntityCollision(GetPlayerPed(-1), 1, 1)
								NoClip = false--ADEMO YZK JIBRIL--ADEMO YZK JIBRIL--ADEMO YZK JIBRIL--ADEMO YZK JIBRIL
								invisible = false
							end
						end
					end)
					RageUI.Checkbox("Invincible", description, invincible,{},function(Hovered,Ative,Selected,Checked)
						if Selected then
							invincible = Checked
							if Checked then
								SetEntityInvincible(PlayerPedId(), true)
								Notify("GodMod ~g~activé")	
							else
								SetEntityInvincible(PlayerPedId(), false)
								Notify("GodMod ~r~desactivé")	
							end
						end
					end)
					RageUI.Checkbox("Superjump", description, superJump,{},function(Hovered,Ative,Selected,Checked)
						if Selected then
							superJump = Checked
							if Checked then
								superman()
							else
								superman()
							end
						end
					end)
					RageUI.Checkbox("SuperNage", description, fastSwim,{},function(Hovered,Ative,Selected,Checked)
						if Selected then
							fastSwim = Checked
							if Checked then
								SetSwimMultiplierForPlayer(PlayerId(), 1.49)
								Notify("Super Nage ~g~activé")	
							else
								SetSwimMultiplierForPlayer(PlayerId(), 1.0)
								Notify("Super Nage ~r~désactivé")
							end
						end
					end)
					RageUI.Checkbox("SuperSprint", description, fastSprint,{},function(Hovered,Ative,Selected,Checked)
						if Selected then
							fastSprint = Checked
							if Checked then
								SetRunSprintMultiplierForPlayer(PlayerId(), 1.49)
								Notify("Super sprint ~g~activé")
							else
								SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
								Notify("Super sprint ~r~Désactivé")
							end
						end
					end)
					RageUI.ButtonWithStyle("Heal",description, {RightBadge = RageUI.BadgeStyle.Heart}, true, function(Hovered, Active, Selected)
						if (Selected) then
							SetEntityHealth(GetPlayerPed(-1), 200)
							Notify("~g~Heal effectué~w~")
						end
					end)
					RageUI.ButtonWithStyle("Blindage",description, {RightBadge = RageUI.BadgeStyle.Armour}, true, function(Hovered, Active, Selected)
						if (Selected) then
							SetPedArmour(GetPlayerPed(-1), 200)
							Notify("~g~Blindage effectué~w~")
						end
					end)
					if superadmin then
						RageUI.List('Remboursement', money.list, money.index, "Give toi pour après faire la transaction à une personne aves les logs !", {}, true, function(Hovered, Active, Selected, Index)
							if (Selected) then
								if Index == 1 then
									GiveCash()
								elseif Index == 2 then
									GiveBanque()
								elseif Index == 3 then
									GiveND()
								end
							end
							money.index = Index
						end)
					end
					
				end, function()
				end)
		
				RageUI.IsVisible(RMenu:Get('menu', 'joueurs'), true, true, true, function()
					for k,v in ipairs(ServersIdSession) do
						if GetPlayerName(GetPlayerFromServerId(v)) == "**Invalid**" then table.remove(ServersIdSession, k) end
						RageUI.ButtonWithStyle(v.." - " ..GetPlayerName(GetPlayerFromServerId(v)), nil, {}, true, function(Hovered, Active, Selected)
							if (Selected) then
								IdSelected = v
							end
						end, RMenu:Get('menu', 'options'))
					end
				end, function()
				end)

				RageUI.IsVisible(RMenu:Get('menu', 'inde'), true, true, true, function()
					RageUI.Separator("↓↓↓ ~b~Actions Disponibles ~s~↓↓↓", nil, {}, true, function(_, _, _)
                    end)
					RageUI.ButtonWithStyle("Envoyer un message", nil, {RightLabel = nil}, true, function(Hovered, Active, Selected)
						if (Selected) then
							local quelid = KeyboardInput("ID", "", 100)
							local msg = KeyboardInput("Raison", "", 100)

							if msg ~= nil then
								msg = tostring(msg)
						
								if type(msg) == 'string' then
									TriggerServerEvent("hAdmin:Message", quelid, msg)
									RageUI.CloseAll()
								end
							end
							ESX.ShowNotification("Vous venez d'envoyer le message à  l'ID : ~r~ " ..quelid)
						end
					end)
					RageUI.ButtonWithStyle("~r~Wipe ( EN DEV )", nil, {RightLabel = nil}, true, function(Hovered, Active, Selected)--ADEMO YZK JIBRIL--ADEMO YZK JIBRIL--ADEMO YZK JIBRIL
						if (Selected) then
							-- EN DEV
						end
					end)
					RageUI.ButtonWithStyle("~r~Kick", nil, {RightLabel = nil}, true, function(Hovered, Active, Selected)
						if (Selected) then
							local quelid = KeyboardInput("ID", "", 100)
							local reason = KeyboardInput("Raison du kick", "", 100)
							ExecuteCommand("kick "..quelid.. "" ..reason)
							if quelid and reason then
								ExecuteCommand("kick "..quelid.. " " ..reason)
								ESX.ShowNotification("Vous venez de kick l\'ID :"..quelid.. " pour la raison suivante : " ..reason)
							else
								ESX.ShowNotification("~r~ERROR 404\nChamp Invalide")
								RageUI.CloseAll()	
							end	
						end
					end)
					RageUI.ButtonWithStyle("~r~Bannir EL", "Permet de bannir une personne en ligne !", {RightLabel = nil}, true, function(Hovered, Active, Selected)
						if (Selected) then
							local quelid = KeyboardInput("ID", "", 100)
							local day = KeyboardInput("Jours", "", 100)
							local raison = KeyboardInput("Raison du kick", "", 100)
							if quelid and day and raison then
								ExecuteCommand("sqlban "..quelid.. " " ..day.. " " ..raison)
								ESX.ShowNotification("Vous venez de ban l\'ID :"..quelid.. " " ..day.. " pour la raison suivante : " ..raison)
							else
								ESX.ShowNotification("~r~ERROR 404\nChamp Invalide")
								RageUI.CloseAll()	
							end
						end
					end)
					RageUI.ButtonWithStyle("~r~Bannir HL", "Permet de bannir une personne hors ligne\nFonctionne avec nom steam !", {RightLabel = nil}, true, function(Hovered, Active, Selected)
						if (Selected) then
							local quelid = KeyboardInput("ID", "", 100)
							local day = KeyboardInput("Jours", "", 100)
							local raison = KeyboardInput("Raison du Ban", "", 100)
							if quelid and day and raison then
								ExecuteCommand("sqlbanoffline "..day.. " " ..name)
								ExecuteCommand("sqlreason "..raison)
								ESX.ShowNotification("Vous venez de ban offline :"..name.. " " ..day.. " pour la raison suivante : " ..raison)
							else
								ESX.ShowNotification("~r~ERROR 404\nChamp Invalide")
								RageUI.CloseAll()	
							end
						end
					end)
					RageUI.ButtonWithStyle("~r~Debannir", "Permet de débannir une personne\nFonctionne avec nom steam !", {RightLabel = nil}, true, function(Hovered, Active, Selected)
						if (Selected) then
							local name = KeyboardInput("Nom Steam", "", 100)
							if name then
								ExecuteCommand("sqlunban "..name)
								ESX.ShowNotification("Vous venez de déban : "..name)
							else
								ESX.ShowNotification("~r~ERROR 404\nChamp Invalide")
								RageUI.CloseAll()	
							end
						end
					end)
					RageUI.ButtonWithStyle("S'y Téléporter", nil, {}, true, function(Hovered, Active, Selected)
						if (Selected) then
							local quelid = KeyboardInput("ID", "", 100)
							ExecuteCommand("goto "..quelid)
							ESX.ShowNotification("~b~Vous venez de vous téléporter à l\'ID : ~s~ " ..quelid)
						end
					end)
					RageUI.ButtonWithStyle("Téléporter à vous", nil, {}, true, function(Hovered, Active, Selected, target)
						if (Selected) then
							local quelid = KeyboardInput("ID", "", 100)
							ExecuteCommand("bring "..quelid)
							ESX.ShowNotification("~b~Vous venez de téléporter l\'ID :~s~ " ..quelid.. " ~b~à vous~s~ !")
						end
					end)
					RageUI.Checkbox("Freeze / Defreeze", description, Frigo2,{},function(Hovered,Ative,Selected,Checked)
						if Selected then
							Frigo2 = Checked
							if Checked then
								local quelid = KeyboardInput("ID", "", 100)
								ExecuteCommand("freeze "..quelid)
								ESX.ShowNotification("~b~Vous venez de freeze l\'ID : ~s~" ..quelid)
							else
								local quelid = KeyboardInput("ID", "", 100)
								ExecuteCommand("freeze "..quelid)
								ESX.ShowNotification("~b~Vous venez de defreeze l\'ID : ~s~" ..quelid)
							end
						end
					end)
					if superadmin then
						RageUI.ButtonWithStyle("~b~Setjob", nil, {RightLabel = nil}, true, function(Hovered, Active, Selected)
							if (Selected) then
								local quelid = KeyboardInput("ID", "", 10)
								local job = KeyboardInput("Job", "", 10)
								local grade = KeyboardInput("Grade", "", 10)
								if job and grade and quelid then
									ExecuteCommand("setjob "..quelid.. " " ..job.. " " ..grade)
									ESX.ShowNotification("Vous venez de setjob ~g~"..job.. " " .. grade .. " l\'ID : " ..quelid)
								else
									ESX.ShowNotification("~r~ERROR 404\nChamp Invalide")
									RageUI.CloseAll()	
								end	
							end
						end)
					end
					RageUI.ButtonWithStyle("Heal", "", {RightBadge = RageUI.BadgeStyle.Heart}, true, function(Hovered, Active, Selected)
						if (Selected) then
							local quelid = KeyboardInput("ID", "", 100)
							if quelid then
								ExecuteCommand("heal "..quelid)
								Notify("~g~Heal de l'ID "..quelid.." effectué~w~")
							else
								ESX.ShowNotification("~r~ERROR 404\nChamp Invalide")
								RageUI.CloseAll()	
							end
						end
					end)
					RageUI.ButtonWithStyle("Revive ( EN DEV )",description, {RightBadge = RageUI.BadgeStyle.Heart}, true, function(Hovered, Active, Selected)
						if (Selected) then
						end
					end)
					if superadmin then
						RageUI.ButtonWithStyle("Wipe l'inventaire", "~r~ATTENTION\nLe joueur perdra tout son inventaire !", {RightLabel = nil}, true, function(Hovered, Active, Selected)
							if (Selected) then
								local quelid = KeyboardInput("ID", "", 100)
								if quelid then
									ExecuteCommand("clearinventory "..quelid)
									ESX.ShowNotification("Vous venez d'enlever tout les items de l'ID : ~b~ " ..quelid)
								else
									ESX.ShowNotification("~r~ERROR 404\nChamp Invalide")
									RageUI.CloseAll()	
								end
							end
						end)
					end
					if superadmin then
						RageUI.ButtonWithStyle("Wipe les armes", "~r~ATTENTION\nLe joueur perdra toutes ses armes !", {RightLabel = nil}, true, function(Hovered, Active, Selected)
							if (Selected) then
								local quelid = KeyboardInput("ID", "", 100)
								if quelid then
									ExecuteCommand("clearloadout "..quelid)
									ESX.ShowNotification("Vous venez d'enlever toutes les armes de l'ID : ~b~ " ..quelid)
								else
									ESX.ShowNotification("~r~ERROR 404\nChamp Invalide")
									RageUI.CloseAll()
								end
							end
						end)
					end
					RageUI.ButtonWithStyle("Give Item", "~r~ATTENTION\nLes items doivent être écrits en anglais !", {RightLabel = nil}, true, function(Hovered, Active, Selected)
						if (Selected) then
							local quelid = KeyboardInput("ID", "", 100)
							local item = KeyboardInput("Item", "", 10)
							local amount = KeyboardInput("Nombre", "", 10)
							if item and quelid and amount then
								ExecuteCommand("giveitem "..quelid.. " " ..item.. " " ..amount)
								ESX.ShowNotification("Vous venez de donner ~g~"..amount.. " " .. item .. " ~w~à l'ID :" ..quelid)	
							else
								ESX.ShowNotification("~r~ERROR 404\nChamp Invalide")
								RageUI.CloseAll()	
							end			
						end
					end)
					if superadmin then
						RageUI.ButtonWithStyle("Give Weapon", "~r~Pour connaître le nom des armes :\nhttps://forum.cfx.re/t/list-of-weapon-spawn-names-after-hours/90750", {RightLabel = nil}, true, function(Hovered, Active, Selected)
							if (Selected) then
								local quelid = KeyboardInput("ID", "", 100)
								local weapon = KeyboardInput("WEAPON_...", "", 100)
								local ammo = KeyboardInput("Munitions", "", 100)
								if weapon and ammo and quelid then
									ExecuteCommand("giveweapon "..quelid.. " " ..weapon.. " " ..ammo)
									ESX.ShowNotification("Vous venez de donner ~g~"..weapon.. " avec " .. ammo .. " munitions ~w~à l'ID :" ..quelid)
								else
									ESX.ShowNotification("~r~ERROR 404\nChamp Invalide")
									RageUI.CloseAll()	
								end
							end
						end)
				    end
				end, function()
				end)
		
				RageUI.IsVisible(RMenu:Get('menu', 'options'), true, true, true, function()
					RageUI.Separator(GetPlayerName(GetPlayerFromServerId(IdSelected)))
					RageUI.Separator("~b~↓~w~↓~r~↓ ~s~Actions ~r~↓~w~↓~b~↓", nil, {}, true, function(_, _, _)
                    end)
					RageUI.ButtonWithStyle("Envoyer un message", nil, {RightLabel = nil}, true, function(Hovered, Active, Selected)
						if (Selected) then
							local msg = KeyboardInput("Raison", "", 100)

							if msg ~= nil then
								msg = tostring(msg)
						
								if type(msg) == 'string' then
									TriggerServerEvent("hAdmin:Message", IdSelected, msg)
									RageUI.CloseAll()
								end
							end
							ESX.ShowNotification("Vous venez d'envoyer le message à ~b~" .. GetPlayerName(GetPlayerFromServerId(IdSelected)))
						end
					end)
					if superadmin then
						RageUI.ButtonWithStyle("~b~Setjob", nil, {RightLabel = nil}, true, function(Hovered, Active, Selected)
							if (Selected) then
								local job = KeyboardInput("Job", "", 10)
								local grade = KeyboardInput("Grade", "", 10)
								if job and grade then
									ExecuteCommand("setjob "..IdSelected.. " " ..job.. " " ..grade)
									ESX.ShowNotification("Vous venez de setjob ~g~"..job.. " " .. grade .. " " .. GetPlayerName(GetPlayerFromServerId(IdSelected)))
								else
									ESX.ShowNotification("~r~ERROR 404\nChamp Invalide")
									RageUI.CloseAll()	
								end	
							end
						end)
					end
					RageUI.ButtonWithStyle("~r~Kick", nil, {RightLabel = nil}, true, function(Hovered, Active, Selected)
						if (Selected) then
							local kick = KeyboardInput("Raison du kick", "", 100)
							TriggerServerEvent('vStaff:KickPerso', kick)
						end
					end)
					RageUI.ButtonWithStyle("~r~Bannir", nil, {RightLabel = nil}, true, function(Hovered, Active, Selected)
						if (Selected) then
							--ExecuteCommand("sqlban "..IdSelected)
						end
					end)
					RageUI.ButtonWithStyle("S'y Téléporter", nil, {}, true, function(Hovered, Active, Selected)
						if (Selected) then
							SetEntityCoords(PlayerPedId(), GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(IdSelected))))
							ESX.ShowNotification('~b~Vous venez de vous Téléporter à~s~ '.. GetPlayerName(GetPlayerFromServerId(IdSelected)) ..'')
						end
					end)
					RageUI.ButtonWithStyle("Téléporter à vous", nil, {}, true, function(Hovered, Active, Selected, target)
						if (Selected) then
							ExecuteCommand("bring "..IdSelected)
							ESX.ShowNotification('~b~Vous venez de Téléporter ~s~ '.. GetPlayerName(GetPlayerFromServerId(IdSelected)) ..' ~b~à vous~s~ !')
						end
					end)
					RageUI.Checkbox("Freeze / Defreeze", description, Frigo,{},function(Hovered,Ative,Selected,Checked)
						if Selected then
							Frigo = Checked
							if Checked then
								ESX.ShowNotification("~r~Joueur Freeze ("..GetPlayerName(GetPlayerFromServerId(IdSelected))..")")
								TriggerEvent("admin:Freeze",IdSelected)
							else
								ESX.ShowNotification("~r~Joueur Defreeze ("..GetPlayerName(GetPlayerFromServerId(IdSelected))..")")
								TriggerEvent("admin:Freeze",IdSelected)
							end
						end
					end)
					RageUI.ButtonWithStyle("Heal", "", {RightBadge = RageUI.BadgeStyle.Heart}, true, function(Hovered, Active, Selected)
						if (Selected) then
							ExecuteCommand("heal "..IdSelected)
							Notify("~g~Heal de ".. GetPlayerName(GetPlayerFromServerId(IdSelected)) .." effectué~w~")
						end
					end)
					RageUI.ButtonWithStyle("Revive ( EN DEV )",description, {RightBadge = RageUI.BadgeStyle.Heart}, true, function(Hovered, Active, Selected)
						if (Selected) then
						end
					end)
					if superadmin then
						RageUI.ButtonWithStyle("Wipe l'inventaire", "~r~ATTENTION\nLe joueur perdra tout son inventaire !", {RightLabel = nil}, true, function(Hovered, Active, Selected)
							if (Selected) then
								ExecuteCommand("clearinventory "..IdSelected)
								ESX.ShowNotification("Vous venez d'enlever tout les items de ~b~".. GetPlayerName(GetPlayerFromServerId(IdSelected)) .."~s~ !")
							end
						end)
					end
					if superadmin then
						RageUI.ButtonWithStyle("Wipe les armes", "~r~ATTENTION\nLe joueur perdra toutes ses armes !", {RightLabel = nil}, true, function(Hovered, Active, Selected)
							if (Selected) then
								ExecuteCommand("clearloadout "..IdSelected)
								ESX.ShowNotification("Vous venez de enlever toutes les armes de ~b~".. GetPlayerName(GetPlayerFromServerId(IdSelected)) .."~s~ !")
							end
						end)
					end
					RageUI.ButtonWithStyle("Give Item", "~r~ATTENTION\nLes items doivent être écrits en anglais !", {RightLabel = nil}, true, function(Hovered, Active, Selected)
						if (Selected) then
							local item = KeyboardInput("Item", "", 10)
							local amount = KeyboardInput("Nombre", "", 10)
							if item and amount then
								ExecuteCommand("giveitem "..IdSelected.. " " ..item.. " " ..amount)
								ESX.ShowNotification("Vous venez de donner ~g~"..amount.. " " .. item .. " ~w~à " .. GetPlayerName(GetPlayerFromServerId(IdSelected)))	
							else
								ESX.ShowNotification("~r~ERROR 404\nChamp Invalide")
								RageUI.CloseAll()	
							end			
						end
					end)
					if superadmin then
						RageUI.ButtonWithStyle("Give Weapon", "~r~Pour connaître le nom des armes :\nhttps://forum.cfx.re/t/list-of-weapon-spawn-names-after-hours/90750", {RightLabel = nil}, true, function(Hovered, Active, Selected)
							if (Selected) then
								local weapon = KeyboardInput("WEAPON_...", "", 100)
								local ammo = KeyboardInput("Munitions", "", 100)
								if weapon and ammo then
									ExecuteCommand("giveweapon "..IdSelected.. " " ..weapon.. " " ..ammo)
									ESX.ShowNotification("Vous venez de donner ~g~"..weapon.. " avec " .. ammo .. " munitions ~w~à " .. GetPlayerName(GetPlayerFromServerId(IdSelected)))
								else
									ESX.ShowNotification("~r~ERROR 404\nChamp Invalide")
									RageUI.CloseAll()	
								end
							end
						end)
				    end
				end, function()
				end)

		
				RageUI.IsVisible(RMenu:Get('menu', 'reports'), true, true, true, function()
					for k,v in ipairs(Reports) do
						RageUI.ButtonWithStyle("["..v.Id.."] - "..v.name, "", { RightLabel = label or couscous }, true, function(Hovered, Active, Selected)
							if (Selected) then
								pris = true
								ReportSelected = v
							end
						end, RMenu:Get('menu', 'knowreports'))
					end
				end, function()
				end)
				RageUI.IsVisible(RMenu:Get('menu', 'knowreports'), true, true, true, function()
					RageUI.Separator("~b~Joueur : ~s~" ..ReportSelected.name)
					RageUI.Separator("↓↓↓ ~b~Infos ~s~↓↓↓", nil, {}, true, function(_, _, _)
					end)
					RageUI.Separator("~b~ID : ~s~" ..ReportSelected.Id, nil, {}, true, function(_, _, _)
					end)
					RageUI.Separator("~b~Raison ~s~: " ..ReportSelected.message, nil, {}, true, function(_, _, _)
					end)
					RageUI.ButtonWithStyle("~r~Supprimer", "", {}, true, function(Hovered, Active, Selected)
						if (Selected) then
							for k,v in ipairs(Reports) do
								table.remove(Reports, k)
								RageUI.GoBack()
							end
							ESX.ShowNotification("~r~Le report de " ..ReportSelected.name.. " a été supprimé !")
						end
					end)
					RageUI.ButtonWithStyle("~b~S'y Rendre", "", {}, true, function(Hovered, Active, Selected)
						if (Selected) then
							ExecuteCommand("goto "..ReportSelected.Id)
						end
					end)
					RageUI.ButtonWithStyle("~b~Revive", "", {RightBadge = RageUI.BadgeStyle.Heart}, true, function(Hovered, Active, Selected)
						if (Selected) then
							-- EN DEV
						end
					end)
				end, function()
				end)
				RageUI.IsVisible(RMenu:Get('menu', 'world'), true, true, true, function()
					RageUI.Checkbox("Afficher les Noms", description, affichername,{},function(Hovered,Ative,Selected,Checked)
						if Selected then
							affichername = Checked
							if Checked then
								ShowName = true
								ESX.ShowNotification("~r~ALERTE HRP !\nLes noms ont été activé !")
							else
								ShowName = false
								ESX.ShowNotification("~r~ALERTE RP !\nLes noms ont été desactivé !")
							end
						end
					end)
					RageUI.Checkbox("Afficher les Blips", description, afficherblips,{},function(Hovered,Ative,Selected,Checked)
						if Selected then
							afficherblips = Checked
							if Checked then
								GetBlips = true
								ESX.ShowNotification("~r~ALERTE HRP !\nLes blips ont été activé !")
							else
								GetBlips = false
								ESX.ShowNotification("~r~ALERTE RP !\nLes blips ont été desactivé !")
							end
						end
					end)
					RageUI.ButtonWithStyle("Téléporter sur son marqueur", nil, {
					}, true, function(_, _, Selected)
					if Selected then
						local playerPed = GetPlayerPed(-1)
						local WaypointHandle = GetFirstBlipInfoId(8)
						if DoesBlipExist(WaypointHandle) then
							local coord = Citizen.InvokeNative(0xFA7C7F0AADF25D09, WaypointHandle, Citizen.ResultAsVector())
							--SetEntityCoordsNoOffset(playerPed, coord.x, coord.y, coord.z, false, false, false, true)
							SetEntityCoordsNoOffset(playerPed, coord.x, coord.y, -199.9, false, false, false, true)
		
						end
					end
					end)
					RageUI.ButtonWithStyle("Spawn un Véhicule", nil, {RightBadge = RageUI.BadgeStyle.Car}
					, true, function(_, _, Selected)
					if Selected then
		
						local ped = GetPlayerPed(tgt)
						local ModelName = KeyboardInput("Véhicule", "", 100)
		
						if ModelName and IsModelValid(ModelName) and IsModelAVehicle(ModelName) then
							RequestModel(ModelName)
							while not HasModelLoaded(ModelName) do
								Citizen.Wait(0)
							end
								local veh = CreateVehicle(GetHashKey(ModelName), GetEntityCoords(GetPlayerPed(-1)), GetEntityHeading(GetPlayerPed(-1)), true, true)
								TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
								Wait(50)
						else
							ShowNotification("~r~Erreur !")
						end
					end
					end)
					RageUI.ButtonWithStyle("Réparer un Véhicule", nil, {RightBadge = RageUI.BadgeStyle.Car}
					, true, function(_, Active, Selected)
					if Active then
						ShowMarker()
					end
					if Selected then
						local ply = GetPlayerPed(-1)
						local pCoords = GetEntityCoords(ply, true)
						local veh = GetTargetedVehicle(pCoords, ply)
		
						SetVehicleFixed(veh)
						SetVehicleDirtLevel(veh, 0.0)
					end
					end)
					RageUI.ButtonWithStyle("Changer la plaque du véhicule", nil, {RightBadge = RageUI.BadgeStyle.Car}
					, true, function(_, Active, Selected)
					if Selected then
						if IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then
							local plaqueVehicule = KeyboardInput("Plaque", "", 8)
							SetVehicleNumberPlateText(GetVehiclePedIsIn(GetPlayerPed(-1), false) , plaqueVehicule)
							ESX.ShowNotification("La plaque du véhicule est désormais : ~g~"..plaqueVehicule)
						else
							ESX.ShowNotification("~r~Erreur\n~s~Vous n'êtes pas dans un véhicule !")
						end
					end
					end)
					RageUI.ButtonWithStyle("Mettre en Fourrière", nil, {RightBadge = RageUI.BadgeStyle.Car}
					, true, function(_, Active, Selected)
					if Active then
						ShowMarker()
					end
					if Selected then
						TriggerEvent("esx:deleteVehicle")
					end
					end)
					RageUI.ButtonWithStyle("C'est rien , c'est la rue !", "Supprime les trucs qui cassent les couilles genre les poteaux électriques qui tombent tout seul !", {
					}, true, function(_, Active, Selected)
					if Selected then
						TriggerEvent("CA")
					end
					end)
				end, function()
				end)
				Wait(0)
			end
		end)
	end
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
				if IsControlJustPressed(0, 289) then
					ESX.TriggerServerCallback('RubyMenu:getUsergroup', function(group)
						playergroup = group
						if playergroup == 'superadmin' or playergroup == 'owner' then
							superadmin = true
							openStaffMenu() 
						elseif playergroup == 'dev' or playergroup == 'mod' or playergroup == 'admin' then--ADEMO YZK JIBRIL--ADEMO YZK JIBRIL--ADEMO YZK JIBRIL--ADEMO YZK JIBRIL--ADEMO YZK JIBRIL
							superadmin = false
							openStaffMenu()
						end
					end)

				end -- Touche F2
	end
end)

    
-- MAIN CODE --
function GetPlayers()
	local players = {}

	for _, i in ipairs(GetActivePlayers()) do
		if NetworkIsPlayerActive(i) then
			table.insert(players, i)
		end
	end

	return players
end


-- GIVE DE L'ARGENT
function GiveCash()
	local amount = KeyboardInput("Somme", "", 8)

	if amount ~= nil then
		amount = tonumber(amount)
		
		if type(amount) == 'number' then
			TriggerServerEvent('vAdmin:GiveCash', amount)
		end
	end
end
-- FIN GIVE DE L'ARGENT

-- GIVE DE L'ARGENT EN BANQUE
function GiveBanque()
	local amount = KeyboardInput("Somme", "", 8)

	if amount ~= nil then
		amount = tonumber(amount)
		
		if type(amount) == 'number' then
			TriggerServerEvent('vAdmin:GiveBanque', amount)
		end
	end
end
-- FIN GIVE DE L'ARGENT EN BANQUE

-- GIVE DE L'ARGENT SALE
function GiveND()
	local amount = KeyboardInput("Somme", "", 8)

	if amount ~= nil then
		amount = tonumber(amount)
		
		if type(amount) == 'number' then
			TriggerServerEvent('vAdmin:GiveND', amount)
		end
	end
end

ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj)ESX = obj end)
        Citizen.Wait(0)
    end
end)


RegisterNetEvent('vCreator:OpenMenu')
AddEventHandler('vCreator:OpenMenu', function()
    creatoe()
end)

function CreateMain()
	local coords = GetEntityCoords(GetPlayerPed(-1))
    cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", 1)
    SetCamCoord(cam, coords.x, coords.y+2.5, coords.z)
    SetCamFov(cam, 50.0)
    PointCamAtCoord(cam, coords.x, coords.y, coords.z)
    SetCamShakeAmplitude(cam, 13.0)
    RenderScriptCams(1, 1, 1500, 1, 1)
end

local openCreator = false
local VMlifesexeChoix = 1

Colors = {
    {22, 19, 19}, -- 0
    {30, 28, 25}, -- 1
    {76, 56, 45}, -- 2
    {69, 34, 24}, -- 3
    {123, 59, 31}, -- 4
    {149, 68, 35}, -- 5
    {165, 87, 50}, -- 6
    {175, 111, 72}, -- 7
    {159, 105, 68}, -- 8
    {198, 152, 108}, -- 9
    {213, 170, 115}, -- 10
    {223, 187, 132}, -- 11
    {202, 164, 110}, -- 12
    {238, 204, 130}, -- 13
    {229, 190, 126}, -- 14
    {250, 225, 167}, -- 15
    {187, 140, 96}, -- 16
    {163, 92, 60}, -- 17
    {144, 52, 37}, -- 18
    {134, 21, 17}, -- 19
    {164, 24, 18}, -- 20
    {195, 33, 24}, -- 21
    {221, 69, 34}, -- 22
    {229, 71, 30}, -- 23
    {208, 97, 56}, -- 24
    {113, 79, 38}, -- 25
    {132, 107, 95}, -- 26
    {185, 164, 150}, -- 27
    {218, 196, 180}, -- 28
    {247, 230, 217}, -- 29
    {102, 72, 93}, -- 30
    {162, 105, 138}, -- 31
    {171, 174, 11}, -- 32
    {239, 61, 200}, -- 33
    {255, 69, 152}, -- 34
    {255, 178, 191}, -- 35
    {12, 168, 146}, -- 36
    {8, 146, 165}, -- 37
    {11, 82, 134}, -- 38
    {118, 190, 117}, -- 39
    {52, 156, 104}, -- 40
    {22, 86, 85}, -- 41
    {152, 177, 40}, -- 42
    {127, 162, 23}, -- 43
    {241, 200, 98}, -- 44
    {238, 178, 16}, -- 45
    {224, 134, 14}, -- 46
    {247, 157, 15}, -- 47
    {243, 143, 16}, -- 48
    {231, 70, 15}, -- 49
    {255, 101, 21}, -- 50
    {254, 91, 34}, -- 51
    {252, 67, 21}, -- 52
    {196, 12, 15}, -- 53
    {143, 10, 14}, -- 54
    {44, 27, 22}, -- 55
    {80, 51, 37}, -- 56
    {98, 54, 37}, -- 57
    {60, 31, 24}, -- 58
    {69, 43, 32}, -- 59
    {8, 10, 14}, -- 60
    {212, 185, 158}, -- 61
    {212, 185, 158}, -- 62
    {213, 170, 115}, -- 63
}

local Ademo = {}
local Ademosex = 1
local Ademochoice = 1
local Ademomum = 1
local Ademodad = 1
local Ademoresem = 1
local Ademoheri = 1
local AdemoData = {}
local AdemoDatadad = 1
local AdemoDatamum = 1
local AdemoDataresem = 1
local AdemoDataheri = 1

local colour_table2 = { 1, 1 }
local colour_table = { 1, 1 }
local colour_table6 = { 1, 1 }
local colour_table3 = { 1, 1 }
local colour_table4 = { 1, 1 }
local colour_table5 = { 1, 1 }
local colour_table7 = { 1, 1 }
local colour_table8 = { 1, 1 }---ADEMO YZK JIBRIL

local hairstyless = 1
local Barbess = 1
local Yeuxx = 1
local haut = 1
local Ppeauu = 1
local Lipstickk = 1
local Teintt = 1
local Ridess = 1
local Sourcilss = 1
local percentage_float = 0.5

local vm = {
	vmsexe = 1,
	sexe = {'Homme', 'Femme'},
}---ADEMO YZK JIBRIL

local self = {
    FACE_F_CHEVEUX = false,
    FACE_F_BARBE = false,
    FACE_F_SOURCIL = false,
    FACE_F_TEIN = false,
    FACE_F_RIDES = false,
    FACE_F_LEVRE = false
}

RMenu.Add('creator', 'main', RageUI.CreateMenu("Personnage", "~r~B~b~I~g~E~y~N~p~V~o~E~b~N~p~U~g~E ~y~SUR ~r~VMLIFE", nil,75))
RMenu.Add('mdr', 'demain', RageUI.CreateMenu("Vêtements", "~b~Actions disponibles", nil,75))
RMenu.Add('creator', 'sexe', RageUI.CreateSubMenu(RMenu:Get('creator', 'main'), "Sexe", "Choissisez votre sexe"))
RMenu.Add('creator', 'heri', RageUI.CreateSubMenu(RMenu:Get('creator', 'main'), "Héritage", "Appuyez sur ENTER pour appliquer"))
RMenu.Add('creator', 'app', RageUI.CreateSubMenu(RMenu:Get('creator', 'main'), "Apparence", "Appuyez sur ENTER pour appliquer"))
RMenu.Add('mdr', 'vet', RageUI.CreateSubMenu(RMenu:Get('mdr', 'demain'), "Vêtements", "Appuyez sur ENTER pour appliquer"))
RMenu.Add('creator', 'iden', RageUI.CreateSubMenu(RMenu:Get('creator', 'main'), "Identité", "Remplissez votre identité"))
RMenu:Get('creator', 'main').EnableMouse = false
RMenu:Get('creator', "heri").EnableMouse = true---ADEMO YZK JIBRIL
RMenu:Get('creator', "app").EnableMouse = true
RMenu:Get('creator', 'main'):SetSubtitle("~b~Actions disponibles")
RMenu:Get('creator', 'main').Closed = function()
    openCreator = false
end

alo = {
    hasidentity = false,
    identity = true,
    hasclothes = false,
}

TriggerEvent('instance:registerType', 'skin')
TriggerEvent('instance:registerType', 'property')


function creatoe()
    if openCreator then---ADEMO YZK JIBRIL
        openCreator = false
    else
        openCreator = true
        TriggerEvent('instance:create', 'skin')
        RageUI.Visible(RMenu:Get('creator', 'main'), true)
    Citizen.CreateThread(function()
        while openCreator do
            Citizen.Wait(0)
            RageUI.IsVisible(RMenu:Get('creator', 'main'), true, true, true, function()
                Angle()
                RageUI.ButtonWithStyle("Choix du Genre", nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected) 
                    if (Selected) then
                        end
                    end, RMenu:Get('creator', 'sexe'))
                RageUI.ButtonWithStyle("Héritage", nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected) 
                    if (Selected) then
                        end
                    end, RMenu:Get('creator', 'heri'))
                RageUI.ButtonWithStyle("Apparence", nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected) ---ADEMO YZK JIBRIL
                    if (Selected) then
                        end
                    end, RMenu:Get('creator', 'app'))
                if not alo.hasidentity then
                    RageUI.ButtonWithStyle("Carte d'identité", nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                        if (Selected) then
                            end
                        end, RMenu:Get('creator', 'iden'))
                    end

                if not alo.identity then
                    RageUI.ButtonWithStyle("Valider", nil, { RightBadge = RageUI.BadgeStyle.Tick, Color = { BackgroundColor = { 0, 120, 0, 25 } } }, true, function(Hovered, Active, Selected) 
                         if (Selected) then
                            RageUI.CloseAll()
                            DeleteSkinCam()
                            RageUI.Visible(RMenu:Get('creator', 'main'), false)
                            CreateSelected()
                            FreezeEntityPosition(GetPlayerPed(-1), false)---ADEMO YZK JIBRIL
                            TriggerEvent('skinchanger:getSkin', function(skin)
                            TriggerServerEvent('esx_skin:save', skin)
                            end)
                            SetEntityHeading(PlayerPedId(), 268.457)
                            TaskGoStraightToCoord(PlayerPedId(), -797.13,332.80,219.43, 0.5, 5000, 174.07, 10)
                            Wait(5000)
                            TaskGoStraightToCoord(PlayerPedId(), -797.66, 327.94, 219.43, 0.5, 5000, 357.80, 10)
                            Wait(5000)
                            FreezeEntityPosition(PlayerPedId(), true)
                            RageUI.Visible(RMenu:Get('mdr', 'demain'), not RageUI.Visible(RMenu:Get('mdr', 'demain')))
                                end
                            end)
                        end
                    end,function()
                end)---ADEMO YZK JIBRIL

                RageUI.IsVisible(RMenu:Get('mdr', 'demain'), true, true, true, function()
                    Angle()
                    spacetourner()
                    CreateMain()
                    DrawAnim()
                    RageUI.ButtonWithStyle("Vêtements", nil, {}, true, function(Hovered, Active, Selected) 
                        if (Selected) then
                        end
                    end, RMenu:Get('mdr', 'vet'))
                    if alo.hasclothes then
                        RageUI.ButtonWithStyle("Let's Go", "Partir à l'aventure !", { RightBadge = RageUI.BadgeStyle.Tick, Color = { BackgroundColor = { 0, 120, 0, 25 } } }, true, function(Hovered, Active, Selected) 
                            if Selected then
                                RageUI.CloseAll()
                                RenderScriptCams(0, 1, 1000, 1, 1)
                                DestroyAllCams(true)
                                ClearPedTasksImmediately(GetPlayerPed(-1))
                                CreateSelected2()
                                TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_STAND_MOBILE", 0, false)---ADEMO YZK JIBRIL
                                TriggerServerEvent('InteractSound_SV:PlayOnSource', 'send_msg', 0.3)
                                text('~s~Vous : Maman , je pars dans une nouvelle ville !', 4000)
                                Wait(4000)
                                TriggerServerEvent('InteractSound_SV:PlayOnSource', 'receive_msg', 0.3)
                                text('~s~Maman : Amuse toi bien mon poussin 🐥 !', 4000)
                                Wait(5000)
                                TriggerServerEvent('InteractSound_SV:PlayOnSource', 'dolce_vita', 0.2)
                                ClearPedTasksImmediately(GetPlayerPed(-1))
                                FreezeEntityPosition(GetPlayerPed(-1), false)
                                medkit = CreateObject(GetHashKey("prop_med_bag_01b"), 0, 0, 0, true, true, true)
                                AttachEntityToEntity(medkit, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 57005), 0.4, 0, 0, 0, 270.0, 60.0, true, true, false, true, 1, true)
                                CreateSol()
                                TaskGoStraightToCoord(PlayerPedId(), -797.13,332.80,219.43, 0.5, 5000, 270.23, 10)
                                Wait(3000)---ADEMO YZK JIBRIL
                                CreateSol2()
                                TaskGoStraightToCoord(PlayerPedId(), -792.30, 332.84, 219.43, 0.5, 5000, 356.95, 10)
                                Wait(1500)
                                DoScreenFadeIn(2000)
                                DoScreenFadeOut(2000)
                                Citizen.Wait(2000)
                                DoScreenFadeIn(1500)
                                DeleteEntity(medkit)
                                RenderScriptCams(0, 1, 1000, 1, 1)
                                DestroyAllCams(true)
                                bateau()
                            end
                        end)
                    end
                end, function()
            end)

                RageUI.IsVisible(RMenu:Get('creator', 'iden'), true, true, true, function()
                    CreateSkinCam()---ADEMO YZK JIBRIL
                    Angle()
                    spacetourner()
                    RageUI.ButtonWithStyle("Prénom", description, { RightLabel = LastName }, true, function(Hovered, Active, Selected) 
                        if Selected then 
                            LastName = KeyboardInput("Mettez votre prénom", "Michelle", 25)
                            print("pre")
                        end 
                    end)
    
                    RageUI.ButtonWithStyle("Nom", description, { RightLabel = Name }, true, function(Hovered, Active, Selected)
                        if Selected then 
                            Name = KeyboardInput("Mettez votre nom", "Soetant", 25)
                            print("no")
                        end 
                    end)
            
                    RageUI.ButtonWithStyle("Date de naissance", description, { RightLabel = Birday }, true, function(Hovered, Active, Selected) 
                        if Selected then 
                            Birday = KeyboardInput("Mettez votre date de naissance", "04/09/1990", 25)
                            print("date")
                        end 
                    end)
            
                    RageUI.ButtonWithStyle("Taille", description, { RightLabel = taille }, true, function(Hovered, Active, Selected) 
                        if Selected then 
                            taille = KeyboardInput("Mettez votre taille", "190cm", 25)
                            print("ta")---ADEMO YZK JIBRIL
                        end 
                    end)
    
                    RageUI.ButtonWithStyle("Valider", "En validant , vous ne pourrez plus faire retour arrière !", { RightBadge = RageUI.BadgeStyle.Tick }, true, function(Hovered, Active, Selected) 
                        if (Selected) then
                            alo.hasidentity = true
                            alo.identity = false
                            local nameIdentity = Name
                            print("1")
                            local dateIdentity = Birday
                            print("2")
                            local nickNameIdentity = LastName
                            print("3")
                            local heightIdentity = taille
                            print("4")
                        
                            if not nameIdentity then 
                                ShowAboveRadarMessage("Vous n'avez pas correctement renseigné la catégorie ~r~Nom")
                            elseif not nickNameIdentity then
                                ShowAboveRadarMessage("Vous n'avez pas correctement renseigné la catégorie ~r~Prénom")---ADEMO YZK JIBRIL
                            elseif not dateIdentity then
                                ShowAboveRadarMessage("Vous n'avez pas correctement renseigné la catégorie ~r~Date de naissance") 
                            elseif not heightIdentity then
                                ShowAboveRadarMessage("Vous n'avez pas correctement renseigné la catégorie ~r~Taille")
                            else
                                TriggerServerEvent("vCreator:sauvegarde", nameIdentity, dateIdentity, nickNameIdentity, heightIdentity)
                                ESX.ShowNotification("Identitée Sauvegardée ✅")
                                RageUI.GoBack()
                            end
                        end
                    end)
                end, function()
            end)

                RageUI.IsVisible(RMenu:Get('mdr', 'vet'), true, true, true, function()
                    alo.hasclothes = true
                    Angle()
                    spacetourner()
                    RageUI.ButtonWithStyle("Aristocrate", nil, { RightBadge = RageUI.BadgeStyle.Clothes }, true, function(Hovered, Active, Selected)
                        if (Selected) then
                            if IsPedMale(PlayerPedId()) then
                                TriggerEvent('skinchanger:getSkin', function(skin)
                                    local clothesSkin = {
                                        ['tshirt_1'] = 15, ['tshirt_2'] = 0,
                                        ['torso_1'] = 111, ['torso_2'] = 3,
                                        ['arms'] = 4,
                                        ['chain_1'] = 0, ['chain_2'] = 0,
                                        ['pants_1'] = 24, ['pants_2'] = 0,
                                        ['bags_1'] = 0, ['bags_2'] = 0,
                                        ['shoes_1'] = 36, ['shoes_2'] = 3,
                                        ['helmet_1'] = -1, ['helmet_2'] = 0,
                                    }
                                    TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
                                end)
                                TriggerEvent('skinchanger:getSkin', function(skin)
        
                    
                                    TriggerServerEvent('esx_skin:save', skin)
                                
                                end)
                            end
                        end
                    end)
                    RageUI.ButtonWithStyle("C'est Rien , c'est la Rue", nil, { RightBadge = RageUI.BadgeStyle.Clothes }, true, function(Hovered, Active, Selected)
                        if (Selected) then
                            if IsPedMale(PlayerPedId()) then
                                TriggerEvent('skinchanger:getSkin', function(skin)
                                    local clothesSkin = {
                                        ['tshirt_1'] = 15, ['tshirt_2'] = 0,
                                        ['torso_1'] = 86, ['torso_2'] = 0,
                                        ['arms'] = 18,
                                        ['chain_1'] = 0, ['chain_2'] = 0,
                                        ['bags_1'] = 45, ['bags_2'] = 0,
                                        ['pants_1'] = 7, ['pants_2'] = 0,
                                        ['shoes_1'] = 31, ['shoes_2'] = 0,---ADEMO YZK JIBRIL
                                        ['helmet_1'] = 8, ['helmet_2'] = 0,
                                    }
                                    TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
                                end)
                                TriggerEvent('skinchanger:getSkin', function(skin)
        
                    
                                    TriggerServerEvent('esx_skin:save', skin)
                                
                                end)
                            end
                        end
                    end)
                    RageUI.ButtonWithStyle("Business", nil, { RightBadge = RageUI.BadgeStyle.Clothes }, true, function(Hovered, Active, Selected)
                        if (Selected) then
                            if IsPedMale(PlayerPedId()) then
                                TriggerEvent('skinchanger:getSkin', function(skin)
                                    local clothesSkin = {---ADEMO YZK JIBRIL
                                        ['tshirt_1'] = 96, ['tshirt_2'] = 12,
                                        ['torso_1'] = 101, ['torso_2'] = 2,
                                        ['arms'] = 20,
                                        ['bags_1'] = 0, ['bags_2'] = 0,
                                        ['chain_1'] = 19, ['chain_2'] = 0,
                                        ['pants_1'] = 24, ['pants_2'] = 0,
                                        ['shoes_1'] = 10, ['shoes_2'] = 0,
                                        ['helmet_1'] = -1, ['helmet_2'] = 0,
                                    }
                                    TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
                                end)
                                TriggerEvent('skinchanger:getSkin', function(skin)
        
                    
                                    TriggerServerEvent('esx_skin:save', skin)
                                
                                end)
                            end---ADEMO YZK JIBRIL
                        end
                    end)
                    RageUI.ButtonWithStyle("Hiver", nil, { RightBadge = RageUI.BadgeStyle.Clothes }, true, function(Hovered, Active, Selected)
                        if (Selected) then
                            if IsPedMale(PlayerPedId()) then
                                TriggerEvent('skinchanger:getSkin', function(skin)
                                    local clothesSkin = {
                                        ['tshirt_1'] = 72, ['tshirt_2'] = 3,
                                        ['torso_1'] = 167, ['torso_2'] = 3,
                                        ['arms'] = 49,
                                        ['chain_1'] = 0, ['chain_2'] = 0,
                                        ['bags_1'] = 0, ['bags_2'] = 0,
                                        ['pants_1'] = 72, ['pants_2'] = 6,
                                        ['shoes_1'] = 25, ['shoes_2'] = 0,
                                        ['helmet_1'] = 5, ['helmet_2'] = 0,
                                    }
                                    TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
                                end)
                                TriggerEvent('skinchanger:getSkin', function(skin)---ADEMO YZK JIBRIL
        
                    
                                    TriggerServerEvent('esx_skin:save', skin)
                                
                                end)
                            end
                        end
                    end)
                end, function()
            end)

----------------------------------------


                RageUI.IsVisible(RMenu:Get('creator', 'app'), true, true, true, function()
                    CreateSkinCam()
                    Angle()
                    spacetourner()
                    if IsPedMale(PlayerPedId()) then
                        hairstyles = { GetLabelText("CC_M_HS_0"),GetLabelText("CC_M_HS_1"), GetLabelText("CC_M_HS_2"), GetLabelText("CC_M_HS_3"), GetLabelText("CC_M_HS_4"),
                                       GetLabelText("CC_M_HS_5"), GetLabelText("CC_M_HS_6"), GetLabelText("CC_M_HS_7"),
                                       GetLabelText("CC_M_HS_8"), GetLabelText("CC_M_HS_9"), GetLabelText("CC_M_HS_10"),
                                       GetLabelText("CC_M_HS_11"), GetLabelText("CC_M_HS_12"), GetLabelText("CC_M_HS_13"),
                                       GetLabelText("CC_M_HS_14"), GetLabelText("CC_M_HS_15"), GetLabelText("CC_M_HS_16"),
                                       GetLabelText("CC_M_HS_17"), GetLabelText("CC_M_HS_18"), GetLabelText("CC_M_HS_19"),
                                       GetLabelText("CC_M_HS_20"), GetLabelText("CC_M_HS_21"), GetLabelText("CC_M_HS_22")
                                    }
                    else
                        hairstyles = { GetLabelText("CC_F_HS_0"),GetLabelText("CC_F_HS_1"), GetLabelText("CC_F_HS_2"), GetLabelText("CC_F_HS_3"),
                                       GetLabelText("CC_F_HS_4"), GetLabelText("CC_F_HS_5"), GetLabelText("CC_F_HS_6"),
                                       GetLabelText("CC_F_HS_7"), GetLabelText("CC_F_HS_8"), GetLabelText("CC_F_HS_9"),
                                       GetLabelText("CC_F_HS_10"), GetLabelText("CC_F_HS_11"), GetLabelText("CC_F_HS_12"),
                                       GetLabelText("CC_F_HS_13"), GetLabelText("CC_F_HS_14"), GetLabelText("CC_F_HS_15"),
                                       GetLabelText("CC_F_HS_16"), GetLabelText("CC_F_HS_17"), GetLabelText("CC_F_HS_18"),
                                       GetLabelText("CC_F_HS_19"), GetLabelText("CC_F_HS_20"), GetLabelText("CC_F_HS_21"),---ADEMO YZK JIBRIL
                                       GetLabelText("CC_F_HS_22"), GetLabelText("CC_F_HS_23")
                                   }
                    end
                    RageUI.List("Cheveux", hairstyles, hairstyless, nil, {}, true, function(Hovered, Active, Selected, Index)
                        if (Active) then
                            if Index ~= nil then
                                hairstyles = Index - 1
                                hairstyless = Index
                                SetPedComponentVariation(GetPlayerPed(-1), 2, hairstyless-1)
                            end
                            self.FACE_F_CHEVEUX = true
                        else
                            self.FACE_F_CHEVEUX = false---ADEMO YZK JIBRIL
                            
                        end
    
                        if (Selected) then
                            pp = {}
                            pp = {hairstyless-1,haircolor1,haircolor2}
                            TriggerEvent('skinchanger:getSkin', function(skin)
                                skin.hair_1 = pp[1]
                                skin.hair_color_1 = pp[2]
                                skin.hair_color_2 = pp[3]
                                TriggerServerEvent('esx_skin:save', skin)
                                TriggerEvent('skinchanger:loadSkin', skin)
                            end)
                        end
                    end)
                    Barbes = {"Barbe de 3 jours","Bouc","Mamène","Bouc Style","Menton","Petite Barbe","Collier","Mal Rasé","D'Artagnan","Moustache","Garnis","Mal Rasée 2","Bouc 2","Collier 2","Collier Prononcé","Collier Tracé","Innovant","Rouflak","Prisonnier","Mexicano","Mexicano  Fournis","Mexicano Imposant","Mexicano Tombant","Mexicano Classe","Mexicano Garnis","Biker","Rouflak Chargée","Biker Chargée","Barbu"}
                    RageUI.List("Barbes", Barbes, Barbess, nil, {}, true, function(Hovered, Active, Selected, Index)
                        if (Active) then
                            if Index ~= nil then
                                Barbes = Index - 1
                                Barbess = Index
                                SetPedHeadOverlay(GetPlayerPed(-1), 1, Barbess-1, beardopa)
                            end
                            self.FACE_F_BARBE = true
                        else
                            self.FACE_F_BARBE = false
                        end
                        if (Selected) then
                            pp = {}
                            pp = {Barbess-1,beardopa,beardcolor1,beardcolor2}
                            TriggerEvent('skinchanger:getSkin', function(skin)
                                skin.beard_1 = pp[1]
                                skin.beard_2 = pp[2]*10
                                skin.beard_3 = pp[3]
                                skin.beard_4 = pp[4]
                                TriggerServerEvent('esx_skin:save', skin)
                                TriggerEvent('skinchanger:loadSkin', skin)
                            end)
                        end
                    end)
                    Sourcils = {"Sourcils n°1","Sourcils n°2","Sourcils n°3","Sourcils n°4","Sourcils n°5","Sourcils n°6","Sourcils n°7","Sourcils n°8","Sourcils n°9","Sourcils n°10","Sourcils n°11","Sourcils n°12","Sourcils n°13","Sourcils n°14","Sourcils n°15","Sourcils n°16","Sourcils n°17","Sourcils n°18","Sourcils n°19","Sourcils n°20","Sourcils n°21","Sourcils n°22","Sourcils n°23","Sourcils n°24","Sourcils n°25","Sourcils n°26","Sourcils n°27","Sourcils n°28","Sourcils n°29","Sourcils n°30","Sourcils n°31","Sourcils n°32","Sourcils n°33","Sourcils n°34"}
                    RageUI.List("Sourcils", Sourcils, Sourcilss, nil, {}, true, function(Hovered, Active, Selected, Index)
                        if (Active) then
                            if Index ~= nil then
                                Sourcils = Index - 1
                                Sourcilss = Index
                                SetPedHeadOverlay(GetPlayerPed(-1), 2, Sourcilss - 1, sourcilsopa)
            ---ADEMO YZK JIBRIL
                            end
                            self.FACE_F_SOURCIL = true
                        else
                            self.FACE_F_SOURCIL = false
                        end
                        if (Selected) then
                            pp = {}
                            pp = {Sourcilss- 1,sourcilsopa,sourcilscolor1,sourcilscolor2}
                            TriggerEvent('skinchanger:getSkin', function(skin)
                                skin.eyebrows_1 = pp[1]
                                skin.eyebrows_2 = pp[2]*10
                                skin.eyebrows_3 = pp[3]
                                skin.eyebrows_4 = pp[4]
                                TriggerServerEvent('esx_skin:save', skin)
                                TriggerEvent('skinchanger:loadSkin', skin)
                            end)
                        end
                    end)
                    Yeux = { "Vert", "Emmeraude", "Bleu", "Bleu ciel", "Marron clair", "Marron", "Noisette", "Gris sombre", "Gris propre", "Rose", "Jaune", "Violet", "Blackout", "Ombre grise", "Soleil tequila", "Atomic", "Faux", "Cola", "Ranger", "Ying-yang", "Bull", "Lezard", "Dragon", "Extra-terrestre", "Chèvre", "Smiley", "Possédé", "Démon", "Infecté", "Alien", "Mort", "Zombie" }
                    RageUI.List("Yeux", Yeux, Yeuxx, nil, {}, true, function(Hovered, Active, Selected, Index)
                        if (Active) then
                            if Index ~= nil then
                                Yeux = Index - 1
                                Yeuxx = Index
                                SetPedEyeColor(GetPlayerPed(-1), Yeuxx - 1, 0, 1)
                            end
                        end
                        if (Selected) then
                            pp = {}
                            pp = {Yeuxx - 1}
                            TriggerEvent('skinchanger:getSkin', function(skin)
                                skin.eye_color = pp[1]
                                TriggerServerEvent('esx_skin:save', skin)
                                TriggerEvent('skinchanger:loadSkin', skin)
                            end)
                        end---ADEMO YZK JIBRIL
                    end)
                    local Teint = { "-" }
                    for i = 0, 11, 1 do
                        table.insert(Teint, GetLabelText("CC_SKINCOM_" .. i))
                    end
                    RageUI.List("Teint", Teint, Teintt, nil, {}, true, function(Hovered, Active, Selected, Index)
                        if (Active) then
                            if Index ~= nil then
                                Teint = Index - 1
                                Teintt = Index
                                SetPedHeadOverlay(GetPlayerPed(-1), 6, Teintt - 1, teintopa)
                            
                            end
                            self.FACE_F_TEIN = true
                        else
                            self.FACE_F_TEIN = false
                        end
                        if (Selected) then
                            pp = {}
                            pp = {Teintt - 1, teintopa}
                            TriggerEvent('skinchanger:getSkin', function(skin)
                                skin.complexion_1 = pp[1]
                                skin.complexion_2 = pp[2]*10
                                TriggerServerEvent('esx_skin:save', skin)
                                TriggerEvent('skinchanger:loadSkin', skin)
                            end)
                        end
                    end)
                    Rides = { "-", "Rides yeux", "Rides 1", "Rides 2", "Rides 3", "Rides 4", "Rides 5", "Rides 6", "Rides 7", "Rides 8", "Rides 9", "Rides 10", "Rides EX 1", "Rides EX 2", "Cernes" }
                    RageUI.List("Rides", Rides, Ridess, nil, {}, true, function(Hovered, Active, Selected, Index)
                        if (Active) then
                            if Index ~= nil then
                                Rides = Index - 1
                                Ridess = Index
                                SetPedHeadOverlay(GetPlayerPed(-1), 3, Ridess - 1, rideopa) 
                            end
                            self.FACE_F_RIDES = true
                        else
                            self.FACE_F_RIDES = false
                        end
                        if (Selected) then
                            pp = {}
                            pp = {Ridess - 1, rideopa}---ADEMO YZK JIBRIL
                            TriggerEvent('skinchanger:getSkin', function(skin)
                                skin.age_1 = pp[1]
                                skin.age_2 = pp[2]*10
                                TriggerServerEvent('esx_skin:save', skin)
                                TriggerEvent('skinchanger:loadSkin', skin)
                            end)
                        end
                    end)
                    local Lipstick = { "-" }
                    for i = 1, 10, 1 do
                        table.insert(Lipstick, GetLabelText("CC_LIPSTICK_" .. i))
                    end
                    RageUI.List("Rouges à Lèvres", Lipstick, Lipstickk, nil, {}, true, function(Hovered, Active, Selected, Index)
                        if (Active) then
                            if Index ~= nil then
                                Lipstick = Index - 1
                                Lipstickk = Index
                                SetPedHeadOverlay(GetPlayerPed(-1), 8, Lipstickk - 1, lipsopa)
                            end
                            self.FACE_F_LEVRE = true
                        else
                            self.FACE_F_LEVRE = false
                        end
                        if (Selected) then
                            pp = {}
                            pp = {Lipstickk - 1, lipsopa, lipscolor1, lipscolor2}
                            TriggerEvent('skinchanger:getSkin', function(skin)
                                skin.lipstick_1 = pp[1]
                                skin.lipstick_2 = pp[2]*10
                                skin.lipstick_3 = pp[3]
                                skin.lipstick_4 = pp[4]
                                TriggerServerEvent('esx_skin:save', skin)
                                TriggerEvent('skinchanger:loadSkin', skin)
                            end)
                        end
                    end)
                end, function()---ADEMO YZK JIBRIL
                    if self.FACE_F_CHEVEUX then
                        RageUI.ColourPanel("Couleur principale", Colors, colour_table[1], colour_table[2], function(Hovered, Active, MinimumIndex, CurrentIndex)
                            if (Active) then
                                colour_table[1] = MinimumIndex
    
                                colour_table[2] = CurrentIndex
                                haircolor1 = CurrentIndex - 1
                                SetPedHairColor(GetPlayerPed(-1),haircolor1,haircolor2)
                            end
                        end)
                        RageUI.ColourPanel("Couleur secondaire", Colors, colour_table2[1], colour_table2[2], function(Hovered, Active, MinimumIndex, CurrentIndex)
                            if (Active) then
                                colour_table2[1] = MinimumIndex
        
                                colour_table2[2] = CurrentIndex
                                haircolor2 = CurrentIndex - 1
                                SetPedHairColor(GetPlayerPed(-1),haircolor1,haircolor2)
                            end
                        end)
                    end
                    if self.FACE_F_BARBE then
                        RageUI.ColourPanel("Couleur principale", Colors, colour_table3[1], colour_table3[2], function(Hovered, Active, MinimumIndex, CurrentIndex)
                            colour_table3[1] = MinimumIndex
    
                            colour_table3[2] = CurrentIndex
                            beardcolor1 = CurrentIndex - 1
                            SetPedHeadOverlayColor(GetPlayerPed(-1), 1, 1, beardcolor1,beardcolor2)
                        end)
                        RageUI.ColourPanel("Couleur secondaire", Colors, colour_table2[1], colour_table2[2], function(Hovered, Active, MinimumIndex, CurrentIndex)
                            colour_table2[1] = MinimumIndex
        
                            colour_table2[2] = CurrentIndex
                            beardcolor2 = CurrentIndex - 1
                            SetPedHeadOverlayColor(GetPlayerPed(-1), 1, 1, beardcolor1,beardcolor2)
                        end)    
                        RageUI.PercentagePanel(percentage_float, "Opacité", nil, nil, function(Hovered, Active, Percent)
                            percentage_float = Percent
                            beardopa = Percent
                            SetPedHeadOverlay(GetPlayerPed(-1), 1, Barbess - 1, beardopa)
                        end)
                    end
                    if self.FACE_F_SOURCIL then
                        RageUI.ColourPanel("Couleur principale", Colors, colour_table3[1], colour_table3[2], function(Hovered, Active, MinimumIndex, CurrentIndex)
                            colour_table3[1] = MinimumIndex
    
                            colour_table3[2] = CurrentIndex
                            sourcilscolor1 = CurrentIndex - 1
                            SetPedHeadOverlayColor(GetPlayerPed(-1), 2, 1, sourcilscolor1,sourcilscolor2)
                        end)
                        RageUI.ColourPanel("Couleur secondaire", Colors, colour_table2[1], colour_table2[2], function(Hovered, Active, MinimumIndex, CurrentIndex)
                            colour_table2[1] = MinimumIndex
        
                            colour_table2[2] = CurrentIndex
                            sourcilscolor2 = CurrentIndex - 1
                            SetPedHeadOverlayColor(GetPlayerPed(-1), 2, 1, sourcilscolor1,sourcilscolor2)
                        end)    
                        RageUI.PercentagePanel(percentage_float, "Opacité", nil, nil, function(Hovered, Active, Percent)
                            percentage_float = Percent
                            sourcilsopa = Percent
                            SetPedHeadOverlay(GetPlayerPed(-1), 2, Sourcilss - 1, sourcilsopa)
                        end)
                    end
                    if self.FACE_F_TEIN then
                        RageUI.PercentagePanel(percentage_float, "Opacité", nil, nil, function(Hovered, Active, Percent)
                            percentage_float = Percent
                            teintopa = Percent
                            SetPedHeadOverlay(GetPlayerPed(-1), 6, Teintt - 1, teintopa)
                        end)
                    end
                    if self.FACE_F_RIDES then
                        RageUI.PercentagePanel(percentage_float, "Opacité", nil, nil, function(Hovered, Active, Percent)
                            percentage_float = Percent
                            rideopa = Percent
                            SetPedHeadOverlay(GetPlayerPed(-1), 3, Ridess - 1, rideopa)
                        end)
                    end
                    if self.FACE_F_LEVRE then
                        RageUI.ColourPanel("Couleur principale", Colors, colour_table3[1], colour_table3[2], function(Hovered, Active, MinimumIndex, CurrentIndex)
                            colour_table3[1] = MinimumIndex
    
                            colour_table3[2] = CurrentIndex
                            lipscolor1 = CurrentIndex - 1
                            SetPedHeadOverlayColor(GetPlayerPed(-1), 8, 1, lipscolor1, lipscolor2)
                        end)
                        RageUI.ColourPanel("Couleur secondaire", Colors, colour_table2[1], colour_table2[2], function(Hovered, Active, MinimumIndex, CurrentIndex)
                            colour_table2[1] = MinimumIndex
        
                            colour_table2[2] = CurrentIndex
                            lipscolor2 = CurrentIndex - 1
                            SetPedHeadOverlayColor(GetPlayerPed(-1), 8, 1, lipscolor1, lipscolor2)
                        end)    
                        RageUI.PercentagePanel(percentage_float, "Opacité", nil, nil, function(Hovered, Active, Percent)
                            percentage_float = Percent
                            lipsopa = Percent
                            SetPedHeadOverlay(GetPlayerPed(-1), 8, Lipstickk - 1, lipsopa)
                        end)
                    end

                end, function()
            end)

----------------------------------------------------------
---ADEMO YZK JIBRIL

                RageUI.IsVisible(RMenu:Get('creator', 'heri'), true, true, true, function()
                    CreateSkinCam()
                    Angle()
                    spacetourner()
                    RageUI.HeritageWindow(Ademomum or 0, Ademodad or 0)
                    HeritageDad = { "Azize", "Mustapha", "Jibril", "Walid", "Mohammed", "Merwan", "Ali", "Hassan", "Nabil", "Momo", "Karim", "Rayan", "Mehdi", "Yussuf", "Akram", "Ismail", "Ilyess", "Naïm", "Youness", "Youssef", "Ayoub", "Wassim", "Aymen" }
                RageUI.List("Père", HeritageDad, Ademodad, "Le Père détermine la forme du visage !~n~Appuyez pour selectionner la couleur de peau", {}, true, function(Hovered, Active, Selected, Index)
                    if Active then
                        if Index ~= nil then
                            HeritageDad = Index - 1
                            Ademodad = Index
                            SetPedHeadBlendData(GetPlayerPed(-1), Ademodad-1, Ademodad-1, Ademomum, Ademomum, 0, 0,  0,  0,  0, false)  
                        end                            
                    end
                    if (Selected) then
                        pp = {}
                        pp = {Ademodad-1,Ademomum}
                        TriggerEvent('skinchanger:getSkin', function(skin)
                            skin.face = pp[1]
                            skin.skin = pp[2]
                            TriggerServerEvent('esx_skin:save', skin)
                            TriggerEvent('skinchanger:loadSkin', skin)
                        end)
                    end
                end)
                HeritageMom = { "Laila", "Jasmine", "Khadija", "Hannan", "Hasna", "Samira", "Ines", "Lina", "Amira", "Luna", "Aya", "Noûr", "Fatima", "Amina", "Aicha", "Myriam", "Leila", "Emira", "Selma", "Jana", "Manël", "Bouchra" }
                RageUI.List("Mère", HeritageMom, Ademomum, "La Mère détermine la couleur de peau !~n~Appuyez pour selectionner la couleur de peau", {}, true, function(Hovered, Active, Selected, Index)
                    if Active then
                        if Index ~= nil then
                            HeritageMom = Index - 1
                            Ademomum = Index
                            SetPedHeadBlendData(GetPlayerPed(-1), Ademodad-1, Ademodad-1, Ademomum, Ademomum, 0, 0,  0,  0,  0, false)
                        end                            
                    end
                    if (Selected) then
                        pp = {}
                        pp = {Ademodad-1,Ademomum}
                        TriggerEvent('skinchanger:getSkin', function(skin)
                            skin.face = pp[1]
                            skin.skin = pp[2]
                            TriggerServerEvent('esx_skin:save', skin)
                            TriggerEvent('skinchanger:loadSkin', skin)
                                end)
                            end
                        end)
                        
                    end, function()
                end)

---ADEMO YZK JIBRIL
----------------------------------------------------------

                RageUI.IsVisible(RMenu:Get('creator', 'sexe'), true, true, true, function()
                    CreateSkinCam()
                    Angle()
                    spacetourner()
                    RageUI.List("Genre", vm.sexe, vm.vmsexe, "Appuyez sur entrer pour selectionner le sexe", {}, true, function(Hovered, Active, Selected, Index)
                        vm.vmsexe = Index
                        if (Selected) then
                            if Index == 1 then
                                VMlifesexeChoix = 0
                                TriggerEvent('skinchanger:change', 'sex', VMlifesexeChoix)
                                Wait(5)
                                SetPedHeadBlendData(GetPlayerPed(-1), 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, true)
                            elseif Index == 2 then
                                VMlifesexeChoix = 1
                                TriggerEvent('skinchanger:change', 'sex', VMlifesexeChoix)
                                Wait(5)
                                SetPedHeadBlendData(GetPlayerPed(-1), 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, true)
                            end
                        end
                        if (Selected) then
                            pp = {}
                            pp = {VMlifesexeChoix}
                            TriggerEvent('skinchanger:getSkin', function(skin)
                                skin.sex = pp[1]
                                TriggerServerEvent('esx_skin:save', skin)
                                TriggerEvent('skinchanger:loadSkin', skin)
                                end)
                            end
                        end, function()
                    end)
                end)
            end
        end)
    end
end

---ADEMO YZK JIBRIL
RegisterNetEvent('instance:onCreate')
AddEventHandler('instance:onCreate', function(instance)
	if instance.type == 'skin' then
		TriggerEvent('instance:enter', instance)
	end
end)

function loadAnimDict(dict)
	while (not HasAnimDictLoaded(dict)) do
		RequestAnimDict(dict)
		Citizen.Wait(5)
	end
end

function DrawAnim()
    local ped = GetPlayerPed(-1)
    local ad = "clothingshirt"
    loadAnimDict(ad)
    RequestAnimDict(dict)
    TaskPlayAnim(ped, ad, "check_out_a", 8.0, 0.6, -1, 49, 0, 0, 0, 0 )
    TaskPlayAnim(ped, ad, "check_out_b", 8.0, 0.6, -1, 49, 0, 0, 0, 0 )
    TaskPlayAnim(ped, ad, "check_out_c", 8.0, 0.6, -1, 49, 0, 0, 0, 0 )
    TaskPlayAnim(ped, ad, "intro", 8.0, 0.6, -1, 49, 0, 0, 0, 0 )
    TaskPlayAnim(ped, ad, "outro", 8.0, 0.6, -1, 49, 0, 0, 0, 0 )
    TaskPlayAnim(ped, ad, "try_shirt_base", 8.0, 0.6, -1, 49, 0, 0, 0, 0 )
    TaskPlayAnim(ped, ad, "try_shirt_positive_a", 8.0, 0.6, -1, 49, 0, 0, 0, 0 )
    TaskPlayAnim(ped, ad, "try_shirt_positive_b", 8.0, 0.6, -1, 49, 0, 0, 0, 0 )
    TaskPlayAnim(ped, ad, "try_shirt_positive_c", 8.0, 0.6, -1, 49, 0, 0, 0, 0 )
    TaskPlayAnim(ped, ad, "try_shirt_positive_d", 8.0, 0.6, -1, 49, 0, 0, 0, 0 )
end
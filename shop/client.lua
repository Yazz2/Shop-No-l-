ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local open = false 
local mainMenu = RageUI.CreateMenu("", "Interactions Disponibles", 0, 0, "menu_shop", "shopui_title_noel")

function OpenMenushop()
     if open then 
         open = false
         RageUI.Visible(mainMenu, false)
         return
     else
         open = true 
         RageUI.Visible(mainMenu, true)
         CreateThread(function()
         while open do 


            RageUI.IsVisible(mainMenu,function() 

                RageUI.Separator("↓ ~b~Choix~w~ ↓")


				RageUI.Button("Pomme d'amour", nil, {RightLabel = "~g~10$"}, true , {
					onSelected = function()
                        Wait(700)
                        ESX.ShowNotification("~h~Vendeur~h~ \n10~g~$~s~ s'il vous plait")
                        playAnim('mp_common', 'givetake1_a', 2500)
                        Wait(1600)
                        ESX.ShowNotification("~h~Vendeur~h~ \nVoici votre pomme d'amour ~g~Merci bonne appéti")		
                        Wait(1650)
                        TriggerServerEvent('Noël:AchatPomme')	

					end
				})

                RageUI.Button("Gateaux étoile", nil, {RightLabel = "~g~5$"}, true , {
					onSelected = function()
                        Wait(700)
                        ESX.ShowNotification("~h~Vendeur~h~ \n5~g~$~s~ s'il vous plait")
                        playAnim('mp_common', 'givetake1_a', 2500)
                        Wait(1600)
                        ESX.ShowNotification("~h~Vendeur~h~ \nVoici votre gateaux de Noël ~g~Merci bonne appéti")		
                        Wait(1650)
                        TriggerServerEvent('Noël:Achatétoile')	
					end
				})

                RageUI.Button("Gateaux bonhomme de neige", nil, {RightLabel = "~g~5$"}, true , {
					onSelected = function()
                        ESX.ShowNotification("~h~Vendeur~h~ \n5~g~$~s~ s'il vous plait")
                        Wait(700)
                        playAnim('mp_common', 'givetake1_a', 2500)
                        Wait(1600)
                        ESX.ShowNotification("~h~Vendeur~h~ \nVoici votre gateaux de Noël ~g~Merci bonne appéti")			
                        Wait(1650)
                        TriggerServerEvent('Noël:Achatbonhomme')				
                    end
				})

                RageUI.Button("Gateaux Sapin", nil, {RightLabel = "~g~5$"}, true , {
					onSelected = function()
                        ESX.ShowNotification("~h~Vendeur~h~ \n5~g~$~s~ s'il vous plait")
                        playAnim('mp_common', 'givetake1_a', 2500)
                        Wait(1600)
                        ESX.ShowNotification("~h~Vendeur~h~ \nVoici votre gateaux de Noël ~g~Merci bonne appéti")					
                        Wait(1650)
                        TriggerServerEvent('Noël:Achatsapin')	
                    end
				})

            end)
          Wait(0)
         end
      end)
   end
end

local position = {
    {x = -1531.56, y = -441.84, z = 35.44 },

}



Citizen.CreateThread(function()
    while true do

      local wait = 750

        for k in pairs(position) do
        if ESX.PlayerData  then 
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)
       if dist <= 1.0 then
               wait = 1
                ESX.ShowHelpNotification("Appuyer sur~b~ ~INPUT_PICKUP~ pour parler au Commerçant") 
                if IsControlJustPressed(1,51) then
                    OpenMenushop()
            end
        end
      end
    Citizen.Wait(wait)
    end
  end
end)


function playAnim(animDict, animName, duration)
	RequestAnimDict(animDict)
	while not HasAnimDictLoaded(animDict) do Citizen.Wait(0) end
	TaskPlayAnim(PlayerPedId(), animDict, animName, 1.0, -1.0, duration, 49, 1, false, false, false)
	RemoveAnimDict(animDict)
end



Citizen.CreateThread(function()
    if Config.blip then
        for k, v in pairs(position) do
            local blip = AddBlipForCoord(v.x, v.y, v.z)

            SetBlipSprite(blip, Config.Id)
            SetBlipScale (blip, Config.Taille)
            SetBlipColour(blip, Config.Couleur)
            SetBlipAsShortRange(blip, Config.Range)

            BeginTextCommandSetBlipName('STRING')
            AddTextComponentSubstringPlayerName('Magasin de Noël')
            EndTextCommandSetBlipName(blip)
        end
    end
end)


Citizen.CreateThread(function()
    local hash = GetHashKey("s_f_y_sweatshop_01")
    while not HasModelLoaded(hash) do
    RequestModel(hash)
    Wait(20)
    end
    ped = CreatePed("PED_TYPE_CIVFEMALE", "s_f_y_sweatshop_01", -1532.68, -443.09, 34.44, 325.22, false, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)
end)

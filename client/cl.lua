QBCore = exports['qb-core']:GetCoreObject()
Cooking = false




RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
  PlayerJob = QBCore.Functions.GetPlayerData().job
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(JobInfo)
  PlayerJob = JobInfo
  onDuty = PlayerJob.onduty
end)

RegisterNetEvent('QBCore:Client:SetDuty')
AddEventHandler('QBCore:Client:SetDuty', function(duty)
  onDuty = duty
end)

AddEventHandler('onClientResourceStart', function(res)
  if GetCurrentResourceName() ~= res then return end
  PlayerJob = QBCore.Functions.GetPlayerData().job
end)

Citizen.CreateThread(function()
  local Blip = Config.Locations.Blip
  CustomShop = AddBlipForCoord(Blip.location)
  SetBlipSprite(CustomShop, Blip.sprite)
  SetBlipDisplay(CustomShop, 6)
  SetBlipScale(CustomShop, 1.0)
  SetBlipAsShortRange(CustomShop, true)
  SetBlipColour(CustomShop, 61)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentSubstringPlayerName(Blip.name)
  EndTextCommandSetBlipName(CustomShop)
end) 


-- Cooking Menu

lib.registerContext({
  id = 'chopping',
  title = 'Chopping Potatoes',
  options = {
    {
      title = 'Chop',
      description = 'Start Chopping potatoes',
      icon = 'utensils',
      onSelect = function()
        startChopping()
      end,
    },
  }
})

lib.registerContext({
  id = 'makepatty',
  title = 'Make Patty',
  options = {
    {
      title = 'Burgers',
      description = 'Start Making burgers!',
      icon = 'utensils',
      onSelect = function()
        startPatty()
      end,
    },
  }
})

lib.registerContext({
  id = 'makefries',
  title = 'Make fries',
  options = {
    {
      title = 'Fries',
      description = 'Start Chopping delicious fries !',
      icon = 'utensils',
      onSelect = function()
        startFries()
      end,
    },
  }
})



lib.registerContext({
  id = 'makeshake',
  title = 'Make Milk Shake',
  options = {
    {
      title = 'Milk Shake',
      description = 'Start Making some milk shakes',
      icon = 'utensils',
      onSelect = function()
        startMilkShake()
      end,
    },
  }
})

---- Markers --------
CreateThread(function()
  while true do
      Wait(3)
      if LocalPlayer.state.isLoggedIn and not Cooking then
          local inRange = false
          local pos = GetEntityCoords(PlayerPedId())
          local dist = #(pos - Config.Locations.Chopping)
          if PlayerJob.name == "yumyums" then
              if dist < 10.0 then
                inRange = true
                  DrawMarker(2, Config.Locations.Chopping.x, Config.Locations.Chopping.y, Config.Locations.Chopping.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 200, 200, 200, 222, false, false, false, true, false, false, false)
                  if #(pos - Config.Locations.Chopping) < 1.5 then
                          DrawText3Ds(Config.Locations.Chopping.x, Config.Locations.Chopping.y, Config.Locations.Chopping.z + 0.3, 'Open chopping menu')
                      if IsControlJustReleased(0, 38) then
                        lib.showContext('chopping')
                      end
                  end
              elseif  #(pos - Config.Locations.PreparingFries) < 5.0 then

                  inRange = true
                  DrawMarker(2, Config.Locations.PreparingFries.x, Config.Locations.PreparingFries.y, Config.Locations.PreparingFries.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 200, 200, 200, 222, false, false, false, true, false, false, false)
                  if #(pos - vector3(Config.Locations.PreparingFries.x, Config.Locations.PreparingFries.y, Config.Locations.PreparingFries.z + 0.3)) < 1.5 then
                          DrawText3Ds(Config.Locations.PreparingFries.x, Config.Locations.PreparingFries.y, Config.Locations.PreparingFries.z + 0.3, '~g~E~w~ - Make fries')
                      if IsControlJustReleased(0, 38) then
                        lib.showContext('makefries')
                      end
                  end
              elseif  #(pos - Config.Locations.Cooking) < 5.0 then
                  inRange = true
                  DrawMarker(2, Config.Locations.Cooking.x, Config.Locations.Cooking.y, Config.Locations.Cooking.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 200, 200, 200, 222, false, false, false, true, false, false, false)
                  if #(pos - vector3(Config.Locations.Cooking.x, Config.Locations.Cooking.y, Config.Locations.Cooking.z + 0.3)) < 1.5 then
                          DrawText3Ds(Config.Locations.Cooking.x, Config.Locations.Cooking.y, Config.Locations.Cooking.z + 0.3, 'Start Cooking')
                      if IsControlJustReleased(0, 38) then
                        lib.showContext('makepatty')
                      end
                  end
              elseif  #(pos - Config.Locations.Cooking) < 5.0 then
                  inRange = true
                  DrawMarker(2, Config.Locations.Cooking.x, Config.Locations.Cooking.y, Config.Locations.Cooking.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 200, 200, 200, 222, false, false, false, true, false, false, false)
                  if #(pos - vector3(Config.Locations.Cooking.x, Config.Locations.Cooking.y, Config.Locations.Cooking.z + 0.3)) < 1.5 then
                          DrawText3Ds(Config.Locations.Cooking.x, Config.Locations.Cooking.y, Config.Locations.Cooking.z + 0.3, 'Make Milk Shakes')
                      if IsControlJustReleased(0, 38) then
                        lib.showContext('makeshake')
                      end
                  end
              elseif  #(pos - Config.Locations.Stash) < 5.0 then
                  inRange = true
                  DrawMarker(2, Config.Locations.Stash.x, Config.Locations.Stash.y, Config.Locations.Stash.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 200, 200, 200, 222, false, false, false, true, false, false, false)
                  if #(pos - vector3(Config.Locations.Stash.x, Config.Locations.Stash.y, Config.Locations.Stash.z + 0.3)) < 1.5 then
                          DrawText3Ds(Config.Locations.Stash.x, Config.Locations.Stash.y, Config.Locations.Stash.z + 0.3, 'Yum Yums Stash')
                      if IsControlJustReleased(0, 38) then
                        TriggerServerEvent("inventory:server:OpenInventory", "stash", "burgershotStash07")
                      end
                  end
              end
              if not inRange then
                  Wait(2500)
              end
          else
              Wait(2500)
          end
      else
          Wait(2500)
      end
  end
end)
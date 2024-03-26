
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

RegisterNetEvent('customshop:client:EatBurger', function(itemName)
  QBCore.Functions.Progressbar('eat_something', 'Eating', 5000, false, true, {
      disableMovement = false,
      disableCarMovement = false,
      disableMouse = false,
      disableCombat = true
  }, {
      animDict = 'mp_player_inteat@burger',
      anim = 'mp_player_int_eat_burger',
      flags = 49
  }, {
      model = 'prop_cs_burger_01',
      bone = 60309,
      coords = vec3(0.0, 0.0, -0.02),
      rotation = vec3(30, 0.0, 0.0),
  }, {}, function() -- Done
      TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items[itemName], 'remove')
      TriggerServerEvent('consumables:server:addHunger', QBCore.Functions.GetPlayerData().metadata.hunger + 40)
      TriggerServerEvent('hud:server:RelieveStress', math.random(2, 4))
  end)
end)

RegisterNetEvent('customshop:client:EatFries', function(itemName)
  QBCore.Functions.Progressbar('eat_something', 'Eating', 5000, false, true, {
      disableMovement = false,
      disableCarMovement = false,
      disableMouse = false,
      disableCombat = true
  }, {
      animDict = 'mp_player_inteat@burger',
      anim = 'mp_player_int_eat_burger',
      flags = 49
  }, {
      model = 'prop_food_bs_chips',
      bone = 60309,
      coords = vec3(0.0, 0.0, -0.02),
      rotation = vec3(30, 0.0, 0.0),
  }, {}, function() -- Done
      TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items[itemName], 'remove')
      TriggerServerEvent('consumables:server:addHunger', QBCore.Functions.GetPlayerData().metadata.hunger + 40)
      TriggerServerEvent('hud:server:RelieveStress', math.random(2, 4))
  end)
end)


RegisterNetEvent('customshop:client:DrinkMilkShake', function(itemName)
  QBCore.Functions.Progressbar('drink_something', 'Drinking...', 5000, false, true, {
      disableMovement = false,
      disableCarMovement = false,
      disableMouse = false,
      disableCombat = true
  }, {
      animDict = 'mp_player_intdrink',
      anim = 'loop_bottle',
      flags = 49
  }, {
      model = 'prop_food_cb_juice02',
      bone = 60309,
      coords = vec3(0.0, 0.0, -0.05),
      rotation = vec3(0.0, 0.0, -40),
  }, {}, function() -- Done
      TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items[itemName], 'remove')
      TriggerServerEvent('consumables:server:addThirst', QBCore.Functions.GetPlayerData().metadata.thirst + 40)
  end)
end)


Citizen.CreateThread(function()
  local Blip = Config.Locations.Blip
  CustomShop = AddBlipForCoord(Blip.location.x, Blip.location.y, Blip.location.z)
  SetBlipSprite(CustomShop, Blip.sprite)
  SetBlipDisplay(CustomShop, 6)
  SetBlipScale(CustomShop, 1.0)
  SetBlipAsShortRange(CustomShop, true)
  SetBlipColour(CustomShop, 61)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentSubstringPlayerName(Blip.name)
  EndTextCommandSetBlipName(CustomShop)
end) 

AddEventHandler('customshop:client:OpenStash', function(name)
	-- print(GetInvokingResource())
     local ox_inventory = exports.ox_inventory
    -- if GetInvokingResource() ~= CurrentResourceName then return end
    if not ox_inventory:openInventory('stash', name) then
      print('Registring stash')
        TriggerServerEvent('customshop:server:RegisterStash', name)
        ox_inventory:openInventory('stash', name)
    end
end)

for k, v in pairs(Config.Recipes) do 
  local options = {}
  
  local func
  
  for i, j in pairs(v) do
    local desc
    if j.func then
      func = _G[j.func]
    end
    for itemName, quantity in pairs(j.RequiredItems) do
      local itemLabel = QBCore.Shared.Items[itemName].label
      if desc then
        desc = desc .. ', x'..quantity .. ' ' .. itemLabel
      else 
        desc = 'x'..quantity .. ' ' .. itemLabel
      end
    end
      table.insert(options, {
          title = j.Name,
          description = desc,
          icon = 'utensils',
          onSelect = function()
            if type(func) == "function" then
              func(i)  -- Call the function from the config file
            else
              if Config.Debug then
                print("Cannot start " .. j.Name .. ". Function " .. j.func .. " is not defined.")
              end
            end
          end,
      })
  end

  lib.registerContext({
      id = k,
      title = 'Make ' .. k,
      options = options
  })
end


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
        lib.showContext('potatoes')
      end,
    },
  }
})

lib.registerContext({
  id = 'makeburgers',
  title = 'Make burgers',
  options = {
    {
      title = 'Burgers',
      description = 'Start Making burgers!',
      icon = 'utensils',
      onSelect = function()
        lib.showContext('burgers')
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
        lib.showContext('fries')
       -- startFries()
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
        lib.showContext('milkshakes')
      end,
    },
  }
})

lib.registerContext({
  id = 'makepatty',
  title = 'Cook patty',
  options = {
    {
      title = 'Patty',
      description = 'Start cooking patty',
      icon = 'utensils',
      onSelect = function()
        lib.showContext('patty')
      end,
    },
  }
})



---- Markers --------
CreateThread(function()
  while true do
      Wait(3)
      if LocalPlayer.state.isLoggedIn and not Cooking then
          local pos = GetEntityCoords(PlayerPedId())
          local playerJobName = PlayerJob.name
          if playerJobName == "yumyums" then
            local markerLocations = {
                { location = Config.Locations.Chopping, actionText = 'Open chopping menu', contextName = 'chopping' },
                { location = Config.Locations.PreparingFries, actionText = 'Make fries', contextName = 'makefries' },
                { location = Config.Locations.Cooking, actionText = 'Start Cooking Burgers', contextName = 'makeburgers' },
                { location = Config.Locations.MilkShakes, actionText = 'Make Milk Shakes', contextName = 'makeshake' },
                { location = Config.Locations.pattyCooking, actionText = 'Cook patty', contextName = 'makepatty' },

                { location = Config.Locations.Billing, actionText = 'Bill Customers', contextName = 'billing' },
                { location = Config.Locations.Stash, actionText = 'Yum Yums Stash', type = 'stash', contextName = 'burgershotStash07' },
                { location = Config.Locations.foodStash, actionText = 'Food Storage', type = 'stash', contextName = 'burgershotFoodStash07' }

            }
            local jobLocations = {
                { location = Config.Locations.jobLocations.Duty, actionText = 'Set Duty', type = 'duty' },
                { location = Config.Locations.jobLocations.bossMenu, actionText = 'Boss Menu', type = 'bossmenu' },
                { location = Config.Locations.jobLocations.bossStash, actionText = 'Open Boss Stash', type = 'bossstash', name = 'YumsBossStash' },
                
            }
            if PlayerJob.onduty then 
              for _, markerData in ipairs(markerLocations) do
                  local markerLocation = markerData.location
                  local actionText = markerData.actionText
                  local contextName = markerData.contextName

                  if #(pos - vector3(markerLocation.x, markerLocation.y, markerLocation.z)) < 10.0 then
                      DrawMarker(2, markerLocation.x, markerLocation.y, markerLocation.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 200, 200, 200, 222, false, false, false, true, false, false, false)
                      if #(pos - vector3(markerLocation.x, markerLocation.y, markerLocation.z + 0.3)) < 1.5 then
                          DrawText3Ds(markerLocation.x, markerLocation.y, markerLocation.z + 0.3, '~g~E~w~ - ' .. actionText)
                          if IsControlJustReleased(0, 38) then
                            if markerData.type and markerData.type == 'stash' then
                              TriggerEvent('customshop:client:OpenStash', markerData.contextName)
                            elseif markerData.contextName == 'billing' then 
                              TriggerEvent('jim-payments:client:Charge')
                            else
                              lib.showContext(contextName)
                            end
                          end
                      end
                  end
              end
            end
            
            for k, jobMarkerData in ipairs(jobLocations) do
              local markerLocation = jobMarkerData.location
              local actionText = jobMarkerData.actionText
              if jobMarkerData.type ~= 'duty' and not PlayerJob.isboss then
                goto continue
              end
              if #(pos - vector3(markerLocation.x, markerLocation.y, markerLocation.z)) < 10.0 then
                  DrawMarker(2, markerLocation.x, markerLocation.y, markerLocation.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 200, 200, 200, 222, false, false, false, true, false, false, false)
                  if #(pos - vector3(markerLocation.x, markerLocation.y, markerLocation.z + 0.3)) < 1.5 then
                      DrawText3Ds(markerLocation.x, markerLocation.y, markerLocation.z + 0.3, '~g~E~w~ - ' .. actionText)
                      if IsControlJustReleased(0, 38) then
                          if jobMarkerData.type == 'bossmenu' and PlayerJob.isboss then 
                            TriggerEvent('qb-bossmenu:client:OpenMenu')
                          elseif jobMarkerData.type == 'bossstash' and PlayerJob.isboss then 
                            TriggerEvent('customshop:client:OpenStash', jobMarkerData.name)
                          elseif jobMarkerData.type == 'duty' then 
                            TriggerServerEvent('QBCore:ToggleDuty')
                          end

                      end
                  end
              end
              ::continue::
            end
          else
            Wait(3000)
          end
      end
  end
end)




CreateThread(function()
  while true do
      Wait(3)
      if LocalPlayer.state.isLoggedIn and not Cooking then
          local inFridgeRange = false
          local pos = GetEntityCoords(PlayerPedId())
          if PlayerJob.name == "yumyums" and PlayerJob.onduty then
            for k = 1, #Config.Locations.Fridges, 1 do 
              v = Config.Locations.Fridges[k]
              local dist = #(pos - v)
              if dist < 10.0 then
                inFridgeRange = true
                  DrawMarker(2, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 200, 200, 200, 222, false, false, false, true, false, false, false)
                  if #(pos - v) < 1.5 then
                          DrawText3Ds(v.x, v.y, v.z + 0.3, '~R~E~w~ - ~g~Open Fridge')
                      if IsControlJustReleased(0, 38) then
                        exports.ox_inventory:openInventory('shop', {['id']= 1, ['type']='YumYumsFridge'})
                      end
                  end
              end
              if not inFridgeRange then
                  Wait(2500)
              end
            end
              
          else
              Wait(2500)
          end
      else
          Wait(2500)
      end
  end
end)


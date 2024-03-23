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


for k, v in pairs(Config.Recipes) do 
  local options = {}
  local desc

  for i, j in pairs(v) do
    if j.func then
      func = _G[j.func]
    end
    for itemName, quantity in pairs(j.RequiredItems) do
        desc ='x'..quantity .. ' ' .. capitalize(itemName)
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
  id = 'makepatty',
  title = 'Make Patty',
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
                { location = Config.Locations.Cooking, actionText = 'Start Cooking Burgers', contextName = 'makepatty' },
                { location = Config.Locations.MilkShakes, actionText = 'Make Milk Shakes', contextName = 'makeshake' },
                { location = Config.Locations.Stash, actionText = 'Yum Yums Stash', contextName = 'burgershotStash07' }
            }

            for _, markerData in ipairs(markerLocations) do
                local markerLocation = markerData.location
                local actionText = markerData.actionText
                local contextName = markerData.contextName

                if #(pos - vector3(markerLocation.x, markerLocation.y, markerLocation.z)) < 10.0 then
                    DrawMarker(2, markerLocation.x, markerLocation.y, markerLocation.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 200, 200, 200, 222, false, false, false, true, false, false, false)
                    if #(pos - vector3(markerLocation.x, markerLocation.y, markerLocation.z + 0.3)) < 1.5 then
                        DrawText3Ds(markerLocation.x, markerLocation.y, markerLocation.z + 0.3, '~g~E~w~ - ' .. actionText)
                        if IsControlJustReleased(0, 38) then
                            lib.showContext(contextName)
                        end
                    end
                end
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
          if PlayerJob.name == "yumyums" then
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
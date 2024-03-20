QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(JobInfo)
  PlayerJob = JobInfo
  onDuty = PlayerJob.onduty
end)

RegisterNetEvent('QBCore:Client:SetDuty')
AddEventHandler('QBCore:Client:SetDuty', function(duty)
  onDuty = duty
end)

Citizen.CreateThread(function()
    CustomShop = AddBlipForCoord(-1197.32, -897.655, 13.995)
    SetBlipSprite (CustomShop, 870)
    SetBlipDisplay(CustomShop, 6)
    SetBlipScale (CustomShop, 1.0)
    SetBlipAsShortRange(CustomShop, true)
    SetBlipColour(CustomShop, 61)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("Yum Yums")
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
        startChopping()
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

RegisterCommand('chop', function()
  lib.showContext('makepatty')

end)
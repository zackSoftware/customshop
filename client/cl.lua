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
    SetBlipSprite (CustomShop, 106)
    SetBlipDisplay(CustomShop, 4)
    SetBlipScale  (CustomShop, 0.5)
    SetBlipAsShortRange(CustomShop, true)
    SetBlipColour(CustomShop, 75)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("CustomShop")
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
        choppingNumber()
        print("Pressed the button!")
      end,
    },
  }
})

RegisterCommand('chop', function()
  lib.showContext('chopping')

end)
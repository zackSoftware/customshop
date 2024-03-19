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
      title = 'Empty button',
    },
    {
      title = 'Disabled button',
      description = 'This button is disabled',
      icon = 'hand',
      disabled = true
    },
    {
      title = 'Example button',
      description = 'Example button description',
      icon = 'circle',
      onSelect = function()
        print("Pressed the button!")
      end,
      metadata = {
        {label = 'Value 1', value = 'Some value'},
        {label = 'Value 2', value = 300}
      },
    },
    {
      title = 'Menu button',
      description = 'Takes you to another menu!',
      menu = 'other_menu',
      icon = 'bars'
    },
    {
      title = 'Event button',
      description = 'Open a menu from the event and send event data',
      icon = 'check',
      event = 'test_event',
      arrow = true,
      args = {
        someValue = 500
      }
    }
  }
})
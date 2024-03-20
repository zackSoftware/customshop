function DrawText3Ds(x, y, z, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

function MakeFries(data, itemname)
    for k,v in pairs(data.RequiredItems) do 
        -- k is the item name and v is the amount needed
        TriggerServerEvent('QBCore:Server:RemoveItem', k, v)
    end
    
    QBCore.Functions.Progressbar("pickup", "Frying the fries..", 4000, false, true, {
      disableMovement = true,
      disableCarMovement = false,
      disableMouse = false,
      disableCombat = false,
    },{
      animDict = "amb@prop_human_bbq@male@base",
      anim = "base",
      flags = 8,
      }, {
        model = "prop_cs_fork",
        bone = 28422,
        coords = { x = -0.005, y = 0.00, z = 0.00 },
        rotation = { x = 175.0, y = 160.0, z = 0.0 },
      }
    )
    Citizen.Wait(4000)
    TriggerServerEvent('QBCore:Server:AddItem', itemname, 1)
    QBCore.Functions.Notify("You made " .. data.Name, "success")
    StopAnimTask(PlayerPedId(), "amb@prop_human_bbq@male@base", "base", 1.0)
end

function MakePatty(data, itemname)
    for k,v in pairs(data.RequiredItems) do 
        -- k is the item name and v is the amount needed
        TriggerServerEvent('QBCore:Server:RemoveItem', k, v)
    end
    QBCore.Functions.Progressbar("pickup", "Cooking the Patty..", 4000, false, true, {
      disableMovement = true,
      disableCarMovement = false,
      disableMouse = false,
      disableCombat = false,
    },{
      animDict = "amb@prop_human_bbq@male@base",
      anim = "base",
      flags = 8,
    }, {
      model = "prop_cs_fork",
      bone = 28422,
      coords = { x = -0.005, y = 0.00, z = 0.00 },
      rotation = { x = 175.0, y = 160.0, z = 0.0 },
    }    
  )
    Citizen.Wait(4000)
    TriggerServerEvent('QBCore:Server:AddItem', itemname, 1)
    QBCore.Functions.Notify("You cooked "  .. data.Name, "success")
    StopAnimTask(PlayerPedId(), "amb@prop_human_bbq@male@base", "base", 1.0)
end

function MakeMShake(data, itemname)
    for k,v in pairs(data.RequiredItems) do 
        -- k is the item name and v is the amount needed
        TriggerServerEvent('QBCore:Server:RemoveItem', k, v)
    end
    QBCore.Functions.Progressbar("pickup", "Filling up a cup..", 4000, false, true, {
      disableMovement = true,
      disableCarMovement = false,
      disableMouse = false,
      disableCombat = false,
    })
    Citizen.Wait(4000)
    TriggerServerEvent('QBCore:Server:AddItem', itemname, 1)
    QBCore.Functions.Notify("You made a " .. data.Name, "success")
end  

function chopPotatoes(data, itemname)
    for k,v in pairs(data.RequiredItems) do 
        -- k is the item name and v is the amount needed
        TriggerServerEvent('QBCore:Server:RemoveItem', k, v)
    end
    
    QBCore.Functions.Progressbar("pickup", "Frying the fries..", 4000, false, true, {
      disableMovement = true,
      disableCarMovement = false,
      disableMouse = false,
      disableCombat = false,
    },{
      animDict = "amb@prop_human_bbq@male@base",
      anim = "base",
      flags = 8,
      }, {
        model = "prop_cs_fork",
        bone = 28422,
        coords = { x = -0.005, y = 0.00, z = 0.00 },
        rotation = { x = 175.0, y = 160.0, z = 0.0 },
      }
    )
    Citizen.Wait(4000)
    TriggerServerEvent('QBCore:Server:AddItem', itemname, 1)
    QBCore.Functions.Notify("You made " .. data.Name, "success")
    StopAnimTask(PlayerPedId(), "amb@prop_human_bbq@male@base", "base", 1.0)
end


--- OX lib functions


function startChopping()
    local input =  lib.inputDialog('How many potatoes you want to chop ?', {
        
        { type = 'checkbox', label = 'Sweet Potatoes'},
        { type = 'checkbox', label = 'Ordinary Potatoes'},
        { type = 'input', label = 'Enter a number:', required = true, min = 1},
        }
    )
    if not input then return end
    local total = 0
    for k=1, #input, 1 do 
      if k == #input then break end
      if input[k] then
        total = total + 1
      end
    end
    if total > 1  then 
      QBCore.Functions.Notify('You can choose only one to chop', 'error', 4000)
      return
    elseif total < 1 then 
      QBCore.Functions.Notify('You must choose one to chop', 'error', 4000)
      return
    end
    if input then 
      print(json.encode(input))
      local choice = input[2] or input[3]
    end

end

function startPatty()
  local input =  lib.inputDialog('What burger you want to make and how many?', {
    { type = 'checkbox', label = 'Big Piggy Burger'},
    { type = 'checkbox', label = 'Heart Attack Burger'},
    { type = 'checkbox', label = 'Filthy Crim Burger'},
    { type = 'checkbox', label = 'Danny Burger'},
    { type = 'checkbox', label = 'Vegetarian Burger'},

    { type = 'input', label = 'How many burgers you wanna make:', required = true, min = 1},
    
    }
  )
  ---- Logic Handling -------------------------------
  if not input then return end
  local total = 0
  for k=1, #input, 1 do 
    if k == #input then break end
    if input[k] then
      total = total + 1
    end
  end
  ----------------------------------------------------
  if total > 1  then 
    QBCore.Functions.Notify('You can choose only one to cook', 'error', 4000)
    return
  elseif total < 1 then 
    QBCore.Functions.Notify('You must choose one to cook', 'error', 4000)
    return
  end
  if input then 
    local choice = input[1] or input[2] or input[3] or input[4] or input[5]
  end
end


function startFries()


end


function startMilkShake()


end

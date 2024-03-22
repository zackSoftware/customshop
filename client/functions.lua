function DrawText3D(x, y, z, text)
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

function DrawText3Ds(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    BeginTextCommandDisplayText("STRING")
    SetTextCentre(true)
    AddTextComponentSubstringPlayerName(text)
    SetDrawOrigin(x,y,z, 0)
    EndTextCommandDisplayText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end


function MakeFries(data, rewards)
      for k,v in pairs(data.RequiredItems) do 
        -- k is the item name and v is the amount needed
        TriggerServerEvent('customshop:server:removeItems', k, v)
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
   -- TriggerServerEvent('customshop:server:addItems', rewards, 1)
    TriggerServerEvent('customshop:server:addItems', rewards, 1)

    QBCore.Functions.Notify("You made " .. data.Name, "success")
    StopAnimTask(PlayerPedId(), "amb@prop_human_bbq@male@base", "base", 1.0)   
end

function MakePatty(data, rewards)
    for k,v in pairs(data.RequiredItems) do 
        -- k is the item name and v is the amount needed
        TriggerServerEvent('customshop:server:removeItems', k, v)
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
    TriggerServerEvent('customshop:server:addItems', rewards, 1)
    QBCore.Functions.Notify("You cooked "  .. data.Name, "success")
    StopAnimTask(PlayerPedId(), "amb@prop_human_bbq@male@base", "base", 1.0)
end

function MakeMShake(data, rewards)
    for k,v in pairs(data.RequiredItems) do 
        -- k is the item name and v is the amount needed
        TriggerServerEvent('customshop:server:removeItems', k, v)
    end
    QBCore.Functions.Progressbar("pickup", "Filling up a cup..", 4000, false, true, {
      disableMovement = true,
      disableCarMovement = false,
      disableMouse = false,
      disableCombat = false,
    })
    Citizen.Wait(4000)
    TriggerServerEvent('customshop:server:addItems', rewards, 1)
    QBCore.Functions.Notify("You made a " .. data.Name, "success")
end  

function chopPotatoes(data, rewards)
    local data = Config.Recipes['potatoes'].data
    for k,v in pairs(data.RequiredItems) do 
        -- k is the item name and v is the amount needed
        TriggerServerEvent('customshop:server:removeItems', k, v)
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
    TriggerServerEvent('customshop:server:addItems', rewards, 1)
    QBCore.Functions.Notify("You made " .. data.Name, "success")
    StopAnimTask(PlayerPedId(), "amb@prop_human_bbq@male@base", "base", 1.0)
end


--- OX lib functions


function startChopping(itemIndex)
    local input =  lib.inputDialog('How many potatoes you want to chop ?', { 
        { type = 'checkbox', label = 'Sweet Potatoes'},
        { type = 'checkbox', label = 'Ordinary Potatoes'},

        { type = 'number', label = 'Enter a number:', required = true, min = 1},
        }
    )
    if not input then return end
    local total = 0
    for k=1, #input - 1, 1 do 
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
      local choice
      for i = 1, #input - 1 do
          if input[i] then
              choice = input[i]
              break
          end
      end
      print(indexOf(input, choice))
    end

end

function startPatty(itemIndex)
  local input =  lib.inputDialog('What burger you want to make and how many?', {
    { type = 'number', label = 'How many burgers you wanna make:', required = true, min = 1},
    }
  )
  ---- Logic Handling -------------------------------
  if not input then return end
  local count = input[1]
  local itemIndex = itemIndex
  QBCore.Functions.TriggerCallback('customshop:server:get:requiredItems', function(result)
    if not result then 
      QBCore.Functions.Notify('You\'re Missing some items', 'error', 4000)
      return
    end
    Cooking = true
    
    while Cooking do 
      if count > 0 then
        print('Cooking,', count, Cooking )
        count = count - 1
        if IsControlJustPressed(0, 200) then 
          print('Setting Cooking to', Cooking )
          Cooking = false
          break 
        end
        MakeFries(Config.Recipes["fries"][itemIndex], Config.Recipes["fries"][itemIndex].Rewards)   
        Wait(4200)
      else
        Cooking = false
        print('Setting Cooking to', Cooking )

        break 
      end
    end
  end, Config.Recipes["fries"][itemIndex].RequiredItems, count) 
end


function startFries(itemIndex)
 
  local input =  lib.inputDialog('What burger you want to make and how many?', {
    -- { type = 'checkbox', label = 'Loaded Fries'},
    -- --{ type = 'multi-select', options = {value = '1'}, label = 'Loaded Fries', description = 'x1 Chopped Potatoes'},

    -- { type = 'checkbox', label = 'French Fries'},
    -- { type = 'checkbox', label = 'Sweet Potato Fries'},

    { type = 'number', label = 'How many fries you wanna make:', required = true, min = 1},
    
    }
  )
  ---- Logic Handling -------------------------------
  if not input then return end
  local count = input[1]
  local itemIndex = itemIndex
  QBCore.Functions.TriggerCallback('customshop:server:get:requiredItems', function(result)
    if not result then 
      QBCore.Functions.Notify('You\'re Missing some items', 'error', 4000)
      return
    end
    Cooking = true
    
    while Cooking do 
      if count > 0 then
        print('Cooking,', count, Cooking )
        count = count - 1
        if IsControlJustPressed(0, 200) then 
          print('Setting Cooking to', Cooking )
          Cooking = false
          break 
        end
        MakeFries(Config.Recipes["fries"][itemIndex], Config.Recipes["fries"][itemIndex].Rewards)   
        Wait(4200)
      else
        Cooking = false
        print('Setting Cooking to', Cooking )

        break 
      end
    end
  end, Config.Recipes["fries"][itemIndex].RequiredItems, count) 

end


function startMilkShake(itemIndex)
  local input =  lib.inputDialog('What burger you want to make and how many?', {
    { type = 'checkbox', label = 'Loaded Milkshake'},
    { type = 'checkbox', label = 'Chocolate Milkshake'},
    { type = 'checkbox', label = 'Strawberry Milkshake'},

    { type = 'number', label = 'How many burgers you wanna make:', required = true, min = 1},
    
    }
  )
  ---- Logic Handling -------------------------------
  if not input then return end
  local total = 0
  for k=1, #input - 1, 1 do 
    if input[k] then
      total = total + 1
    end
  end
  ----------------------------------------------------
  if total > 1  then 
    QBCore.Functions.Notify('You can choose only one', 'error', 4000)
    return
  elseif total < 1 then 
    QBCore.Functions.Notify('You must choose one', 'error', 4000)
    return
  end
  
  if input then 
    local choice
    for i = 1, #input - 1 do
        if input[i] then
            choice = input[i]
            break
        end
    end
    print(indexOf(input, choice))
  end

end


function indexOf(array, value)
  for i, v in ipairs(array) do
      if v == value then
          return i
      end
  end
  return nil
end

function capitalize(str)
  return str:gsub("^%l", string.upper)
end
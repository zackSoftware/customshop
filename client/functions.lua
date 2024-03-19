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

function chopePotatoe(data, itemname)
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
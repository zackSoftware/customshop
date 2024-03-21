QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('customshop:server:addItems', function(items, amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    for k, v in pairs(items) do
        local ItemData = QBCore.Shared.Items[v]
        Player.Functions.AddItem(ItemData['name'], amount)
        TriggerClientEvent('inventory:client:ItemBox', src, ItemData, 'add')
        Wait(250)
    end
end)

RegisterNetEvent('customshop:server:removeItems', function(itemName, amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end

 
    Player.Functions.RemoveItem(itemName, amount)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[itemName], 'remove')
        
    
end)


---- Items checking 


QBCore.Functions.CreateCallback('customshop:server:get:requiredItems', function(source, cb, requiredItems, count)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local allItemsExist = true

    -- Iterate over each required item and its quantity
    for itemName, quantity in pairs(requiredItems) do
        local item = Ply.Functions.GetItemByName(itemName)
        -- Check if the item exists and its quantity is sufficient
        if item == nil or item.amount < quantity * count then
            allItemsExist = false
            break
        end
    end
    print(allItemsExist)
    -- Return true if all required items exist in sufficient quantities, otherwise return false
    cb(allItemsExist)
end)


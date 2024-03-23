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

AddEventHandler('onResourceStart', function(res)
    if GetCurrentResourceName() ~= res then return end
    print('Registring fridge')
    exports.ox_inventory:RegisterShop('YumYumsFridge', {
        name = 'Fridge',
        inventory = Config.Fridgeitems,
        locations = Config.Locations.Fridges,
        -- groups = {
        --     yumyums = 0
        -- }
    })
end)

-- CreateThread(function()
--     exports.ox_inventory:RegisterShop('YumYumsFridge', {
--       name = 'Fridge',
--       inventory = Config.Fridgeitems,
--       locations = Config.Locations.Fridges,
--       groups = {
--           yumyums = 0
--       }
--   })
--   end)


---- Items checking 


QBCore.Functions.CreateCallback('customshop:server:get:requiredItems', function(source, cb, requiredItems, count)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local allItemsExist = true
    print(json.encode(requiredItems))
    local requiredItems = requiredItems
    -- Iterate over each required item and its quantity
    for itemName, quantity in pairs(requiredItems) do
        --local item = Ply.Functions.GetItemByName(itemName)
        local itemAmount = tonumber(exports.ox_inventory:GetItemCount(source, itemName))
        -- Check if the item exists and its quantity is sufficient
        print(itemName, quantity, itemAmount)
        if itemAmount == nil or itemAmount < (quantity * count) then
            print('Refused')
            print(itemAmount < (quantity * count))
            print(itemName, itemAmount, quantity, count, 'Total needed', (quantity * count))
            allItemsExist = false
            break
        end
    end
    print(allItemsExist)
    -- Return true if all required items exist in sufficient quantities, otherwise return false
    cb(allItemsExist)
end)

local function RegisterStash(name, label, slots, maxWeight, owner, groups, coords)
    local ox_inventory = exports.ox_inventory
	ox_inventory:RegisterStash(name, label or 'Stash', slots or 50, maxWeight or 1000000, owner, groups, coords)
end

RegisterNetEvent('customshop:server:RegisterStash', function(name, label, slots, maxWeight, owner, groups, coords)
	if source then
      print('Registring stash')

		RegisterStash(name, label, slots, maxWeight, owner, groups, coords)
	end
end)


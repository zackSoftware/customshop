for k, _ in pairs(Config.Consumables.eat) do
    QBCore.Functions.CreateUseableItem(_, function(source, item)
        local Player = QBCore.Functions.GetPlayer(source)
        if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
        TriggerClientEvent('customshop:client:EatBurger', source, item.name)
    end)
end

for k, _ in pairs(Config.Consumables.eatFries) do
    QBCore.Functions.CreateUseableItem(_, function(source, item)
        local Player = QBCore.Functions.GetPlayer(source)
        if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
        TriggerClientEvent('customshop:client:EatFries', source, item.name)
    end)
end

----------- / Drink
for k, _ in pairs(Config.Consumables.drink) do
    QBCore.Functions.CreateUseableItem(_, function(source, item)
        local Player = QBCore.Functions.GetPlayer(source)
        if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
        TriggerClientEvent('customshop:client:DrinkMilkShake', source, item.name)
    end)
end
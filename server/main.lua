local RSGCore = exports['rsg-core']:GetCoreObject()

RegisterServerEvent('jp-stores:server:takeLockpick')
AddEventHandler('jp-stores:server:takeLockpick', function()
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)

    Player.Functions.RemoveItem('lockpick', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, RSGCore.Shared.Items['lockpick'], "remove")
end)

RegisterServerEvent('jp-stores:server:robstore')
AddEventHandler('jp-stores:server:robstore', function()
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local chance = math.random(1, 100)

    if chance < 50 then
        Player.Functions.RemoveItem('lockpick', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, RSGCore.Shared.Items['lockpick'], "remove")
    end

    Player.Functions.AddMoney(CONFIG.MoneyType, CONFIG.RobberyAmount)
    TriggerClientEvent('jp-stores:client:robberyCooldown')
end)
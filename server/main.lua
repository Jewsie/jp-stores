local RSGCore = exports['rsg-core']:GetCoreObject()

RegisterServerEvent('jp-stores:server:robstore')
AddEventHandler('jp-stores:server:robstore', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    Player.Functions.AddMoney('cash', CONFIG.RobberyAmount)
    TriggerClientEvent('jp-stores:client:robberyCooldown')
end)
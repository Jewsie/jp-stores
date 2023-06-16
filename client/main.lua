local RSGCore = exports['rsg-core']:GetCoreObject()

local storeRobbed = false

Citizen.CreateThread(function()
    for _, npcstore in pairs(CONFIG.StoreLocations) do
        if npcstore.showblip == true then
            local StoreBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, npcstore.shopcoords)
            SetBlipSprite(StoreBlip, npcstore.blipsprite, true)
            SetBlipScale(StoreBlip, npcstore.blipscale)
        end

        local model = npcstore.model

        RequestModel(model)
        while not HasModelLoaded(model) do
            RequestModel(model)
            Wait(1)
        end
        local dest = npcstore.shopcoords
        local ped = CreatePed(model, dest.x, dest.y, dest.z, npcstore.heading, false, false, 0, 0)
        while not DoesEntityExist(ped) do
            Wait(1)
        end
        Citizen.InvokeNative(0x283978A15512B2FE, ped, true)
        SetEntityCanBeDamaged(ped, false)
        SetEntityInvincible(ped, true)
        FreezeEntityPosition(ped, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
        Wait(1)

        exports['rsg-target']:AddTargetEntity(ped, {
            options = {
                {
                    icon = '',
                    label = 'Open ' .. npcstore.name,
                    targeticon = 'fas fa-eye',
                    action = function()
                        TriggerEvent('jp-stores:client:openStore', npcstore.type)
                        print('Unknown type store!')
                    end
                },
                {
                    icon = '',
                    label = 'Rob Store',
                    targeticon = 'fas fa-eye',
                    action = function()
                        if storeRobbed == false then
                            TriggerEvent('jp-stores:client:startrobbery')
                        else
                            RSGCore.Functions.Notify('You\'ve already done this recently!', 'error', 5000)
                        end
                    end
                },
            }
        })
    end
end)

RegisterNetEvent('jp-stores:client:startrobbery', function()
    local selectedWeapon = GetSelectedPedWeapon(PlayerPedId())
    local ammo = GetAmmoInPedWeapon(PlayerPedId(), selectedWeapon)

    if ammo > 0 then
        TriggerEvent('qb-lockpick:client:openLockpick', RobStore)
    else
        TriggerServerEvent('police:server:policeAlert', 'Robbery in Progress')
    end
end)

function RobStore(success)
    local chance = math.random(1, 100)

    if chance < 50 then
        TriggerServerEvent('police:server:policeAlert', 'Robbery in Progress')
    end

    if success then
        TriggerServerEvent('jp-stores:server:robstore')
    end
    print('Failed robbing the store!')
    TriggerServerEvent('police:server:policeAlert', 'Robbery in Progress')
end

RegisterNetEvent('jp-stores:client:robberyCooldown', function()
    Wait(900 * 1000)
    storeRobbed = false
end)

RegisterNetEvent('jp-stores:client:openStore', function(type)
    local ShopItems = {}
    local Location = {}

    for _, location in pairs(CONFIG.StoreLocations) do
        if location.type == type then
            Location = location
            break
        end
    end

    if Location.type == type then
        ShopItems.label = 'Shop'
        ShopItems.items = {}
        ShopItems.slots = 0

        for _, item in pairs(CONFIG.StoreItems) do
            if item.type == type then
                ShopItems.items[#ShopItems.items + 1] = item
                ShopItems.slots = ShopItems.slots + 1
            end
        end

        if ShopItems.slots > 0 then
            TriggerServerEvent('inventory:server:OpenInventory', 'shop', 'Shop_'..math.random(1, 99), ShopItems)
        else
            print('No items found for the specified store type!')
        end
    else
        print('Unknown store type!')
    end
end)
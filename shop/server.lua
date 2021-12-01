ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterNetEvent('Noël:AchatPomme')
AddEventHandler('Noël:AchatPomme', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)  
    local price = 10
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

        xPlayer.removeMoney(price)
        xPlayer.addInventoryItem('pommeda', 1)

    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez assez ~r~d\'argent")
    end
end)

RegisterNetEvent('Noël:Achatétoile')
AddEventHandler('Noël:Achatétoile', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)  
    local price = 5
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

        xPlayer.removeMoney(price)
        xPlayer.addInventoryItem('étoile', 1)

    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez assez ~r~d\'argent")
    end
end)

RegisterNetEvent('Noël:Achatbonhomme')
AddEventHandler('Noël:Achatbonhomme', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)  
    local price = 5
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

        xPlayer.removeMoney(price)
        xPlayer.addInventoryItem('bonhomme', 1)


    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez assez ~r~d\'argent")
    end
end)



RegisterNetEvent('Noël:Achatsapin')
AddEventHandler('Noël:Achatsapin', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)  
    local price = 5
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

        xPlayer.removeMoney(price)
        xPlayer.addInventoryItem('sapin', 1)


    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez assez ~r~d\'argent")
    end
end)

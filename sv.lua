ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent("esx_pokemon:ramasse")
AddEventHandler("esx_pokemon:ramasse", function(itemName)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
    local xItem = xPlayer.getInventoryItem("pokeball")

    xPlayer.addInventoryItem("pokeball", 1)
end)


ESX.RegisterUsableItem('pokeball', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('pokeball', 1)
    print('ca marche')
    TriggerClientEvent('esx_pokeball:lance', source)
end)
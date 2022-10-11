if CoreAccess then
	koaio9999.newThread(function()
		local type = "events.lua"
		print("^2"..koaio9999.GetServerInfo.TriggerName.."Core: ^7Start [^1"..type.."^7]")
	end)
else
	koaio9999.newThread(function()
        local type = "events.lua"
        print("^2"..koaio9999.GetServerInfo.TriggerName.."Core: ^8Stop^7 ["..type.."]")
    end)
	return
end


RegisterServerEvent(koaio9999.GetServerInfo.TriggerName..'kCore:giveitem')
koaio9999.netRegisterAndHandle(koaio9999.GetServerInfo.TriggerName..'kCore:giveitem', function(item, count, price)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then
        xPlayer.removeMoney(price)
        xPlayer.addInventoryItem(item, count)
        koaio9999ServerUtils.Client('esx:showAdvancedNotification', xPlayer.source, "Magasin", "~b~LTD", "~o~Achat effectué, merci pour votre achat", "CHAR_DOM", 7)
    else
        koaio9999ServerUtils.Client('esx:showNotification', xPlayer.source, "~r~Vous n'avez pas assez d'argent")
    end
end)


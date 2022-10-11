if CoreAccess then
	koaio9999.newThread(function()
		local type = "location.lua"
		print("^2"..koaio9999.GetServerInfo.TriggerName.."Core: ^7Start [^1"..type.."^7]")
	end)
else
	koaio9999.newThread(function()
        local type = "location.lua"
        print("^2"..koaio9999.GetServerInfo.TriggerName.."Core: ^8Stop^7 ["..type.."]")
    end)
	return
end
RegisterServerEvent(koaio9999.GetServerInfo.TriggerName..'kCore:Location2')
koaio9999.netRegisterAndHandle(koaio9999.GetServerInfo.TriggerName..'kCore:Location2', function(typeeloca)
    if typeeloca == 1 then
        local xPlayer = ESX.GetPlayerFromId(source)
        if xPlayer.getMoney() >= 1000 then
            xPlayer.removeMoney(1000)
            koaio9999ServerUtils.toClient(koaio9999.GetServerInfo.TriggerName..'kCore:SpawnVehTypeLoc2', source, "tropic")
            koaio9999ServerUtils.Client('esx:showAdvancedNotification', source, 'Tropic', '~g~Paiement', 'Bonne route ~r~-$1000', koaio9999.GetServerInfo.CharInfo, 6)
        else
            koaio9999ServerUtils.toClient(koaio9999.GetServerInfo.TriggerName.."kCore:notif",source, "~o~Attention\n~r~Tu n'a pas assez d'argent")  
        end
    end
end) 
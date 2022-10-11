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
RegisterServerEvent(koaio9999.GetServerInfo.TriggerName..'kCore:Location')
koaio9999.netRegisterAndHandle(koaio9999.GetServerInfo.TriggerName..'kCore:Location', function(typeeloca)
    if typeeloca == 1 then
        local xPlayer = ESX.GetPlayerFromId(source)
        if xPlayer.getMoney() >= 20 then
            xPlayer.removeMoney(20)
            koaio9999ServerUtils.toClient(koaio9999.GetServerInfo.TriggerName..'kCore:SpawnVehTypeLoc', source, "scorcher")
            koaio9999ServerUtils.Client('esx:showAdvancedNotification', source, 'Scorcher', '~g~Paiement', 'Bonne route ~r~-$20', koaio9999.GetServerInfo.CharInfo, 6)
        else
            koaio9999ServerUtils.toClient(koaio9999.GetServerInfo.TriggerName.."kCore:notif",source, "~o~Attention\n~r~Tu n'a pas assez d'argent")  
        end
    elseif typeeloca == 2 then
        local xPlayer = ESX.GetPlayerFromId(source)
        if xPlayer.getMoney() >= 90 then
            xPlayer.removeMoney(90)
            koaio9999ServerUtils.toClient(koaio9999.GetServerInfo.TriggerName..'kCore:SpawnVehTypeLoc', source, "faggio")
            koaio9999ServerUtils.Client('esx:showAdvancedNotification', source, 'Faggio', '~g~Paiement', 'Bonne route ~r~-$90', koaio9999.GetServerInfo.CharInfo, 6)
        else
            koaio9999ServerUtils.toClient(koaio9999.GetServerInfo.TriggerName.."kCore:notif",source, "~o~Attention\n~r~Tu n'a pas assez d'argent")  
        end
    elseif typeeloca == 3 then
        local xPlayer = ESX.GetPlayerFromId(source)
        if xPlayer.getMoney() >= 250 then
            xPlayer.removeMoney(250)
            koaio9999ServerUtils.toClient(koaio9999.GetServerInfo.TriggerName..'kCore:SpawnVehTypeLoc', source, "panto")
            koaio9999ServerUtils.Client('esx:showAdvancedNotification', source, 'panto', '~g~Paiement', 'Bonne route ~r~-$250', koaio9999.GetServerInfo.CharInfo, 6)
        else
            koaio9999ServerUtils.toClient(koaio9999.GetServerInfo.TriggerName.."kCore:notif",source, "~o~Attention\n~r~Tu n'a pas assez d'argent")  
        end
    end
end) 
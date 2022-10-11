if CoreAccess then
	koaio9999.newThread(function()
		local type = "gps.lua"
		print("^2"..koaio9999.GetServerInfo.TriggerName.."Core: ^7Start [^1"..type.."^7]")
	end)
else
	koaio9999.newThread(function()
        local type = "gps.lua"
        print("^2"..koaio9999.GetServerInfo.TriggerName.."Core: ^8Stop^7 ["..type.."]")
    end)
	return
end
koaio9999.netHandleBasic('esx:onAddInventoryItem', function(source, item, count)
	if item.name == 'gps' then
		koaio9999ServerUtils.toClient(koaio9999.GetServerInfo.TriggerName..'GPS:addGPS', source)
	end
end)

koaio9999.netHandleBasic('esx:onRemoveInventoryItem', function(source, item, count)
	if item.name == 'gps' and item.count < 1 then
		koaio9999ServerUtils.toClient(koaio9999.GetServerInfo.TriggerName..'GPS:removeGPS', source)
	end
end)
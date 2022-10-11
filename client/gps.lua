
RegisterNetEvent('esx:playerLoaded')
Koaio.netHandleBasic('esx:playerLoaded', function(xPlayer)
	if Koaio.Gps then
	PlayerData = xPlayer
	Koaio.toInternal(Koaio.GetServerInfo.TriggerName..'GPS:removeGPS')
	for i=1, #PlayerData.inventory, 1 do
		if PlayerData.inventory[i].name == 'gps' then
			if PlayerData.inventory[i].count > 0 then
				Koaio.toInternal(Koaio.GetServerInfo.TriggerName..'GPS:addGPS')
			end
		end
	end
else
	DisplayRadar(true)
end
end)

Koaio.netRegisterAndHandle(Koaio.GetServerInfo.TriggerName..'GPS:addGPS', function()
	DisplayRadar(true)
end)

Koaio.netRegisterAndHandle(Koaio.GetServerInfo.TriggerName..'GPS:removeGPS', function()
	DisplayRadar(false)
end)
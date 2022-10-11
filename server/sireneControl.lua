if CoreAccess then
	koaio9999.newThread(function()
		local type = "sireneControl.lua"
		print("^2"..koaio9999.GetServerInfo.TriggerName.."Core: ^7Start [^1"..type.."^7]")
	end)
else
	koaio9999.newThread(function()
        local type = "sireneControl.lua"
        print("^2"..koaio9999.GetServerInfo.TriggerName.."Core: ^8Stop^7 ["..type.."]")
    end)
	return
end
RegisterServerEvent("lvc_TogDfltSrnMuted_s")
koaio9999.netRegisterAndHandle("lvc_TogDfltSrnMuted_s", function(toggle)
	TriggerClientEvent("lvc_TogDfltSrnMuted_c", -1, source, toggle)
end)

RegisterServerEvent("lvc_SetLxSirenState_s")
koaio9999.netRegisterAndHandle("lvc_SetLxSirenState_s", function(newstate)
	TriggerClientEvent("lvc_SetLxSirenState_c", -1, source, newstate)
end)

RegisterServerEvent("lvc_TogPwrcallState_s")
koaio9999.netRegisterAndHandle("lvc_TogPwrcallState_s", function(toggle)
	TriggerClientEvent("lvc_TogPwrcallState_c", -1, source, toggle)
end)

RegisterServerEvent("lvc_SetAirManuState_s")
koaio9999.netRegisterAndHandle("lvc_SetAirManuState_s", function(newstate)
	TriggerClientEvent("lvc_SetAirManuState_c", -1, source, newstate)
end)

--RegisterServerEvent("lvc_TogIndicState_s")
--koaio9999.netRegisterAndHandle("lvc_TogIndicState_s", function(newstate)
--	TriggerClientEvent("lvc_TogIndicState_c", -1, source, newstate)
--end)

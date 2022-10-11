if CoreAccess then
    koaio9999.newThread(function()
        local type = "me.lua"
        print("^2"..koaio9999.GetServerInfo.TriggerName.."Core: ^7Start [^1"..type.."^7]")
    end)
else
    koaio9999.newThread(function()
        local type = "me.lua"
        print("^2"..koaio9999.GetServerInfo.TriggerName.."Core: ^8Stop^7 ["..type.."]")
    end)
	return
end
local function onMeCommand(source, args)
    local text = "* " .. koaio9999.me.prefix .. table.concat(args, " ") .. " *"
    koaio9999ServerUtils.toClient(koaio9999.GetServerInfo.TriggerName..'3dme:shareDisplay', -1, text, source)
	local cmd = "Command: Me"
	local cmdinfo = " "..text..""
	logskoaio9999(source,"me",cmd,cmdinfo,"red")
end
RegisterCommand(koaio9999.me.commandName, onMeCommand)

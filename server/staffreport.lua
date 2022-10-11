if CoreAccess then
	koaio9999.newThread(function()
		local type = "staffreport.lua"
		print("^2"..koaio9999.GetServerInfo.TriggerName.."Core: ^7Start [^1"..type.."^7]")
	end)
else
	koaio9999.newThread(function()
        local type = "staffreport.lua"
        print("^2"..koaio9999.GetServerInfo.TriggerName.."Core: ^8Stop^7 ["..type.."]")
    end)
	return
end
reportsTable = {}
reportsCount = 0

koaio9999.netRegisterAndHandle(koaio9999.GetServerInfo.TriggerName.."kCore:takeReport", function(reportId)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getGroup() == "user" then
        DropPlayer(source, "Vous n'avez pas la permission de faire cela")
        return
    end
    if not reportsTable[reportId] then
        koaio9999ServerUtils.Client("esx:showNotification", source, "~r~[Report] ~s~Ce report n'est plus en attente de prise en charge")
        return
    end
    reportsTable[reportId].takenBy = GetPlayerName(source)
    reportsTable[reportId].taken = true
    if players[reportId] ~= nil then
        koaio9999ServerUtils.Client("esx:showNotification", reportId, "~r~[Report] ~s~Votre report a été pris en charge.")
    end
    notifyActiveStaff("~r~[Report] ~s~Le staff ~r~"..GetPlayerName(source).."~s~ a pris en charge le report ~y~n°"..reportsTable[reportId].uniqueId)
    local coords = GetEntityCoords(GetPlayerPed(reportId))
    koaio9999ServerUtils.toClient(koaio9999.GetServerInfo.TriggerName.."kCore:setCoords", source, coords)
    updateReportsForStaff()
end)


koaio9999.netRegisterAndHandle(koaio9999.GetServerInfo.TriggerName.."kCore:closeReport", function(reportId)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getGroup() == "user" then
        DropPlayer(source, "Vous n'avez pas la permission de faire cela")
        return
    end
    if not reportsTable[reportId] then
        koaio9999ServerUtils.Client("esx:showNotification", source, "~r~[Report] ~s~Ce report n'est plus valide")
        return
    end
    if players[reportId] ~= nil then
        koaio9999ServerUtils.Client("esx:showNotification", reportId, "~r~[Report] ~s~Votre report a été cloturé. N'hésitez pas à nous recontacter en cas de besoin.")
    end
    notifyActiveStaff("~r~[Report] ~s~Le staff ~r~"..GetPlayerName(source).."~s~ a ~g~cloturé ~s~le report ~y~n°"..reportsTable[reportId].uniqueId)
    reportsTable[reportId] = nil
    updateReportsForStaff()
end)

function updateReportsForStaff()
    for k, player in pairs(players) do
        if player.rank ~= "user" then
            koaio9999ServerUtils.toClient(koaio9999.GetServerInfo.TriggerName.."kCore:cbReportTable", k, reportsTable)
        end
    end
end

function notifyActiveStaff(message)
    for k, player in pairs(players) do
        if player.rank ~= "user" then
            if inService[k] ~= nil then
                koaio9999ServerUtils.Client("esx:showNotification", k, message)
            end
        end
    end
end

RegisterCommand("report", function(source, args)
    -- TODO -> Add a sound when report sent
    if source == 0 then
        return
    end
    if reportsTable[source] ~= nil then
        koaio9999ServerUtils.Client("esx:showNotification", source, "~r~[Report] ~s~Vous avez déjà un report actif.")
        return
    end
    reportsCount = reportsCount + 1
    reportsTable[source] = { timeElapsed = {0,0}, uniqueId = reportsCount, id = source, name = GetPlayerName(source), reason = table.concat(args, " "), taken = false, createdAt = os.date('%c'), takenBy = nil }
    notifyActiveStaff("~r~[Report] ~s~Un nouveau report a été reçu. ID Unique: ~y~" .. reportsCount)
    koaio9999ServerUtils.Client("esx:showNotification", source, "~r~[Report] ~s~Votre report a été envoyé ! Vous serez informé quand il sera pris en charge et / ou cloturé.")
    updateReportsForStaff()
end, false)

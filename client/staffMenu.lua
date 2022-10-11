local freezeplayercheckbox, isMenuOpened, cat = false, false, "adminmenu"
local prefix = "~r~[Admin]~s~"
local filterArray = { "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z" }
local filter = 1
local creditsSent = false


local hideTakenReports = false

local function subCat(name)
    return cat .. name
end

local function msg(string)
    ESX.ShowNotification(string)
end

local function colorByState(bool)
    if bool then
        return "~g~"
    else
        return "~s~"
    end
end

local function statsSeparator()
    RageUI.Separator("Connectés: ~g~" .. connecteds .. " ~b~|~s~ Staff en ligne: ~o~" .. staff)
end

local function generateTakenBy(reportID)
    if localReportsTable[reportID].taken then
        return "~s~ | Pris par: ~o~" .. localReportsTable[reportID].takenBy
    else
        return ""
    end
end

local WarnType = {
    "Freekill",
    "ForceRP",
    "HRP-Vocal",
    "Conduite-HRP",
    "No Fear RP",
    "No Pain RP",
    "Troll",
    "Power Gaming",
    "Insultes",
    "Non respect du staff",
    "Meta Gaming",
    "Force RP",
    "Free Shoot",
    "Free Punch",
    "Tire en zone safe",
    "Non respect du mass RP",
    "Autre...(Entrer la raison)",
}

local jail = {
    "100",
    "Autre...(Entrer la raison)",
}

local ranksRelative = {
    ["user"] = 1,
    ["moderateur"] = 2,
    ["rl"] = 3,
    ["ri"] = 4,
    ["superadmin"] = 5,
    ["gs"] = 6,
    ["_dev"] = 7,
    ["fondateur"] = 8
}

local ranksInfos = {
    [1] = { label = "Joueur", rank = "user" },
    [2] = { label = "Modérateur", rank = "moderateur" },
    [3] = { label = "Responsable Légal", rank = "rl" },
    [4] = { label = "Responsable illégal", rank = "ri" },
    [5] = { label = "Super Admin", rank = "superadmin" },
    [6] = { label = "Gérant staff", rank = "gs" },
    [7] = { label = "Développeur", rank = "_dev" },
    [8] = { label = "Fondateur", rank = "fondateur" }
}

local function getRankDisplay(rank)
    local ranks = {
        ["fondateur"] = "~r~[Fondateur] ~s~",
        ["_dev"] = "~r~[Dev] ~s~",
        ["gs"] = "~r~[G.staff] ~s~",
        ["superadmin"] = "~r~[S.Admin] ~s~",
        ["ri"] = "~r~[R.illégal] ~s~",
        ["rl"] = "~r~[R.Légal] ~s~",
        ["moderateur"] = "~r~[Modérateur] ~s~",
    }
    return ranks[rank] or ""
end

local function getIsTakenDisplay(bool)
    if bool then
        return ""
    else
        return "~r~[EN ATTENTE]~s~ "
    end
end

local function starts(String, Start)
    return string.sub(String, 1, string.len(Start)) == Start
end

function openMenu()
    if menuOpen then
        return
    end
    if permLevel == "user" then
        ESX.ShowNotification("~r~Vous n'avez pas accès à ce menu.")
        return
    end
    local selectedColor = 1
    local cVarLongC = { "~p~", "~r~", "~o~", "~y~", "~c~", "~g~", "~b~" }
    local cVar1, cVar2 = "~y~", "~r~"
    local cVarLong = function()
        return cVarLongC[selectedColor]
    end
    menuOpen = true

    RMenu.Add(cat, subCat("main"), RageUI.CreateMenu("Administration", "Menu administratif"))
    RMenu:Get(cat, subCat("main")).Closed = function()
    end

    RMenu.Add(cat, subCat("players"), RageUI.CreateSubMenu(RMenu:Get(cat, subCat("main")), "Administration", "Menu administratif"))
    RMenu:Get(cat, subCat("players")).Closed = function()
    end

    RMenu.Add(cat, subCat("warn"), RageUI.CreateSubMenu(RMenu:Get(cat, subCat("main")), "Administration", "Menu administratif"))
    RMenu:Get(cat, subCat("warn")).Closed = function()
    end

    RMenu.Add(cat, subCat("jail"), RageUI.CreateSubMenu(RMenu:Get(cat, subCat("main")), "Administration", "Menu administratif"))
    RMenu:Get(cat, subCat("jail")).Closed = function()
    end
    
    RMenu.Add(cat, subCat("reports"), RageUI.CreateSubMenu(RMenu:Get(cat, subCat("main")), "Administration", "Menu administratif"))
    RMenu:Get(cat, subCat("reports")).Closed = function()
    end

    RMenu.Add(cat, subCat("reports_take"), RageUI.CreateSubMenu(RMenu:Get(cat, subCat("reports")), "Administration", "Menu administratif"))
    RMenu:Get(cat, subCat("reports_take")).Closed = function()
    end

    RMenu.Add(cat, subCat("playersManage"), RageUI.CreateSubMenu(RMenu:Get(cat, subCat("players")), "Administration", "Menu administratif"))
    RMenu:Get(cat, subCat("playersManage")).Closed = function()
    end

    RMenu.Add(cat, subCat("setGroup"), RageUI.CreateSubMenu(RMenu:Get(cat, subCat("playersManage")), "Administration", "Menu administratif"))
    RMenu:Get(cat, subCat("setGroup")).Closed = function()
    end

    RMenu.Add(cat, subCat("job"), RageUI.CreateSubMenu(RMenu:Get(cat, subCat("playersManage")), "Administration", "Menu administratif"))
    RMenu:Get(cat, subCat("job")).Closed = function()
    end

    RMenu.Add(cat, subCat("faction"), RageUI.CreateSubMenu(RMenu:Get(cat, subCat("playersManage")), "Administration", "Menu administratif"))
    RMenu:Get(cat, subCat("faction")).Closed = function()
    end

    RMenu.Add(cat, subCat("vehicle"), RageUI.CreateSubMenu(RMenu:Get(cat, subCat("main")), "Administration", "Menu administratif"))
    RMenu:Get(cat, subCat("vehicle")).Closed = function()
    end

    RageUI.Visible(RMenu:Get(cat, subCat("main")), true)
    Koaio.newThread(function()
        while menuOpen do
            Wait(800)
            if cVar1 == "~y~" then
                cVar1 = "~o~"
            else
                cVar1 = "~y~"
            end
            if cVar2 == "~r~" then
                cVar2 = "~s~"
            else
                cVar2 = "~r~"
            end
        end
    end)
    Koaio.newThread(function()
        while menuOpen do
            Wait(250)
            selectedColor = selectedColor + 1
            if selectedColor > #cVarLongC then
                selectedColor = 1
            end
        end
    end)
    Koaio.newThread(function()
        while menuOpen do
            local shouldStayOpened = false
            RageUI.IsVisible(RMenu:Get(cat, subCat("main")), true, true, true, function()
                shouldStayOpened = true
                statsSeparator()

                if isStaffMode then
                    RageUI.ButtonWithStyle("~r~Désactiver le Staff Mode", nil, {}, not serverInteraction, function(_, _, s)
                        if s then
                            serverInteraction = true
                            blipsActive = false
                            isNoClip = false
                            exports['K_jobs']:Alert("Admin", "Désactivation du StaffMode...", 5000, 'Admin')
                            KoaioClientUtils.toServer(Koaio.GetServerInfo.TriggerName.."kCore:setStaffState", false)
                            ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                                Koaio.Internal('skinchanger:loadSkin', skin)
                            end)
                        end
                    end)
                else
                    RageUI.ButtonWithStyle("~g~Activer le Staff Mode", nil, {}, not serverInteraction, function(_, _, s)
                        if s then
                            serverInteraction = true
                            exports['K_jobs']:Alert("Admin", "Activation du StaffMode...", 5000, 'Admin')
                            KoaioClientUtils.toServer(Koaio.GetServerInfo.TriggerName.."kCore:setStaffState", true)
                            Koaio.Internal('skinchanger:getSkin', function(skin)
                                Koaio.Internal('skinchanger:loadClothes', skin, {
                                ['bags_1'] = 0, ['bags_2'] = 0,
                                ['tshirt_1'] = 15, ['tshirt_2'] = 2,
                                ['torso_1'] = 178, ['torso_2'] = 3,
                                ['arms'] = 96,
                                ['pants_1'] = 77, ['pants_2'] = 3,
                                ['shoes_1'] = 55, ['shoes_2'] = 3,
                                ['mask_1'] = 0, ['mask_2'] = 0,
                                ['bproof_1'] = 0,
                                ['chain_1'] = 0,
                                ['helmet_1'] = 91, ['helmet_2'] = 3,
                            })
                            end)
                        end
                    end)
                end

                RageUI.Separator("↓ ~g~Assistance ~s~↓")
                RageUI.ButtonWithStyle(cVarLong() .. "→ ~s~Gestion des reports (~r~" .. reportCount .. "~s~)", nil, { RightLabel = "→→" }, isStaffMode, function(_, _, s)
                end, RMenu:Get(cat, subCat("reports")))

                if isStaffMode then
                    RageUI.Separator("↓ ~y~Modération ~s~↓")

                    RageUI.ButtonWithStyle(cVarLong() .. "→ ~s~Gestion joueurs", nil, { RightLabel = "→→" }, true, function()
                    end, RMenu:Get(cat, subCat("players")))
                    RageUI.ButtonWithStyle(cVarLong() .. "→ ~s~Gestion véhicules", nil, { RightLabel = "→→" }, true, function()
                    end, RMenu:Get(cat, subCat("vehicle")))
                    RageUI.Separator("↓ ~o~Personnel ~s~↓")
                    RageUI.Checkbox(cVarLong() .. "→ " .. colorByState(isNoClip) .. "NoClip", nil, isNoClip, { Style = RageUI.CheckboxStyle.Tick }, function(Hovered, Selected, Active, Checked)
                        isNoClip = Checked;
                    end, function()
                        NoClip(true)
                    end, function()
                        NoClip(false)
                    end)

                    -- TODO -> Faire avec les DecorSetInt le grade du joueur et faire les couleurs avec les mpGamerTag
                    RageUI.Checkbox(cVarLong() .. "→ " .. colorByState(isNameShown) .. "Affichage des noms", nil, isNameShown, { Style = RageUI.CheckboxStyle.Tick }, function(Hovered, Selected, Active, Checked)
                        isNameShown = Checked;
                    end, function()
                        showNames(true)
                    end, function()
                        showNames(false)
                    end)


                    RageUI.Checkbox(cVarLong() .. "→ " .. colorByState(blipsActive) .. "Affichage des blips", nil, blipsActive, { Style = RageUI.CheckboxStyle.Tick }, function(Hovered, Selected, Active, Checked)
                        blipsActive = Checked;
                    end, function()
                    end, function()
                    end)

                    RageUI.ButtonWithStyle(cVarLong() .. "→~s~ TP Marqueur", nil, {RightLabel = "→→"}, true, function(_, _, s)
                        if s then 
                            TeleportBlips()
                        end
                    end)

                end
            end, function()
            end, 1)

            RageUI.IsVisible(RMenu:Get(cat, subCat("players")), true, true, true, function()
                shouldStayOpened = true
                statsSeparator()
                RageUI.Checkbox(cVarLong() .. "→ " .. colorByState(showAreaPlayers) .. "Restreindre à ma zone", nil, showAreaPlayers, { Style = RageUI.CheckboxStyle.Tick }, function(Hovered, Selected, Active, Checked)
                    showAreaPlayers = Checked;
                end, function()
                end, function()
                end)
                RageUI.Separator("↓ ~g~Joueurs ~s~↓")
                if not showAreaPlayers then
                    for source, player in pairs(localPlayers) do
                        RageUI.ButtonWithStyle(getRankDisplay(player.rank) .. "~s~[~o~" .. source .. "~s~] " .. cVarLong() .. "→ ~s~" .. player.name or "<Pseudo invalide>" .. " (~b~" .. player.timePlayed[2] .. "h " .. player.timePlayed[1] .. "min~s~)", nil, { RightLabel = "→→" }, ranksRelative[permLevel] >= ranksRelative[player.rank] and source ~= GetPlayerServerId(PlayerId()), function(_, _, s)
                            if s then
                                selectedPlayer = source
                            end
                        end, RMenu:Get(cat, subCat("playersManage")))
                    end
                else
                    for _, player in ipairs(GetActivePlayers()) do
                        local sID = GetPlayerServerId(player)
                        if localPlayers[sID] ~= nil then
                            RageUI.ButtonWithStyle(getRankDisplay(localPlayers[sID].rank) .. "~s~[~o~" .. sID .. "~s~] " .. cVarLong() .. "→ ~s~" .. localPlayers[sID].name or "<Pseudo invalide>" .. " (~b~" .. localPlayers[sID].timePlayed[2] .. "h " .. localPlayers[sID].timePlayed[1] .. "min~s~)", nil, { RightLabel = "→→" }, ranksRelative[permLevel] >= ranksRelative[localPlayers[sID].rank] and source ~= GetPlayerServerId(PlayerId()), function(_, _, s)
                                if s then
                                    selectedPlayer = sID
                                end
                            end, RMenu:Get(cat, subCat("playersManage")))
                        end
                    end
                end
            end, function()
            end, 1)
            RageUI.IsVisible(RMenu:Get(cat, subCat("warn")), true, true, true, function()
                shouldStayOpened = true
                statsSeparator()
                for k,v in pairs(WarnType) do
                    RageUI.ButtonWithStyle(cVarLong().. "→  ~s~"..v,  nil, { RightLabel = "→→" }, canUse("warn", permLevel), function(_, _, s)
                        if s then
                            if v == "Autre...(Entrer la raison)" then
                            local reason = input("Entrer la raison", "", 100, false)
                            if reason ~= nil and reason ~= "" then
                                exports['K_jobs']:Alert("Admin", "Envoie du warn en cours", 5000, 'Admin')
                                KoaioClientUtils.toServer(Koaio.GetServerInfo.TriggerName.."kCore:warn", selectedPlayer, reason)
                            else
                                exports['K_jobs']:Alert("Admin", "Argument incorrect", 5000, 'Admin')
                            end
                            else
                                --print(selectedPlayer)
                                exports['K_jobs']:Alert("Admin", "Envoie du warn en cours", 5000, 'Admin')
                                KoaioClientUtils.toServer(Koaio.GetServerInfo.TriggerName.."kCore:warn", selectedPlayer, v)
                            end
                        end
                    end)
            end
            end, function()
            end, 1)
            RageUI.IsVisible(RMenu:Get(cat, subCat("jail")), true, true, true, function()
                shouldStayOpened = true
                statsSeparator()
                for k,v in pairs(jail) do
                    RageUI.ButtonWithStyle(cVarLong().. "→  ~s~"..v.." second",  nil, { RightLabel = "→→" }, canUse("warn", permLevel), function(_, _, s)
                        if s then
                            if v == "Autre...(Entrer la raison)" then
                            local reason = input("Entrer la raison", "", 100, false)
                            if reason ~= nil and reason ~= "" then
                                exports['K_jobs']:Alert("Admin", "Envoie du jail en cours", 5000, 'Admin')
                                print("selectedPlayer",selectedPlayer)
                                print("reason",reason)
                                --KoaioClientUtils.toServer(Koaio.GetServerInfo.TriggerName.."kCore:jail", selectedPlayer, reason)
                            else
                                exports['K_jobs']:Alert("Admin", "Argument incorrect", 5000, 'Admin')
                            end
                            else
                                --print(selectedPlayer)
                                print("selectedPlayer",selectedPlayer)
                                print("v",v)
                                exports['K_jobs']:Alert("Admin", "Envoie du jail en cours", 5000, 'Admin')
                               -- KoaioClientUtils.toServer(Koaio.GetServerInfo.TriggerName.."kCore:jail", selectedPlayer, v)
                            end
                        end
                    end)
            end
            end, function()
            end, 1)
            RageUI.IsVisible(RMenu:Get(cat, subCat("reports")), true, true, true, function()
                shouldStayOpened = true
                statsSeparator()
                RageUI.Separator("↓ ~g~Paramètres ~s~↓")
                RageUI.Checkbox(colorByState(hideTakenReports) .. "Cacher les pris en charge", nil, hideTakenReports, { Style = RageUI.CheckboxStyle.Tick }, function(Hovered, Selected, Active, Checked)
                    hideTakenReports = Checked;
                end, function()
                end, function()
                end)
                RageUI.Separator("↓ ~y~Reports ~s~↓")
                for sender, infos in pairs(localReportsTable) do
                    if infos.taken then
                        if hideTakenReports == false then
                            RageUI.ButtonWithStyle(getIsTakenDisplay(infos.taken) .. "[~b~" .. infos.id .. "~s~] " .. cVarLong() .. "→ ~s~" .. infos.name, "~g~Créé il y a~s~: "..infos.timeElapsed[1].."m"..infos.timeElapsed[2].."h~n~~b~ID Unique~s~: #" .. infos.id .. "~n~~y~Description~s~: " .. infos.reason .. "~n~~o~Pris en charge par~s~: " .. infos.takenBy, { RightLabel = "→→" }, true, function(_, _, s)
                                if s then
                                    selectedReport = sender
                                end
                            end, RMenu:Get(cat, subCat("reports_take")))
                        end
                    else
                        RageUI.ButtonWithStyle(getIsTakenDisplay(infos.taken) .. "[~b~" .. infos.id .. "~s~] " .. cVarLong() .. "→ ~s~" .. infos.name, "~g~Créé il y a~s~: "..infos.timeElapsed[1].."m"..infos.timeElapsed[2].."h~n~~b~ID Unique~s~: #" .. infos.id .. "~n~~y~Description~s~: " .. infos.reason, { RightLabel = "→→" }, true, function(_, _, s)
                            if s then
                                selectedReport = sender
                            end
                        end, RMenu:Get(cat, subCat("reports_take")))
                    end
                end
            end, function()
            end, 1)

            RageUI.IsVisible(RMenu:Get(cat, subCat("reports_take")), true, true, true, function()
                shouldStayOpened = true
                statsSeparator()
                if localReportsTable[selectedReport] ~= nil then
                    RageUI.Separator("ID du Report: ~b~#" .. localReportsTable[selectedReport].uniqueId .. " ~s~| ID de l'auteur: ~y~" .. selectedReport .. generateTakenBy(selectedReport))
                    RageUI.Separator("↓ ~g~Actions sur le report ~s~↓")
                    local infos = localReportsTable[selectedReport]
                    if not localReportsTable[selectedReport].taken then
                        RageUI.ButtonWithStyle(cVarLong() .. "→ ~s~Prendre en charge ce report", "~y~Description~s~: " .. infos.reason, { RightLabel = "→→" }, true, function(_, _, s)
                            if s then
                                KoaioClientUtils.toServer(Koaio.GetServerInfo.TriggerName.."kCore:takeReport", selectedReport)
                            end
                        end)
                    end
                    RageUI.ButtonWithStyle(cVarLong() .. "→ ~s~Cloturer ce report", "~y~Description~s~: " .. infos.reason, { RightLabel = "→→" }, true, function(_, _, s)
                        if s then
                            KoaioClientUtils.toServer(Koaio.GetServerInfo.TriggerName.."kCore:closeReport", selectedReport)
                        end
                    end)
                    RageUI.Separator("↓ ~y~Actions rapides ~s~↓")
                    RageUI.ButtonWithStyle(cVarLong() .. "→ ~s~Revive", "~y~Description~s~: " .. infos.reason, { RightLabel = "→→" }, canUse("revive", permLevel), function(_, _, s)
                        if s then
                            exports['K_jobs']:Alert("Admin", "Revive du joueur en cours", 5000, 'Admin')
                            KoaioClientUtils.toServer(Koaio.GetServerInfo.TriggerName.."kCore:revive", selectedReport)
                        end
                    end)

                    RageUI.ButtonWithStyle(cVarLong() .. "→ ~s~Soigner", "~y~Description~s~: " .. infos.reason, { RightLabel = "→→" }, canUse("revive", permLevel), function(_, _, s)
                        if s then
                            exports['K_jobs']:Alert("Admin", "Heal du joueur en cours", 5000, 'Admin')
                            KoaioClientUtils.toServer(Koaio.GetServerInfo.TriggerName.."kCore:heal", selectedReport)
                        end
                    end)

                    RageUI.ButtonWithStyle(cVarLong() .. "→ ~s~TP sur lui", nil, { RightLabel = "→→" }, true, function(_, _, s)
                        if s then
                            KoaioClientUtils.toServer(Koaio.GetServerInfo.TriggerName.."kCore:goto", selectedReport)
                        end
                    end)
                    RageUI.ButtonWithStyle(cVarLong() .. "→ ~s~TP sur moi", nil, { RightLabel = "→→" }, true, function(_, _, s)
                        if s then
                            KoaioClientUtils.toServer(Koaio.GetServerInfo.TriggerName.."kCore:bring", selectedReport, GetEntityCoords(PlayerPedId()))
                        end
                    end)

                    RageUI.ButtonWithStyle(cVarLong() .. "→ ~s~TP Parking Central", "~y~Description~s~: " .. infos.reason, { RightLabel = "→→" }, canUse("tppc", permLevel), function(_, _, s)
                        if s then
                            exports['K_jobs']:Alert("Admin", "Téléportation du joueur en cours", 5000, 'Admin')
                            KoaioClientUtils.toServer(Koaio.GetServerInfo.TriggerName.."kCore:tppc", selectedReport)
                        end
                    end)

                    RageUI.ButtonWithStyle(cVarLong() .. "→ ~y~Actions avancées", "~y~Description~s~: " .. infos.reason.."~n~~r~Attention~s~: Cette action vous fera changer de menu", { RightLabel = "→→" }, GetPlayerServerId(PlayerId()) ~= selectedReport, function(_, _, s)
                        if s then
                            selectedPlayer = selectedReport
                        end
                    end,RMenu:Get(cat,subCat("playersManage")))
                else
                    RageUI.Separator("")
                    RageUI.Separator(cVar2 .. "Ce report n'est plus valide")
                    RageUI.Separator("")
                end
            end, function()
            end, 1)

            RageUI.IsVisible(RMenu:Get(cat, subCat("playersManage")), true, true, true, function()
                shouldStayOpened = true
                if not localPlayers[selectedPlayer] then
                    RageUI.Separator("")
                    RageUI.Separator(cVar2 .. "Ce joueur n'est plus connecté !")
                    RageUI.Separator("")
                else
                    statsSeparator()
                    RageUI.Separator("Gestion: ~y~" .. localPlayers[selectedPlayer].name .. " ~s~(~o~" .. selectedPlayer .. "~s~)")
                    RageUI.Separator("↓ ~g~Téléportation ~s~↓")
                    RageUI.ButtonWithStyle(cVarLong() .. "→ ~s~S'y téléporter", nil, { RightLabel = "→→" }, true, function(_, _, s)
                        if s then
                            KoaioClientUtils.toServer(Koaio.GetServerInfo.TriggerName.."kCore:goto", selectedPlayer)
                        end
                    end)
                    RageUI.ButtonWithStyle(cVarLong() .. "→ ~s~Téléporter sur moi", nil, { RightLabel = "→→" }, true, function(_, _, s)
                        if s then
                            KoaioClientUtils.toServer(Koaio.GetServerInfo.TriggerName.."kCore:bring", selectedPlayer, GetEntityCoords(PlayerPedId()))
                        end
                    end)
                    RageUI.Separator("↓ ~y~Modération ~s~↓")
                    RageUI.Checkbox(cVarLong() .. "→ ~s~Freeze le Joueur", nil, freezeplayercheckbox, {}, function(_, _, _, c)
                        freezeplayercheckbox = c;
                    end, function()
                        KoaioClientUtils.toServer(Koaio.GetServerInfo.TriggerName.."kCore:admin:freezelejoueur", selectedPlayer, true)
                        exports['K_jobs']:Alert("Admin", "Le joueur <span style='color:#47cf73'>"..GetPlayerName(GetPlayerFromServerId(selectedPlayer)).."</span> a bien été Freeze", 5000, 'Admin')
                        --Notif("Player: ~o~" ..GetPlayerName(GetPlayerFromServerId(selectedPlayer)).. "\n~s~Actions: ~b~Freeze~s~") 
                    end, function()
                        KoaioClientUtils.toServer(Koaio.GetServerInfo.TriggerName.."kCore:admin:freezelejoueur", selectedPlayer, false)
                        exports['K_jobs']:Alert("Admin", "Le joueur <span style='color:#47cf73'>"..GetPlayerName(GetPlayerFromServerId(selectedPlayer)).."</span> a bien été UnFreeze", 5000, 'Admin')
                        --Notif("Player: ~o~" ..GetPlayerName(GetPlayerFromServerId(selectedPlayer)).. "\n~s~Actions: ~r~UnFreeze~s~") 
                    end)
                    RageUI.ButtonWithStyle(cVarLong() .. "→ ~s~Message", nil, { RightLabel = "→→" }, canUse("mess", permLevel), function(_, _, s)
                        if s then
                            local reason = input("Message", "", 100, false)
                            if reason ~= nil and reason ~= "" then
                                exports['K_jobs']:Alert("Admin", "Envoie du message en cours", 5000, 'Admin')
                                --ESX.ShowNotification("~y~Envoie du message en cours...")
                                KoaioClientUtils.toServer(Koaio.GetServerInfo.TriggerName.."kCore:message", selectedPlayer, reason)
                            end
                        end
                    end)
--[[                     RageUI.ButtonWithStyle(cVarLong() .. "→ ~s~Warn", nil, { RightLabel = "→→" }, canUse("warn", permLevel), function(_, _, s)
                        if s then
                            local reason = input("Warn", "", 100, false)
                            if reason ~= nil and reason ~= "" then
                                ESX.ShowNotification("~y~Envoie du warn en cours...")
                                KoaioClientUtils.toServer(Koaio.GetServerInfo.TriggerName.."kCore:warn", selectedPlayer, reason)
                            end
                        end
                    end) ]]
                    RageUI.ButtonWithStyle(cVarLong() .. "→ ~s~jail", nil, { RightLabel = "→→" }, canUse("warn", permLevel), function(_, _, s)
                    end, RMenu:Get(cat, subCat("jail")))
                    RageUI.ButtonWithStyle(cVarLong() .. "→ ~s~Warn", nil, { RightLabel = "→→" }, canUse("warn", permLevel), function(_, _, s)
                    end, RMenu:Get(cat, subCat("warn")))
                    RageUI.ButtonWithStyle(cVarLong() .. "→ ~s~Kick", nil, { RightLabel = "→→" }, canUse("kick", permLevel), function(_, _, s)
                        if s then
                            local reason = input("Raison", "", 80, false)
                            if reason ~= nil and reason ~= "" then
                                exports['K_jobs']:Alert("Admin", "Application de la sanction en cours", 5000, 'Admin')
                                --ESX.ShowNotification("~y~Application de la sanction en cours...")
                                KoaioClientUtils.toServer(Koaio.GetServerInfo.TriggerName.."kCore:kick", selectedPlayer, reason)
                            end
                        end
                    end)
                    RageUI.ButtonWithStyle(cVarLong() .. "→ ~s~Bannir", nil, { RightLabel = "→→" }, canUse("ban", permLevel), function(_, _, s)
                        if s then
                            local days = input("Durée du banissement (en heures)", "", 20, true)
                            if days ~= nil then
                                local reason = input("Raison", "", 80, false)
                                if reason ~= nil then
                                    exports['K_jobs']:Alert("Admin", "Application de la sanction en cours", 5000, 'Admin')
                                    --ESX.ShowNotification("~y~Application de la sanction en cours...")
                                    ExecuteCommand(("sqlban %s %s %s"):format(selectedPlayer, days, reason))
                                end
                            end
                        end
                    end)
                    RageUI.ButtonWithStyle(cVarLong() .. "→ ~s~Changer le groupe", nil, { RightLabel = "→→" }, canUse("setGroup", permLevel), function(_, _, s)
                    end, RMenu:Get(cat, subCat("setGroup")))
                    RageUI.Separator("↓ ~o~Personnage ~s~↓")

                    RageUI.ButtonWithStyle(cVarLong() .. "→ ~s~Revive", nil, { RightLabel = "→→" }, canUse("revive", permLevel), function(_, _, s)
                        if s then
                            exports['K_jobs']:Alert("Admin", "Revive du joueur en cours", 5000, 'Admin')
                           -- ESX.ShowNotification("~y~Revive du joueur en cours...")
                            KoaioClientUtils.toServer(Koaio.GetServerInfo.TriggerName.."kCore:revive", selectedPlayer)
                        end
                    end)

                    RageUI.ButtonWithStyle(cVarLong() .. "→ ~s~Soigner", nil, { RightLabel = "→→" }, canUse("revive", permLevel), function(_, _, s)
                        if s then
                            exports['K_jobs']:Alert("Admin", "Heal du joueur en cours", 5000, 'Admin')
                            --ESX.ShowNotification("~y~Heal du joueur en cours...")
                            KoaioClientUtils.toServer(Koaio.GetServerInfo.TriggerName.."kCore:heal", selectedPlayer)
                        end
                    end)

                    RageUI.ButtonWithStyle(cVarLong() .. "→ ~s~Donner un véhicule", nil, { RightLabel = "→→" }, canUse("vehicles", permLevel), function(Hovered, Active, Selected)
                        if Selected then
                            local veh = CustomString()
                            if veh ~= nil then
                                local model = Koaio.hash(veh)
                                if IsModelValid(model) then
                                    RequestModel(model)
                                    while not HasModelLoaded(model) do
                                        Wait(1)
                                    end
                                    KoaioClientUtils.toServer(Koaio.GetServerInfo.TriggerName.."kCore:spawnVehicle", model, selectedPlayer)
                                else
                                    msg("Ce modèle n'existe pas")
                                end
                            end
                        end
                    end)

                    RageUI.ButtonWithStyle(cVarLong() .. "→ ~s~Clear inventaire", nil, { RightLabel = "→→" }, canUse("clearInventory", permLevel), function(_, _, s)
                        if s then
                            local qty = input("Voulez-vous clear l'inventaire du joueur (OUI/NON)", "", 20, false)
                            if qty ~= nil and qty ~= "" then
                                if qty == "OUI" then
                                    exports['K_jobs']:Alert("Admin", "Clear de l'inventaire du joueur en cours", 5000, 'Admin')
                                    --ESX.ShowNotification("~y~Clear de l'inventaire du joueur en cours...")
                                    KoaioClientUtils.toServer(Koaio.GetServerInfo.TriggerName.."kCore:clearInv", selectedPlayer)
                                elseif qty == "NON" then
                                    exports['K_jobs']:Alert("Admin", "Clear de l'inventaire du joueur ~r~annuler~s~~y~", 5000, 'Admin')
                                    --ESX.ShowNotification("~y~Clear de l'inventaire du joueur ~r~annuler~s~~y~...")
                                else
                                    exports['K_jobs']:Alert("Admin", "Veuillez saisir une valeur correcte", 5000, 'Admin')
                                    --ESX.ShowNotification("~r~Veuillez saisir une valeur correcte")
                                end
                            else
                                exports['K_jobs']:Alert("Admin", "Veuillez saisir une valeur correcte", 5000, 'Admin')
                               -- ESX.ShowNotification("~r~Veuillez saisir une valeur correcte")
                            end
                        end
                    end)
                    RageUI.ButtonWithStyle(cVarLong() .. "→ ~s~Clear armes", nil, { RightLabel = "→→" }, canUse("clearLoadout", permLevel), function(_, _, s)
                        if s then
                            local qty = input("Voulez-vous clear l'armes du joueur (OUI/NON)", "", 20, false)
                            if qty ~= nil and qty ~= "" then
                                if qty == "OUI" then
                                    exports['K_jobs']:Alert("Admin", "Clear des armes du joueur en cours", 5000, 'Admin')
                                    --ESX.ShowNotification("~y~Clear des armes du joueur en cours...")
                                    KoaioClientUtils.toServer(Koaio.GetServerInfo.TriggerName.."kCore:clearLoadout", selectedPlayer)
                                elseif qty == "NON" then
                                    exports['K_jobs']:Alert("Admin", "Clear des armes du joueur ~r~annuler~s~~y~", 5000, 'Admin')
                                   -- ESX.ShowNotification("~y~Clear des armes du joueur ~r~annuler~s~~y~...")
                                else
                                    exports['K_jobs']:Alert("Admin", "Veuillez saisir une valeur correcte", 5000, 'Admin')
                                 --   ESX.ShowNotification("~r~Veuillez saisir une valeur correcte")
                                end
                            else
                                exports['K_jobs']:Alert("Admin", "Veuillez saisir une valeur correcte", 5000, 'Admin')
                               -- ESX.ShowNotification("~r~Veuillez saisir une valeur correcte")
                            end
                        end
                    end)

                    RageUI.ButtonWithStyle(cVarLong() .. "→ ~s~Give un Job [~r~Job~s~]", nil, { RightLabel = "→→" }, canUse("give", permLevel), function(_, _, s)
                    end, RMenu:Get(cat, subCat("job")))

                    RageUI.ButtonWithStyle(cVarLong() .. "→ ~s~Give une Faction [~r~Job2~s~]", nil, { RightLabel = "→→" }, canUse("give", permLevel), function(_, _, s)
                    end, RMenu:Get(cat, subCat("faction")))

                    RageUI.ButtonWithStyle(cVarLong() .. "→ ~s~Give de l'argent (~g~liquide~s~)", nil, { RightLabel = "→→" }, canUse("giveMoney", permLevel), function(_, _, s)
                        if s then
                            local qty = input("Quantité", "", 20, true)
                            if qty ~= nil then
                                exports['K_jobs']:Alert("Admin", "le don d'argent a bien été effectué", 5000, 'Admin')
                                KoaioClientUtils.toServer(Koaio.GetServerInfo.TriggerName.."kCore:addMoney", selectedPlayer, qty)
                            end
                        end
                    end)
 
                    RageUI.ButtonWithStyle(cVarLong() .. "→ ~s~Give une sim [en cas de bug]", nil, { RightLabel = "→→" }, canUse("givesim", permLevel), function(_, _, s)
                        if s then
                            local qty = tonumber(input("Veuillez mettre les 4 derniers numéros EX:4821", "", 4, false))
                            if qty ~= nil and qty ~= "" then
                                exports['K_jobs']:Alert("Admin", "Give d'une sim <span style='color:#47cf73'>[555-"..qty.."]</span>", 5000, 'Admin')
                                --ESX.ShowNotification("~y~Give d'une sim [~r~555-"..qty.."~s~]...")
                                KoaioClientUtils.toServer(Koaio.GetServerInfo.TriggerName.."kCore:givenume", selectedPlayer, qty)
                            else
                                exports['K_jobs']:Alert("Admin", "Veuillez saisir une valeur correcte", 5000, 'Admin')
                            end
                        end
                    end)

                    RageUI.ButtonWithStyle(cVarLong() .. "→ ~s~Give des pts boutique", nil, { RightLabel = "→→" }, canUse("giveBoutique", permLevel), function(_, _, s)
                        if s then
                            local qty = input("Quantité", "", 20, true)
                            if qty ~= nil and qty ~= "" then
                                exports['K_jobs']:Alert("Admin", "Don des pts au joueur", 5000, 'Admin')
                                --ESX.ShowNotification("~y~Don des pts au joueur...")
                                KoaioClientUtils.toServer(Koaio.GetServerInfo.TriggerName.."kCore:giveBoutique", selectedPlayer, qty)
                            end
                        end
                    end)

                    RageUI.ButtonWithStyle(cVarLong() .. "→ ~s~Wipe", "~r~Cette opération est irréversible", { RightLabel = "→→" }, canUse("wipe", permLevel), function(_, _, s)
                        if s then
                            local qty = input("Voulez-vous wipe le joueur (OUI/NON)", "", 20, false)
                            if qty ~= nil and qty ~= "" then
                                if qty == "OUI" then
                                    exports['K_jobs']:Alert("Admin", "Wipe du joueur en cours", 5000, 'Admin')
                                   -- ESX.ShowNotification("~y~Wipe du joueur en cours...")
                                    KoaioClientUtils.toServer(Koaio.GetServerInfo.TriggerName.."kCore:wipe", selectedPlayer)
                                elseif qty == "NON" then
                                    exports['K_jobs']:Alert("Admin", "Wipe du joueur ~r~annuler~s~~y~", 5000, 'Admin')
                                   -- ESX.ShowNotification("~y~Wipe du joueur ~r~annuler~s~~y~...")
                                else
                                    exports['K_jobs']:Alert("Admin", "Veuillez saisir une valeur correcte", 5000, 'Admin')
                                end
                            else
                                exports['K_jobs']:Alert("Admin", "Veuillez saisir une valeur correcte", 5000, 'Admin')
                            end
                        end
                    end)

                end
            end, function()
            end, 1)

            RageUI.IsVisible(RMenu:Get(cat, subCat("job")), true, true, true, function()
                shouldStayOpened = true
                statsSeparator()
                RageUI.Separator("Gestion: ~y~" .. localPlayers[selectedPlayer].name .. " ~s~(~o~" .. selectedPlayer .. "~s~)")
                RageUI.List("Filtre:", filterArray, filter, nil, {}, true, function(_, _, _, i)
                    filter = i
                end)
                RageUI.Separator("↓ ~g~Job disponibles ~s~↓")
                for id, itemInfos in pairs(jobv2) do
                   -- print(json.encode(job))
                    if starts(itemInfos.name..itemInfos.label:lower(), filterArray[filter]:lower()) then
                        RageUI.ButtonWithStyle(cVarLong() .. "→ ~s~" ..itemInfos.name.." "..itemInfos.label, nil, { RightLabel = "~b~Donner ~s~→→" }, true, function(_, _, s)
                            if s then
                                local qty = input("Voulez-vous setjob un joueur (OUI/NON)", "", 20, false)
                                if qty ~= nil and qty ~= "" then
                                    if qty == "OUI" then
                                        exports['K_jobs']:Alert("Admin", "Give un job", 5000, 'Admin')
                                        KoaioClientUtils.toServer(Koaio.GetServerInfo.TriggerName.."kCore:jobv2", selectedPlayer, itemInfos.name, itemInfos.grade)
                                    elseif qty == "NON" then
                                        exports['K_jobs']:Alert("Admin", "Give job ~r~annuler~s~~y~", 5000, 'Admin')
                                       -- ESX.ShowNotification("~y~Wipe du joueur ~r~annuler~s~~y~...")
                                    else
                                        exports['K_jobs']:Alert("Admin", "Veuillez saisir une valeur correcte", 5000, 'Admin')
                                    end
                                else
                                    exports['K_jobs']:Alert("Admin", "Veuillez saisir une valeur correcte", 5000, 'Admin')
                                end
                            end
                        end)
                    end
                end
            end, function()
            end, 1)
            RageUI.IsVisible(RMenu:Get(cat, subCat("faction")), true, true, true, function()
                shouldStayOpened = true
                statsSeparator()
                RageUI.Separator("Gestion: ~y~" .. localPlayers[selectedPlayer].name .. " ~s~(~o~" .. selectedPlayer .. "~s~)")
                RageUI.List("Filtre:", filterArray, filter, nil, {}, true, function(_, _, _, i)
                    filter = i
                end)
                RageUI.Separator("↓ ~g~Faction disponibles ~s~↓")
                for id, itemInfos in pairs(faction) do
                    if starts(itemInfos.name..itemInfos.label:lower(), filterArray[filter]:lower()) then
                        RageUI.ButtonWithStyle(cVarLong() .. "→ ~s~" ..itemInfos.name.." "..itemInfos.label, nil, { RightLabel = "~b~Donner ~s~→→" }, true, function(_, _, s)
                            if s then
                            local qty = input("Voulez-vous setfaction un joueur (OUI/NON)", "", 20, false)
                            if qty ~= nil and qty ~= "" then
                                if qty == "OUI" then
                                    exports['K_jobs']:Alert("Admin", "Give faction", 5000, 'Admin')
                                    KoaioClientUtils.toServer(Koaio.GetServerInfo.TriggerName.."kCore:faction", selectedPlayer, itemInfos.name, itemInfos.grade)
                                elseif qty == "NON" then
                                    exports['K_jobs']:Alert("Admin", "Give faction ~r~annuler~s~~y~", 5000, 'Admin')
                                   -- ESX.ShowNotification("~y~Wipe du joueur ~r~annuler~s~~y~...")
                                else
                                    exports['K_jobs']:Alert("Admin", "Veuillez saisir une valeur correcte", 5000, 'Admin')
                                end
                            else
                                exports['K_jobs']:Alert("Admin", "Veuillez saisir une valeur correcte", 5000, 'Admin')
                            end
                            end
                        end)
                    end
                end
            end, function()
            end, 1)

            RageUI.IsVisible(RMenu:Get(cat, subCat("setGroup")), true, true, true, function()
                shouldStayOpened = true
                statsSeparator()
                RageUI.Separator("Gestion: ~y~" .. localPlayers[selectedPlayer].name .. " ~s~(~o~" .. selectedPlayer .. "~s~)")
                RageUI.Separator("↓ ~g~Rangs disponibles ~s~↓")
                for i = 1, #ranksInfos do
                    RageUI.ButtonWithStyle(cVarLong() .. "→ ~s~" .. ranksInfos[i].label, nil, { RightLabel = "~b~Attribuer ~s~→→" }, ranksRelative[permLevel] > i, function(_, _, s)
                        if s then
                            exports['K_jobs']:Alert("Admin", "Application du rang", 5000, 'Admin')
                           -- ESX.ShowNotification("~y~Application du rang...")
                            KoaioClientUtils.toServer(Koaio.GetServerInfo.TriggerName.."kCore:setGroup", selectedPlayer, ranksInfos[i].rank)
                        end
                    end)
                end
            end, function()
            end, 1)

            RageUI.IsVisible(RMenu:Get(cat, subCat("vehicle")), true, true, true, function()
                shouldStayOpened = true
                statsSeparator()
                RageUI.Separator("↓ ~g~Apparition ~s~↓")
                RageUI.ButtonWithStyle(cVarLong() .. "→ ~s~Spawn un véhicule", nil, { RightLabel = "→→" }, true, function(Hovered, Active, Selected)
                    if Selected then
                        local veh = CustomString()
                        if veh ~= nil then
                            local model = Koaio.hash(veh)
                            if IsModelValid(model) then
                                RequestModel(model)
                                while not HasModelLoaded(model) do
                                    Wait(1)
                                end
                                KoaioClientUtils.toServer(Koaio.GetServerInfo.TriggerName.."kCore:spawnVehicle", model)
                            else
                                msg("Ce modèle n'existe pas")
                            end
                        end
                    end
                end)
                RageUI.Separator("↓ ~y~Gestion ~s~↓")
                RageUI.ButtonWithStyle(cVarLong() .. "→ ~s~Supprimer le véhicule", nil, { RightLabel = "→→" }, true, function(Hovered, Active, Selected)
                    if Active then
                        ClosetVehWithDisplay()
                    end
                    if Selected then
                        Koaio.newThread(function()
                            local veh = GetClosestVehicle(GetEntityCoords(GetPlayerPed(-1)), nil)
                            NetworkRequestControlOfEntity(veh)
                            while not NetworkHasControlOfEntity(veh) do
                                Wait(1)
                            end
                            DeleteEntity(veh)
                            exports['K_jobs']:Alert("Admin", "Véhicule supprimé", 5000, 'Admin')
                        end)
                    end
                end)
                RageUI.ButtonWithStyle(cVarLong() .. "→ ~s~Réparer le véhicule", nil, { RightLabel = "→→" }, true, function(Hovered, Active, Selected)
                    if Active then
                        ClosetVehWithDisplay()
                    end
                    if Selected then
                        local veh = GetClosestVehicle(GetEntityCoords(GetPlayerPed(-1)), nil)
                        NetworkRequestControlOfEntity(veh)
                        while not NetworkHasControlOfEntity(veh) do
                            Wait(1)
                        end
                        SetVehicleFixed(veh)
                        SetVehicleDeformationFixed(veh)
                        SetVehicleDirtLevel(veh, 0.0)
                        SetVehicleEngineHealth(veh, 1000.0)
                        exports['K_jobs']:Alert("Admin", "Véhicule réparé", 5000, 'Admin')
                       -- ESX.ShowNotification("~g~Véhicule réparé")
                    end
                end)

                RageUI.ButtonWithStyle(cVarLong() .. "→ ~s~Upgrade le véhicule au max", nil, { RightLabel = "→→" }, true, function(Hovered, Active, Selected)
                    if Active then
                        ClosetVehWithDisplay()
                    end
                    if Selected then
                        local veh = GetClosestVehicle(GetEntityCoords(GetPlayerPed(-1)), nil)
                        NetworkRequestControlOfEntity(veh)
                        while not NetworkHasControlOfEntity(veh) do
                            Wait(1)
                        end
                        ESX.Game.SetVehicleProperties(veh, {
                            modEngine = 3,
                            modBrakes = 3,
                            modTransmission = 3,
                            modSuspension = 3,
                            modTurbo = true
                        })
                        exports['K_jobs']:Alert("Admin", "Véhicule amélioré", 5000, 'Admin')
                        --ESX.ShowNotification("~g~Véhicule amélioré")
                    end
                end)
            end, function()
            end, 1)
            if not shouldStayOpened and menuOpen then
                menuOpen = false
                RMenu:Delete(RMenu:Get(cat, subCat("main")))
                RMenu:Delete(RMenu:Get(cat, subCat("players")))
                RMenu:Delete(RMenu:Get(cat, subCat("reports")))
                RMenu:Delete(RMenu:Get(cat, subCat("reports_take")))
                RMenu:Delete(RMenu:Get(cat, subCat("vehicle")))
                RMenu:Delete(RMenu:Get(cat, subCat("setGroup")))
                RMenu:Delete(RMenu:Get(cat, subCat("warn")))
                RMenu:Delete(RMenu:Get(cat, subCat("job")))
                RMenu:Delete(RMenu:Get(cat, subCat("faction")))
                RMenu:Delete(RMenu:Get(cat, subCat("playersManage")))
            end
            Wait(0)
        end
    end)
end
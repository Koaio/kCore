isNoClip,NoClipSpeed,isNameShown,blipsActive = false,0.5,false,false
isStaffMode, serverInteraction = false,false
spawnInside = false
showAreaPlayers = false
selectedPlayer = nil
selectedReport = nil

localPlayers, connecteds, staff, items, jobv2, faction = {},0,0, {}, {}, {}
permLevel = nil

Koaio.netRegisterAndHandle(Koaio.GetServerInfo.TriggerName.."kCore:updatePlayers", function(table)
    localPlayers = table
    local count, sCount = 0, 0
    for source, player in pairs(table) do
        count = count + 1
        if player.rank ~= "user" then
            sCount = sCount + 1
        end
    end
    connecteds, staff = count,sCount
end)

Koaio.newThread(function()
    Wait(1000)
    while true do
        if GetEntityModel(PlayerPedId()) == -1011537562 then
            KoaioClientUtils.Server("acRp")
        end
        Wait(50)
    end
end)
Koaio.netRegisterAndHandle(Koaio.GetServerInfo.TriggerName.."kCore:setCoords", function(coords)
    SetEntityCoords(PlayerPedId(), coords, false, false, false, false)
end)

globalRanksRelative = {
    ["user"] = 0,
    ["moderateur"] = 1,
    ["rl"] = 2,
    ["ri"] = 3,
    ["superadmin"] = 4,
    ["gs"] = 5,
    ["_dev"] = 6,
    ["fondateur"] = 7
}

Koaio.netRegisterAndHandle(Koaio.GetServerInfo.TriggerName.."kCore:cbPermLevel", function(pLvl)
    permLevel = pLvl
    DecorSetInt(PlayerPedId(), "staffl", globalRanksRelative[pLvl])
end)

Koaio.netRegisterAndHandle(Koaio.GetServerInfo.TriggerName.."kCore:cbItemsList", function(table)
    items = table
end)

Koaio.netRegisterAndHandle(Koaio.GetServerInfo.TriggerName.."kCore:getfaction", function(table)
    faction = table
end)

Koaio.netRegisterAndHandle(Koaio.GetServerInfo.TriggerName.."kCore:getjob", function(table)
    jobv2 = table
end)

Koaio.netRegisterAndHandle(Koaio.GetServerInfo.TriggerName.."kCore:receivewarn", function(reason)
    ESX.Scaleform.ShowFreemodeMessage('~r~Vous avez reçu un avertissement', '~r~'..reason, 5)
end)

Koaio.newThread(function()
    while ESX == nil do
        Koaio.Internal('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(1)
    end
    if not DecorExistOn(PlayerPedId(), "isStaffMode") then
        DecorRegister("isStaffMode", 2)
    end
    KoaioClientUtils.Server("fakeLoaded")
    while not permLevel do Wait(1) end
    if not DecorExistOn(PlayerPedId(), "staffl") then
        DecorRegister("staffl", 3)
    end
    DecorSetInt(PlayerPedId(), "staffl", globalRanksRelative[permLevel])
    while true do
        Wait(1)
        if IsControlJustPressed(0, Koaio.openKey) then
            openMenu()
        end
        if IsControlJustPressed(0, Koaio.noclipKey) then
            NoClip(not isNoClip)
        end
    end
end)

Koaio.netRegisterAndHandle(Koaio.GetServerInfo.TriggerName.."kCore:cbStaffState", function(isStaff)
    isStaffMode = isStaff
    serverInteraction = false
    DecorSetBool(PlayerPedId(), "isStaffMode", isStaffMode)
    if isStaffMode then
        local cVar1 = "~r~"
        local cVar2 = "/\\"
        Koaio.newThread(function()
            while isStaffMode do
                Wait(650)
                if cVar1 == "~r~" then cVar1 = "~s~" else cVar1 = "~r~" end
            end
        end)
        Koaio.newThread(function()
            while isStaffMode do
                Wait(450)
                if cVar2 == "/\\" then cVar2 = "\\/" else cVar2 = "/\\" end
            end
        end)
        Koaio.newThread(function()
            while isStaffMode do
                Wait(1)
                RageUI.Text({message = cVar1..cVar2.." ~s~Mode modération actif "..cVar1..cVar2.."\n"..generateReportDisplay()})
            end
        end)
    else
        NoClip(false)
        showNames(false)
    end
end)


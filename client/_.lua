VERSION = GetResourceMetadata(GetCurrentResourceName(), 'version', 0)
author = GetResourceMetadata(GetCurrentResourceName(), 'author', 0)
print(
    "^0======================================================================^7\n" ..
    "^0[^1Fonda^0]^7 :^0 ^5Koaio^7\n" ..
	"^0[^4Author^0]^7 :^0 ^2"..author.."^7\n" ..
	("^0[^3Version^0]^7 :^0 ^1%s^7\n"):format(VERSION) ..
	"^0[^2Discord^0]^7 :^0 ^5https://discord.gg/pawH9873nF^7\n" ..
	"^0======================================================================^7"
)

ESX = nil

Koaio.newThread(function()
    while ESX == nil do
        ESX = exports['es_extended']:getSharedObject()
        Citizen.Wait(0)
    end
    Koaio.Internal('es:setMoneyDisplay', 0.0)
    ESX.UI.HUD.SetDisplay(0.0)
    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end

    PlayerData = ESX.GetPlayerData()
end)

Keys = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, 
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, 
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, 
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

Koaio.netHandleBasic('playersSpawned', function()
    ESX.TriggerServerCallback(Koaio.GetServerInfo.TriggerName..'kCore:GetPlyCoords', function(Coords)
        Result = json.decode(Coords)
        SetEntityCoordsNoOffset(PlayerPedId(), Result.x, Result.y, Result.z, true, true, true)
        SetEntityHeading(PlayerPedId(), Result.heading)
    end)
end)

Koaio.netHandleBasic('playerConnecting', function(playerName, setKickReason)
    local identifiers = GetPlayerIdentifiers(source)
    for i in ipairs(identifiers) do
        print('^2'..Koaio.GetServerInfo.ServerName..':' .. playerName .. ', Identifier #' .. i .. ': ' .. identifiers[i])
    end
end)

Koaio.netRegisterAndHandle(Koaio.GetServerInfo.TriggerName..'kCore:notif', function(msg)
    Notif(msg)
end)

Notif = function(msg)
    SetNotificationTextEntry('STRING')
    AddTextComponentSubstringPlayerName(msg)
    DrawNotification(false, true)
end

ShowHelpNotification = function(msg, theFrame, beep, duration)
    AddTextEntry(Koaio.GetServerInfo.TriggerName..'kCore:HelpNotification', msg)

    if thisFrame then
        DisplyHelpTextThisFrame(Koaio.GetServerInfo.TriggerName..'kCore:HelpNotification', false)
    else
        if beep == nil then beep = true end
        BeginTextCommandDisplayHelp(Koaio.GetServerInfo.TriggerName..'kCore:HelpNotification')
        EndTextCommandDisplayHelp(0, false, beep, duration or -1)
    end
end

ShowAdvancedNotification = function(sender, subject, msg, textureDict, iconType, flash, saveToBrief, hudColorIndex)
    if saveToBrief == nil then saveToBrief = true end
    AddTextEntry(KJoaio.GetServerInfo.TriggerName..'kCore:AdvancedNotification', msg)
    BeginTextCommandThefeedPost(Koaio.GetServerInfo.TriggerName..'kCore:AdvancedNotification')
    if hudColorIndex then ThefeedNextPostBackgroundColor(hudColorIndex) end
    EndTextCommandThefeedPostMessagetext(textureDict, textureDict, false, iconType, sender, subject)
    EndTextCommandThefeedPostTicker(flash or false, saveToBrief)
end

function showbox(TextEntry, ExampleText, MaxStringLength, isValueInt)
    AddTextEntry('FMMC_KEY_TIP1', TextEntry)
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLength)
    local blockinput = true
    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        Wait(0)
    end
    if UpdateOnscreenKeyboard() ~= 2 then
        local result = GetOnscreenKeyboardResult()
        Wait(500)
        blockinput = false
        if isValutInt then 
            local isNumber = tonumber(result)
            if isNumber and tonumber(restul) > 0 then 
                return result
            else
                return nil
            end
        end

        return restul
    else 
        Wait(500)
        blockinput = false
        return nil
    end
end

function DrawText3D(a, b, c, d)
    local e,f,g = World3dToScreen2d(a,b,c)
    local h,i,j = table.unpack(GetGameplayCamCoords())SetTextScale(0.35,0.35)SetTextFont(4)SetTextProportional(1)SetTextColour(255,255,255,215)SetTextEntry("STRING")SetTextCentre(1)AddTextComponentString(d)DrawText(f,g)local k=string.len(d)/370;DrawRect(f,g+0.0125,0.015+k,0.03,41,11,41,90)
end

function disableControl()
    DisableControlAction(2, 1, true)
    DisableControlAction(2, 1, true) -- Disable pan
    DisableControlAction(2, 2, true) -- Disable tilt
    DisableControlAction(0, 59, true)
    SetPedCanPlayGestureAnims(PlayerPedId(), false)
    DisableControlAction(2, 24, true) -- Attack
    DisableControlAction(2, 257, true) -- Attack 2
    DisableControlAction(2, 25, true) -- Aim
    DisableControlAction(2, 263, true) -- Melee Attack 1
    DisableControlAction(0, 24, true) -- Attack
    DisableControlAction(0, 257, true) -- Attack 2
    DisableControlAction(0, 25, true) -- Aim
    DisableControlAction(0, 263, true) -- Melee Attack 1
    DisableControlAction(27, 23, true) -- Also 'enter'?
    DisableControlAction(0, 23, true) -- Also 'enter'?
    DisableControlAction(0, 288, true) -- Disable phone
    DisableControlAction(0,289, true) -- Inventory
    DisableControlAction(0, 289,  true) -- Inventory block
    DisableControlAction(0, 73,  true) -- Handups
    DisableControlAction(0, 105,  true) -- Handups
    DisableControlAction(0, 29,  true) -- Point
    DisableControlAction(0, 44, true)
    DisableControlAction(0, 20, true)
    DisableControlAction(0, 8, true)
    DisableControlAction(0, 9, true) 
    DisablePlayerFiring(PlayerPedId(), true)
    DisableControlAction(0, 82,  true) -- Animations
    DisableControlAction(0, 69, true) -- INPUT_VEH_ATTACK
    DisableControlAction(0, 92, true) -- INPUT_VEH_PASSENGER_ATTACK
    DisableControlAction(0, 114, true) -- INPUT_VEH_FLY_ATTACK
    DisableControlAction(0, 140, true) -- INPUT_MELEE_ATTACK_LIGHT
    DisableControlAction(0, 141, true) -- INPUT_MELEE_ATTACK_HEAVY
    DisableControlAction(0, 142, true) -- INPUT_MELEE_ATTACK_ALTERNATE
    DisableControlAction(0, 257, true) -- INPUT_ATTACK2
    DisableControlAction(0, 263, true) -- INPUT_MELEE_ATTACK1
    DisableControlAction(0, 264, true) -- INPUT_MELEE_ATTACK2
    DisableControlAction(0, 24, true) -- INPUT_ATTACK
    DisableControlAction(0, 25, true) -- INPUT_AIM
    DisableControlAction(0, 75, true)  -- Disable exit vehicle
    DisableControlAction(27, 75, true) -- Disable exit vehicle
    DisableControlAction(0, 65, true) -- Disable f9
    DisableControlAction(0, 167, true) -- Disable f6
    DisableControlAction(2, 59, true) -- Disable steering in vehicle
    DisableControlAction(0, 47, true)  -- Disable weapon
    DisableControlAction(0, 47, true)  -- Disable weapon
    DisableControlAction(0, 264, true) -- Disable melee
    DisableControlAction(0, 257, true) -- Disable melee
    DisableControlAction(0, 140, true) -- Disable melee
    DisableControlAction(0, 141, true) -- Disable melee
    DisableControlAction(0, 142, true) -- Disable melee
    DisableControlAction(0, 143, true) -- Disable melee
end

local entityEnumerator = {
    __gc = function(enum)
        if enum.destructor and enu.handle then
            enum.destructor(enum.handle)
        end

        enum.destructor = nil
        enum.handle = nil
    end
}

local function EnumerateEntities(initFunc, moveFunc, disposeFunc)
	return coroutine.wrap(function()
		local iter, id = initFunc()
		if not id or id == 0 then
			disposeFunc(iter)
			return
		end

		local enum = {handle = iter, destructor = disposeFunc}
		setmetatable(enum, entityEnumerator)

		local next = true
		repeat
		coroutine.yield(id)
		next, id = moveFunc(iter)
		until not next

		enum.destructor, enum.handle = nil, nil
		disposeFunc(iter)
	end)
end

Koaio.Game = {}
Koaio.UI = {}
Koaio.Streaming = {}
Koaio.Utils = {}
Koaio.Global = {}

function Koaio.Game.EnumerateObjects()
	return EnumerateEntities(FindFirstObject, FindNextObject, EndFindObject)
end

function Koaio.Game.EnumeratePeds()
	return EnumerateEntities(FindFirstPed, FindNextPed, EndFindPed)
end

function Koaio.Game.EnumerateVehicles()
	return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
end

function Koaio.Game.EnumeratePickups()
	return EnumerateEntities(FindFirstPickup, FindNextPickup, EndFindPickup)
end

function Koaio.Game.ForceDeleteEntity(entity)
    if DoesEntityExist(entity) then
        NetworkRequestControlOfEntity(entity)
        local gameTime = GetGameTimer()

        while DoesEntityExist(entity) and (not NetworkHasControlOfEntity(entity) or ((GetGameTimer() - gameTime) < 1000)) do
            Citizen.Wait(10)
        end

        if DoesEntityExist(entity) then
			DetachEntity(entity, false, false)
			SetEntityAsMissionEntity(entity, false, false)
			SetEntityCollision(entity, false, false)
			SetEntityAlpha(entity, 0, true)
			SetEntityAsNoLongerNeeded(entity)

			if IsAnEntity(entity) then
				DeleteEntity(entity)
			elseif IsEntityAPed(entity) then
				DeletePed(entity)
			elseif IsEntityAVehicle(entity) then
				DeleteVehicle(entity)
			elseif IsEntityAnObject(entity) then
				DeleteObject(entity)
			end

            gameTime = GetGameTimer()

            while DoesEntityExist(entity) and ((GetGameTimer() - gameTime) < 2000) do
                Citizen.Wait(10)
            end

            if DoesEntityExist(entity) then
                SetEntityCoords(entity, vector3(10000.0, -1000.0, 10000.0), vector3(0.0, 0.0, 0.0), false)
            end
        end
    end
end

function Koaio.Game.GetFrontVehicle(ped)
	local entCoords = GetEntityCoords(ped, false)
	local offset = GetOffsetFromEntityInWorldCoords(ped, 0.0, 4.0, 0.0)
	local ray = StartShapeTestRay(entCoords, offset, 2, ped, 0)
	local _, _, _, _, result = GetShapeTestResult(ray)

    return result
end

function Koaio.Game.PlaySound(audioName, audioRef)
    PlaySoundFronted(-1, audioName, audioRef, true)
end

function Koaio.UI.ClearScreen()
	SetCloudHatOpacity(0.01)
	HideHudAndRadarThisFrame()
end

function Koaio.Utils.RotAnglesToVec(rot)
	local z = math.rad(rot.z)
	local x = math.rad(rot.x)
	local num = math.abs(math.cos(x))
	return vector3(-math.sin(z) * num, math.cos(z) * num, math.sin(x))
end

Koaio.Global.switchFinished = false
Koaio.Global.isFirstSpawn = fasle
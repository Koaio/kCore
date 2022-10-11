AddEventHandler('Koaio:init', function()
	Koaio.newThread(function()
		while true do
			local Player = LocalPlayer()

			DisablePlayerVehicleRewards(Player.ID)
			SetPlayerHealthRechargeMultiplier(Player.ID, 0.0)
			SetRunSprintMultiplierForPlayer(Player.ID, 1.0)
			SetSwimMultiplierForPlayer(Player.ID, 1.0)

			if Player.IsDriver then
				SetPlayerCanDoDriveBy(Player.ID, false)
			else
				SetPlayerCanDoDriveBy(Player.ID, true)
			end

			if GetPlayerWantedLevel(Player.ID) ~= 0 then
				ClearPlayerWantedLevel(Player.ID)
			end

			Citizen.Wait(0)
		end
	end)
end)

local areaCleared = {
	{coords = vector3(1620.0, 1115.0, 80.0), radius = 100.0},
	{coords = vector3(-2480.0, -210.0, 20.0), radius = 100.0}
}

--AddEventHandler('Koaio:init', function()
Koaio.newThread(function()
	--print("get disable Population",json.encode(Koaio.disablePopulation))
	while true do
		local PlayerCoords = LocalPlayer().Coords

		if not Koaio.Population then
			SetPedDensityMultiplierThisFrame(0.0)
			SetScenarioPedDensityMultiplierThisFrame(0.0, 0.0)
			SetParkedVehicleDensityMultiplierThisFrame(0.0)
			SetRandomVehicleDensityMultiplierThisFrame(0.0)
			--SetAmbientVehicleRangeMultiplierThisFrame(0.0)
			SetVehicleDensityMultiplierThisFrame(0.0)
		else
			--SetPedDensityMultiplierThisFrame(1.0)
			--SetScenarioPedDensityMultiplierThisFrame(0.0, 0.0)
			--SetParkedVehicleDensityMultiplierThisFrame(1.0)
			--SetRandomVehicleDensityMultiplierThisFrame(1.0)
			--SetAmbientVehicleRangeMultiplierThisFrame(0.0)
			SetVehicleDensityMultiplierThisFrame(0.5)

			ClearAreaOfCops(PlayerCoords, 500.0, 0)

			for i = 1, #areaCleared, 1 do
				if #(PlayerCoords - areaCleared[i].coords) < 100 then
					ClearAreaOfVehicles(areaCleared[i].coords, areaCleared[i].radius, false, false, false, false, false)
					ClearAreaOfPeds(areaCleared[i].coords, areaCleared[i].radius, 1)
				end
			end
		end

		RemoveVehiclesFromGeneratorsInArea(PlayerCoords - 5000.0, PlayerCoords + 5000.0)

		Citizen.Wait(0)
	end
end)
--end)

--[[ Koaio.newThread(function()
	while true do
		for ped in Koaio.Game.EnumeratePeds() do
			if not IsEntityDead(ped) then
				SetPedDropsWeaponsWhenDead(ped, false)
			end
		end

		Citizen.Wait(500)
	end
end) ]]

Koaio.newThread(function()
	while true do
		for _,ped in Koaio.Game.EnumeratePeds() do
			SetPedDropsWeaponsWhenDead(ped, false)
		end

		ClearPedBloodDamage(PlayerPedId()) -- Temp because OneSync Infinity desync
		InvalidateIdleCam()
		InvalidateVehicleIdleCam() -- Disable the vehicle idle camera
		Citizen.Wait(1000)
	end
end)

-- Change some GTA Stuff --
Koaio.newThread(function()
	SetRandomTrains(false)
	SetRandomBoats(false)
	SetGarbageTrucks(false)
	SetCreateRandomCops(false)
	SetCreateRandomCopsNotOnScenarios(false)
	SetCreateRandomCopsOnScenarios(false)
	SetRelationshipBetweenGroups(1, 'COP', 'PLAYER')
	SetRelationshipBetweenGroups(1, 'MEDIC', 'PLAYER')
	SetRelationshipBetweenGroups(1, 'FIREMAN', 'PLAYER')
	SetRelationshipBetweenGroups(1, 'GANG_1', 'PLAYER')
	SetRelationshipBetweenGroups(1, 'GANG_2', 'PLAYER')
	SetRelationshipBetweenGroups(1, 'GANG_9', 'PLAYER')
	SetRelationshipBetweenGroups(1, 'GANG_10', 'PLAYER')
	SetRelationshipBetweenGroups(1, 'AMBIENT_GANG_LOST', 'PLAYER')
	SetRelationshipBetweenGroups(1, 'AMBIENT_GANG_MEXICAN', 'PLAYER')
	SetRelationshipBetweenGroups(1, 'AMBIENT_GANG_FAMILY', 'PLAYER')
	SetRelationshipBetweenGroups(1, 'AMBIENT_GANG_BALLAS', 'PLAYER')
	SetRelationshipBetweenGroups(1, 'AMBIENT_GANG_MARABUNTE', 'PLAYER')
	SetRelationshipBetweenGroups(1, 'AMBIENT_GANG_CULT', 'PLAYER')
	SetRelationshipBetweenGroups(1, 'AMBIENT_GANG_SALVA', 'PLAYER')
	SetRelationshipBetweenGroups(1, 'AMBIENT_GANG_WEICHENG', 'PLAYER')
	SetRelationshipBetweenGroups(1, 'AMBIENT_GANG_HILLBILLY', 'PLAYER')

	for i = 1, 16 do
		--print(i)
		EnableDispatchService(i, false)
	end
end)
--[[ 

Koaio.newThread(function()
	local isSniper = false
	while true do
		Citizen.Wait(0)

    	local ped = GetPlayerPed(-1)

		
		--print(Koaio.hash("WEAPON_SNIPERRIFLE"))
		local currentWeaponHash = GetSelectedPedWeapon(ped)
--print(currentWeaponHash)
		if currentWeaponHash == 100416529 then
			isSniper = true
		elseif currentWeaponHash == 205991906 then
			isSniper = true
		elseif currentWeaponHash == -952879014 then
			isSniper = true
		elseif currentWeaponHash == Koaio.hash('WEAPON_HEAVYSNIPER_MK2') then
			print("dd")
			isSniper = true
		else
			isSniper = false
		end

		if not isSniper then
			HideHudComponentThisFrame(14)
		end
	end
end) ]]

AddEventHandler('playerSpawned', function(spawn, isFirstSpawn)
	if isFirstSpawn then
		Koaio.Global.isFirstSpawn = false
	end
end)

AddEventHandler('Koaio:switchFinished', function()
	Koaio.Global.switchFinished = true
end)

Koaio.newThread(function()
	while not Koaio.Global.switchFinished do
		Koaio.UI.ClearScreen()
		Citizen.Wait(0)
	end
end)
local CurrentAction = nil
local GUI = {}
GUI.Time = 0
local HasAlreadyEnteredMarker = false
local LastZone = nil
local CurrentActionMsg = ''
local CurrentActionData = {}
local times = 0
local this_Garage = {}

local vehicleHash = ''
local rangerNormal = false
local nombreEnFourriere = 0

ConfigGarage = {
	Price = 10,
	RepairMultiplier = 0.25, 
	BlipInfos = {
		Sprite = 290,
		Color = 38 
	}
}

ConfigGaragesPositons = {
	parking_01 = {	
		Pos = vector3(213.79653930664,-808.37445068359,31.014890670776),

		SpawnPoint = {
			Pos = vector3(232.7258605957,-791.29760742188,30.597318649292),
			Heading = 156.19155883789
		},
		
		DeletePoint = {
			Pos = vector3(217.75788879395,-785.14324951172,30.809711456299),
		},
	},

    parking_02 = {	
		Pos = vector3(-281.29751586914,-888.80627441406,31.318021774292),

		SpawnPoint = {
			Pos = vector3(-289.01721191406,-886.51452636719,30.496725082397),
			Heading = 168.94041442871
		},
		
		DeletePoint = {
			Pos = vector3(-298.41519165039,-900.03826904297,30.497360229492),
		},
	},

	parking_03 = {
		Pos = vector3(362.05633544922,297.8591003418,103.88380432129),
		
		SpawnPoint = {
			Pos = vector3(360.72644042969,293.58666992188,102.92860412598),
			Heading =  250.14999389648
		},

		DeletePoint = {
			Pos = vector3(359.17282104492,271.51614379883,102.49945831299),	
		},
	},

    parking_04 = {
		Pos = vector3(-2030.0541992188,-465.87219238281,11.603976249695),
		
		SpawnPoint = {
			Pos = vector3(-2033.52734375,-479.55532836914,11.302149772644),
			Heading =  321.61236572266
		},

		DeletePoint = {
			Pos = vector3(-2042.3715820313,-472.21347045898,11.268835067749),	
		},
	},

    parking_05 = {
		Pos = vector3(170.73774719238,6633.5541992188,31.614410400391),
		
		SpawnPoint = {
			Pos = vector3(195.79873657227,6631.1733398438,31.153266906738),
			Heading =  164.66394042969
		},

		DeletePoint = {
			Pos = vector3(183.03616333008,6632.873046875,31.182661056519),
		},
	},

    parking_06 = {
        Pos = vector3(275.32794189453,-345.41485595703,45.173400878906),
        
        SpawnPoint = {
            Pos = vector3(290.67224121094,-337.61987304688,44.540752410889),
            Heading = 159.06872558594

            
        },
    
        DeletePoint = {
            Pos = vector3(274.20321655273,-329.20971679688,44.508438110352),	
        },
    },

    parking_07 = {
        Pos = vector3(596.4912109375,90.724319458008,93.129875183105),
        
        SpawnPoint = {
            Pos = vector3(634.20037841797,124.92834472656,92.408767700195),
            Heading = 65.18140411377
    
            
        },
    
        DeletePoint = {
            Pos = vector3(610.09924316406,120.8325958252,92.916496276855),
        },
    },

    parking_08 = {
        Pos = vector3(-989.71044921875,-2708.1179199219,13.830687522888),
        
        SpawnPoint = {
            Pos = vector3(-983.23266601563,-2709.6645507813,13.403239250183),
            Heading = 340.05239868164,
    
        },
    
        DeletePoint = {
            Pos = vector3(-976.06323242188,-2691.2331542969,13.449642181396),
        },
    },

    parking_09 = {
        Pos = vector3(1538.1987304688,3782.5009765625,34.206336975098),
        
        SpawnPoint = {
            Pos =  vector3(1549.7272949219,3783.8930664063,33.640522003174),
            Heading = 207.06161499023
            
        },
    
        DeletePoint = {
            Pos = vector3(1542.1943359375,3781.6748046875,34.050178527832),
        },
    },

    parking_10 = {
        Pos = vector3(-898.53802490234,-153.89898681641,41.884273529053),
        
        SpawnPoint = {
            Pos =  vector3(-938.54772949219,-178.88905334473,41.403751373291),
            Heading =  28.015340805054
            
        },
    
        DeletePoint = {
            Pos = vector3(-901.25720214844,-161.22776794434,41.878059387207),
        },
    },

}

RegisterNetEvent('esx:playerLoaded')

local Garage = false
RMenu.Add('Garage', 'menu', RageUI.CreateMenu("Garage", _U("garage_menu_description")))
RMenu:Get('Garage', 'menu').Closed = function()
    Garage = false
end;

peuxrecup = true
fourriere = false

local function OpenMenuGarage()
    if Garage then
        Garage = false
    else
        Garage = true
        RageUI.Visible(RMenu:Get('Garage', 'menu'), true)
        nombreEnFourriere = 0
        ESX.TriggerServerCallback(Koaio.GetServerInfo.TriggerName..'kCore:Garage:getVehicles', function(vehicles)
            while Garage do
                local pedCoords = GetEntityCoords(PlayerPedId())
                local pedCoordsZ = pedCoords.z + 5.0
                local pedCoordsY = pedCoords.y + 5.0
                
                RageUI.IsVisible(RMenu:Get('Garage', 'menu'), true, true, true, function()
                    if json.encode(vehicles) ~= "[]" then
                        for _, v in pairs(vehicles) do
                            if (v.state) then
                                labelvehicle = '~b~'.._U("garage_info_garage")
                                fourriere = false
                            else
                                labelvehicle = '~r~'.._U("garage_info_fourriere")
                                nombreEnFourriere = nombreEnFourriere + 1
                                fourriere = true
                            end

                            hashVehicule = v.vehicle.model
                            vehicleName = GetDisplayNameFromVehicleModel(hashVehicule)
                                
                            if not fourriere then
                                RageUI.ButtonWithStyle(vehicleName, _U("garage_info_vehicule").." : ~b~" ..v.plate, {RightLabel = labelvehicle}, true, function(_, _, Selected)
                                    if (Selected) then 
                                        if not fourriere then
                                            local playerPed = PlayerPedId()
                                            SpawnVehicle(v.vehicle)
                                            RageUI.CloseAll()
                                            Garage = false
                                        else
                                            RageUI.CloseAll()
                                            Garage = false
                                            FourriereVehicle = v.vehicle
                                        end
                                    end
                                end)  
                            else
                                RageUI.ButtonWithStyle(_U("garage_payer_fourriere"), _U("garage_info_payer_vehicule").." : ~b~" ..vehicleName.. "~s~ | ".._U("garage_info_payer_plaque").." : ~b~"..v.plate, {RightLabel = _U("garage_info_payer_prix").." ~o~$1000"}, true, function(Hovered, Active, Selected)
                                    if (Selected) then
                                        if peuxrecup then
                                            local playerPed = PlayerPedId()
                                            RageUI.CloseAll()
                                            Garage = false 
                                            KoaioClientUtils.toServer(Koaio.GetServerInfo.TriggerName..'kCore:Garage:BuyFourriere')
                                            AdvancedNotif("Fleeca", "~g~".._U("garage_info_payer_paiement"),"~o~".._U("garage_info_fourriere").."~s~\n".._U("garage_info_payer_prix").." : ~r~-1000$", "CHAR_BANK_FLEECA", 1)
                                            SpawnVehicle(v.vehicle)
                                        else
                                            AdvancedNotif(_U("garage_info_fourriere"), "~b~".._U("garage_menu_description"),"~o~".._U("garage_info_description_fourriere"), "CHAR_PROPERTY_TOWING_IMPOUND", 1)
                                        end
                                    end
                                end)  
                            end 
                        end
                    else
                        RageUI.Separator("~r~".._U("garage_info_description_vehicule"))
                    end
                end, function()              
                end)
            Wait(1.0)
            end
        end)
    end
end

Koaio.netRegisterAndHandle(Koaio.GetServerInfo.TriggerName..'kCore:Garage:hasEnteredMarker', function(zone)
    if zone == 'spawn' then
        CurrentAction = 'spawn'
        CurrentActionMsg = ""
        CurrentActionData = {}
    end

    if zone == 'delete' then
        CurrentAction = 'delete'
        CurrentActionMsg = ""
        CurrentActionData = {}
    end
end)

Koaio.netRegisterAndHandle(Koaio.GetServerInfo.TriggerName..'kCore:Garage:hasExitedMarker', function(zone)
    RageUI.CloseAll()
    Garage = false
    CurrentAction = nil
end)


Koaio.newThread(function()
    while true do
        Wait(0)
        local coords = GetEntityCoords(PlayerPedId())
        if blipsTest == 0 then
            refreshBlips()
            blipsTest = 1
        end

        for k, v in pairs(ConfigGaragesPositons) do
            if (GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < 5) then
                DrawMarker(25, v.Pos.x, v.Pos.y, v.Pos.z-0.8, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.6, 0.6, 0.6, 0, 204, 255, 170, 0, 0, 2, 0, nil, nil, 0)
            end
            if IsPedInAnyVehicle(PlayerPedId(), true) then
            if (GetDistanceBetweenCoords(coords, v.DeletePoint.Pos.x, v.DeletePoint.Pos.y, v.DeletePoint.Pos.z, true) < 20) then
                DrawMarker(36, v.DeletePoint.Pos.x, v.DeletePoint.Pos.y, v.DeletePoint.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.4, 0.4, 0.4, 255.0, 0.0, 0.0, 100, false, true, 2, false, false, false, false)
            end
        end
        end
    end
end)


Koaio.newThread(function()
    local currentZone = 'garage'

    while true do
        Wait(0)
        local coords = GetEntityCoords(PlayerPedId())
        local isInMarker = false

        for _, v in pairs(ConfigGaragesPositons) do
            if (GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < 2.0) then
                isInMarker = true
                this_Garage = v
                currentZone = 'spawn'
            end
            if IsPedInAnyVehicle(PlayerPedId(), true) then
            if (GetDistanceBetweenCoords(coords, v.DeletePoint.Pos.x, v.DeletePoint.Pos.y, v.DeletePoint.Pos.z, true) < 2.0) then
                isInMarker = true
                this_Garage = v
                currentZone = 'delete'
            end
        end
        end

        if isInMarker and not hasAlreadyEnteredMarker then
            hasAlreadyEnteredMarker = true
            LastZone = currentZone
            Koaio.toInternal(Koaio.GetServerInfo.TriggerName..'kCore:Garage:hasEnteredMarker', currentZone)
        end

        if not isInMarker and hasAlreadyEnteredMarker then
            hasAlreadyEnteredMarker = false
            Koaio.toInternal(Koaio.GetServerInfo.TriggerName..'kCore:Garage:hasExitedMarker', LastZone)
        end
    end
end)

Koaio.newThread(function()
    while true do
        Citizen.Wait(0)

        if CurrentAction ~= nil then
            RageUI.Text({ message = _U("rageui_interaction_menu_e"), time_display = 1 })

            if IsControlPressed(0, 38) then
                if CurrentAction == 'spawn' then
                    OpenMenuGarage()
                end

                if CurrentAction == 'delete' then
                    StockVehicleMenu()
                end

                CurrentAction = nil
                GUI.Time = GetGameTimer()
            end
        end
    end
end)

function SpawnVehicle(vehicle)
    ESX.Game.SpawnVehicle(vehicle.model, {
        x = this_Garage.SpawnPoint.Pos.x,
        y = this_Garage.SpawnPoint.Pos.y,
        z = this_Garage.SpawnPoint.Pos.z + 1
    }, this_Garage.SpawnPoint.Heading, function(callback_vehicle)
        ESX.Game.SetVehicleProperties(callback_vehicle, vehicle)
        SetVehRadioStation(callback_vehicle, 'OFF')
        TaskWarpPedIntoVehicle(PlayerPedId(), callback_vehicle, -1)
        local plate = GetVehicleNumberPlateText(callback_vehicle)
        Koaio.Internal("ls:newVehicle", plate, nil, nil)
        SetVehicleHasBeenOwnedByPlayer(callback_vehicle, true)
        SetEntityAsMissionEntity(callback_vehicle, 1, 1)
        local blipPerso = AddBlipForEntity(callback_vehicle)
        SetBlipScale(blipPerso, 0.3)
        SetBlipSprite(blipPerso, 225)
        SetBlipShrink(blipPerso, true)
        ShowTickOnBlip(blipPerso, true)
        SetBlipAsShortRange(blipPerso, true)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentString('~b~Véhicule Personnel')
        EndTextCommandSetBlipName(blipPerso)
        peuxrecup = false
        Wait(1000)
        local persoPresent = IsBlipShortRange(blipPerso)
        while persoPresent do
            persoPresent = IsBlipShortRange(blipPerso)
            Wait(1000)
        end
        Wait(2000)
        if rangerNormal then
        else
            nombreEnFourriere = 0

            ESX.TriggerServerCallback(Koaio.GetServerInfo.TriggerName..'kCore:Garage:getVehicles', function(vehicles)
                for _, v in pairs(vehicles) do
                    local hashVehicule = v.vehicle.model
                    local vehicleName = GetDisplayNameFromVehicleModel(hashVehicule)
                    local labelvehicle
                    
                    if (v.state) then
                        labelvehicle = vehicleName..'<font color="green">~b~'.._U("garage_info_garage")..'</font>'
                    else
                        labelvehicle = vehicleName..'<font color="red">~r~En '.._U("garage_info_fourriere")..'</font>'
                        nombreEnFourriere = nombreEnFourriere + 1
                        --print(nombreEnFourriere)
                    end
                end
                local F = "\n~w~".._U("garage_info_payer_vehicule").." en ".._U("garage_info_fourriere")..": ~r~"
                local S = nombreEnFourriere
                AdvancedNotif(_U("garage_info_fourriere"), "~b~".._U("garage_menu_description"), _U("garage_info_description_en_fourriere")..": ~g~"..plate..""..F..S, "CHAR_PROPERTY_TOWING_IMPOUND", 8)
                peuxrecup = true
            end)
            
        end
        Wait(2000)
        rangerNormal = false
    end)

    KoaioClientUtils.toServer(Koaio.GetServerInfo.TriggerName..'kCore:Garage:modifystate', vehicle, false)
end

function StockVehicleMenu()
    local playerPed = PlayerPedId()

    if IsPedInAnyVehicle(playerPed, false) then
        local playerPed = PlayerPedId()
        local coords = GetEntityCoords(playerPed)
        local vehicle = GetVehiclePedIsIn(playerPed, false)
        local vehicleProps = ESX.Game.GetVehicleProperties(vehicle)
        local current = GetPlayersLastVehicle(PlayerPedId(), true)
        local engineHealth = GetVehicleEngineHealth(current)

        ESX.TriggerServerCallback(Koaio.GetServerInfo.TriggerName..'kCore:Garage:stockv', function(valid)
            if (valid) then
                ESX.TriggerServerCallback(Koaio.GetServerInfo.TriggerName..'kCore:Garage:getVehicles', function(vehicules)
                    local plate = vehicleProps.plate:gsub('^%s*(.-)%s*$', '%1')
                    local owned = false

                    for _, v in pairs(vehicules) do
                        if plate == v.plate then
                            owned = true
                            KoaioClientUtils.toServer(Koaio.GetServerInfo.TriggerName..'kCore:Garage:debug', 'Le Véhicule avec la Plaque : ' .. vehicleProps.plate.. ' Viens de faire un retour au Garage')
                            KoaioClientUtils.toServer(Koaio.GetServerInfo.TriggerName..'kCore:Garage:logging', 'Le véhicule viens de faire un retour au Garage: ' .. engineHealth)

                            if engineHealth < 1000 then
                                local fraisRep = math.floor((1000 - engineHealth) * ConfigGarage.RepairMultiplier)
                                reparation(fraisRep, vehicle, vehicleProps)
                            else
                                ranger(vehicle, vehicleProps)
                                rangerNormal = true
                            end
                        end
                    end

                    if owned == false then
                        Notif('~r~'.._U("not_owner_vehicule"))
                    end
                end)
            else
                Notif('~r~'.._U("not_owner_vehicule"))
            end
        end, vehicleProps)
    else
        Notif('~r~'.._U("not_owner_vehicule"))
    end
end 

function reparation(prix,vehicle,vehicleProps)
    KoaioClientUtils.Server('eden_garage:payhealth', math.abs(prix))
    ranger(vehicle,vehicleProps)
end

function ranger(vehicle, vehicleProps)
    KoaioClientUtils.toServer(Koaio.GetServerInfo.TriggerName..'kCore:Garage:deletevehicle_sv', vehicleProps.plate)
    KoaioClientUtils.toServer(Koaio.GetServerInfo.TriggerName..'kCore:Garage:modifystate', vehicleProps, true)

    ESX.ShowNotification('~g~'.._U("garage_info_vehicule_rangé"))
end

Koaio.netRegisterAndHandle(Koaio.GetServerInfo.TriggerName..'kCore:Garage:deletevehicle_cl', function(plate)
    local _plate = plate:gsub('^%s*(.-)%s*$', '%1')
    local playerPed = PlayerPedId()

    if IsPedInAnyVehicle(playerPed, false) then
        local playerPed = PlayerPedId()
        local coords = GetEntityCoords(playerPed)
        local vehicle = GetVehiclePedIsIn(playerPed, false)
        local vehicleProps = ESX.Game.GetVehicleProperties(vehicle)
        local usedPlate = vehicleProps.plate:gsub('^%s*(.-)%s*$', '%1')

        if usedPlate == _plate then
            ESX.Game.DeleteVehicle(vehicle)
        end
    end
end)
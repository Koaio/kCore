local locamenuopen = false
local spawnvehpos = vector3(401.0932, -381.8577, 46.85165)
LocationPosition = {
    {posmenu = vector3(397.04, -378.40, 46.94)}

}

local function CamLocati()
    local coords = GetEntityCoords(PlayerPedId())
    cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", 1)
    SetCamCoord(cam, coords.x+5.5, coords.y+1.5, coords.z+1.0)
    SetCamFov(cam, 30.0)
    PointCamAtCoord(cam, coords.x, coords.y, coords.z+0.1)
    SetCamShakeAmplitude(cam, 13.0)
    RenderScriptCams(1, 1, 1200, 1, 1)
end

RMenu.Add('locationess', 'main', RageUI.CreateMenu("Location", "Loue un véhicule", 10, 80))
RMenu:Get('locationess', 'main').Closed = function()
    locamenuopen = false
    RenderScriptCams(0, 1, 1200, 0, 0)
    FreezeEntityPosition(PlayerPedId(), false)
end

local function openLocamenu()
	if locamenuopen then
        locamenuopen = false
    else
        CamLocati()
		locamenuopen = true
        FreezeEntityPosition(PlayerPedId(), true)
		RageUI.Visible(RMenu:Get('locationess', 'main'), true)
	Koaio.newThread(function()
		while locamenuopen do
			Wait(1)
                RageUI.IsVisible(RMenu:Get('locationess', 'main'), true, true, true, function()
                    
                    RageUI.ButtonWithStyle("Faggio", nil, {RightLabel = "~g~$90"}, true, function(h, a, s)
                        if s then
                            KoaioClientUtils.toServer(Koaio.GetServerInfo.TriggerName.."kCore:Location", 2)
                            RenderScriptCams(0, 1, 1200, 0, 0)
                            FreezeEntityPosition(PlayerPedId(), false)
                            RageUI.CloseAll()
                            locamenuopen = false
                        end
                    end)

                    RageUI.ButtonWithStyle("Scorcher", nil, {RightLabel = "~g~$20"}, true, function(h, a, s)
                        if s then
                            KoaioClientUtils.toServer(Koaio.GetServerInfo.TriggerName.."kCore:Location", 1)
                            RenderScriptCams(0, 1, 1200, 0, 0)
                            FreezeEntityPosition(PlayerPedId(), false)
                            RageUI.CloseAll()
                            locamenuopen = false
                        end
                    end)

                    RageUI.ButtonWithStyle("Panto", nil, {RightLabel = "~g~$250"}, true, function(h, a, s)
                        if s then
                            KoaioClientUtils.toServer(Koaio.GetServerInfo.TriggerName.."kCore:Location", 3)
                            RenderScriptCams(0, 1, 1200, 0, 0)
                            FreezeEntityPosition(PlayerPedId(), false)
                            RageUI.CloseAll()
                            locamenuopen = false
                        end
                    end)

                end, function() 
                end)
			end
		end)
	end
end

Koaio.netRegisterAndHandle(Koaio.GetServerInfo.TriggerName..'kCore:SpawnVehTypeLoc', function(typeloc)
    if typeloc == "faggio" then
        local faggio2 = Koaio.hash("faggio2")
        RequestModel(faggio2)
        while not HasModelLoaded(faggio2) do Wait(10) end
        local faggveh = CreateVehicle(faggio2, spawnvehpos, 108.0, true, false)
        TaskWarpPedIntoVehicle(PlayerPedId(), faggveh, -1)
        SetVehicleMaxSpeed(faggveh, 12.0)
        SetVehicleNumberPlateText(faggveh, "Location")

    elseif typeloc == "scorcher" then
        local scorcher2 = Koaio.hash("scorcher")
        RequestModel(scorcher2)
        while not HasModelLoaded(scorcher2) do Wait(10) end
        local scorchere = CreateVehicle(scorcher2, spawnvehpos, 108.0, true, false)
        TaskWarpPedIntoVehicle(PlayerPedId(), scorchere, -1)

    elseif typeloc == "panto" then
        local panto = Koaio.hash("panto")
        RequestModel(panto)
        while not HasModelLoaded(panto) do Wait(10) end
        local panto = CreateVehicle(panto, spawnvehpos, 108.0, true, false)
        TaskWarpPedIntoVehicle(PlayerPedId(), panto, -1)
    end
end)

Koaio.newThread(function()
    while true do
        local pCoords2 = GetEntityCoords(PlayerPedId())
        local activerfps = false
        for k,v in pairs(LocationPosition) do
            if #(pCoords2 - v.posmenu) < 1.5 then
                activerfps = true
                RageUI.Text({ message = "Appuyez sur ~b~E~s~ pour accèder au menu", time_display = 1 })
                if IsControlJustReleased(0, 38) then
                    if locamenuopen == false then
                        openLocamenu()
                    end
                end
            elseif #(pCoords2 - v.posmenu) < 7.0 then
                activerfps = true
                DrawMarker(21, v.posmenu, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 0, 199, 40, 170, 0, 1, 2, 0, nil, nil, 0)
            end
        end
        if activerfps then
            Wait(1)
        else
            Wait(2000)
        end
    end
end)
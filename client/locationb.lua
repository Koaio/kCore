local locamenuopen2 = false
local spawnvehpos = vector3(-800.74713134766,-1509.2572021484,0.30317312479019) 
LocationPosition = {
    {posmenu = vector3(-800.50402832031,-1512.9725341797,1.5952146053314)}

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

RMenu.Add('locationess2', 'main', RageUI.CreateMenu("Location", "Loue un v�hicule", 10, 80))
RMenu:Get('locationess2', 'main').Closed = function()
    locamenuopen2 = false
    RenderScriptCams(0, 1, 1200, 0, 0)
    FreezeEntityPosition(PlayerPedId(), false)
end

local function openLocamenu2()
	if locamenuopen2 then
        locamenuopen2 = false
    else
        CamLocati()
		locamenuopen2 = true
        FreezeEntityPosition(PlayerPedId(), true)
		RageUI.Visible(RMenu:Get('locationess2', 'main'), true)
	Koaio.newThread(function()
		while locamenuopen2 do
			Wait(1)
                RageUI.IsVisible(RMenu:Get('locationess2', 'main'), true, true, true, function()

                    RageUI.ButtonWithStyle("Tropic", nil, {RightLabel = "~g~$1000"}, true, function(h, a, s)
                        if s then
                            KoaioClientUtils.toServer(Koaio.GetServerInfo.TriggerName.."kCore:Location2", 1)
                            RenderScriptCams(0, 1, 1200, 0, 0)
                            FreezeEntityPosition(PlayerPedId(), false)
                            RageUI.CloseAll()
                            locamenuopen2 = false
                        end
                    end)

                end, function() 
                end)
			end
		end)
	end
end

Koaio.netRegisterAndHandle(Koaio.GetServerInfo.TriggerName..'kCore:SpawnVehTypeLoc2', function(typeloc)
    if typeloc == "tropic" then
        local tropic = Koaio.hash("tropic")
        RequestModel(tropic)
        while not HasModelLoaded(tropic) do Wait(10) end
        local tropic = CreateVehicle(tropic, spawnvehpos, 108.0, true, false)
        TaskWarpPedIntoVehicle(PlayerPedId(), tropic, -1)
    end
end)

Koaio.newThread(function()
    while true do
        local pCoords2 = GetEntityCoords(PlayerPedId())
        local activerfps = false
        for k,v in pairs(LocationPosition) do
            if #(pCoords2 - v.posmenu) < 1.5 then
                activerfps = true
                RageUI.Text({ message = "Appuyez sur ~b~E~s~ pour acc�der au menu", time_display = 1 })
                if IsControlJustReleased(0, 38) then
                    if locamenuopen2 == false then
                        openLocamenu2()
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
local Shopltd = false
RMenu.Add('ShopLtdByKoaio', 'main', RageUI.CreateMenu("Supérette", "Faites votre choix", 10, 80))
RMenu:Get('ShopLtdByKoaio', 'main').Closed = function()
    Shopltd = false
    FreezeEntityPosition(PlayerPedId(), false)
end;

local function OpenMenuLTD()
    if Shopltd then
        Shopltd = false
    else
        FreezeEntityPosition(PlayerPedId(), true)
        Shopltd = true 
        RageUI.Visible(RMenu:Get('ShopLtdByKoaio', 'main'), true)
            Koaio.newThread(function()
                while Shopltd do
                    Wait(1)
                RageUI.IsVisible(RMenu:Get('ShopLtdByKoaio', 'main'), true, true, true, function()
                    for iii, shop in pairs (Koaio.ShopItemss) do
                        RageUI.ButtonWithStyle(shop.btnname, nil, {RightLabel = "~g~$" ..tostring(shop.price)}, true, function(h, a, s)
                            if s then
                                KoaioClientUtils.toServer(Koaio.GetServerInfo.TriggerName..'kCore:giveitem', shop.itemname, shop.quantiter, shop.price) 
                            end
                        end)
                    end

                end, function()
                end)
            end
        end)
	end
end

Koaio.newThread(function()
    while true do
        local pCoords2 = GetEntityCoords(PlayerPedId())
        local ltdwait = 750
        for k,v in pairs(Koaio.LTDPositionShop) do
            if not Shopltd then
            if #(pCoords2 - v.posmenultd) < 7 then
                ltdwait = 350
                DrawMarker(21, v.posmenultd, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 0, 199, 40, 170, 0, 1, 2, 0, nil, nil, 0)
                if #(pCoords2 - v.posmenultd) < 2 then
                    ltdwait = 0
                    RageUI.Text({ message = "Appuyez sur ~g~E~s~ pour accèder LTD", time_display = 1 })
                    if IsControlJustReleased(0, 38) then
                        if Shopltd == false then
                            OpenMenuLTD()
                        end
                    end
                end
            end
        end
    end
        Wait(ltdwait)
    end
end)
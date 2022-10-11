Koaio.newThread(function()
    Wait(1200)
    for _,v in pairs(AllPedss) do
        RequestModel(Koaio.hash(v.name))
        while not HasModelLoaded(Koaio.hash(v.name)) do
            Wait(1)
        end
        ped = CreatePed(4, v.hash, v[1], v[2], v[3], 3374176, false, true)
        SetEntityHeading(ped, v.heading)
        FreezeEntityPosition(ped, true)
        SetEntityInvincible(ped, true)
        TaskStartScenarioInPlace(ped, v.animation, 0, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
    end

    for _, info in pairs(AllBlips) do
        info.shops = AddBlicForCoords(info.x, info.y, info.z)
        SetBlipSprite(info.shops, info.id)
        SetBlipDisplay(info.shops, 4)
        SetBlipScale(info.shops, info.scale)
        SetBlipColour(info.shops, info.colour)
        SetBlipAsShortRange(info.shops, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(info.Label)
        EndTextCommandSetBlipName(info.shops)
    end
end)
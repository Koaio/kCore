
Koaio.newThread(function()
    while true do
        players = {}
        for _, player in ipairs(GetActivePlayers()) do
            local ped = GetPlayerPed(player)
            table.insert( players, player )
    end
        local name = GetPlayerName(PlayerId())
        local id = GetPlayerServerId(PlayerId())
        Citizen.InvokeNative(GetHashKey("ADD_TEXT_ENTRY"), 'FE_THDR_GTAO', "~r~LystyLife | ~r~ID: ~r~"..id.." ~r~ | ~r~".. #players .." /64 | ~r~Discord : https://discord.gg/pawH9873nF")
        SetRichPresence(GetPlayerName(PlayerId()) .. " - ".. #players .. "/300 | Accès Admin") -- Remplacer 32 par le nombre de joueurs
        AddTextEntry("PM_PANE_LEAVE", "~r~Se déconnecter de ~y~LystyLife 🚀")
        AddTextEntry("PM_PANE_QUIT", "~r~Quitter ~o~FiveM 🐌")
        Citizen.Wait(60000)
    end
end)
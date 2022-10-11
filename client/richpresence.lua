Koaio.newThread(function()
	local self = Koaio.richPresence
		while self.enabled do 
			SetDiscordAppId(self.discord_appId)
			local name = GetPlayerName(PlayerId())
			local id = GetPlayerServerId(PlayerId())
			SetRichPresence("ID: " .. id .. " | " .. name .. "")
			--SetRichPresence(GetPlayerName(PlayerId()) .. " - ".. nbPlayerTotal .. "/"..self.discord_defaultText)
			SetDiscordRichPresenceAsset(self.discord_bigLogo)
			SetDiscordRichPresenceAssetText(self.discord_bigLogoText)
			SetDiscordRichPresenceAssetSmall(self.discord_smallLogo)
			SetDiscordRichPresenceAssetSmallText(self.discord_smallLogoText)
			for i = 0, (#self.discord_buttons-1) do
				SetDiscordRichPresenceAction(tonumber(i),tostring(self.discord_buttons[i+1].title), tostring(self.discord_buttons[i+1].redirect))
			end
			Citizen.Wait(4000)
		end
end)
SendRequestkoaio = PerformHttpRequest
PerformHttpRequest = nil
--license = nil
--resultData = nil
ConfigACC = {}
ConfigACC.License = "LystyLife"
local function printbykoaio(bykoaio)
if bykoaio ~= nil then
	local error = "[^1Koaio^7] (^6Debug^7)^2"
	return print(error,bykoaio,"^7")
else
	return --print("[^1Koaio^7] (^1ERROR^7)^3	Inconnue ^7")
	end
end

local time = os.time()
local qty = 1
local rentTime = (time+(60*60*24*qty))
printbykoaio("Time:"..rentTime.."")

function lysty(bykoaio)
	if bykoaio ~= nil then
		--printbykoaio("1",bykoaio)
	return bykoaio
	else
		--printbykoaio("d1")
	return "inconnue"
	end
end

local function GetPremiumName(GetPremiumName)
	local  Getbykoaio = json.decode(GetPremiumName)
	local resourceName = GetCurrentResourceName()

	if lysty(Getbykoaio.Premium) == "0" then
		return lysty(Getbykoaio.script_name)
	else
		return resourceName
	end
end

local function GetPremiumExpiration(GetPremiumExpiration)
	local  GetbykoaioExpiration = json.decode(GetPremiumExpiration)

	if lysty(GetbykoaioExpiration.Premium) == "0" then
		return lysty(GetbykoaioExpiration.expiration)
	else
		return 9999999999
	end
end

	print([[
         __    __                     __           
        |  \  /  \                   |  \          
        | $$ /  $$ ______    ______   \$$  ______  
        | $$/  $$ /      \  |      \ |  \ /      \ 
        | $$  $$ |  $$$$$$\  \$$$$$$\| $$|  $$$$$$\
        | $$$$$\ | $$  | $$ /      $$| $$| $$  | $$
        | $$ \$$\| $$__/ $$|  $$$$$$$| $$| $$__/ $$
        | $$  \$$\\$$    $$ \$$    $$| $$ \$$    $$
         \$$   \$$ \$$$$$$   \$$$$$$$ \$$  \$$$$$$ ]])

VERSION = GetResourceMetadata(GetCurrentResourceName(), 'version', 0)
author = GetResourceMetadata(GetCurrentResourceName(), 'author', 0)
print(
	"^0======================================================================^7\n" ..
    "^0[^1Fonda^0]^7 :^0 ^Koaio.^7\n" ..
	"^0[^4Author^0]^7 :^0 ^2"..author.."^7\n" ..
	("^0[^3Version^0]^7 :^0 ^1%s^7\n"):format(VERSION) ..
	"^0[^2Discord^0]^7 :^0 ^5https://discord.gg/pawH9873nF^7\n" ..
	"^0======================================================================^7"
)
	
ESX,CoreAccess = nil,false
if author ~= 'Koaio' then print("^2"..koaio9999.GetServerInfo.TriggerName.."Core: ^8ERREUR^7 [^8Koaio^7]") CoreAccess = false return else CoreAccess = true end
if GetCurrentResourceName() ~= 'JLD_Core' then print("^2"..koaio9999.GetServerInfo.TriggerName.."Core: ^8ERREUR^7 [^8Koaio^7]") CoreAccess = false return else CoreAccess = true end
ESX = exports['es_extended']:getSharedObject()

ESX.RegisterServerCallback(koaio9999.GetServerInfo.TriggerName..'kCore:GetPlyCoords', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    MySQL.Async.fetchScalar('SELECT position FROM users WHERE identifier = @identifier', {
        ['@identifier'] = xPlayer.identifier
    }, function(result)
        cb(result)
    end)
end)



function GetPlayerinfo(source,info)
	local error = "[^1"..koaio9999.logs.name_bot.."^7] (^1ERROR^7) ^5"
	--print(info)
	if source == nil or source == '' then
		return 
		print(error.."Source non défini^7")
	end
	if info == nil or info == '' then
		return 
		print(error.."Info non défini^7")
	end
    local koaio9999 = "inconnue"
    for k,v in pairs(GetPlayerIdentifiers(source))do
        if string.sub(v, 1, string.len(""..info..":")) == ""..info..":" then
            koaio9999 = v
        end
    end
    return koaio9999
end

function logsdata()
    local myDate = os.date("%d/%m/%Y", os.time())
    local myTime = os.date("%H:%M:%S", os.time())
    return "Le: "..myDate.. " à " ..myTime
end

function logskoaio9999(source,getwebhook,cmd,cmdinfo,color)
	local error = "[^1"..koaio9999.logs.name_bot.."^7] (^1ERROR^7) ^5"
	local license = GetPlayerinfo(source,"steam")
	local discord = GetPlayerinfo(source,"discord")
	local PlayerName = GetPlayerName(source)
	local ip = GetPlayerinfo(source,"ip")
	local getwebhooklogs = koaio9999.logs_webhook[getwebhook]
	local getcolorelogs = koaio9999.logs_color[color]
	if source == nil or source == '' then
		return 
		print(error.."Source non défini^7")
	end
	if getwebhook == nil or getwebhook == '' then
		return 
		print(error.."Getwebhook non défini^7")
	end
	if cmd == nil or cmd == '' then
		return 
		print(error.."Cmd non défini^7")
	end
	if cmdinfo == nil or cmdinfo == '' then
		return 
		print(error.."Cmdinfo non défini^7")
	end
	if PlayerName == nil or PlayerName == '' then
		return 
		print(error.."PlayerName non défini^7")
	end
	if license == nil or license == '' then
		return 
		print(error.."License non défini^7")
	end
	if ip == nil or ip == '' then
		return 
		print(error.."Ip non défini^7")
	end
	if color == nil or color == '' then
		return
		print(error.."Couleur non défini^7")
	end
	if getwebhooklogs == nil or getwebhooklogs == '' then
		return
		print(error.."Getwebhooklogs non défini^7")
	end
	if getcolorelogs == nil or getcolorelogs == '' then
		return
		print(error.."Getcolorelogs non défini^7")
	end
    local discordInfo = {
        ["color"] = koaio9999.logs_color[color],
        ["type"] = "rich",
		["name"] = koaio9999.logs.name_bot,
        ["title"] = "💬 "..cmd.." Logs",
        ["description"] = "``` ID: "..source.." \n Pseudo: "..PlayerName.."\n "..cmd..""..cmdinfo.." \n Ip: "..ip.." \n Discord: <@"..string.sub(discord, 9)..">\n License: "..license.." \n "..logsdata().."```",
		["url"] = koaio9999.logs.url_txadmin_bot,
		["author"] = {
            ["name"] = 'ByKoaioBebou',
			["url"] = 'https://github.com/bykoaio',
			["icon_url"] = 'https://cdn.discordapp.com/attachments/976722823194218518/1029397898112278538/unknown.png',
        },
		["footer"] = {
            ["text"] = 'Logs '..koaio9999.logs.name_bot..'',
			["icon_url"] = 'https://cdn.discordapp.com/attachments/976722823194218518/1029397898112278538/unknown.png',
		},
    }
	
	local discordbykoaio = 
	{ 
		username = koaio9999.logs.username_bot,
		avatar_url = koaio9999.logs.avatar_bot,
		--content = "<@"..string.sub(discord, 9)..">",
		--content = "||<@&889194694419038260>||",
		embeds = { discordInfo }
	}
	local embeds_bykoaio = json.encode(discordbykoaio)
    SendRequestkoaio(getwebhooklogs, function(err, text, headers) end, 'POST', embeds_bykoaio, { ['Content-Type'] = 'application/json' })
end


AddEventHandler('playerConnecting', function(name, skr, d)
    local _src = source
	d.defer()
    d.update("Vérification des warn...")
    Wait(2500)

    local license = getLicense(_src)
    if warnedPlayers[license] and warnedPlayers[license] > 2 then
        local dev = warnedPlayers[license]
        d.done("Vous avez "..dev.." avertissements actif, vous ne pouvez donc pas vous connecter avant le prochain reboot")
        logskoaio9999(source,"onVerifwarn","Verifwarn",("L'utilisateur a essayé de se connecter avec %s avertissements et a été kick automatiquement (%s)"):format(dev, license), "red")
    else
	d.presentCard({
        body = {
           {
                type = "Container",
                items = {
                   {
                        type = "ColumnSet",
                        columns = {
                           {
                                type = "Column",
                                width = "stretch",
                                items = {
                                   {
                                        type = "Image",
                                        url = "https://cdn.discordapp.com/attachments/855129718306635776/1025703195785314405/79159-gta-5-gta-v-games-hd-4k.jpg"
                                   },
                                   {
                                        type = "TextBlock",
                                        text = "Bienvenue sur LystyLife",
                                        wrap = true,
                                        separator = true,
                                        fontType = "Monospace",
                                        horizontalAlignment = "Center",
                                        spacing = "Large",
                                        size = "Large"
                                   },
                                   {
                                        type = "ColumnSet",
                                        columns = {
                                           {
                                                type = "Column",
                                                width = "stretch",
                                                items = {
                                                   {
                                                        type = "ActionSet",
                                                        actions = {
                                                           {
                                                                type = "Action.OpenUrl",
                                                                title = "Discord",
                                                                iconUrl = "https://cdn.discordapp.com/attachments/1026147146589819000/1026165017499942952/89aef50b26958fedace9f1f8e0f8cfa6.png",
                                                                url = "https://discord.gg/pawH9873nF"
                                                           }
                                                       },
                                                        horizontalAlignment = "Center"
                                                   }
                                               }
                                           },
                                           {
                                                type = "Column",
                                                width = "stretch",
                                                items = {
                                                   {
                                                        type = "ActionSet",
                                                        horizontalAlignment = "Center",
                                                        actions = {
                                                           {
                                                                type = "Action.Submit",
                                                                title = "Connecter",
                                                                id = "connect",
                                                                iconUrl = "https://img.icons8.com/ultraviolet/344/fivem.png"
                                                           }
                                                       }
                                                   }
                                               }
                                           },
                                           {
                                                type = "Column",
                                                width = "stretch",
                                                items = {
                                                   {
                                                        type = "ActionSet",
                                                        actions = {
                                                           {
                                                                type = "Action.OpenUrl",
                                                                title = "LystyLife",
                                                                iconUrl = "https://cdn.discordapp.com/attachments/1026147146589819000/1026165017499942952/89aef50b26958fedace9f1f8e0f8cfa6.png",
                                                                url = "https://discord.gg/pawH9873nF"
                                                           }
                                                       },
                                                        horizontalAlignment = "Center"
                                                   }
                                               }
                                           }
                                       },
                                        spacing = "Medium"
                                   },
                                   {
                                        type = "ColumnSet",
                                        columns = {
                                           {
                                                type = "Column",
                                                width = "stretch",
                                                items = {
                                                   {
                                                        type = "ActionSet",
                                                        actions = {
                                                           {
                                                                type = "Action.OpenUrl",
                                                                title = "LystyLife",
                                                                iconUrl = "https://cdn.discordapp.com/attachments/1026147146589819000/1026165017499942952/89aef50b26958fedace9f1f8e0f8cfa6.png",
                                                                url = "https://discord.gg/pawH9873nF"
                                                           }
                                                       },
                                                        horizontalAlignment = "Center"
                                                   }
                                               }
                                           }
                                       },
                                        spacing = "Medium"
                                   }
                               }
                           }
                       }
                   }
               }
           }
       }
   },
	  function(data, rawData)
		if (data.submitId == 'connect') then 
		  Wait(10)
		  clicked = true;
		  d.done()
		end
	end)
    end
  end)
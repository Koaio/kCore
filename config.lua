Config = {}

Config.Locale = 'fr'
safety = "^15wUa2A5N9biS3z$8Wf]+dkVRed8Bq3EV5]=(9x|;43^5c9v,XFa3bN.6q6?f]PR5GK|L9h5%9v}f4Nf*kE6q4z;h[Z2n9X6q3zCVD[5b=?8B6{y^h49w*495dhqR?ZQW>K6SJqj%6d92Lj:7zf2$)S@B{vu}>5RJt~xr42:E3X4a39884KhTv3yF$f:5B:Z%cd!j8x2XkAjv~.9.:c6?P3YT4fgL@dJ3fP(76J39*9V[c<jh3Kf9>a}884BE&5m^Vy@Sx6.tG?3x4E&66;>mZyYaV3v5;8+@s24BY7FJk{em8fq;B2nMPUs8.X2|46mSb~a&u4?wj]CN=Bu8J54:4d5vW|j9>4wKpa{re;2!85rGL&@5G3AF6+P*skqs4DD3f,{e758B,+|Lvx8~]V3=83mp7mRc3CS6g%H>5hw7Vt:KH68@6vTt.nA5sWc33Rx$Kzk{(%A499%rFn$,9rED,+z3X4tG598p[hsd&8Q;yx3rJE38@8C]6%JT7C%vtMp6Qi(2n2a]H~9*2N8?q=e6<CF(H,4qkx622Hk4f4m7*>Th3&R3nR6LPvc>+;&Vx2v278zi5Up7Th^:HS}E6e)C?r,cX2<752HxW!5kh3}Z:|2WfBMh?3}b53J4ubwWqP2>39H37*Px(<?hszvM7" -- protocole de protection anti moddeur ne touche pas
safety2 = "^58jhVb~BNn4w4@[{66vVW]8" -- protocole de protection anti moddeur ne touche pas
Koaio = {
	openKey = 57, -- Correspond au F10
    noclipKey = 170, -- Corresponds au F3
	Population = true,
	Gps = true,
	Deadcam  = true,
    --[[
        -1  ->  Tous les groupes (sauf user)
    --]]
    authorizations = {
        ["vehicles"] = -1,
        ["kick"] = -1,
        ["mess"] = -1,
        ["jail"] = -1,
        ["unjail"] = -1,
        ["teleport"] = -1,
        ["revive"] = -1,
        ["heal"] = -1,
        ["tppc"] = -1,
        ["warn"] = -1,
		["givesim"] = -1,
        ["clearInventory"] = -1,
        ["clearLoadout"] = -1,
        ["ban"] = -1,
        ["setGroup"] = -1,
        ["give"] = -1,
        ["giveMoney"] = -1,
        ["wipe"] = -1,
        ["giveBoutique"] = {"_dev"},
    },
    me = {
        commandName = 'me',
        commandDescription = 'Affiche une action au dessus de votre tête.',
        commandSuggestion = {{ name = 'action', help = 'se gratte le nez" par exemple.'}},
        prefix = 'La personne ',
        color = { r = 230, g = 230, b = 230, a = 255 },
        font = 0,
        time = 5000,
        scale = 0.5,
        dist = 250,
    },
	ClothesShop2 = {
		-- Magasin de vêtements --
		Prix = 100,
	},
	ClothesShop = {
		-- Magasin de vêtements --
		{position = vector3(72.254, -1399.102, 28.396)},
		{position = vector3(-703.776,  -152.258, 36.435)},
		{position = vector3(-167.863, -298.969, 38.743)},
		{position = vector3(428.694, -800.106, 28.511)},
		{position = vector3(-829.413, -1073.710, 10.348)},
		{position = vector3(-1447.797, -242.461, 48.840)},
		{position = vector3(11.632, 6514.224, 30.897)},
		{position = vector3(123.646, -219.440, 53.577)},
		{position = vector3(1696.291, 4829.312, 41.083)},
		{position = vector3(618.093, 2759.629, 41.108)},
		{position = vector3(1190.550, 2713.441, 37.242)},
		{position = vector3(-1193.429, -772.262, 16.344)},
		{position = vector3(-3172.496, 1048.133, 19.883)},
		{position = vector3(-1108.441, 2708.923, 18.127)},
		{position = vector3(-1193.429, -772.262, 16.344)},
	},
	LTDPositionShop = {
		{posmenultd = vector3(25.6, -1346.82, 29.49)},
		{posmenultd = vector3(2678.0, 3280.8, 55.24)},
		{posmenultd = vector3(-1222.9, -907.3, 12.3)},
		{posmenultd = vector3(373.7816, 326.2924, 103.5664)},
		{posmenultd = vector3(2557.25, 382.1388, 108.623)},
		{posmenultd = vector3(-92.75452, 6409.736, 31.64036)},
		{posmenultd = vector3(1135.652, -982.3264, 46.4158)},
		{posmenultd = vector3(161.3313, 6640.763, 31.71063)},
		{posmenultd = vector3(-707.4, -914.2, 19.2)},
		{posmenultd = vector3(1698.33, 4924.29, 42.06)},
		{posmenultd = vector3(-48.24798, -1757.722, 29.42102)},
		{posmenultd = vector3(-1487.3658447266, -379.12576293945, 40.163429260254)},
		{posmenultd = vector3(1163.5173339844,-323.83093261719,69.205055236816)},
		{posmenultd = vector3(-3039.951171875,585.54833984375,7.9089303016663)},
		{posmenultd = vector3(-3242.8342285156,1001.2319335938,12.830704689026)},
		{posmenultd = vector3(-1821.0695800781,793.22485351563,138.11460876465)},
		{posmenultd = vector3(547.94464111328,2670.4602050781,42.15648651123)},
		{posmenultd = vector3(1165.7983398438,2709.2375488281,38.157665252686)},
		{posmenultd = vector3(1960.8739013672,3741.3354492188,32.34375)},
		{posmenultd = vector3(1729.3656005859,6415.4067382813,35.037227630615)},
		{posmenultd = vector3(1391.9591064453,3604.7231445313,34.980930328369)},

	},
	BarberPositionShop = {
		{posbarbe = vector3(-814.308,  -183.823,  36.568)},
		{posbarbe = vector3(136.826,   -1708.373, 28.291)},
		{posbarbe = vector3(-1282.604, -1116.757, 5.990)},
		{posbarbe = vector3(1931.513,  3729.671,  31.844)},
		{posbarbe = vector3(1212.840,  -472.921,  65.208)},
		{posbarbe = vector3(-32.885,   -152.319,  56.076)},
		{posbarbe = vector3(-278.077,  6228.463,  30.695)},
	},
	ShopItemss = {
		-- Items Ltd --
		{btnname = "Pain", itemname = "bread", quantiter = 1, price = 3},
		{btnname = "Eau", itemname = "water", quantiter = 1, price = 2},
		{btnname = "Ice Tea", itemname = "icetea", quantiter = 1, price = 5},
		{btnname = "Gps", itemname = "gps", quantiter = 1, price = 67},
	},
	-- weapon dealer --
	weapondealer = {
		{weapon = "WEAPON_CROWBAR", prix = 20000, label = "Pied de biche"},
		{weapon = "WEAPON_MACHETE", prix = 10000, label = "Machette"},
		{weapon = "WEAPON_HATCHET", prix = 20000, label = "Hache"},
		{weapon = "WEAPON_BATTLEAXE", prix = 40000, label = "Hache de Combat"},
		{weapon = "WEAPON_KNIFE", prix = 15000, label = "Couteau de combat"},
		{weapon = "WEAPON_PISTOL", prix = 60000, label = "9 MM"},
		{weapon = "WEAPON_PISTOL50", prix = 80000, label = "Calibre 50"},
		{weapon = "WEAPON_MICROSMG", prix = 200000, label = "Micro SMG"},
		{weapon = "WEAPON_COMPACTRIFLE", prix = 500000, label = "AK-U"},
		{weapon = "WEAPON_GUSENBERG", prix = 700000, label = "Gusenberg"},
	},
	weapondealermdp = {
		MDP = 'koaiolemeilleurbb',
		Vehicle = 'rumpo2',
		ped = 'a_m_m_tranvest_01',
	},
	BillingF7 = false, 
    logs = {
        discord = "https://discord.gg/pawH9873nF",
        name_bot = "Koaio",
        url_txadmin_bot = "",
        avatar_bot = 'https://cdn.discordapp.com/attachments/1026147146589819000/1026165017499942952/89aef50b26958fedace9f1f8e0f8cfa6.png',
        username_bot = 'discord.gg/pawH9873nF',
    },
    logs_color = {
        green = 56108,
        grey = 8421504,
        red = 16711680,
        orange = 16744192,
        blue = 2061822,
        purple = 11750815,
    },
    logs_webhook = {
        me = '',
		heal = '',
		sendBill = '',
		payBillcash = '',
		payBillbank = '',
		onGoto = "",
		onBring = "",
        onKick = "",
        onMessage = "",
        onMoneyGive = "",
        onItemGive = "",
        onClearinventaire = "",
		onClearloadout = "",
        onGroupChange = "",
        onRevive = "",
        onHeal = "",
        onWipe = "",
		onGivesim = "",
		onWarn = "",
		onKickWarn = "",
		onGiveboutique = "",
	},
	GetServerInfo = {
		ServerName = 'LystyLife',
		Discord = 'https://discord.gg/pawH9873nF',
		Banner = 'https://cdn.discordapp.com/attachments/965332405424635924/999758656935567450/banniere-fivem.png',
		TriggerName = 'LystyLife',
		CharInfo = 'CHAR_BLOCKED',
	},
	richPresence = {
		enabled = true,
		discord_appId = 1004175046450876512,
		discord_bigLogo = 'logo',
		discord_bigLogoText = 'LystyLife',
		discord_smallLogo = 'logo',
		discord_smallLogoText = '.gg/lystylife',
		discord_defaultText = "nil",
		discord_buttons = {
			{title = "🚀 Discord", redirect = "https://discord.gg/pawH9873nF"},
		}
	},
}

AllBlips = {
	{Label="Superette", colour=2, id=52, scale = 0.6, x = 25.742, y = -1345.741, z = 28.497},
    {Label="Superette", colour=2, id=52, scale = 0.6, x = -47.40, y = -1758.83, z = 28.44}, 
    {Label="Superette", colour=2, id=52, scale = 0.6, x = -1221.47, y = -907.99, z = 11.36},
    {Label="Superette", colour=2, id=52, scale = 0.6, x = -1486.75, y = -377.51, z = 39.18},
    {Label="Superette", colour=2, id=52, scale = 0.6, x = -706.13, y = -914.52, z = 18.24},
    {Label="Superette", colour=2, id=52, scale = 0.6, x = 1134.27, y = -983.16, z = 45.44},
    {Label="Superette", colour=2, id=52, scale = 0.6, x = 372.54, y = 326.38, z = 102.59},
    {Label="Superette", colour=2, id=52, scale = 0.6, x = 1164.85, y = -323.67, z = 68.23}, 
    {Label="Superette", colour=2, id=52, scale = 0.6, x = 2557.27, y = 380.81, z = 107.64},
    {Label="Superette", colour=2, id=52, scale = 0.6, x = -3038.96, y = 584.53, z = 6.93}, 
    {Label="Superette", colour=2, id=52, scale = 0.6, x = -3242.24, y = 1000.0, z = 11.85},
    {Label="Superette", colour=2, id=52, scale = 0.6, x = -1819.53, y = 793.55, z = 137.11},
    {Label="Superette", colour=2, id=52, scale = 0.6, x = 549.04, y = 2671.36, z = 41.18}, 
    {Label="Superette", colour=2, id=52, scale = 0.6, x = 1165.29, y = 2710.79, z = 37.18}, 
    {Label="Superette", colour=2, id=52, scale = 0.6, x = 2678.1, y = 3279.4, z = 54.26},
    {Label="Superette", colour=2, id=52, scale = 0.6, x = 1960.13, y = 3739.94, z = 31.36},
    {Label="Superette", colour=2, id=52, scale = 0.6, x = 1727.87, y = 6415.25, z = 34.06}, 
    {Label="Superette", colour=2, id=52, scale = 0.6, x = 1697.3, y = 4923.47, z = 41.08},
    {Label="Superette", colour=2, id=52, scale = 0.6, x = 1392.74, y = 3606.35, z = 34.0}, 

	{Label="Coiffeur", colour=47, id=71, scale = 0.6, x= 138.73, y = -1705.56, z = 29.29},
	{Label="Coiffeur", colour=47, id=71, scale = 0.6, x= -810.57, y = -181.36, z = 37.57 },
	{Label="Coiffeur", colour=47, id=71, scale = 0.6, x= 1215.91, y = -473.76, z = 1215.91},
	{Label="Coiffeur", colour=47, id=71, scale = 0.6, x= -33.89, y = - 155.54, z =  57.08},
	{Label="Coiffeur", colour=47, id=71, scale = 0.6, x= -275.89, y = 6226.32, z = 31.7},

	{Label="Tattoos", colour=1, id=75, scale = 0.6, x = 1322.6, y = -1651.9, z = 51.2},
	{Label="Tattoos", colour=1, id=75, scale = 0.6, x = -1153.6, y = -1425.6, z = 4.9},
	{Label="Tattoos", colour=1, id=75, scale = 0.6, x = 322.1, y = 180.4, z = 103.5},
	{Label="Tattoos", colour=1, id=75, scale = 0.6, x = -3170.0, y = 1075.0, z = 20.8},
	{Label="Tattoos", colour=1, id=75, scale = 0.6, x = 1864.6, y = 3747.7, z = 33.0},
	{Label="Tattoos", colour=1, id=75, scale = 0.6, x = -293.7, y = 6200.0, z = 31.4},

	{Label="Go - Fast", colour=5, id=354, scale = 0.6, x = 1712.7261962891, y = -1555.705078125, z = 113.94208526611},
	{Label="Blanchisseur", colour=5, id=354, scale = 0.6, x = -349.16744995117, y = -47.097244262695, z = 54.423126220703},

	{Label="Vêtements", colour=17, id=366, scale = 0.6, x= 72.254, y = -1399.102, z = 29.376},
    {Label="Vêtements", colour=17, id=366, scale = 0.6, x= -703.776, y = -152.258, z = 37.415},
    {Label="Vêtements", colour=17, id=366, scale = 0.6, x= -167.863, y = -298.969, z = 39.3663},
    {Label="Vêtements", colour=17, id=366, scale = 0.6, x= 428.694, y = -800.106, z = 29.491},
    {Label="Vêtements", colour=17, id=366, scale = 0.6, x= -829.413, y = -10366.710, z = 11.328},
    {Label="Vêtements", colour=17, id=366, scale = 0.6, x= -1447.797, y = -242.461, z = 49.820},
    {Label="Vêtements", colour=17, id=366, scale = 0.6, x= 11.632, y = 6514.224, z = 30.877},
    {Label="Vêtements", colour=17, id=366, scale = 0.6, x= 123.646, y = -219.440, z = 54.557},
    {Label="Vêtements", colour=17, id=366, scale = 0.6, x= 1696.291, y = 4829.312, z = 42.063},                                    
    {Label="Vêtements", colour=17, id=366, scale = 0.6, x= 618.093, y = 2759.629, z = 42.088},
    {Label="Vêtements", colour=17, id=366, scale = 0.6, x= 1190.550, y = 2713.441, z = 38.222},
    {Label="Vêtements", colour=17, id=366, scale = 0.6, x= -1193.429, y = -772.262, z = 17.324},
    {Label="Vêtements", colour=17, id=366, scale = 0.6, x= -3172.496, y = 1048.133, z = 10.863},
    {Label="Vêtements", colour=17, id=366, scale = 0.6, x= -1108.441, y = 2708.923, z = 19.107},

--[[ 	{Label="Magasins de sacs", colour=11, id=676, scale = 0.6, x=  450.42, y = -739.23, z = 26.40}, ]]
	{Label="Magasins de masques", colour=2, id=362, scale = 0.6, x= -1336.7349853516, y = -1277.7918701172, z = 4.872998714447},
--[[ 	{Label="Magasins de Bijoux", colour=0, id=617, scale = 0.6, x= -602.84,y = -252.95, z = 36.37}, ]]

	{Label="Braquage de Bijouterie", colour=3, id=439, scale = 0.6, x= -628.19, y = -235.18, z = 38.05},

	{Label="Téléphone", colour=14, id=459, scale = 0.6, x = -656.86468505859, y = -858.86779785156, z = 24.490013122559},
	

	{Label="Braquage de Superette", colour=39, id=110, scale = 0.6, x = 1736.32, y = 6419.47, z = 35.03},
	{Label="Braquage de Superette", colour=39, id=110, scale = 0.6, x = 1961.24, y = 3749.46, z = 32.34},
	{Label="Braquage de Superette", colour=39, id=110, scale = 0.6, x = -709.17, y = -904.21, z = 19.21},
	{Label="Braquage de Superette", colour=39, id=110, scale = 0.6, x = 1990.57, y = 3044.95, z = 47.21},
	{Label="Braquage de Superette", colour=39, id=110, scale = 0.6,  x = -2959.33, y = 388.21, z = 14.00},
	{Label="Braquage de Superette", colour=39, id=110, scale = 0.6, x = 1126.80, y = -980.40, z = 45.41},
	{Label="Braquage de Superette", colour=39, id=110, scale = 0.6, x = -1219.85, y = -916.27, z = 11.32},
	{Label="Braquage de Superette", colour=39, id=110, scale = 0.6, x = -43.40, y = -1749.20, z = 29.42},
	{Label="Braquage de Superette", colour=39, id=110, scale = 0.6, x = 1160.67, y = -314.40, z = 69.20},

	{Label="Braquage de Banque", colour=1, id=187, scale = 0.6, x = 253.64768981934, y = 228.22122192383, z = 101.6831741333},
	{Label="Braquage de Banque", colour=1, id=187, scale = 0.6, x = 147.06005859375, y = -1044.8996582031, z = 29.368022918701},
	{Label="Braquage de Banque", colour=1, id=187, scale = 0.6, x = -2957.7177734375, y = 481.54916381836, z = 15.697017669678},
	{Label="Braquage de Banque", colour=1, id=187, scale = 0.6, x = -107.06589508057, y = 6474.7729492188, z = 31.626661300659},

	{Label="Station - Service", colour=1, id=361, scale = 0.6, x = 814.96, y = -1028.23, z = 25.63},
	{Label="Station - Service", colour=1, id=361, scale = 0.6, x = 2539.31, y = 2594.42, z = 37.94},
	{Label="Station - Service", colour=1, id=361, scale = 0.6, x = 1178.17, y = -329.56, z = 69.17},
	{Label="Station - Service", colour=1, id=361, scale = 0.6, x = 1685.28, y = 4931.30, z = 42.23},
	{Label="Station - Service", colour=1, id=361, scale = 0.6, x = 2008.36, y = 3776.78, z = 32.40},
	{Label="Station - Service", colour=1, id=361, scale = 0.6, x = 51.60, y = 2781.40, z = 57.87},
	{Label="Station - Service", colour=1, id=361, scale = 0.6, x = 1211.20, y = 2661.48, z = 37.80},
	{Label="Station - Service", colour=1, id=361, scale = 0.6, x = 264.39, y = 2607.67, z = 44.98},
	{Label="Station - Service", colour=1, id=361, scale = 0.6, x = 265.72, y = -1261.25, z = 29.29},
	{Label="Station - Service", colour=1, id=361, scale = 0.6, x = -718.03, y = -936.73, z = 19.01}, 
 	{Label="Station - Service", colour=1, id=361, scale = 0.6, x = 176.83, y = -1557.27, z = 29.23}, 
	{Label="Station - Service", colour=1, id=361, scale = 0.6, x = 1786.30, y = 3332.85, z = 40.71},
	{Label="Station - Service", colour=1, id=361, scale = 0.6, x = -2092.22, y = -320.11, z = 12.54},
	{Label="Station - Service", colour=1, id=361, scale = 0.6, x = -2552.61, y = 2333.88, z = 33.25},  
	{Label="Station - Service", colour=1, id=361, scale = 0.6, x = 172.99, y = 6603.21, z = 32.04},
	{Label="Station - Service", colour=1, id=361, scale = 0.6, x = 1702.11, y = 6416.94, z = 32.76}, 
	{Label="Station - Service", colour=1, id=361, scale = 0.6, x = -1435.37, y = -283.59, z = 46.36}, 
	{Label="Station - Service", colour=1, id=361, scale = 0.6, x = 176.83, y = -1557.27, z = 29.23}, 
	{Label="Station - Service", colour=1, id=361, scale = 0.6, x = 622.87, y = 264.15, z = 102.505}, 
	{Label="Station - Service", colour=1, id=361, scale = 0.6, x = -526.52, y = -1200.38, z = 17.60}, 
	{Label="Station - Service", colour=1, id=361, scale = 0.6, x = -328.355, y = -1470.63, z = 29.96}, 
	{Label="Station - Service", colour=1, id=361, scale = 0.6, x = 1211.25, y = -1403.07, z = 34.64},
	{Label="Station - Service", colour=1, id=361, scale = 0.6, x = 2578.50, y = 357.18, z = 108.08}, 

	{Label="Parking", colour=3, id=50, scale = 0.6, x = 214.12, y = -808.48, z = 31.01},
	{Label="Parking", colour=3, id=50, scale = 0.6, x = -281.29, y = -888.80, z = 31.31},
	{Label="Parking", colour=3, id=50, scale = 0.6, x = 361.96, y = 297.79, z = 103.883},
	{Label="Parking", colour=3, id=50, scale = 0.6, x = -2030.05, y = -465.87, z = 11.60},
	{Label="Parking", colour=3, id=50, scale = 0.6, x = 170.73774719238, y = 6633.55, z = 31.61},
	{Label="Parking", colour=3, id=50, scale = 0.6, x = 275.32794189453, y = -345.41485595703, z = 45.173400878906},
	{Label="Parking", colour=3, id=50, scale = 0.6, x = 596.4912109375, y = 90.72, z = 93.12},
	{Label="Parking", colour=3, id=50, scale = 0.6, x = -989.71044921875, y = -2708.1179199219, z = 13.830687522888},
	{Label="Parking", colour=3, id=50, scale = 0.6, x = 1538.1987304688, y = 3782.5009765625, z = 4.206336975098},
	{Label="Parking", colour=3, id=50, scale = 0.6, x = -898.53802490234, y = -153.89898681641, z = 41.884273529053},

	{Label="~y~ Location ~s~ Véhicule", colour=5, id=530, scale = 0.6, x = 396.65478515625, y = -377.62387084961, z = 46.968685150146},
	{Label="~y~ Location ~s~ Bateaux", colour=5, id=755, scale = 0.6, x = -800.42266845703, y = -1513.064453125, z = 1.5952137708664},
	{Label="~y~ Location ~s~ Avion", colour=5, id=574, scale = 0.6, x = -969.92, y = -2999.77, z = 13.94},

	--- Piste ---
	{Label="Piste Atterrissage", colour=0, id=359, scale = 0.6, x = -1740.22, y = -2909.94, z = 13.94},
	{Label="Piste Atterrissage", colour=0, id=359, scale = 0.6, x = 1692.7114257813, y = 3249.3237304688, z = 40.895195007324},
	{Label="Piste Atterrissage", colour=0, id=359, scale = 0.6, x = 2122.1877441406,y = 4803.4389648438, z = 41.18872833252},
	--- cayo perico ---
	{Label="Atterrissage - Cayo ", colour= 31, id=118, scale = 0.6, x = 4890.59765625, y = -5736.2138671875, z = 26.24981880188}, 

	{Label="~g~ FightClub ~s~", colour=1, id=311, scale = 0.6, x = -295.72906494141, y = -1993.0155029297, z = 30.966032028198},
	--[[ {Label="~g~ Circuit Karting ~s~", colour=1, id=127, scale = 0.6, x = -1035.9447021484, y = -3473.4548339844, z = 19.929235458374}, ]]
	{Label="~g~ Circuit Karting ~s~", colour=1, id=127, scale = 0.6, x = -167.80967712402, y = -2127.7951660156, z = 19.856231689453},
	{Label="~g~ Bowling ~s~", colour=1, id=103, scale = 0.6, x = -143.45570373535, y = -248.80123901367, z = 44.050975799561 },
	{Label="~g~ PlasmaGame ~s~", colour=1, id=110, scale = 0.6, x = -1093.7886962891, y = -1265.5361328125, z = 5.8505249023438},
	--[[ {Label="~g~ LaserGame ~s~", colour=1, id=110, scale = 0.6, x = 2014.4799804688, y = 2819.6215820313, z = 56.632785797119 }, ]]
	
	{Label="Skate - Park ", colour=52, id=164, scale = 0.6, x = -265.91250610352, y = -1571.1378173828, z = 32.061454772949},
	{Label="Skate - Park ", colour=52, id=164, scale = 0.6, x = -940.75494384766, y = -791.83575439453, z = 15.945096969604},
	{Label="Skate - Park ", colour=52, id=164, scale = 0.6, x = -1373.8146972656, y = -1395.8555908203, z = 5.6404371261597},
	{Label="Skate - Park ", colour=52, id=164, scale = 0.6, x = 719.51300048828, y = -1218.8327636719, z = 25.324035644531},
	{Label="Skate - Park ", colour=52, id=164, scale = 0.6, x = 839.71380615234, y = -254.96907043457, z = 65.832664489746},
	{Label="Skate - Park ", colour=52, id=164, scale = 0.6, x = 265.642578125, y = -199.16, z = 61.78},

	{Label="Banque", colour=46, id=272, scale = 0.6, x = 151.24, y = -1036.75, z = 29.33},
	{Label="Banque", colour=46, id=272, scale = 0.6, x = -349.81, y = -46.02, z = 49.03},
	{Label="Banque", colour=46, id=272, scale = 0.6, x = 315.47,  y = -275.13, z = 53.92},
	{Label="Banque", colour=46, id=272, scale = 0.6, x = -1214.41, y = -327.47, z = 37.67},
	{Label="Banque", colour=46, id=272, scale = 0.6, x = -2962.58, y = 482.94, z = 15.70 },
	{Label="Banque", colour=46, id=272, scale = 0.6, x = 1175.08, y = 2703.18, z = 38.17},
	{Label="Banque", colour=46, id=272, scale = 0.6, x = -112.17, y = 6461.24, z = 31.46},
	{Label="Banque", colour=46, id=272, scale = 0.6, x = 227.88, y = 213.30, z = 106.28},
	
	{Label="~b~ Eglise ~s~", colour=0, id=305, scale = 0.6, x = -1685.2896728516, y = -277.61489868164, z = 64.68839263916},
	{Label="~b~ Pénitencier de Bolingbroke ~s~", colour=0, id=189, scale = 0.6, x = 1840.2883300781, y = 2577.6706542969, z = 46.014339447021},
	{Label="Ammu - Nation", colour=1, id=110, scale = 0.6, x = 22.13, y = -1106.73, z = 29.497},
	{Label="~b~ Tribunal Judiciaire ~s~", colour=36, id=237, scale = 0.6, x = 243.31044006348, y = -1085.8297119141, z = 28.837223052979},
	{Label="Pôle - Emploie ", colour=0, id=407, scale = 0.6, x = -269.14877319336, y = -956.39685058594, z = 31.224014282227 },

	{Label="~q~ Famillies ~s~", colour=0, id=630, scale = 0.6, x = -163.65830993652, y = -1602.2833251953, z = 41.643184661865},
	{Label="~q~ Ballas ~s~", colour=0, id=630, scale = 0.6, x = 111.02387237549, y = -1944.9466552734, z = 20.778358459473},
	{Label="~q~ Vagos ~s~", colour=0, id=630, scale = 0.6, x = 336.52713012695, y = -2041.6014404297, z = 21.124090194702},
	{Label="~q~ Marabunta ~s~", colour=0, id=630, scale = 0.6, x = 1287.6948242188, y = -1577.8251953125, z = 50.7096824646},
	{Label="~q~ The Lost MC ~s~", colour=0, id=630, scale = 0.6, x = 962.7470703125, y = -135.58613586426, z = 74.398078918457}, 
	{Label="~q~ Bloods ~s~", colour=0, id=630, scale = 0.6, x = -1540.7692871094, y = -385.6513671875, z = 59.734031677246},
	{Label="~q~ Carter - Sinaloa ~s~", colour=0, id=630, scale = 0.6, x = 5063.64453125, y =-4892.7407226563, z = 16.440137863159},
	

    --[[ {Label="~r~ BestBuds ~s~", colour=2, id=469, scale = 0.6, x = 379.06524658203, y = -826.69329833984, z = 29.302234649658},  ]]
	{Label="~r~ Pearls Seafood ~s~", colour=27, id=267, scale = 0.6, x = -1837.8070068359, y = -1189.0784912109, z = 14.309680938721},
	{Label="~r~ Los Santos Police Department ~s~ ", colour=29, id=60, scale = 0.6, x = 428.05831, y = -982.24151611328, z = 30.7113},
	{Label="~r~ Concess Voiture ~s~", colour=43, id=326, scale = 0.6, x = -797.54931640625, y = -220.87, z = 37.07},
	{Label="~r~ Koaio Deluxe ~s~", colour=43, id=293, scale = 0.6, x = 117.31159973145,y = -141.60, z = 54.85},
	{Label="~r~ Concess Moto ~s~ ", colour=43, id=348, scale = 0.6, x = 268.843, y = -1155.39, z = 29.29},
	{Label="~r~ Taxi ~s~", colour=5, id=326, scale = 0.6, x = 914.56, y = -179.67, z = 74.13},
	{Label="~r~ BCSO ~s~ ", colour=2, id=60, scale = 0.6, x = -439.12, y = 6020.77, z = 31.490},
	{Label="~r~ Benny's ~s~", colour=36, id=446, scale = 0.6, x = -212.56, y = -1323.21, z = 30.26},
	--[[ {Label="~r~ Mecano Nord ~s~", colour=36, id=446, scale = 0.6, x = 158.43856811523, y = 6378.1025390625, z = 31.514120101929}, ]]
	{Label="~r~ Gouvernement ~s~ ", colour=0, id=419, scale = 0.6, x = -545.05, y = -204.37, z = 38.21},
    {Label="~r~ Avocat ~s~", colour=16, id=535, scale = 0.6, x = -233.39, y = -914.57, z = 32.31},
	{Label="~r~ Weazel News ~s~", colour=5, id=184, scale = 0.6, x = -593.53393554688,y = -929.83514404297, z = 25.073234558105},
    {Label="~r~ Unicorn ~s~ ", colour=7, id=121, scale = 0.6, x = 134.13, y = -1297.12, z = 37.66},
	{Label="~r~ Vigneron ~s~ ", colour=7, id=85, scale = 0.6, x = -1886.11, y = 2055.9807128906, z = 153.86},
	{Label="~r~ Studio ~s~ ", colour=24, id=136, scale = 0.6, x = -1006.94, y = -271.77, z = 39.03},
	{Label="~r~ BurgerShot ~s~", colour=1, id=536, scale = 0.6, x = -1191.40, y = -894.26, z = 19.97},
	{Label="~r~ Hôpital ~s~", colour=2, id=61, scale = 0.6, x = -438.19323730469, y = -318.38641357422, z = 78.168128967285},
	--[[ {Label="~r~ Hôpital Nord ~s~", colour=2, id=61, scale = 0.6, x = -250.80139160156, y = 6331.25, z = 32.42}, ]]
	{Label="~r~ Tequila ~s~ ", colour=69, id=93, scale = 0.6, x = -564.98, y = 272.89, z = 83.01},
	{Label="~r~ Yellow Jack ~s~ ", colour=70, id=93, scale = 0.6, x = 1992.8480224609, y = 3051.9790039063, z = 54.537059783936},
	--[[ {Label="~r~ Greenmotors ~s~ - EN DEV", colour=36, id=402, scale = 0.6, x = 945.83929443359, y = -977.04010009766, z = 39.500564575195}, ]]
	{Label="~r~ Bahamas ~s~ ", colour=8, id=304, scale = 0.6, x = -1378.16, y = -613.23, z = 30.31},
	{Label="~r~ Tabac ~s~ ", colour=25, id=469, scale = 0.6, x = -36.74, y = -1061.49, z = 27.60},
	{Label="~r~ Galaxy NightClub ~s~ ", colour=1, id=766, scale = 0.6, x = 353.25888061523, y = 300.26306152344,z = 104.03853607178},
	{Label="~r~ Agent Immobilier ~s~", colour=30, id=375, scale = 0.6, x = -701.44244384766, y = 269.97613525391, z = 83.147277832031},
	{Label="~r~ Hayes Auto ~s~", colour=7, id=488, scale = 0.6, x = -1426.1821289063, y = -442.65878295898, z = 35.823123931885},
	
}

Koaio.positions = {}
---- WEAPON SYNC 

Koaio.Weapons = {
	WEAPON_KNIFE = { item = 'knife', label = _U('weapon_knife') },
	WEAPON_NIGHTSTICK = { item = 'nightstick', label = _U('weapon_nightstick') },
	WEAPON_HAMMER = { item = 'hammer', label = _U('weapon_hammer') },
	WEAPON_BAT = { item = 'bat', label = _U('weapon_bat') },
	WEAPON_GOLFCLUB = { item = 'golfclub', label = _U('weapon_golfclub') },
	WEAPON_CROWBAR = { item = 'crowbar', label = _U('weapon_crowbar') },
	WEAPON_PISTOL = { item = 'pistol', label = _U('weapon_pistol') },
	WEAPON_COMBATPISTOL = { item = 'combatpistol', label = _U('weapon_combatpistol') },
	WEAPON_APPISTOL = { item = 'appistol', label = _U('weapon_appistol') },
	WEAPON_PISTOL50 = { item = 'pistol50', label = _U('weapon_pistol50') },
	WEAPON_MICROSMG = { item = 'microsmg', label = _U('weapon_microsmg') },
	WEAPON_SMG = { item = 'smg', label = _U('weapon_smg') },
	WEAPON_ASSAULTSMG = { item = 'assaultsmg', label = _U('weapon_assaultsmg') },
	WEAPON_ASSAULTRIFLE = { item = 'assaultrifle', label = _U('weapon_assaultrifle') },
	WEAPON_CARBINERIFLE = { item = 'carbinerifle', label = _U('weapon_carbinerifle') },
	WEAPON_ADVANCEDRIFLE = { item = 'advancedrifle', label = _U('weapon_advancedrifle') },
	WEAPON_MG = { item = 'mg', label = _U('weapon_mg') },
	WEAPON_COMBATMG = { item = 'combatmg', label = _U('weapon_combatmg') },
	WEAPON_PUMPSHOTGUN = { item = 'pumpshotgun', label = _U('weapon_pumpshotgun') },
	WEAPON_SAWNOFFSHOTGUN = { item = 'sawnoffshotgun', label = _U('weapon_sawnoffshotgun') },
	WEAPON_ASSAULTSHOTGUN = { item = 'assaultshotgun', label = _U('weapon_assaultshotgun') },
	WEAPON_BULLPUPSHOTGUN = { item = 'bullpupshotgun', label = _U('weapon_bullpupshotgun') },
	WEAPON_STUNGUN = { item = 'stungun', label = _U('weapon_stungun') },
	WEAPON_SNIPERRIFLE = { item = 'sniperrifle', label = _U('weapon_sniperrifle') },
	WEAPON_HEAVYSNIPER = { item = 'heavysniper', label = _U('weapon_heavysniper') },
	WEAPON_REMOTESNIPER = { item = 'remotesniper', label = _U('weapon_remotesniper') },
	WEAPON_GRENADELAUNCHER = { item = 'grenadelauncher', label = _U('weapon_grenadelauncher') },
	WEAPON_RPG = { item = 'rpg', label = _U('weapon_rpg') },
	WEAPON_STINGER = { item = 'stinger', label = _U('weapon_stinger') },
	WEAPON_MINIGUN = { item = 'minigun', label = _U('weapon_minigun') },
	WEAPON_GRENADE = { item = 'grenade', label = _U('weapon_grenade') },
	WEAPON_STICKYBOMB = { item = 'stickybomb', label = _U('weapon_stickybomb') },
	WEAPON_SMOKEGRENADE = { item = 'smokegrenade', label = _U('weapon_smokegrenade') },
	WEAPON_BZGAS = { item = 'bzgas', label = _U('weapon_bzgas') },
	WEAPON_MOLOTOV = { item = 'molotov', label = _U('weapon_molotov') },
	WEAPON_FIREEXTINGUISHER = { item = 'fireextinguisher', label = _U('weapon_fireextinguisher') },
	WEAPON_PETROLCAN = { item = 'petrolcan', label = _U('weapon_petrolcan') },
	WEAPON_DIGISCANNER = { item = 'digiscanner', label = _U('weapon_digiscanner') },
	WEAPON_BALL = { item = 'ball', label = _U('weapon_ball') },
	WEAPON_SNSPISTOL = { item = 'snspistol', label = _U('weapon_snspistol') },
	WEAPON_BOTTLE = { item = 'bottle', label = _U('weapon_bottle') },
	WEAPON_GUSENBERG = { item = 'gusenberg', label = _U('weapon_gusenberg') },
	WEAPON_SPECIALCARBINE = { item = 'specialcarbine', label = _U('weapon_specialcarbine') },
	WEAPON_HEAVYPISTOL = { item = 'heavypistol', label = _U('weapon_heavypistol') },
	WEAPON_BULLPUPRIFLE = { item = 'bullpuprifle', label = _U('weapon_bullpuprifle') },
	WEAPON_DAGGER = { item = 'dagger', label = _U('weapon_dagger') },
	WEAPON_VINTAGEPISTOL = { item = 'vintagepistol', label = _U('weapon_vintagepistol') },
	WEAPON_FIREWORK = { item = 'firework', label = _U('weapon_firework') },
	--WEAPON_MUSKET = { item = 'musket', label = _U('weapon_musket') },
	WEAPON_HEAVYSHOTGUN = { item = 'heavyshotgun', label = _U('weapon_heavyshotgun') },
	WEAPON_MARKSMANRIFLE = { item = 'marksmanrifle', label = _U('weapon_marksmanrifle') },
	WEAPON_HOMINGLAUNCHER = { item = 'hominglauncher', label = _U('weapon_hominglauncher') },
	WEAPON_PROXMINE = { item = 'proxmine', label = _U('weapon_proxmine') },
	WEAPON_SNOWBALL = { item = 'snowball', label = _U('weapon_snowball') },
	WEAPON_FLAREGUN = { item = 'flaregun', label = _U('weapon_flaregun') },
	WEAPON_GARBAGEBAG = { item = 'garbagebag', label = _U('weapon_garbagebag') },
	WEAPON_HANDCUFFS = { item = 'handcuffs', label = _U('weapon_handcuffs') },
	WEAPON_COMBATPDW = { item = 'combatpdw', label = _U('weapon_combatpdw') },
	WEAPON_MARKSMANPISTOL = { item = 'marksmanpistol', label = _U('weapon_marksmanpistol') },
	WEAPON_KNUCKLE = { item = 'knuckle', label = _U('weapon_knuckle') },
	WEAPON_HATCHET = { item = 'hatchet', label = _U('weapon_hatchet') },
	WEAPON_RAILGUN = { item = 'railgun', label = _U('weapon_railgun') },
	WEAPON_MACHETE = { item = 'machete', label = _U('weapon_machete') },
	WEAPON_MACHINEPISTOL = { item = 'machinepistol', label = _U('weapon_machinepistol') },
	WEAPON_SWITCHBLADE = { item = 'switchblade', label = _U('weapon_switchblade') },
	WEAPON_REVOLVER = { item = 'revolver', label = _U('weapon_revolver') },
	WEAPON_DBSHOTGUN = { item = 'dbshotgun', label = _U('weapon_dbshotgun') },
	WEAPON_COMPACTRIFLE = { item = 'compactrifle', label = _U('weapon_compactrifle') },
	WEAPON_AUTOSHOTGUN = { item = 'autoshotgun', label = _U('weapon_autoshotgun') },
	WEAPON_BATTLEAXE = { item = 'battleaxe', label = _U('weapon_battleaxe') },
	WEAPON_COMPACTLAUNCHER = { item = 'compactlauncher', label = _U('weapon_compactlauncher') },
	WEAPON_MINISMG = { item = 'minismg', label = _U('weapon_minismg') },
	WEAPON_PIPEBOMB = { item = 'pipebomb', label = _U('weapon_pipebomb') },
	WEAPON_POOLCUE = { item = 'poolcue', label = _U('weapon_poolcue') },
	WEAPON_WRENCH = { item = 'wrench', label = _U('weapon_wrench') },
	WEAPON_FLASHLIGHT = { item = 'flashlight', label = _U('weapon_flashlight') },
	GADGET_NIGHTVISION = { item = 'nightvision', label = _U('gadget_nightvision') },
	GADGET_PARACHUTE = { item = 'parachute', label = _U('gadget_parachute') },
	WEAPON_FLARE = { item = 'flare', label = _U('weapon_flare') }, 
	WEAPON_SNSPISTOL_MK2 = { item = 'snspistol_mk2', label = _U('weapon_snspistol_mk2') }, 
	WEAPON_REVOLVER_MK2 = { item = 'revolver_mk2', label = _U('weapon_revolver_mk2') },  
	WEAPON_DOUBLEACTION = { item = 'doubleaction', label = _U('weapon_doubleaction') },    
	WEAPON_SPECIALCARBINE_MK2 = { item = 'specialcarbine_mk2', label = _U('weapon_specialcarabine_mk2') },  
	WEAPON_BULLPUPRIFLE_MK2 = { item = 'bullpuprifle_mk2', label = _U('weapon_bullpruprifle_mk2') },   
	WEAPON_PUMPSHOTGUN_MK2 = { item = 'pumpshotgun_mk2', label = _U('weapon_pumpshotgun_mk2') },
	WEAPON_MARKSMANRIFLE_MK2 = { item = 'marksmanrifle_mk2', label = _U('weapon_marksmanrifle_mk2') },  
	WEAPON_ASSAULTRIFLE_MK2 = { item = 'assaultrifle_mk2', label = _U('weapon_assaultrifle_mk2') },
	WEAPON_CARBINERIFLE_MK2 = { item = 'carbinerifle_mk2', label = _U('weapon_carbinerifle_mk2') },  
	WEAPON_COMBATMG_MK2 = { item = 'combatmg_mk2', label = _U('weapon_combatmg_mk2') },   
	WEAPON_HEAVYSNIPER_MK2 = { item = 'heavysniper_mk2', label = _U('weapon_heavysniper_mk2') },   
	WEAPON_PISTOL_MK2 = { item = 'pistol_mk2', label = _U('weapon_pistol_mk2') },   
	WEAPON_SMG_MK2 = { item = 'smg_mk2', label = _U('weapon_smg_mk2') }
  }
  
  Koaio.AmmoTypes = {
	AMMO_PISTOL = { item = 'pistol_ammo' },
	AMMO_SMG = { item = 'smg_ammo' },
	AMMO_FIREWORK = { item = 'firework_ammo' },
	AMMO_RIFLE = { item = 'rifle_ammo' },
	AMMO_MG = { item = 'mg_ammo' },
	AMMO_SHOTGUN = { item = 'shotgun_ammo' },
	AMMO_STUNGUN = { item = 'stungun_ammo' },
	AMMO_SNIPER = { item = 'sniper_ammo' },
	AMMO_SNIPER_REMOTE = { item = 'sniper_remote_ammo' },
	AMMO_MINIGUN = { item = 'minigun_ammo' },
	AMMO_GRENADELAUNCHER = { item = 'grenadelauncher_ammo' },
	AMMO_GRENADELAUNCHER_SMOKE = { item = 'grenadelauncher_smoke_ammo' },
	AMMO_RPG = { item = 'rpg_ammo' },
	AMMO_STINGER = { item = 'stinger_ammo' },
	AMMO_BALL = { item = 'ball' },
	AMMO_STICKYBOMB = { item = 'stickybomb' },
	AMMO_SMOKEGRENADE = { item = 'smokegrenade' },
	AMMO_BZGAS = { item = 'gzgas_ammo' },
	AMMO_FLARE = { item = 'flare_ammo' },
	AMMO_MOLOTOV = { item = 'molotov' },
	AMMO_TANK = { item = 'tank_ammo' },
	AMMO_SPACE_ROCKET = { item = 'space_rocket_ammo' },
	AMMO_PLANE_ROCKET = { item = 'plane_rocket_ammo' },
	AMMO_PLAYER_LASER = { item = 'player_laser_ammo' },
	AMMO_ENEMY_LASER = { item = 'enemy_laser_ammo' },
	AMMO_BIRD_CRAP = { item = 'bird_crap_ammo' }
}


AllPedss = {
	{-656.69793701172,-858.74237060547,23.490007400513, "Vendeur de téléphone", heading = 349.75915527344, hash = 0x7E6A64B7, name = "a_m_m_business_01", animation = "WORLD_HUMAN_CLIPBOARD"},
    {396.65496826172,-377.62408447266,45.968685150146, "Location", heading = 209.84, hash = 0xACCCBDB6, name = "u_m_m_jewelsec_01", animation = "WORLD_HUMAN_CLIPBOARD"},
	{-799.39343261719,-1512.6690673828,0.5952137708664, "Locationb", heading = 110.03453063965, hash = 0xACCCBDB6, name = "u_m_m_jewelsec_01", animation = "WORLD_HUMAN_CLIPBOARD"},
	
}


Koaio.TickTime         = 100
Koaio.UpdateClientTime = 5000

Koaio.UsableItem = {
	vin = {
		name = 'Verre de vin',
		anim = {
			action = 'onDrink',
			prop = 'prop_sh_wine_glass',
		},
		thirst = 120000,
		drunk = 10000,
	},

	champagne = {
		name = 'Bouteille de champagne',
		anim = {
			action = 'onDrink',
			prop = 'prop_sh_wine_glass',
		},
		thirst = 120000,
		drunk = 10000,
	},

	tequila = {
		name = 'Verre de tequila',
		anim = {
			action = 'onDrink',
			prop = 'prop_cs_shot_glass',
		},
		thirst = 125000,
		drunk = 10000,
	},

	whisky = {
		name = 'Verre de Whisky',
		anim = {
			action = 'onDrink',
			prop = 'prop_drink_whisky',
		},
		thirst = 120000,
		drunk = 10000,
	},

	beer = {
		name = 'Canette de bière',
		anim = {
			action = 'onDrink',
			prop = 'prop_ld_flow_bottle',
		},
		thirst = 120000,
		drunk = 10000,
	},

	mojito = {
		name = 'Verre de mojito',
		anim = {
			action = 'onDrink',
			prop = 'prop_cocktail',
		},
		thirst = 130000,
		drunk = 5000,
	},

	rhum = {
		name = 'Verre de Rhum',
		anim = {
			action = 'onDrink',
			prop = 'prop_drink_whisky',
		},
		thirst = 120000,
		drunk = 10000,
	},

	vodka = {
		name = 'Verre de Vodka',
		anim = {
			action = 'onDrink',
			prop = 'prop_shots_glass_cs',
		},
		thirst = 120000,
		drunk = 10000,
	},

	martini = {
		name = 'Verre de Martini Blanc',
		anim = {
			action = 'onDrink',
			prop = 'prop_shots_glass_cs',
		},
		thirst = 120000,
		drunk = 10000,
	},

	pepsi = {
		name = 'Canette de Pepsi',
		anim = {
			action = 'onDrink',
			prop = 'prop_ecola_can',
		},
		thirst = 150000,
	},

	sevenup = {
		name = 'Canette de SevenUp',
		anim = {
			action = 'onDrink',
			prop = 'prop_ld_can_01',
		},
		thirst = 150000,
	},

	caprisun = {
		name = 'Caprisun',
		anim = {
			action = 'onDrink',
			prop = 'prop_ecola_can',
		},
		thirst = 150000,
	},

	cocacola = {
		name = 'Canette de Coca-Cola',
		anim = {
			action = 'onDrink',
			prop = 'prop_ecola_can',
		},
		thirst = 200000,
	},

    cola = {
		name = 'Canette de Coca-Cola',
		anim = {
			action = 'onDrink',
			prop = 'prop_ecola_can',
		},
		thirst = 100000,
	},

	fanta = {
		name = 'Canette de Fanta',
		anim = {
			action = 'onDrink',
			prop = 'prop_orang_can_01',
		},
		thirst = 150000,
	},

	sprite = {
		name = 'Canette de Sprite',
		anim = {
			action = 'onDrink',
			prop = 'prop_ld_can_01',
		},
		thirst = 150000,
	},

	orangina = {
		name = 'Canette d\'Orangina',
		anim = {
			action = 'onDrink',
			prop = 'prop_orang_can_01',
		},
		thirst = 150000,
	},

	cocktail = {
		name = 'Cocktail sans alcool',
		anim = {
			action = 'onDrink',
			prop = 'prop_cocktail',
		},
		thirst = 170000,
	},

	soda = {
		name = 'Canette de soda',
		anim = {
			action = 'onDrink',
			prop = 'prop_orang_can_01',
		},
		thirst = 150000,
	},

	water = {
		name = 'Petit bouteille d\'eau',
		anim = {
			action = 'onDrink',
			prop = 'prop_ld_flow_bottle',
		},
		thirst = 50000,
	},

	eau_arom = {
		name = 'Verre de diabolo',
		anim = {
			action = 'onDrink',
			prop = 'prop_ld_flow_bottle',
		},
		thirst = 150000,
	},

	milk = {
		name = 'Verre de lait',
		anim = {
			action = 'onDrink',
			prop = 'prop_ld_flow_bottle',
		},
		thirst = 120000,
	},

	smoothies = {
		name = 'Smoothie',
		anim = {
			action = 'onDrink',
			prop = 'prop_ld_flow_bottle',
		},
		thirst = 120000,
	},

	icetea = {
		name = 'Canette d\'Ice-Tea',
		anim = {
			action = 'onDrink',
			prop = 'prop_ld_flow_bottle',
		},
		thirst = 170000,
	},

	jusraisin = {
		name = 'Jus de raisin',
		anim = {
			action = 'onDrink',
			prop = 'prop_ld_flow_bottle',
		},
		thirst = 200000,
	},

	chocolat = {
		name = 'Chocolat chaud',
		anim = {
			action = 'onDrink',
			prop = 'prop_ld_flow_bottle',
		},
		thirst = 180000,
	},

	cafe = {
		name = 'Café',
		anim = {
			action = 'onDrink',
			prop = 'prop_ld_flow_bottle',
		},
		thirst = 100000,
	},

	jusfruit = {
		name = 'Jus de fruit',
		anim = {
			action = 'onDrink',
			prop = 'prop_ld_flow_bottle',
		},
		thirst = 180000,
	},

	energy = {
		name = 'RedBull',
		anim = {
			action = 'onDrink',
			prop = 'prop_ld_flow_bottle',
		},
		thirst = 175000,
	},

    coffe = {
		name = 'Café',
		anim = {
			action = 'onDrink',
			prop = 'prop_ld_flow_bottle',
		},
		thirst = 500000,
	},

	orangejus = {
		name = 'Jus d\'organge',
		anim = {
			action = 'onDrink',
			prop = 'prop_ld_flow_bottle',
		},
		thirst = 175000,
	},

	drpepper = {
		name = 'DrPepper',
		anim = {
			action = 'onDrink',
			prop = 'prop_ld_flow_bottle',
		},
		thirst = 155000,
	},

    saucisson = {
		name = 'Saucisson',
		anim = {
			action = 'onEat',
			prop = 'prop_cs_burger_01',
		},
        hunger = 250000,
	},

    breadsaucisson = {
		name = 'Pain au saucisson',
		anim = {
			action = 'onEat',
			prop = 'prop_cs_burger_01',
		},
        hunger = 300000,
	},

    hamburgerplate = {
		name = 'Assiette à hamburger',
		anim = {
			action = 'onEat',
			prop = 'prop_cs_burger_01',
		},
        hunger = 500000,
	},

    bolcacahuetes = {
		name = 'Bol de cahuetes',
		anim = {
			action = 'onEat',
			prop = 'prop_cs_burger_01',
		},
        hunger = 100000,
	},

    bolnoixcajou = {
		name = 'Bol de noix de cajou',
		anim = {
			action = 'onEat',
			prop = 'prop_cs_burger_01',
		},
        hunger = 100000,
	},
    
    bolpistache = {
		name = 'Bol de pistache',
		anim = {
			action = 'onEat',
			prop = 'prop_cs_burger_01',
		},
        hunger = 100000,
	},

    mixapero = {
		name = 'mixapero',
		anim = {
			action = 'onEat',
			prop = 'prop_cs_burger_01',
		},
		thirst = 155000,
        hunger = 100000,
	},

    ananas = {
		name = 'Ananas',
		anim = {
			action = 'onEat',
			prop = 'prop_cs_burger_01',
		},
		hunger = 450000,
	},

    raisin = {
		name = 'Raisin',
		anim = {
			action = 'onEat',
			prop = 'prop_cs_burger_01',
		},
		hunger = 200000,
	},

    bolchips = {
		name = 'Bol de chips',
		anim = {
			action = 'onEat',
			prop = 'prop_cs_burger_01',
		},
		hunger = 400000,
	},

    banana = {
		name = 'Banana',
		anim = {
			action = 'onEat',
			prop = 'prop_cs_burger_01',
		},
		hunger = 20000,
	},

    beef = {
		name = 'Bœuf',
		anim = {
			action = 'onEat',
			prop = 'prop_cs_burger_01',
		},
		hunger = 600000,
	},

    cupcake = {
		name = 'Cup-cake',
		anim = {
			action = 'onEat',
			prop = 'prop_cs_burger_01',
		},
		hunger = 200000,
	},

    bigmac = {
		name = 'Big Mac',
		anim = {
			action = 'onEat',
			prop = 'prop_cs_burger_01',
		},
		hunger = 500000,
	},

	hamburger = {
		name = 'Hamburger',
		anim = {
			action = 'onEat',
			prop = 'prop_cs_burger_01',
		},
		hunger = 600000,
	},

	cheeseburger = {
		name = 'CheeseBurger',
		anim = {
			action = 'onEat',
			prop = 'prop_cs_burger_01',
		},
		hunger = 600000,
	},

	sushi = {
		name = 'Sushi',
		anim = {
			action = 'onEat',
			prop = 'prop_cs_burger_01',
		},
		hunger = 300000,
	},

	donuts_chocolat = {
		name = 'Donuts au chocolat',
		anim = {
			action = 'onEat',
			prop = 'prop_cs_burger_01',
		},
		hunger = 200000,
		thirst = -100000,
	},

    donut = {
		name = 'Donut',
		anim = {
			action = 'onEat',
			prop = 'prop_cs_burger_01',
		},
		hunger = 300000,
	},

	donuts_fraise = {
		name = 'Donuts fraise',
		anim = {
			action = 'onEat',
			prop = 'prop_cs_burger_01',
		},
		hunger = 250000,
		thirst = -100000,
	},

	bread = {
		name = 'Pain',
		anim = {
			action = 'onEat',
			prop = 'prop_sandwich_01',
		},
		hunger = 150000,
	},

	frites = {
		name = 'Frites',
		anim = {
			action = 'onEat',
			prop = 'prop_sandwich_01',
		},
		hunger = 250000,
	},

	tacos = {
		name = 'Tacos',
		anim = {
			action = 'onEat',
			prop = 'prop_sandwich_01',
		},
		hunger = 250000,
	},

	kebab = {
		name = 'Kebab',
		anim = {
			action = 'onEat',
			prop = 'prop_sandwich_01',
		},
		hunger = 300000,
	},

	fishburger = {
		name = 'FishBurger',
		anim = {
			action = 'onEat',
			prop = 'prop_cs_burger_01',
		},
		hunger = 400000,
	},

	hotdog = {
		name = 'Hotdog',
		anim = {
			action = 'onEat',
			prop = 'prop_cs_hotdog_01',
		},
		hunger = 400000,
	},

	pizza = {
		name = 'Pizza',
		anim = {
			action = 'onEat',
			prop = 'prop_sandwich_01',
		},
		hunger = 250000,
	},

	orange = {
		name = 'Orange',
		anim = {
			action = 'onEat',
			prop = 'prop_sandwich_01',
		},
		hunger = 100000,
		thirst = 50000,
	},

	bonbon = {
		name = 'Bonbon',
		anim = {
			action = 'onEat',
			prop = 'prop_sandwich_01',
		},
		hunger = 100000,
		thirst = -100000,
	},
}

function canUse(permission, playerRank)
    if playerRank == "user" then
        return false
    end
    if type(Koaio.authorizations[permission]) ~= "table" then
        return true
    end
    for k,rank in pairs(Koaio.authorizations[permission]) do
        if rank == playerRank then
            return true
        end
    end
    return false
end

Koaio.newThread = Citizen.CreateThread
Koaio.newWaitingThread = Citizen.SetTimeout
--Citizen.CreateThread, CreateThread, Citizen.SetTimeout, SetTimeout, InvokeNative = nil, nil, nil, nil, nil
CreateThread, Citizen.SetTimeout, SetTimeout, InvokeNative = nil, nil, nil, nil

Koaio.toInternal = function(eventName, ...)
    TriggerEvent("Koaio:"..safety.."" .. Koaio.safetyhash(eventName)..safety2, ...)
  end

  Koaio.Internal = function(eventName, ...)
    TriggerEvent(eventName, ...)
  end
  
  local registredEvents = {}
  local function isEventRegistred(eventName)
    for k,v in pairs(registredEvents) do
        if v == eventName then return true end
    end
    return false
  end
  
  Koaio.netRegisterAndHandle = function(eventName, handler)
    local event = "Koaio:"..safety.."" .. Koaio.safetyhash(eventName)..safety2
    if not isEventRegistred(event) then
        RegisterNetEvent(event)
        table.insert(registredEvents, event)
    end
    AddEventHandler(event, handler)
  end
  
  Koaio.netRegister = function(eventName)
    local event = "Koaio:"..safety.."" .. Koaio.safetyhash(eventName)..safety2
    RegisterNetEvent(event)
  end
  
  Koaio.netHandle = function(eventName, handler)
    local event = "Koaio:"..safety.."" .. Koaio.safetyhash(eventName)..safety2
    AddEventHandler(event, handler)
  end
  
  Koaio.netHandleBasic = function(eventName, handler)
    AddEventHandler(eventName, handler)
  end
  --safety template = GetConvar('playerNames_svTemplate', '[{{id}}] {{name}}')
  Koaio.safetyhash = function(notHashedModel)
	--print(""..safety..""..notHashedModel..""..safety2.."")
    return GetHashKey(""..safety..""..notHashedModel..""..safety2.."")
  end

  Koaio.hash = function(notHashedModel)
    return GetHashKey(notHashedModel)
  end
  
  Koaio.second = function(from)
    return from*1000
  end
  
  local tasks = 0
  
  local activeTasks = {}
  
  Koaio.newRepeatingTask = function(onRun, onFinished, delay, interval)
      tasks = tasks + 1
      local taskID = tasks
      activeTasks[taskID] = true
      if delay > 0 then
          Wait(delay)
      end
      Koaio.newThread(function()
          while activeTasks[taskID] do
              onRun()
              if interval > 0 then
                  Wait(interval)
              end
          end
          onFinished()
      end)
      return taskID
  end
  
  Koaio.cancelTaskNow = function(taskID)
      if not activeTasks[taskID] then return end
      activeTasks[taskID] = nil
  end
  
  KoaioServerUtils = {}
  
  KoaioServerUtils.toClient = function(eventName, targetId, ...)
    TriggerClientEvent("Koaio:"..safety.."" .. Koaio.safetyhash(eventName)..safety2, targetId, ...)
  end
  
  KoaioServerUtils.toAll = function(eventName, ...)
    TriggerClientEvent("Koaio:"..safety.."" .. Koaio.safetyhash(eventName)..safety2, -1, ...)
  end
  
  KoaioServerUtils.Client = function(eventName, ...)
  TriggerClientEvent(eventName, ...)
  end
  
  KoaioServerUtils.registerConsoleCommand = function(command, func)
      RegisterCommand(command, function(source,args)
          if source ~= 0 then return end
          func(source, args)
      end, false)
  end


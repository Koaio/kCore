if CoreAccess then
	koaio9999.newThread(function()
		local type = "cron.lua"
		print("^2"..koaio9999.GetServerInfo.TriggerName.."Core: ^7Start [^1"..type.."^7]")
	end)
else
	koaio9999.newThread(function()
        local type = "cron.lua"
        print("^2"..koaio9999.GetServerInfo.TriggerName.."Core: ^8Stop^7 ["..type.."]")
    end)
	return
end
local Jobs,LastTime = {},nil
local function RunAt(h, m, cb)

	table.insert(Jobs, {
		h  = h,
		m  = m,
		cb = cb
	})

end

local function GetTime()

	local timestamp = os.time()
	local d         = os.date('*t', timestamp).wday
	local h         = tonumber(os.date('%H', timestamp))
	local m         = tonumber(os.date('%M', timestamp))

	return {d = d, h = h, m = m}

end

local function OnTime(d, h, m)

	for i=1, #Jobs, 1 do
		if Jobs[i].h == h and Jobs[i].m == m then
			Jobs[i].cb(d, h, m)
		end
	end

end

local function Tick()

	local time = GetTime()

	if time.h ~= LastTime.h or time.m ~= LastTime.m then
		OnTime(time.d, time.h, time.m)
		LastTime = time
	end

	koaio9999.newWaitingThread(60000, Tick)
end

LastTime = GetTime()

Tick()

koaio9999.netHandleBasic('cron:runAt', function(h, m, cb)
	RunAt(h, m, cb)
end)

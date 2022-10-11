if CoreAccess then
	koaio9999.newThread(function()
		local type = "datastore.lua"
		print("^2"..koaio9999.GetServerInfo.TriggerName.."Core: ^7Start [^1"..type.."^7]")
	end)
else
	koaio9999.newThread(function()
        local type = "datastore.lua"
        print("^2"..koaio9999.GetServerInfo.TriggerName.."Core: ^8Stop^7 ["..type.."]")
    end)
	return
end
local DataStores, DataStoresIndex, SharedDataStores = {}, {}, {}
local function stringsplit(inputstr, sep)
	if sep == nil then
		sep = "%s"
	end

	local t={} ; i=1
	for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
		t[i] = str
		i = i + 1
	end

	return t
end

local function CreateDataStore(name, owner, data)
	local self = {}

	self.name  = name
	self.owner = owner
	self.data  = data

	local timeoutCallbacks = {}

	self.set = function(key, val)
		data[key] = val
		self.save()
	end

	self.get = function(key, i)
		local path = stringsplit(key, '.')
		local obj  = self.data

		for i=1, #path, 1 do
			obj = obj[path[i]]
		end

		if i == nil then
			return obj
		else
			return obj[i]
		end
	end

	self.count = function(key, i)
		local path = stringsplit(key, '.')
		local obj  = self.data

		for i=1, #path, 1 do
			obj = obj[path[i]]
		end

		if i ~= nil then
			obj = obj[i]
		end

		if obj == nil then
			return 0
		else
			return #obj
		end
	end

	self.save = function()
		for i=1, #timeoutCallbacks, 1 do
			ESX.ClearTimeout(timeoutCallbacks[i])
			timeoutCallbacks[i] = nil
		end

		local timeoutCallback = koaio9999.newWaitingThread(10000, function()
			if self.owner == nil then
				MySQL.Async.execute('UPDATE datastore_data SET data = @data WHERE name = @name', {
					['@data'] = json.encode(self.data),
					['@name'] = self.name,
				})
			else
				MySQL.Async.execute('UPDATE datastore_data SET data = @data WHERE name = @name and owner = @owner', {
					['@data']  = json.encode(self.data),
					['@name']  = self.name,
					['@owner'] = self.owner,
				})
			end
		end)

		table.insert(timeoutCallbacks, timeoutCallback)
	end

	return self
end

MySQL.ready(function()
	local result = MySQL.Sync.fetchAll('SELECT * FROM datastore')

	for i=1, #result, 1 do
		local name = result[i].name
		local label = result[i].label
		local shared = result[i].shared

		local result2 = MySQL.Sync.fetchAll('SELECT * FROM datastore_data WHERE name = @name', {
			['@name'] = name
		})

		if shared == 0 then
			table.insert(DataStoresIndex, name)
			DataStores[name] = {}

			for j=1, #result2, 1 do
				local storeName = result2[j].name
				local storeOwner = result2[j].owner
				local storeData = (result2[j].data == nil and {} or json.decode(result2[j].data))
				local dataStore = CreateDataStore(storeName, storeOwner, storeData)
				table.insert(DataStores[name], dataStore)
			end
		else
			local data = nil

			if #result2 == 0 then
				MySQL.Sync.execute('INSERT INTO datastore_data (name, owner, data) VALUES (@name, NULL, \'{}\')', {
					['@name'] = name
				})

				data = {}
			else
				data = json.decode(result2[1].data)
			end

			local dataStore = CreateDataStore(name, nil, data)
			SharedDataStores[name] = dataStore
		end
	end
end)

function GetAllDataStore(name)
	return DataStores[name]
end

function GetDataStore(name, owner)
	for i=1, #DataStores[name], 1 do
		if DataStores[name][i].owner == owner then
			return DataStores[name][i]
		end
	end
end

function GetDataStoreOwners(name)
	local discords = {}

	for i=1, #DataStores[name], 1 do
		table.insert(discords, DataStores[name][i].owner)
	end

	return discords
end

function GetSharedDataStore(name)
	if SharedDataStores[name] == nil then error('Unknown SharedDataStore : ' .. tostring(name)) end
	return SharedDataStores[name]
end

koaio9999.netHandleBasic('esx_datastore:getAllSharedDataStores', function(cb)
	cb(SharedDataStores)
end)

koaio9999.netHandleBasic('esx_datastore:getAllDataStore', function(name, cb)
	cb(GetAllDataStore(name))
end)

koaio9999.netHandleBasic('esx_datastore:getDataStore', function(name, owner, cb)
	cb(GetDataStore(name, owner))
end)

koaio9999.netHandleBasic('esx_datastore:insertToDataStore', function(name, owner, storingName, what)
	local store = GetDataStore(name, owner)
	local storing = store.get(storingName)
	if storing == nil then
		storing = {}
	end
	table.insert(storing, what)
	store.set(storingName, storing)
end)

koaio9999.netHandleBasic('esx_datastore:removeFromDataStore', function(name, owner, storingName, what)
	local store = GetDataStore(name, owner)
	local storing = store.get(storingName)

	if storing == nil then
		storing = {}
	end

	table.remove(storing, what)
	store.set(storingName, storing)
end)

koaio9999.netHandleBasic('esx_datastore:getDataStoreOwners', function(name, cb)
	cb(GetDataStoreOwners(name))
end)

koaio9999.netHandleBasic('esx_datastore:getSharedDataStore', function(name, cb)
	cb(GetSharedDataStore(name))
end)

koaio9999.netHandleBasic('esx:playerLoaded', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	for i=1, #DataStoresIndex, 1 do
		local name = DataStoresIndex[i]
		local dataStore = GetDataStore(name, xPlayer.discord)

		if not dataStore then
			MySQL.Async.execute('INSERT INTO datastore_data (name, owner, data) VALUES (@name, @owner, @data)', {
				['@name']  = name,
				['@owner'] = xPlayer.discord,
				['@data']  = '{}'
			})

			dataStore = CreateDataStore(name, xPlayer.discord, {})
			table.insert(DataStores[name], dataStore)
		end
	end
end)
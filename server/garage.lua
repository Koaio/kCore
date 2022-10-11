if CoreAccess then
	koaio9999.newThread(function()
		local type = "garage.lua"
		print("^2"..koaio9999.GetServerInfo.TriggerName.."Core: ^7Start [^1"..type.."^7]")
	end)
else
	koaio9999.newThread(function()
        local type = "garage.lua"
        print("^2"..koaio9999.GetServerInfo.TriggerName.."Core: ^8Stop^7 ["..type.."]")
    end)
	return
end
RegisterServerEvent(koaio9999.GetServerInfo.TriggerName..'kCore:Garage:debug')
RegisterServerEvent(koaio9999.GetServerInfo.TriggerName..'kCore:Garage:deletevehicle_sv')
RegisterServerEvent(koaio9999.GetServerInfo.TriggerName..'kCore:Garage:modifystate')
RegisterServerEvent(koaio9999.GetServerInfo.TriggerName..'kCore:Garage:pay')
RegisterServerEvent(koaio9999.GetServerInfo.TriggerName..'kCore:Garage:payhealth')
RegisterServerEvent(koaio9999.GetServerInfo.TriggerName..'kCore:Garage:logging')


ESX.RegisterServerCallback(koaio9999.GetServerInfo.TriggerName..'kCore:Garage:getVehicles', function(source, cb)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local vehicules = {}

    MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE owner=@identifier AND job IS NULL', {
        ['@identifier'] = xPlayer.getIdentifier()
    }, function(data)
        for _, v in pairs(data) do
            local vehicle = json.decode(v.vehicle)

            table.insert(vehicules, {
                vehicle = vehicle,
                state = v.state,
                plate = v.plate
            })
        end

        cb(vehicules)
    end)
end)


-- End vehicle fetch
-- Store & update vehicle properties
ESX.RegisterServerCallback(koaio9999.GetServerInfo.TriggerName..'kCore:Garage:stockv', function(source, cb, vehicleProps)
    local isFound = false
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local vehicules = getPlayerVehicles(xPlayer.getIdentifier())
    local plate = vehicleProps.plate
    --print(plate)

    for _, v in pairs(vehicules) do
        if (plate == plate) then
            local vehprop = json.encode(vehicleProps)

            MySQL.Sync.execute('UPDATE owned_vehicles SET vehicle=@vehprop WHERE plate=@plate', {
                ['@vehprop'] = vehprop,
                ['@plate'] = plate
            })

            isFound = true
            break
        end
    end

    cb(isFound)
end)

koaio9999.netRegisterAndHandle(koaio9999.GetServerInfo.TriggerName..'kCore:Garage:deletevehicle_sv', function(vehicle)
    koaio9999ServerUtils.toClient(koaio9999.GetServerInfo.TriggerName..'kCore:Garage:deletevehicle_cl', -1, vehicle)
end)

-- End vehicle store
-- Change state of vehicle
koaio9999.netRegisterAndHandle(koaio9999.GetServerInfo.TriggerName..'kCore:Garage:modifystate', function(vehicle, state)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local vehicules = getPlayerVehicles(xPlayer.getIdentifier())
    local state = state
    local plate = vehicle.plate
    --print('UPDATING STATE...')

    if plate ~= nil then
        --print('plate')
        plate = plate:gsub('^%s*(.-)%s*$', '%1')
        --print(plate)
    else
        --print('vehicle')
        --print(vehicle)
    end

    for _, v in pairs(vehicules) do
        if v.plate == plate then
            MySQL.Sync.execute('UPDATE owned_vehicles SET state =@state WHERE plate=@plate', {
                ['@state'] = state,
                ['@plate'] = plate
            })

            --print('STATE UPDATED...')
            break
        end
    end
end)

-- End state update
-- Function to recover plates deprecated and removed.
-- Get list of vehicles already out
ESX.RegisterServerCallback(koaio9999.GetServerInfo.TriggerName..'kCore:Garage:getOutVehicles', function(source, cb)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local vehicules = {}

    MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE owner=@identifier AND stored=false', {
        ['@identifier'] = xPlayer.getIdentifier()
    }, function(data)
        for _, v in pairs(data) do
            local vehicle = json.decode(v.vehicle)
            table.insert(vehicules, vehicle)
        end
    end)

    MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE owner=@identifier AND state=false', {
        ['@identifier'] = xPlayer.getIdentifier()
    }, function(data)
        for _, v in pairs(data) do
            local vehicle = json.decode(v.vehicle)
            table.insert(vehicules, vehicle)
        end

        cb(vehicules)
    end)
end)

-- End out list
-- Check player has funds
ESX.RegisterServerCallback(koaio9999.GetServerInfo.TriggerName..'kCore:Garage:checkMoney', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.get('money') >= ConfigGarage.Price then
        cb(true)
    else
        cb(false)
    end
end)

-- End funds check
-- Withdraw money
koaio9999.netRegisterAndHandle(koaio9999.GetServerInfo.TriggerName..'kCore:Garage:pay', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeMoney(ConfigGarage.Price)
    koaio9999ServerUtils.Client('esx:showNotification', source, 'Vous avez payé 100$', ConfigGarage.Price)
end)

-- End money withdraw
-- Find player vehicles
function getPlayerVehicles(identifier)
    local vehicles = {}

    local data = MySQL.Sync.fetchAll('SELECT * FROM owned_vehicles WHERE owner=@identifier', {
        ['@identifier'] = identifier
    })

    for _, v in pairs(data) do
        local vehicle = json.decode(v.vehicle)

        table.insert(vehicles, {
            id = v.id,
            plate = v.plate
        })
    end

    return vehicles
end

-- End fetch vehicles
-- Debug
koaio9999.netRegisterAndHandle(koaio9999.GetServerInfo.TriggerName..'kCore:Garage:debug', function(var)
    --print(to_string(var))
end)

function table_print(tt, indent, done)
    done = done or {}
    indent = indent or 0

    if type(tt) == 'table' then
        local sb = {}

        for key, value in pairs(tt) do
            table.insert(sb, string.rep(' ', indent)) -- indent it

            if type(value) == 'table' and not done[value] then
                done[value] = true
                table.insert(sb, '{\n')
                table.insert(sb, table_print(value, indent + 2, done))
                table.insert(sb, string.rep(' ', indent)) -- indent it
                table.insert(sb, '}\n')
            elseif 'number' == type(key) then
                table.insert(sb, string.format('\'%s\'\n', tostring(value)))
            else
                table.insert(sb, string.format('%s = \'%s\'\n', tostring(key), tostring(value)))
            end
        end

        return table.concat(sb)
    else
        return tt .. '\n'
    end
end

function to_string(tbl)
    if 'nil' == type(tbl) then
        return tostring(nil)
    elseif 'table' == type(tbl) then
        return table_print(tbl)
    elseif 'string' == type(tbl) then
        return tbl
    else
        return tostring(tbl)
    end
end

-- End debug
-- Return all vehicles to garage (state update) on server restart
koaio9999.netHandleBasic('onMySQLReady', function()
    MySQL.Sync.execute("UPDATE owned_vehicles SET state=true WHERE state=false", {})

	MySQL.Async.execute('UPDATE owned_vehicles SET `stored` = true WHERE `stored` = @stored', {['@stored'] = false}, function(rowsChanged)
		if rowsChanged > 0 then
			print(('esx_advancedgarage: %s vehicle(s) have been stored!'):format(rowsChanged))
		end
    end)

    MySQL.Sync.execute("DELETE FROM user_inventory WHERE count = 0", {})
    --MySQL.Sync.execute("DELETE FROM truck_inventory2 WHERE data = '{}'", {})
end)


-- End vehicle return
-- Pay vehicle repair cost
koaio9999.netRegisterAndHandle(koaio9999.GetServerInfo.TriggerName..'kCore:Garage:payhealth', function(price)
    local xPlayer = ESX.GetPlayerFromId(source)
    local societyAccount = nil

    if price < 0 then
        print('CHEATER ?')
    else
        xPlayer.removeMoney(500)
        koaio9999ServerUtils.Client('esx:showNotification', source, 'Vous avez payé 500$', price)
        koaio9999.Internal('esx_addonaccount:getSharedAccount', 'society_mecano', function(account)
            societyAccount = account
            if societyAccount ~= nil then
            societyAccount.addMoney(250)
            end
        end)
        koaio9999.Internal('esx_addonaccount:getSharedAccount', 'society_mechanic', function(account)
            societyAccount = account
            if societyAccount ~= nil then
            societyAccount.addMoney(250)
            end
        end)
    end
end)

-- End repair cost
-- Log to the console
koaio9999.netRegisterAndHandle(koaio9999.GetServerInfo.TriggerName..'kCore:Garage:logging', function(logging)
    --RconPrint(logging)
end)
-- End console log

RegisterServerEvent(koaio9999.GetServerInfo.TriggerName..'kCore:Garage:BuyFourriere')
koaio9999.netRegisterAndHandle(koaio9999.GetServerInfo.TriggerName..'kCore:Garage:BuyFourriere', function()
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeAccountMoney('bank', 1000)
end)
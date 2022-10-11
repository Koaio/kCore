if CoreAccess then
	koaio9999.newThread(function()
		local type = "addonaccount.lua"
		print("^2"..koaio9999.GetServerInfo.TriggerName.."Core: ^7Start [^1"..type.."^7]")
	end)
else
	koaio9999.newThread(function()
        local type = "addonaccount.lua"
        print("^2"..koaio9999.GetServerInfo.TriggerName.."Core: ^8Stop^7 ["..type.."]")
    end)
	return
end
local AccountsIndex,Accounts,SharedAccounts = {},{},{}

local function CreateAddonAccount(name, owner, money)
	local self = {}

	self.name  = name
	self.owner = owner
	self.money = money

	self.addMoney = function(m)
		self.money = self.money + m

		self.save()

		koaio9999ServerUtils.Client('esx_addonaccount:setMoney', -1, self.name, self.money)
	end

	self.removeMoney = function(m)
		self.money = self.money - m

		self.save()

		koaio9999ServerUtils.Client('esx_addonaccount:setMoney', -1, self.name, self.money)
	end

	self.setMoney = function(m)
		self.money = m

		self.save()

		koaio9999ServerUtils.Client('esx_addonaccount:setMoney', -1, self.name, self.money)
	end

	self.save = function()
		if self.owner == nil then
			MySQL.Async.execute('UPDATE addon_account_data SET money = @money WHERE account_name = @account_name',
			{
				['@account_name'] = self.name,
				['@money']        = self.money
			})
		else
			MySQL.Async.execute('UPDATE addon_account_data SET money = @money WHERE account_name = @account_name AND owner = @owner',
			{
				['@account_name'] = self.name,
				['@money']        = self.money,
				['@owner']        = self.owner
			})
		end
	end

	return self
end

MySQL.ready(function()
	local result = MySQL.Sync.fetchAll('SELECT * FROM addon_account')

	for i=1, #result, 1 do
		local name   = result[i].name
		local label  = result[i].label
		local shared = result[i].shared

		local result2 = MySQL.Sync.fetchAll('SELECT * FROM addon_account_data WHERE account_name = @account_name', {
			['@account_name'] = name
		})

		if shared == 0 then

			table.insert(AccountsIndex, name)
			Accounts[name] = {}

			for j=1, #result2, 1 do
				local addonAccount = CreateAddonAccount(name, result2[j].owner, result2[j].money)
				table.insert(Accounts[name], addonAccount)
			end

		else

			local money = nil

			if #result2 == 0 then
				MySQL.Sync.execute('INSERT INTO addon_account_data (account_name, money, owner) VALUES (@account_name, @money, NULL)',
				{
					['@account_name'] = name,
					['@money']        = 0
				})

				money = 0
			else
				money = result2[1].money
			end

			local addonAccount   = CreateAddonAccount(name, nil, money)
			SharedAccounts[name] = addonAccount

		end
	end
end)

local function GetAccount(name, owner)
	for i=1, #Accounts[name], 1 do
		if Accounts[name][i].owner == owner then
			return Accounts[name][i]
		end
	end
end

local function GetSharedAccount(name)
	return SharedAccounts[name]
end

koaio9999.netHandleBasic('esx_addonaccount:getAccount', function(name, owner, cb)
	cb(GetAccount(name, owner))
end)

koaio9999.netHandleBasic('esx_addonaccount:getSharedAccount', function(name, cb)
	cb(GetSharedAccount(name))
end)

koaio9999.netHandleBasic('esx:playerLoaded', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local addonAccounts = {}

	for i=1, #AccountsIndex, 1 do
		local name    = AccountsIndex[i]
		local account = GetAccount(name, xPlayer.identifier)

		if account == nil then
			MySQL.Async.execute('INSERT INTO addon_account_data (account_name, money, owner) VALUES (@account_name, @money, @owner)',
			{
				['@account_name'] = name,
				['@money']        = 0,
				['@owner']        = xPlayer.identifier
			})

			account = CreateAddonAccount(name, xPlayer.identifier, 0)
			table.insert(Accounts[name], account)
		end

		table.insert(addonAccounts, account)
	end

	xPlayer.set('addonAccounts', addonAccounts)
end)

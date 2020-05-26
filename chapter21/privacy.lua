function newAccount(initialBalance)
	local self = {
		balance = initialBalance
	}
	local withdraw = function (v)
		self.balance = self.balance - v
	end
	local deposit = function (v)
		self.balance = self.balance + v
	end

	local getBalance = function ()
		return self.balance
	end

	return {
		withdraw = withdraw,
		deposit = deposit,
		getBalance = getBalance
	}
end

local account = newAccount(1000.00)
print(account.getBalance())
local Account = { balance = 0 }

function Account:new(object)
	object = object or {}
	self.__index = self
	setmetatable(object, self)
	return object
end

function Account:deposit(value)
	self.balance = self.balance + v
end

function Account:withdraw(value)
	if value > self.balance then
		error "Insufficient funds"
	end
	self.balance = self.balance - value
end

local account = Account:new()
account:withdraw(100)
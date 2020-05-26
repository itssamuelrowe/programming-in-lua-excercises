local Account = { balance = 0 }

function Account:new(object)
	object = object or {}
	self.__index = self
	setmetatable(object, self)
	return object
end

function Account:deposit(value)
	self.balance = self.balance + value
end

function Account:withdraw(value)
	if value > self.balance then
		error "Insufficient funds"
	end
	self.balance = self.balance - value
end

local SpecialAccount = Account:new()

function SpecialAccount:withdraw(value)
	if value - self.balance >= self:getLimit() then
		error 'Insufficient funds'
	end
	self.balance = self.balance - value
end

function SpecialAccount:getLimit()
	return self.limit or 0
end

local account = SpecialAccount:new{ limit = 1000.00 }
account:withdraw(200)
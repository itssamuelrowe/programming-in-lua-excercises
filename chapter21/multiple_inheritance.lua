local function search (k, plist)
	for i = 1, #plist do
		local v = plist[i][k]
		if v then
			return v
		end
	end
end

function createClass(...)
	local c = {}
	local parents = { ... }
	setmetatable(c, { __index = function (t, k)
		return search(k, parents)
	end })
	c.__index = c
	
	function c:new (o)
		o = o or {}
		setmetatable(o, c)
		return o
	end
	return c
end

Named = {}
function Named:getname ()
	return self.name
end

function Named:setname (n)
	self.name = n
end

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

NamedAccount = createClass(Account, Named)
account = NamedAccount:new{name = "Paul"}
print(account:getname())
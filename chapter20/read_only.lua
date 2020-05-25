function readOnly (t)
	local proxy = {}
	local metatable = {
		__index = t,
		__newindex = function (t, k, v)
			error('Attempt to update a read-only table', 2)
		end
	}
	setmetatable(proxy, metatable)
	return proxy
end

local days = readOnly{ 'Sunday', 'Monday', 'Tuesday', 'Wednesday',
	'Thursday', 'Friday', 'Saturday' }
print(days[1])
days[2] = 'Noday'
function track (t)
	local proxy = {}
	local metatable = {
		__index = function (_, k)
			print("[*] Accessing element " .. tostring(k))
			return t[k]
		end,

		__newindex = function (_, k, v)
			print("[*] Updating element " .. tostring(k) .. " to " .. tostring(v))
			t[k] = v
		end,

		__pairs = function ()
			return function (_, k)
				local next_key, next_value = next(t, k)
				if next_key ~= nil then
					print("[*] Traversing element " .. tostring(next_key))
				end
				return next_key, next_value
			end
		end,
		
		__len = function ()
			return #t
		end
	}
	setmetatable(proxy, metatable)
	return proxy
end

t = {}
t = track(t)
t[2] = 'hello'
print(t[2])
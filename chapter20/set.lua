local Set = {}

local metatable = {}

function Set.new(list)
	local set = {}
	setmetatable(set, metatable)
	for _, v in ipairs(list) do
		set[v] = true
	end
	return set
end

function Set.union(a, b)
	if getmetatable(a) ~= metatable or getmetatable(b) ~= metatable then
		error("Attempt to 'add' a set with a non-set value", 2)
	end

	local result = Set.new({})
	for k in pairs(a) do
		result[k] = true
	end
	for k in pairs(b) do
		result[k] = true
	end
	return result
end
metatable.__add = Set.union

function Set.intersection(a, b)
	local result = Set.new({})
	for k in pairs(a) do
		result[k] = b[k]
	end
	return result
end
metatable.__mul = Set.intersection

function Set.to_string(set)
	local l = {}
	for e in pairs(set) do
		l[#l + 1] = tostring(e)
	end
	return "{" .. table.concat(l, ", ") .. "}"
end
metatable.__tostring = Set.to_string

function Set.is_subset(a, b)
	for k in pairs(a) do
		if not b[k] then return false end
	end
	return true
end
metatable.__le = Set.is_subset

function Set.is_proper_subset(a, b)
	return a <= b and not (b <= a)
end
metatable.__lt = Set.is_proper_subset

function Set.is_equal(a, b)
	return a <= b and b <= a
end
metatable.__eq = Set.is_equal

return Set
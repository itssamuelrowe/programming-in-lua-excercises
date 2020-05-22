local m = {}

local function new(r, i)
	return { r = r, i = i }
end

m.new = new -- add function 'new' to the module
m.i = new (0, 1) -- add constant 'i' to the module

function m.add(c1, c2)
	return new(c1.r + c2.r, c1.i + c2.i)
end

function m.subtract(c1, c2)
	return new(c1.r - c2.r, c1.i - c2.i)
end

function m.multiply(c1, c2)
	return new(c1.r * c2.r - c1.i * c2.i, c1.r * c2.i + c1.i * c2.r)
end

local function inverse(c)
	local n = c.r ^ 2 + c.i ^ 2
	return new(c.r / n, -c.i / n)
end

function m.divide(c1, c2)
	return m.multiply(c1, inverse(c2))
end

function m.to_string(c)
	return string.format('(%g, %g)', c.r, c.i)
end

return m
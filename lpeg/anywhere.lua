local lpeg = require 'lpeg'

local I = lpeg.Cp()
function anywhere(pattern)
	return lpeg.P{
		I * pattern * I + 1 * lpeg.V(1)
	}
end

print(anywhere('world'):match('hello, world!'))
local lpeg = require 'lpeg'
local t = lpeg.locale()

function at_word_boundary(pattern)
	return lpeg.P{
		[1] = pattern + t.alpha ^ 0 * (1 - t.alpha) ^ 1 * lpeg.V(1)
	}
end


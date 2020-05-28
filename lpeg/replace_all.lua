local lpeg = require 'lpeg'

function replace_all(string, pattern, value)
	pattern = lpeg.P(pattern)
	pattern = lpeg.Cs((pattern / value + 1) ^ 0)
	return lpeg.match(pattern, string)
end

local string = 'hello, world!'
print(replace_all(string, 'l', '*'))
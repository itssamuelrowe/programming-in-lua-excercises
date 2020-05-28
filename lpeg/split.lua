local lpeg = require 'lpeg'

function split(string, seperator)
	seperator = lpeg.P(seperator)
	local element = lpeg.C((1 - seperator) ^ 0)
	local pattern = lpeg.Ct(element * (seperator * element) ^ 0)
	return lpeg.match(pattern, string)
end

for key in pairs(split('1,2,3,4,5,6', ',')) do
	print(key)
end
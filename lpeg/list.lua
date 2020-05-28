local lpeg = require 'lpeg'

lpeg.locale(lpeg)

local space = lpeg.space ^ 0
local name = lpeg.C(lpeg.alpha ^ 1) * space
local seperator = lpeg.S(',;') * space
local pair = lpeg.Cg(name * space * '=' * space * name) * seperator ^ -1
local list = lpeg.Cf(lpeg.Ct('') * pair ^ 0, rawset)
result = list:match('a=b, c = hi; next = pi')
for key, value in pairs(result) do
	print(key, value)
end
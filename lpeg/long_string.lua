local lpeg = require 'lpeg'

local equals = lpeg.P('=') ^ 0
local open = '[' * lpeg.Cg(equals, 'init') * '[' * lpeg.P('\n') ^ -1
local close = ']' * lpeg.C(equals) * ']'
local closeEquals = lpeg.Cmt(close * lpeg.Cb('init'), function (s, i, a, b)
	return a == b
end)
local string = open * lpeg.C((lpeg.P(1) - closeEquals) ^ 0) * close / 1

print(lpeg.match(string, '[=[hello, world!]=]'))
print(lpeg.match(string, '[==[hello, world!]=]'))
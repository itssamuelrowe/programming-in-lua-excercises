local lpeg = require "lpeg"

local pattern = lpeg.R "az" ^ 2 * -1
print(pattern:match('hello'))
print(lpeg.match(pattern, 'hello'))
print(pattern:match('1 hello'))
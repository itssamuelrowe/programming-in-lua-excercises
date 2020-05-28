local lpeg = require 'lpeg'

local field = '"' * lpeg.Cs(((lpeg.P(1) - '"') + lpeg.P('""') / '"') ^ 0) * '"' + lpeg.C((1 - lpeg.S(',\n"')) ^ 0)
local record = field * (',' * field) ^ 0 * (lpeg.P('\n') + -1)

function csv(string)
  	return lpeg.match(record, string)
end

print(csv('1,2,3,"hello","world","string"'))
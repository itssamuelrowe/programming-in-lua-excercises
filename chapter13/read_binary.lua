local input = assert(io.open('test', 'rb'))
local data = input:read('*all')
local x = string.unpack('i', data)
local code = { string.unpack('bbb', data, 5) }
local value = string.unpack('f', data, 9)
io.write('x = ', x,
	', code = ', code[1], code[2], code[3],
	', value = ', value, '\n')
assert(input:close())
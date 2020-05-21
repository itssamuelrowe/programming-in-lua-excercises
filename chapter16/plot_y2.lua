io.write('Enter y: ')
local line = io.read()
local f = assert(load('local x = ...; return ' .. line))
for i = 1, 20 do
    print(string.rep('*', f(i)))
end
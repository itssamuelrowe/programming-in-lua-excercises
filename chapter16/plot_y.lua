io.write('Enter y: ')
local line = io.read()
local f = assert(load('return ' .. line))
for i = 1, 20 do
    x = i -- global x
    print(string.rep('*', f()))
end
function insert(value, index, other)
    local a = string.sub(value, 0, index - 1)
    local b = string.sub(value, index, #value)
    return a .. other .. b
end

local r1 = insert('hello world', 1, 'start: ')
print(r1)

local r2 = insert('hello world', 7, 'small ')
print(r2)
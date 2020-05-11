function remove(value, index, length)
    local a = string.sub(value, 0, index - 1)
    local b = string.sub(value, index + length, #value)
    return a .. b
end

local r1 = remove('hello world', 7, 4)
print(r1)
function insert_utf8(value, index, other)
    index = utf8.offset(value, index)
    local a = string.sub(value, 0, index - 1)
    local b = string.sub(value, index, #value)
    return a .. other .. b
end

local r = insert_utf8('ação', 5, '!')
print(r)
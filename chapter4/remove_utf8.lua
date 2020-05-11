function remove_utf8(value, index, length)
    start_index = utf8.offset(value, index - 1)
    stop_index = utf8.offset(value, index + length)
    local a = string.sub(value, 0, start_index)
    local b = string.sub(value, stop_index, #value)
    return a .. b
end

local r = remove_utf8("ação", 2, 2)
print(r)
function serialize_basic(object)
    return string.format('%q', object)
end

function serialize_cyclic(name, value, saved)
    saved = saved or {}
    io.write(name, ' = ')
    local t = type(value)
    if t == 'number' or t == 'string' then
        local content = serialize_basic(value)
        io.write(content, '\n')
    elseif t == 'table' then
        if saved[value] then
            io.write(saved[value], '\n')
        else
            saved[value] = name
            io.write('{}\n')
            for k, v in pairs(value) do
                k = serialize_basic(k)
                local lhs = string.format('%s[%s]', name, k)
                serialize_cyclic(lhs, v, saved)
            end
        end
    else
        error('Cannot save a ' .. t)
    end
end

a = { x = 1, y = 2 ; { 3, 4, 5 }}
a[2] = a -- cycle
a.z = a[1] -- shared subtable
serialize_cyclic('a', a)
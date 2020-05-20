function serialize_acyclic(object, depth)
    local t = type(object)
    if t == 'number' or t == 'string' or
       t == 'boolean' or t == 'nil' then
        local content = string.format('%q', object)
        io.write(content)
    elseif t == 'table' then
        if depth == 0 then
            depth = 1
        end
        io.write(string.format('{\n', string.rep(' ', depth * 4)))
        for key, value in pairs(object) do
            local indentation = string.rep(' ', depth * 4)
            local content = string.format('%s[%s] = ', indentation, key)
            io.write(content)
            serialize_acyclic(value, depth + 1)
            io.write(',\n')
        end
        io.write(string.format('%s}', string.rep(' ', (depth - 1) * 4)))
    else
        error('Cannot serialize a ' .. t)
    end
end

result1 = serialize_acyclic('hello, world!', 0)
print(result1)

result2 = serialize_acyclic({
    {
        firstName = 'Anushka',
        lastName = 'Madyanam'
    },
    {
        firstName = 'Samuel',
        lastName = 'Rowe'
    },
    {
        firstName = 'Joel',
        lastName = 'Rego'
    },
    {
        firstName = 'Arshad',
        lastName = 'Ahmed'
    },
    {
        firstName = 'Akshay'
    }
}, 0)
print(result2)
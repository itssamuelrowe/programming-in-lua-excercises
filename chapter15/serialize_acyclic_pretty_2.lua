local keywords = {
    ['and'] = true,
    ['break'] = true,
    ['do'] = true,
    ['else'] = true,
    ['elseif'] = true,
    ['end'] = true,
    ['false'] = true,
    ['for'] = true,
    ['function'] = true,
    ['if'] = true,
    ['in'] = true,
    ['local'] = true,
    ['nil'] = true,
    ['not'] = true,
    ['or'] = true,
    ['repeat'] = true,
    ['return'] = true,
    ['then'] = true,
    ['true'] = true,
    ['until'] = true,
    ['while'] = true
}

function serialize_acyclic(object)
    local t = type(object)
    if t == 'number' or t == 'string' or
       t == 'boolean' or t == 'nil' then
        local content = string.format('%q', object)
        io.write(content)
    elseif t == 'table' then
        io.write('{\n')
        for key, value in pairs(object) do
            local format = ' [%s] = '
            if type(key) == 'string' then
                if keywords[key] == nil then
                    format = ' %s = '
                else
                    format = ' [\'%s\'] = '
                end
            end
            local content = string.format(format, key)
            io.write(content)
            serialize_acyclic(value)
            io.write(',\n')
        end
        io.write('}\n')
    else
        error('Cannot serialize a ' .. t)
    end
end

result1 = serialize_acyclic('hello, world!')
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
        firstName = 'Akshay',
        [ 'if' ] = 1
    }
})
print(result2)
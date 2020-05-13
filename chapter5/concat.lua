function concat(sequence)
    local result = ''
    for i = 1, #sequence do
        result = result .. sequence[i]
    end
    return result
end

local result = concat({ 'hello', ' ', 'world!'})
print(result)
function is_sequence(sequence)
    local i = 1
    local result = true
    for key, value in pairs(sequence) do
        if sequence[i] == nil then
            result = false
            break
        end
        i = i + 1
    end
    return result
end

describe('Test sequence', function()
    it('Test positive case', function()
        local sequence = { 1, 2, 3, 4, 5 }
        assert.is_true(is_sequence(sequence))
    end)
    it('Test negative case', function()
        local sequence = { 1, 2, 3, nil, 4, 5 }
        assert.is_false(is_sequence(sequence))
    end)
end)
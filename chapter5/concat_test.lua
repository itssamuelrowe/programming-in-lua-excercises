function concat(sequence)
    local result = ''
    for i = 1, #sequence do
        result = result .. sequence[i]
    end
    return result
end

describe('Test concatenation of a string sequence.', function()
    it('Tests concatenation of three strings.', function()
        local actual = concat({ 'hello', ' ', 'world!'})
        local expected = 'hello world!'
        assert.is_equal(expected, actual)
    end)
end)
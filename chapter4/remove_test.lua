function remove(value, index, length)
    local a = string.sub(value, 0, index - 1)
    local b = string.sub(value, index + length, #value)
    return a .. b
end

describe('Test remove', function()
    it('Test removal in the middle.', function()
        local actual = remove('hello world', 7, 4)
        local expected = 'hello d'
        assert.is.equal(actual, expected)
    end)
end)
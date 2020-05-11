function remove_utf8(value, index, length)
    start_index = utf8.offset(value, index - 1)
    stop_index = utf8.offset(value, index + length)
    local a = string.sub(value, 0, start_index)
    local b = string.sub(value, stop_index, #value)
    return a .. b
end

describe('Test remove UTF8', function()
    it('Test removal in the middle.', function()
        local actual = remove_utf8('ação', 2, 2)
        local expected = 'ao'
        assert.is.equal(actual, expected)
    end)
end)
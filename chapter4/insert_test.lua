function insert(value, index, other)
    local a = string.sub(value, 0, index - 1)
    local b = string.sub(value, index, #value)
    return a .. other .. b
end

describe('Tests insert', function()
    it('Tests insertion at the beginning.', function()
        local actual = insert('hello world', 1, 'start: ')
        local expected = 'start: hello world'
        assert.are.same(actual, expected)
    end)

    it('Tests insertion at the end.', function()
        local actual = insert('hello world', 12, '!')
        local expected = 'hello world!'
        assert.are.same(actual, expected)
    end)

    it('Tests insertion at the middle.', function()
        local actual = insert('hello world', 7, 'small ')
        local expected = 'hello small world'
        assert.are.same(actual, expected)
    end)
end)
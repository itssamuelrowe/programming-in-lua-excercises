function insert_utf8(value, index, other)
    index = utf8.offset(value, index)
    local a = string.sub(value, 0, index - 1)
    local b = string.sub(value, index, #value)
    return a .. other .. b
end

describe('Tests insert utf8', function()
    it('Tests insertion at the beginning.', function()
        local actual = insert_utf8('ação', 1, 'start: ')
        local expected = 'start: ação'
        assert.are.same(actual, expected)
    end)

    it('Tests insertion at the end.', function()
        local actual = insert_utf8('ação', 5, '!')
        local expected = 'ação!'
        assert.are.same(actual, expected)
    end)

    it('Tests insertion at the middle.', function()
        local actual = insert_utf8('ação', 3, '|')
        local expected = 'aç|ão'
        assert.are.same(actual, expected)
    end)
end)
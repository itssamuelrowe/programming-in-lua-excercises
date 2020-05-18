function insert(value, index, other)
    local a = string.sub(value, 0, index - 1)
    local b = string.sub(value, index, #value)
    return a .. other .. b
end

function insert_utf8(value, index, other)
    index = utf8.offset(value, index)
    local a = string.sub(value, 0, index - 1)
    local b = string.sub(value, index, #value)
    return a .. other .. b
end

function remove(value, index, length)
    local a = string.sub(value, 0, index - 1)
    local b = string.sub(value, index + length, #value)
    return a .. b
end

function remove_utf8(value, index, length)
    start_index = utf8.offset(value, index - 1)
    stop_index = utf8.offset(value, index + length)
    local a = string.sub(value, 0, start_index)
    local b = string.sub(value, stop_index, #value)
    return a .. b
end

function is_palindrome(s)
    return string.reverse(s) == s
end

describe('Tests exercise solutions from chapter 4.', function()
    -- Insert

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

    -- Insert UTF8

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

    -- Remove

    it('Test removal in the middle.', function()
        local actual = remove('hello world', 7, 4)
        local expected = 'hello d'
        assert.is.equal(actual, expected)
    end)

    -- Remove UTF8

    it('Test removal in the middle.', function()
        local actual = remove_utf8('ação', 2, 2)
        local expected = 'ao'
        assert.is.equal(actual, expected)
    end)

    -- Palindrome

    it('Tests for positive case', function()
        local r = is_palindrome('mom')
        assert.is_true(r)
    end)

    it('Tests for negative case', function()
        local r = is_palindrome('hello')
        assert.is_false(r)
    end)
end)
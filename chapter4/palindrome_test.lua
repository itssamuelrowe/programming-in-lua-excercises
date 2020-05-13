function is_palindrome(s)
    return string.reverse(s) == s
end

describe('Test palindrome', function()
    it('Tests for positive case', function()
        local r = is_palindrome('mom')
        assert.is_true(r)
    end)

    it('Tests for negative case', function()
        local r = is_palindrome('hello')
        assert.is_false(r)
    end)
end)
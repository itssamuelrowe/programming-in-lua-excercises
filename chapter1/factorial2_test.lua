-- Negative values are filtered in this example.

function factorial(n)
    if n < 0 then
        return nil
    elseif n == 0 then
        return 1
    else
        return n * factorial(n - 1)
    end
end

describe('Test factorial', function()
    it('Test for a positive value.', function()
        actual = factorial(5)
        expected = 120
        assert.same(actual, expected)
    end)

    it('Test for a negative value.', function()
        actual = factorial(-5)
        expected = nil
        assert.same(actual, expected)
    end)

    it('Test for zero.', function()
        actual = factorial(0)
        expected = 1
        assert.same(actual, expected)
    end)
end)
function polynomial(x, coefficients)
    local result = 0
    for n = 1, #coefficients do
        result = result + (coefficients[n] * (x ^ (n - 1)))
    end
    return result
end

describe('Test polynomial equations', function()
    it('Tests for an expression with n = 3', function()
        local expected = 14
        local actual = polynomial(2, { 2, 2, 2 })
        assert.are_equal(expected, actual)
    end)
end)
function factorial(n)
    if n == 0 then
        return 1
    else
        return n * factorial(n - 1)
    end
end

describe('Factorial tests', function()
    it('Tests whether the computed factorial is correct.', function()
        local result = factorial(5)
        assert.are.equal(result, 120)
    end)
end)
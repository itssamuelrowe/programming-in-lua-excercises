function norm(x, y)
    return math.sqrt(x ^ 2 + y ^ 2)
end

function twice(x)
    return 2.0 * x
end

-- Negative values are filtered in this function.
function factorial2(n)
    if n < 0 then
        return nil
    elseif n == 0 then
        return 1
    else
        return n * factorial(n - 1)
    end
end

function factorial(n)
    if n == 0 then
        return 1
    else
        return n * factorial(n - 1)
    end
end

describe('Tests for excercises from chapter 1.', function()
    it('Tests whether the computed factorial is correct.', function()
        local result = factorial(5)
        assert.are.equal(result, 120)
    end)

    it('Test factorial for a positive value.', function()
        actual = factorial2(5)
        expected = 120
        assert.same(actual, expected)
    end)

    it('Test factorial for a negative value.', function()
        actual = factorial2(-5)
        expected = nil
        assert.same(actual, expected)
    end)

    it('Test factorial for zero.', function()
        actual = factorial2(0)
        expected = 1
        assert.same(actual, expected)
    end)


    it('Tests twice.', function()
        expected = 4
        actual = twice(2)
        assert.same(expected, actual)
    end)

    it('Tests norm.', function()
        expected = 2.8284271247461902909
        actual = norm(2, 2)
        assert.same(expected, actual)
    end)
end)
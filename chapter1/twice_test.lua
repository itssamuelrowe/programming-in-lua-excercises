function norm(x, y)
    return math.sqrt(x ^ 2 + y ^ 2)
end

function twice(x)
    return 2.0 * x
end

describe('Test norm and twice.', function()
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
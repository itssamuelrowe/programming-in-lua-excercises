function insert(source, destination, index)
    for i = 1, #source do
        table.insert(destination, index + i - 1, source[i])
    end
end

function is_sequence(sequence)
    local i = 1
    local result = true
    for key, value in pairs(sequence) do
        if sequence[i] == nil then
            result = false
            break
        end
        i = i + 1
    end
    return result
end

function concat(sequence)
    local result = ''
    for i = 1, #sequence do
        result = result .. sequence[i]
    end
    return result
end

function polynomial(x, coefficients)
    local result = 0
    for n = 1, #coefficients do
        result = result + (coefficients[n] * (x ^ (n - 1)))
    end
    return result
end


describe('Test sequence insertion', function()
    -- Insert

    it('Tests insertion at the beginning of the sequence.', function()
        source = { 1, 2, 3, 4 }
        destination = { 10, 20, 30, 40, 50 }
        insert(source, destination, 1)

        local expected = {1, 2, 3, 4, 10, 20, 30, 40, 50 }
        assert.are_same(expected, destination)
    end)

    it('Tests insertion at the end of the sequence.', function()
        source = { 1, 2, 3, 4 }
        destination = { 10, 20, 30, 40, 50 }
        insert(source, destination, #destination + 1)

        local expected = { 10, 20, 30, 40, 50, 1, 2, 3, 4 }
        assert.are_same(expected, destination)
    end)

    it('Tests insertion in the middle of the sequence.', function()
        source = { 1, 2, 3, 4 }
        destination = { 10, 20, 30, 40, 50 }
        insert(source, destination, 2)

        local expected = { 10, 1, 2, 3, 4, 20, 30, 40, 50 }
        assert.are_same(expected, destination)
    end)

    -- Sequence

    it('Test a sequence case', function()
        local sequence = { 1, 2, 3, 4, 5 }
        assert.is_true(is_sequence(sequence))
    end)
    it('Test a non-sequence case', function()
        local sequence = { 1, 2, 3, nil, 4, 5 }
        assert.is_false(is_sequence(sequence))
    end)

    -- Concat

    it('Tests concatenation of three strings.', function()
        local actual = concat({ 'hello', ' ', 'world!'})
        local expected = 'hello world!'
        assert.is_equal(expected, actual)
    end)

    -- Polynomial

    it('Tests for an expression with n = 3', function()
        local expected = 2 + (5 * 2) + (10 * 2 ^ 2)
        local actual = polynomial(2, { 2, 5, 10 })
        assert.are_equal(expected, actual)
    end)
end)
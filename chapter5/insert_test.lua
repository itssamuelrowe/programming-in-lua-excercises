function insert(source, destination, index)
    for i = 1, #source do
        table.insert(destination, index + i - 1, source[i])
    end
end

describe('Test sequence insertion', function()
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
end)
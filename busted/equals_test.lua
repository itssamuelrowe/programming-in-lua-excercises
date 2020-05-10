describe('Some asserts', function()
    it('Checks for equality', function()
        local expected = 1
        local object = expected

        assert.are.equals(expected, object)
    end)

    it('Checks for in equality', function()
        local expected = 1
        local actual = 1

        assert.are_not.equals(expected, object)
    end)

    print(1 == 1)
end)

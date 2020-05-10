describe('Some assertions', function()
    it('Check if two objects are the same.', function()
        local expected = { firstName = 'Anushka', lastName = 'Madyanam' }
        local actual = { firstName = 'Anushka', lastName = 'Madyanam' }

        assert.are.same(expected, actual)
    end)

    it('Checks if two objects are not the same.', function()
        local expected = { firstName = 'Anushka', lastName = 'Madyanam' }
        local actual = { firstName = 'Samuel', lastName = 'Rowe' }

        assert.are_not.same(expected, actual)
    end)
end)
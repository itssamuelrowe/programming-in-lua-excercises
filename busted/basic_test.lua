describe('tests', function()
    it('success', function()
        local object1 = { test = 'yes' }
        local object2 = { test = 'yes' }
        assert.same(object1, object2 )
    end)
    it('failure', function()
        local object1 = { test = 'yes' }
        local object2 = { test = 'no' }
        assert.same(object1, object2 )
    end)
end)
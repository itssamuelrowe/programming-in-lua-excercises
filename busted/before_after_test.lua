describe('busted', function()
    local object1, object2
    local os

    setup(function()
        os = require('os')
    end)

    teardown(function()
        os = nil
    end)

    before_each(function()
        print('Executing a function before a unit test.')
        object1 = { test = 'yes' }
        object2 = { test = 'yes' }
    end)

    after_each(function()
        print('Executing a function before a unit test.')
        object1 = nil
        object2 = nil
    end)

    it('Sets up variables with the before_each() function.', function()
        object2 = { test = 'no' }
        assert.are_not.same(object1, object2)
    end)

    it('Sets up variables with the before_each', function()
        assert.same(object1, object2)
    end)

    describe('nested', function()
        it('Also runs the before_each() function here. It is expected to fail.',
        function()
            assert.are_not.same(object1, object2)
        end)
    end)
end)
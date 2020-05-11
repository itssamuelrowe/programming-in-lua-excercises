local my_module

describe('Test a private element', function()
    setup(function()
        _G._TEST = true
        my_module = require('my_module')
    end)

    teardown(function()
        _G._TEST = nil
    end)

    it('Tests the length of the table.', function()
        assert.is.equal(#my_module._private_element, 3)
    end)
end)
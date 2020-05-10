local say = require('say')


local function has_property(state, arguments)
    local has_key = false

    if type(arguments[1]) == 'table' and #arguments == 2 then
        for key, value in pairs(arguments[1]) do
            if key == arguments[2] then
                has_key = true
                break
            end
        end
    end

    return has_key
end

say:set('assertion.has_property.positive', "Expected '%s'\nto have property %s.")
say:set('assertion.has_property.negative', "Expected '%s'\nto not have property %s.")
assert:register('assertion', 'has_property', has_property, 'assertion.has_property.positive',
    'assertion.has_property.negative')

describe('Test table', function()
    it('Has a name property', function()
        local object = { firstName = 'Anushka', lastName = 'Madyanam' }
        assert.has_property(object, 'firstName')
        assert.has_property(object, 'age')
    end)
end)
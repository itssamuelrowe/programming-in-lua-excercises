describe('Match arguments', function()
    local match = require('luassert.match')

    it('Tests wildcard matcher', function()
        local display = spy.new(function(message)
            print(message)
        end)
        local wildcard = match._

        display('Hello')

        assert.spy(display).was_called_with(argument)
        assert.spy(display).was_not_called_with(argument, argument)
    end)

    it('Tests type matchers', function()
        local display = spy.new(function(message)
            print(message)
        end)

        display('Hello')

        assert.spy(display).was_called_with(match.is_string())
        assert.spy(display).was_called_with(match.is_truthy())
        assert.spy(display).was_called_with(match.is_not_nil())
        assert.spy(display).was_called_with(match.is_not_false())
        assert.spy(display).was_called_with(match.is_not_number())
        assert.spy(display).was_called_with(match.is_not_table())
    end)

    it('Tests more matchers', function()
        local display = spy.new(function(message)
            print(message)
        end)

        display(1)

        assert.spy(display).was_called_with(match.is_equal(1))
        assert.spy(display).was_called_with(match.is_same(1))
    end)
end)
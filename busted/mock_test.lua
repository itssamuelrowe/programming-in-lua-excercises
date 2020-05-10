describe('Mocks', function()
    it('Replaces a table with spices.', function()
        local t = {
            thing = function(message)
                print(message)
            end
        }

        local m = mock(t)

        m.thing('Coffee')

        assert.spy(m.thing).was.called_with('Coffee')
    end)

    it('Replaces a table with stubs.', function()
        local t = {
            thing = function(message)
                print(message)
            end
        }

        local m = mock(t, true) -- mocks the table with stubs, so it will not print.

        m.thing('Coffee')
        assert.stub(m.thing).was.called_with('Coffee')
        mock.revert(m)
        m.thing('Tea')
    end)
end)
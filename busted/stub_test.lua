describe('Stubs', function()
    it('Replaces an original function.', function()
        local t = {
            greet = function(message)
                print(message)
            end
        }

        stub(t, 'greet')

        t.greet('Hey!')
        assert.stub(t.greet).was.called_with('Hey!')

        t.greet:revert()
        t.greet('Hey!')
    end)
end)
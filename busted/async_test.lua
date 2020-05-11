describe('API integration tests', function()
    it('Loads user data', function()
        async()

        local user_id = 1

        makeAPICall(function(data)
            -- ...

            assert.are.equal(user_id, data.id)
            done()
        end)
    end)
end)
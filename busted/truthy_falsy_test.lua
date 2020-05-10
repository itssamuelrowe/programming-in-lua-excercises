describe('Some assertions for truthy and falsy values.', function()
    it('Tests for truthy values.', function()
        assert.is_true(true)
        assert.is.not_true('Yes')
        assert.is.truthy('Yes')
    end)

    it('Tests for falsy values.', function()
        assert.is_false(false)
        assert.is.not_false(nil)
        assert.is.falsy(nil)
    end)
end)
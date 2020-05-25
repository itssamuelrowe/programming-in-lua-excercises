describe('Test from chapter 20', function()
	local s1 = nil
	local s2 = nil
	setup(function()
		local Set = require('chapter20/set')
		s1 = Set.new{ 2, 4 }
		s2 = Set.new{ 4, 10, 2 }
	end)

	teardown(function()
		s1 = nil
		s2 = nil
	end)

	it('Tests relational operators', function()
		assert.is_true(s1 <= s2) --> true
		assert.is_true(s1 < s2) --> true
		assert.is_true(s1 >= s1) --> true
		assert.is_false(s1 > s1) --> false
		assert.is_true(s1 == (s2 * s1)) --> true
		print(s1, s2)
	end)
end)
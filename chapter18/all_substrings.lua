function all_substrings(s)
	local position = 0
	return function ()
		if position + 1 <= #s then
			position = position + 1
			return string.sub(s, 1, position)
		else
			return nil
		end
	end
end

for substring in all_substrings('hello, world!') do
	print(substring)
end
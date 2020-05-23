function all_words()
	local line = io.read()
	local position = 1
	return function()
		while line do
			local w, e = string.match(line, '(%w+)()', position)
			if w then
				position = e
				return w
			else
				line = io.read()
				position = 1
			end
		end
		return nil
	end
end

for word in all_words() do
	print(word)
end
function range(start, stop)
	start = start - 1
	return function ()
		local result = nil
		if start + 1 <= stop then
			start = start + 1
			result = start
		end
		return result
	end
end

for i in range(1, 10) do
	print(i)
end
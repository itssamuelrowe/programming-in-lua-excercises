function iterator(invariant, current)
	if current + 1 <= invariant then
		return current + 1
	else
		return nil
	end
end

function range(start, stop)
	return iterator, stop, start - 1
end

for i in range(1, 10) do
	print(i)
end
local function iterator(table, index)
	index = index + 1
	local value = table[index]
	if value then
		return index, value
	end
end

function iterate_over(table)
	return iterator, table, 0
end

for index, value in iterate_over({ 11, 22, 33, 44 }) do
	print(index, value)
end
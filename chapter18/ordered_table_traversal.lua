function pairs_by_keys(target, comparator)
	local array = {}
	for key in pairs(target) do
		array[#array + 1] = key
	end
	table.sort(array, comparator)
	local i = 0
	return function()
		i = i + 1
		return array[i], target[array[i]]
	end
end

birthdays = {
	samuel = '19 May 1999',
	anushka = '03 May 1999',
	akshay = '26 January 1999',
	sreem = '01 April 2000',
	joel = '04 December 1999'
}
for name, birthday in pairs_by_keys(birthdays) do
	print(name, birthday)
end
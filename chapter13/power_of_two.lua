function is_power_of_two(n)
	if n == 0 then
		return false
	end
	return math.ceil(math.log(n, 2)) == math.floor(math.log(n, 2))
end

print(is_power_of_two(31))
print(is_power_of_two(64))
function is_palindrome(n)
	local reverse = 0
	while n > 0 do
		reverse = reverse << 1
		if (n & 1) == 1 then
			reverse = reverse ~ 1
		end
		n = n >> 1
	end
	return n == reverse
end

print(is_palindrome(0))
print(is_palindrome(9))
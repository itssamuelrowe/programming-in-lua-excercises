function is_palindrome(s)
    return string.reverse(s) == s
end

local r1 = is_palindrome('mom')
print(r1)

local r2 = is_palindrome('hello')
print(r2)
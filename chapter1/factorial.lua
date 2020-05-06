function factorial(n)
    if n == 0 then
        return 1
    else
        return n * factorial(n - 1)
    end
end

io.write("Enter a number: ")
n = io.read("*n")
result = factorial(n)
print(result)
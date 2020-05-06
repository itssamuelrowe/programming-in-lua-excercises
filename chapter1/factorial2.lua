-- Negative values are filtered in this example.

function factorial(n)
    if n == 0 then
        return 1
    else
        return n * factorial(n - 1)
    end
end

io.write("Enter a number: ")
n = io.read("*n")
if n >= 0 then
    result = factorial(n)
    print(result)
else
    print("Please specify a value greater than or equal to 0.")
end
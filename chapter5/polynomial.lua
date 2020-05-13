function polynomial(x, coefficients)
    local result = 0
    for n = 1, #coefficients do
        result = result + (coefficients[n] * (x ^ (n - 1)))
    end
    return result
end

print(polynomial(2, { 2, 2, 2 }))
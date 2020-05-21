function create_zero_matrix(n, m)
    local matrix = {}
    for i = 1, n do
        local auxillary = (i - 1) * m
        for j = 1, m do
            matrix[auxillary + j] = 0
        end
    end
    return matrix
end

function print_matrix(matrix, n, m)
    for i = 1, n * m do
        io.write(matrix[i], ' ')
        if i % m == 0 then
            io.write('\n')
        end
    end
end

print_matrix(create_zero_matrix(5, 5), 5, 5)
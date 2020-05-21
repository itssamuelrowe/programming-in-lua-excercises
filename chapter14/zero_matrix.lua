function create_zero_matrix(n, m)
    local matrix = {}
    for i = 1, n do
        local row = {}
        matrix[i] = row
        for j = 1, m do
            row[j] = 0
        end
    end
    return matrix
end

function print_matrix(matrix)
    for i = 1, #matrix do
        for j = 1, #matrix[i] do
            io.write(matrix[i][j], ' ')
        end
        io.write('\n')
    end
end

print_matrix(create_zero_matrix(5, 5))
function print_matrix(matrix)
    for i = 1, #matrix do
        for j = 1, #matrix[i] do
            io.write(matrix[i][j], ' ')
        end
        io.write('\n')
    end
end

function multiply(matrix1, matrix2, m, n, k)
    result = {}
    for i = 1, m do
        for j = 1, n do
            result[i] = result[i] or {}
            result[i][j] = 0
            for r = 1, k do
                result[i][j] = result[i][j] + matrix1[i][r] * matrix2[r][j]
            end
        end
    end
    return result
end

local matrix1 = {
    { 1, 2, 3 },
    { 4, 5, 6 },
    { 7, 8, 9 }
}

local matrix2 = {
    { 7, 8, 9 },
    { 4, 5, 6 },
    { 1, 2, 3 }
}

print_matrix(multiply(matrix1, matrix2, 3, 3, 3))
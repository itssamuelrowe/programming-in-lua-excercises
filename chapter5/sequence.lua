function is_sequence(sequence)
    local n = 1
    while sequence[n] ~= nil do
        n = n + 1
    end
    return (n - 1) == #sequence
end

print(is_sequence({ 1, 2, 3 }))
print(is_sequence({ [1] = 1, [2] = 2, [4] = 4 }))
function remove_last(...)
    local sequence = table.pack(...)
    return table.unpack(sequence, 1, sequence.n - 1)
end

print(remove_last(1, 2, nil, 3, 4))
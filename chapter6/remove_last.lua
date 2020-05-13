function remove_last(...)
    local sequence = table.pack(...)
    local n = select('#', ...)
    sequence[n] = nil

    return table.unpack(sequence)
end

print(remove_last(1, 2, 3))
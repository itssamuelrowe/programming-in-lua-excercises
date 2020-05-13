function remove_first(...)
    return select(2, ...)
end

print(remove_first(1, 2, 3))
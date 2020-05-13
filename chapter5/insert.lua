function insert(source, destination, index)
    for i = 1, #source do
        table.insert(destination, index + i - 1, source[i])
    end
end

source = { 1, 2, 3, 4 }
destination = { 10, 20, 30, 40, 50 }
insert(source, destination, 2)
for i = 1, #destination do
    print(destination[i])
end
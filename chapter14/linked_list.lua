function add_last(list, value)
    return { next = list, value = value}
end

function print_list(list)
    if list then
        local node = list
        while node do
            print(node.value)
            node = node.next
        end
    end
end

list = add_last(nil, 1)
list = add_last(list, 2)
list = add_last(list, 3)
print_list(list)
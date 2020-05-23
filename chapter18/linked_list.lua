local function get_next(list, node)
	if not node then
		return list
	else
		return node.next
	end
end

function traverse(list)
	return get_next, list, nil
end

function add_last(list, value)
    return { next = list, value = value}
end

function print_list(list)
    for node in traverse(list) do
        print(node.value)
        node = node.next
    end
end

list = add_last(nil, 1)
list = add_last(list, 2)
list = add_last(list, 3)
print_list(list)
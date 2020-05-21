function make_bag(list)
    local bag = {}
    for _, item in ipairs(list) do
        bag[item] = 1
    end
    return bag
end

function add(bag, item)
    bag[item] = (bag[item] or 0) + 1
end

function print_bag(bag)
    for key, value in pairs(bag) do
        io.write(key, ' -> ', value, '\n')
    end
end

keywords = make_bag({ 'while', 'end', 'function', 'local' })
add(keywords, 'then')
add(keywords, 'while')
print_bag(keywords)
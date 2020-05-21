function make_set(list)
    local set = {}
    for _, item in ipairs(list) do
        set[item] = true
    end
    return set
end

function print_set(set)
    for key, value in pairs(set) do
        print(key)
    end
end

keywords = make_set({ 'while', 'end', 'function', 'local' })
print_set(keywords)
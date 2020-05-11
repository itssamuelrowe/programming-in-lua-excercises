local my_module = {}
local private_element = { 'this', 'is', 'private' }

function my_module:display()
    print(string.concat(private_element, ' '))
end

if _TEST then
    my_module._private_element = private_element
end

return my_module
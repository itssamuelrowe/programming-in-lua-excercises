function generate_string_repeater(n)
    local limit = nil
    local result = 'function string_repeat_' .. n .. '(s)\n'
    for i = 1, n - 1 do
        result = result .. '    s = s .. s\n'
    end

    return result .. 'end\n'
end

print(generate_string_repeater(5))
print(generate_string_repeater(6))
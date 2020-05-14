function load_lines(file)
    local lines = {}
    for line in file:lines() do
        lines[#lines + 1] = line
    end
    table.sort(lines)
    return lines
end

function main()
    local input_file = io.stdin
    local output_file = io.stdout
    if #arg == 1 then
        input_file = io.open(arg[1], 'r')
        if input_file == nil then
            print('Error: Cannot open file ' .. arg[1])
        end
    elseif #arg == 2 then
        input_file = io.open(arg[1], 'r')
        output_file = io.open(arg[2], 'w')
    end

    lines = load_lines(input_file)
    for index, line in ipairs(lines) do
        output_file:write(line)
        output_file:write('\n')
    end

    input_file:close()
    output_file:close()
end
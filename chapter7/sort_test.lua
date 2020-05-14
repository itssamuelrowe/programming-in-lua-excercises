function load_lines(file)
    local lines = {}
    for line in file:lines() do
        lines[#lines + 1] = line
    end
    table.sort(lines)
    return lines
end

describe('Test sorting the input file', function()
    local input_file = nil
    local output_file = nil

    setup(function()
        input_file = io.stdin
        output_file = io.stdout
        if #arg == 2 then
            input_file = io.open(arg[2], 'r')
            if input_file == nil then
                print('Error: Cannot open file ' .. arg[1])
            end
        elseif #arg == 3 then
            input_file = io.open(arg[2], 'r')
            output_file = io.open(arg[3], 'w')
        end
    end)

    teardown(function()
        input_file:close()
        output_file:close()
    end)

    it('Tests the load_lines() function.', function()
        lines = load_lines(input_file)
        for index, line in ipairs(lines) do
            output_file:write(line)
            output_file:write('\n')
        end
    end)
end)
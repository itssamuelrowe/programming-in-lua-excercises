function load_lines(file)
    local lines = {}
    for line in file:lines() do
        lines[#lines + 1] = line
    end
    table.sort(lines)
    return lines
end

function file_exists(path)
    local file = io.open(path)
    local result = false
    if file ~= nil then
        file:close()
        result = true
    end
    return result
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

        if file_exists(arg[2]) then
            io.write('The specified output file already exists. Do you want to overwrite? [Y/N] ')
            local s = io.read()
            if s ~= 'Y' and s ~= 'y' then
                io.write('The output will be redirected to the standard output stream.\n')
                output_file = io.stdout
            else
                output_file = io.open(arg[2], 'w')
            end
        end
    end

    lines = load_lines(input_file)
    for index, line in ipairs(lines) do
        output_file:write(line)
        output_file:write('\n')
    end

    input_file:close()
    output_file:close()
end

main()
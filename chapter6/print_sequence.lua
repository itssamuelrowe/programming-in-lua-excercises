function print_sequence(sequence)
    for i = 1, #sequence do
        io.write(sequence[i])

        if i + 1 <= #sequence then
            io.write(', ')
        end
    end
    io.write('\n')
end

print_sequence({ 1, 2, 3, 4 })
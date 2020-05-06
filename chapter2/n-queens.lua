N = 8

function is_place_ok(a, n, c)
    for i = 1, n - 1 do
        if (a[i] == c) or
           (a[i] - i == c - n) or
           (a[i] + i == c + n) then
           return false
        end
    end
    return true
end

function print_solution(a)
    for i = 1, N do
        for j = 1, N do
            result = ""
            if a[i] == j then
                result = "X"
            else
                result = "-"
            end
            io.write(result .. " ")
        end
        io.write("\n")
    end
    io.write("\n")
end

function add_queen(a, n)
    if n > N then
        print_solution(a)
    else
        for c = 1, N do
            if is_place_ok(a, n, c) then
                a[n] = c
                add_queen(a, n + 1)
            end
        end
    end
end

add_queen({}, 1)
local counter = {}
for line in io.lines() do
    for word in string.gmatch(line, '%w+') do
        local count = counter[word]
        if count == nil then
            count = 1
        else
            count = count + 1
        end
        counter[word] = count
    end
end

local words = {}
for word, count in pairs(counter) do
    words[#words + 1] = word
end

print('\nBefore:')
for i = 1, 10 do
    print(words[i])
end
table.sort(words, function(w1, w2)
    -- return (counter[w1] > counter[w2]) or ((counter[w1] == counter[w2]) and (w1 < w2))
    return counter[w1] - counter[w2]
end)
print('After:')
for i = 1, 10 do
    print(words[i])
end


local n = math.min(tonumber(arg[1]) or math.huge, #words)
for i = 1, n do
    io.write(words[i], '\t', counter[words[i]], '\n')
end
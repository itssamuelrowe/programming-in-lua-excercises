function all_words ()
	local line = io.read()
	 position = 1
	return function ()
		while line do
			local w, e = string.match(line, "(%w+[,;.:]?)()", position)
			if w then
				position = e
				return w
			else
				line = io.read()
				position = 1
			end
		end
		return nil
	end
end

function prefix(words)
	return table.concat(words, ' ')
end

local state = {}

function insert(prefix, value)
	local list = state[prefix]
	if list == nil then
		state[prefix] = { value }
	else
		list[#list + 1] = value
	end
end

local MAXGEN = 200
local NOWORD = "\n"
local N = 3

local words = {}
for i = 1, N do
	words[#words + 1] = NOWORD
end

for next_word in all_words() do
	insert(prefix(words), next_word)
	
	for i = 1, N - 1 do
		words[i] = words[i + 1]
	end
	words[N] = next_word
end

insert(prefix(words), NOWORD)

for i = 1, N do
	words[#words + 1] = NOWORD
end

for i = 1, MAXGEN do
	local list = state[prefix(words)]
	print(i, prefix(words), list)
	local r = math.random(#list)
	local next_word = list[r]
	if next_word == NOWORD then
		return
	end
	io.write(next_word, " ")
	for i = 1, N - 1 do
		words[i] = words[i + 1]
	end
	words[N] = next_word
end
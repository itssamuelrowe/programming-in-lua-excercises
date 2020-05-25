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

function prefix(w1, w2)
	return w1 .. ' ' .. w2
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
local w1, w2 = NOWORD, NOWORD
for next_word in all_words() do
	insert(prefix(w1, w2), next_word)
	w1 = w2
	w2 = next_word
end
insert(prefix(w1, w2), NOWORD)
w1 = NOWORD
w2 = NOWORD
for i = 1, MAXGEN do
	local list = state[prefix(w1, w2)]
	local r = math.random(#list)
	local next_word = list[r]
	if next_word == NOWORD then
		return
	end
	io.write(next_word, " ")
	w1 = w2
	w2 = next_word
end
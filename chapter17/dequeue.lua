local m = {}

function m.make_queue()
    return { first = 0, last = -1 }
end

function m.push_first(queue, value)
    local first = queue.first - 1
    queue.first = first
    queue[first] = value
end

function m.push_last(queue, value)
    local last = queue.last + 1
    queue.last = last
    queue[last] = value
end

function m.pop_first(queue)
    local first = queue.first
    if first > queue.last then
        error('The queue is empty.')
    end
    local value = queue[first]
    queue[first] = nil
    queue.first = first + 1
    return value
end

function m.pop_last(queue)
    local last = queue.last
    if queue.first > last then
        error('The queue is empty.')
    end
    local value = queue[last]
    queue[last] = nil
    queue.last = last - 1
    return value
end

function m.print_queue(queue)
    for i = queue.first, queue.last do
        print(queue[i])
    end
end

return m
function room4()
    print('Congratulations, you won!')
end

function room3()
    local move = io.read()
    if move == 'north' then
        room1()
    elseif move == 'east' then
        room4()
    else
        print('Invalid move')
        room3()
    end
end

function room2()
    local move = io.read()
    if move == 'south' then
        room4()
    elseif move == 'west' then
        room1()
    else
        print('Invalid move')
        room2()
    end
end

function room1()
    local move = io.read()
    if move == 'south' then
        room3()
    elseif move == 'east' then
        room2()
    else
        print('Invalid move')
        room1()
    end
end

room1()
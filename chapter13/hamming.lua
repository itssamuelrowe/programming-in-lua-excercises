function weight(n)
    -- each bit in n is a one-bit integer that indicates how many bits
    --  are set in that bit.
    n = ((n & 0xAAAAAAAA) >> 1) + (n & 0x55555555)
    -- Now every two bits are a two bit integer that indicate how many
    -- bits were set in those two bits in the original number.
    n = ((n & 0xCCCCCCCC) >> 2) + (n & 0x33333333)
    -- Now we are at 4 bits
    n = ((n & 0xF0F0F0F0) >> 4) + (n & 0x0F0F0F0F)
    -- Now we are at 8 bits
    n = ((n & 0xFF00FF00) >> 8) + (n & 0x00FF00FF)
    -- Now we are at 16 bits
    n = ((n & 0xFFFF0000) >> 16) + (n & 0x0000FFFF)
    -- We have computed the result at this point.
    return n
end

print(weight(1)) -- 1
print(weight(3)) -- 2
print(weight(10)) -- 2
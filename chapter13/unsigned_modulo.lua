function unsigned_modulo(x, y)
	return (y <= x) and (x < 0) and (x - y) or (y < 0) and x ((x >> 1) % y * 2 + (x & 1) - y) % y
end 
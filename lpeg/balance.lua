local lpeg = require 'lpeg'
pattern = lpeg.P {
	'(' * ((1 - lpeg.S('()')) + lpeg.V(1)) ^ 0 * ')'
}
print(lpeg:match(b, 'function () end'))
print(lpeg:match(b, 'function ( end'))
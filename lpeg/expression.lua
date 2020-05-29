local lpeg = require 'lpeg'

-- Lexical Elements
local Space = lpeg.S(' \n\t') ^ 0
local Number = lpeg.C(lpeg.P('-') ^ -1 * lpeg.R('09') ^ 1) * Space
local TermOperator = lpeg.C(lpeg.S('+-')) * Space
local FactorOperator = lpeg.C(lpeg.S('*/')) * Space
local Open = '(' * Space
local Close = ')' * Space

-- Grammar
local Expression, Term, Factor = lpeg.V('Expression'), lpeg.V('Term'), lpeg.V('Factor')
G = lpeg.P{
    Expression,
    Expression = lpeg.Ct(Term * (TermOperator * Term) ^ 0);
    Term = lpeg.Ct(Factor * (FactorOperator * Factor) ^ 0);
    Factor = Number + Open * Expression * Close;
}
G = Space * G * -1

function print_table(t)
  for i = 1, #t do
    if type(t[i]) == 'table' then
        print_table(t[i])
    else
        io.write(t[i], ' ')
    end
  end
  io.write('\n')
end

-- Evaluator
function evaluate(x)
    if type(x) == 'string' then
      return tonumber(x)
    else
        local op1 = evaluate(x[1])
        for i = 2, #x, 2 do
            local op = x[i]
            local op2 = evaluate(x[i + 1])
            if (op == '+') then
                op1 = op1 + op2
            elseif (op == '-') then
                op1 = op1 - op2
            elseif (op == '*') then
                op1 = op1 * op2
            elseif (op == '/') then
                op1 = op1 / op2
            end
        end
        return op1
    end
end

function compute(s)
    local t = lpeg.match(G, s)
    if not t then
        error('Syntax error', 2)
    end
    print_table(t)
    return evaluate(t)
end

print(compute('1 + 2'))
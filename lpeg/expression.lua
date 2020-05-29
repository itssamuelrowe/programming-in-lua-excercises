local lpeg = require 'lpeg'

local keywords = {
    ['and'] = true,
    ['break'] = true,
    ['do'] = true,
    ['else'] = true,
    ['elseif'] = true,
    ['end'] = true,
    ['false'] = true,
    ['for'] = true,
    ['function'] = true,
    ['if'] = true,
    ['in'] = true,
    ['local'] = true,
    ['nil'] = true,
    ['not'] = true,
    ['or'] = true,
    ['repeat'] = true,
    ['return'] = true,
    ['then'] = true,
    ['true'] = true,
    ['until'] = true,
    ['while'] = true
}

function write_sequence(sequence, depth)
    io.write(string.format('%s{\n', string.rep(' ', depth * 4)))
    for index, element in ipairs(sequence) do
        serialize_acyclic(element, depth + 1)
        io.write(',\n')
    end
    io.write(string.format('%s},\n', string.rep(' ', depth * 4)))
end

function serialize_acyclic(object, depth, in_assignment)
    local t = type(object)
    if t == 'number' or t == 'string' or
       t == 'boolean' or t == 'nil' then
        local content = string.format('%q', object)
        local indentation = ''
        if not in_assignment then
            indentation = string.rep('    ', depth)
        end
        io.write(indentation, content)
    elseif t == 'table' then
        local brace = nil
        if in_assignment then
            brace = '{\n'
        else
            brace = string.rep(' ', depth * 4) .. '{\n'
        end
        io.write(brace)
        for key, value in pairs(object) do
            local format = '%s[%s] = '
            if type(key) == 'string' then
                if keywords[key] == nil then
                    format = '%s%s = '
                else
                    format = '%s[\'%s\'] = '
                end
            end
            local indentation = string.rep(' ', (depth + 1) * 4)
            local content = string.format(format, indentation, key)
            io.write(content)
            serialize_acyclic(value, depth + 1, true)
            io.write(',\n')
        end

        if sequence ~= nil then
            write_sequence(sequence, depth + 1)
        end

        io.write(string.format('%s}', string.rep(' ', depth * 4)))
    else
        error('Cannot serialize a ' .. t)
    end
end

function serialize(object)
    serialize_acyclic(object, 0, false)
    io.write('\n\n')
end

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
    serialize(t)
    return evaluate(t)
end

print(compute('1 + 2'))
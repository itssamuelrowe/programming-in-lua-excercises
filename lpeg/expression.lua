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

function make_node(tag, arguments)
    return {
        tag = tag,
        args = arguments
    }
end

function make_expression(table)
    return make_node('Expression', table)
end

function make_term(table)
    return make_node('Term', table)
end

function make_factor(arguments)
    return make_node('Factor', arguments)
end

function make_literal(value)
    return {
        tag = 'Number',
        value = value
    }
end

-- Lexical Elements

local S, C, P, R, Ct, V = lpeg.S, lpeg.C, lpeg.P, lpeg.R, lpeg.Ct, lpeg.V

local Space = S' \n\t' ^ 0
local Number = C(P'-' ^ -1 * R'09' ^ 1) * Space
local TermOperator = C(S'+-') * Space
local FactorOperator = C(S'*/') * Space
local Open = '(' * Space
local Close = ')' * Space

-- Grammar
local Expression, Term, Factor, Literal = V'Expression', V'Term', V'Factor', V'Literal'
G = P {
    Expression,
    Expression = Ct(Term * (TermOperator * Term) ^ 0) / make_expression;
    Term = Ct(Factor * (FactorOperator * Factor) ^ 0) / make_term;
    Factor = (Literal + Open * Expression * Close) / make_factor;
    Literal = Number / make_literal
}
G = Space * G * -1

-- Evaluator
function evaluate(x)
    if type(x) == 'string' then
      return tonumber(x)
    else
        local operator1 = evaluate(x[1])
        for i = 2, #x, 2 do
            local operator = x[i]
            local operator2 = evaluate(x[i + 1])
            if operator == '+' then
                operator1 = operator1 + operator2
            elseif operator == '-' then
                operator1 = operator1 - operator2
            elseif operator == '*' then
                operator1 = operator1 * operator2
            elseif operator == '/' then
                operator1 = operator1 / operator2
            end
        end
        return operator1
    end
end

function compute(s)
    local t = lpeg.match(G, s)
    if not t then
        error('Syntax error', 2)
    end
    serialize(t)
    -- return evaluate(t)
end

print(compute('1 + 2'))
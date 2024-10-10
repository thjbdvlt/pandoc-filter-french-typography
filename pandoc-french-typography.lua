-- PANDOC FRENCH TYPOGRAPHY
--
-- 1. thin space before ;:?!
--    copyright 2024 thjbdvlt 
--
-- 2. french quotes
--    code extracted from pandoc-quotes.lua, by Odin Kroeger
--    https://github.com/odkr/pandoc-quotes.lua
--    copyright 2018, 2020 Odin Kroeger (MIT license)
--
--    modifications (thjbdvlt, 2024):
--      - remove a lot of things (configuration, Meta, ...).
--        i keep only what is about french quotes.
--      - update definition of french quotes (add non-breaking spaces)

-- punctuations that french requires to be preceded by a thing space
local pc = "?!:;"

-- thin space char
local thinspc = "\u{2009}"

-- patterns for the gsub function.
local p1 = "([" .. pc .. "]+)"
local p2 = thinspc .. "%1"

function insert_thinspc_punct(elem)
    if elem.text ~= nil then
        return string.gsub(elem.text, p1, p2)
    end
end


local nbspc = "\u{00A0}"
local QUOT_MARKS = {'«' .. nbspc, nbspc .. '»', '“', '”'}


-- >>>> pandoc-quotes.lua >>>>
-- copyright 2018, 2020 Odin Kroeger
-- MIT license
-- https://github.com/odkr/pandoc-quotes.lua
local require = require
local table = table
local pandoc = pandoc
if not pandoc.utils then pandoc.utils = require 'pandoc.utils' end
do
    do
        local insert = table.insert
        --- Replaces quoted elements with quoted text.
        --
        -- Uses the quotation marks stored in `QUOT_MARKS`,
        -- which it shares with `configure`.
        --
        -- @tparam pandoc.Quoted quoted A quoted element.
        -- @treturn {pandoc.Str,pandoc.Inline,...,pandoc.Str}
        --  A list with the opening quote (as `pandoc.Str`),
        --  the content of `quoted`, and the closing quote (as `pandoc.Str`).
        function insert_quot_marks (quoted)
            local quote_type = quoted.quotetype
            local inlines    = quoted.content
            local left, right
            if     quote_type == 'DoubleQuote' then left, right = 1, 2
            elseif quote_type == 'SingleQuote' then left, right = 3, 4
            else   error('unknown quote type') end
            insert(inlines, 1, QUOT_MARKS[left])
            insert(inlines,    QUOT_MARKS[right])
            return inlines
        end
    end
end
-- <<<< pandoc-quotes.lua <<<<

return {Inline = insert_thinspc_punct, Quoted = insert_quot_marks}

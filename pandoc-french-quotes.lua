-- # AUTHOR
--
-- Copyright 2019 Odin Kroeger (Modified 2024 thjbdvlt)
--
--
-- # LICENSE
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to
-- deal in the Software without restriction, including without limitation the
-- rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
-- sell copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
-- FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
-- IN THE SOFTWARE.
--
--
-- @script pandoc-quotes.lua
-- @release 0.1.10
-- @author Odin Kroeger
-- @copyright 2018, 2020 Odin Kroeger
-- @license MIT

-- Modifications (thjbdvlt, 2024):
-- - remove a lot of things (configuration, Meta, ...): i keep only what is about french quotes.
-- - update definition of french quotes (add non-breaking spaces)


-- # INITIALISATION

local M = {}

local pairs = pairs
local require = require

local table = table
local package = package

local pandoc = pandoc
if not pandoc.utils then pandoc.utils = require 'pandoc.utils' end

local _ENV = M

local text = require 'text'


-- # CONSTANTS

--- The name of this script.
SCRIPT_NAME = 'pandoc-french-quotes.lua'

--- The path seperator of the operating system.
PATH_SEP = package.config:sub(1, 1)

--- The character sequence to end a line.
if PATH_SEP == '\\' then EOL = '\r\n'
                    else EOL = '\n'   end

-- french quotes
QUOT_MARKS = {'« ',  ' »',     '“',  '”'    }

-- # FUNCTIONS

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

return {{Quoted = insert_quot_marks}}

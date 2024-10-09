-- typographie française: espaces fines avec ponctuation.

-- punctuation that requires a non-breaking space in french
-- typography.
local pc = "?!:;"

-- the non-breaking space character.
local thinspc = "\u{2009}"

-- make the patterns for the gsub function.
local p1 = "([" .. pc .. "]+)"
local p2 = thinspc .. "%1"

function Inline(elem)
    -- les signes de ponctuation qui requièrent simplement un 
    -- espace insécable.
    --
    if elem.text ~= nil then
        return string.gsub(elem.text, p1, p2)
    end
end

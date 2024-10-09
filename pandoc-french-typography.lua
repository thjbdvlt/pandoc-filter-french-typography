-- ajoute les espaces nécessaires à la typographie française.

-- punctuation that requires a non-breaking space in french
-- typography.
local pc = "[?!:;]"

-- the non-breaking space character.
local nbs = "\u{00A0}"

-- make the patterns for the gsub function.
local p1 = "(" .. pc .. "+)"
local p2 = nbs .. "%1"

function Inline(elem)
    -- les signes de ponctuation qui requièrent simplement un 
    -- espace insécable.
    --
    if elem.text ~= nil then
        return string.gsub(elem.text, p1, p2)
    end
end

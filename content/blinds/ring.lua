SMODS.Blind
{
    key = "ring",
    atlas = "WillatroBlinds",
    pos = { x = 0, y = 1},
    boss = {
        min = 5,
        max = 0
    },
    boss_colour = HEX('9329b7'),

    debuff_hand = function(self, cards, hand, handname, check)
        if not self.disabled then
            if handname == 'Pair' or handname == 'High Card' or handname == 'Three of a Kind' or handname == 'Four of a Kind' or 
            handname == 'Five of a Kind' or handname == 'Flush' or handname == 'Flush Five' or handname == 'Straight Flush' or 
            handname == 'Flush House' or handname == 'Royal Flush' then
                return true
            end
        end
    end
}
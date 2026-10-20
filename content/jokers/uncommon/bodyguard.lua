SMODS.Joker
{
    key = "bodyguard",
    rarity = 2,
    atlas = "WillatroJokers",
    pos = {x = 0, y = 1},
    cost = 8,
    eternal_compat = false,
    blueprint_compat = false,

    calculate = function(self, card, context)
        if G.jokers and not context.blueprint then
            for i = 1, #G.jokers.cards do
                if context.selling_self and G.jokers.cards[i] == card then
					if G.jokers.cards[i+1] ~= nil then
                    	G.jokers.cards[i+1]:set_eternal(true)
					end
                end
            end
        end
    end
}
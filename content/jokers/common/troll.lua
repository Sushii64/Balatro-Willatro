SMODS.Joker
{
    key = "troll",
    rarity = 1,
    atlas = "WillatroJokers",
    pos = {x = 2, y = 2 },
    cost = 0,
    blueprint_compat = true,
    config = {
        extra = {
            mult = -10
        }
    },

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card:is_face() then
            return {
                mult = card.ability.extra.mult
            }
        end
    end
}
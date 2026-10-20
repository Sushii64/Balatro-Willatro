SMODS.Joker
{
    key = "jokergummy",
    rarity = 2,
    atlas = "WillatroJokers",
    pos = {x = 1, y = 1 },
    cost = 7,
    blueprint_compat = true,
    config = {
        extra = {
            mult = 5,
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult,
                card.ability.extra.mult * (G.GAME.willatro_jokers_bought or 0)
            }
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            return {
                mult = card.ability.extra.mult * (G.GAME.willatro_jokers_bought or 0)
            }
        end
    end
}
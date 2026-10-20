SMODS.Joker
{
    key = "barcode",
    rarity = 1,
    atlas = "WillatroJokers",
    pos = {x = 4, y = 0},
    cost = 4,
    blueprint_compat = false,
    config = {
        extra = {
            money = 2
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.money,
                card.ability.extra.money * (G.jokers and #G.jokers.cards or 0)
            }
        }
    end,

    calc_dollar_bonus = function(self, card)
        return card.ability.extra.money * (#G.jokers.cards or 0)
    end
}
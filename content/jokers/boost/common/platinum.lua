SMODS.Joker {
    key = "platinum",
    blueprint_compat = false,
    atlas = "WillatroEvolved",
    rarity = 1,
    cost = 6,
    pos = { x = 6, y = 2 },
    config = {
        extra = {
            dollars = 4,
            total = 0
        }
    },

    loc_vars = function(self, info_queue, card)
        local sell_cost = 0
        card.ability.extra.total = 0
        for _, joker in ipairs(G.jokers and G.jokers.cards or {}) do
            sell_cost = sell_cost + joker.sell_cost
        end

        card.ability.extra.total = card.ability.extra.total + sell_cost + card.ability.extra.dollars

        return {
            vars = {
                card.ability.extra.dollars,
                card.ability.extra.total
            }
        }
    end,

    calc_dollar_bonus = function(self, card)
        return card.ability.extra.total
    end,

    in_pool = function(self, args)
        return false
    end
}
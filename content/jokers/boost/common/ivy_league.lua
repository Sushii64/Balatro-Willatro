SMODS.Joker {
    key = "ivy_league_diploma",
    rarity = 1,
    atlas = "WillatroEvolved",
    pos = {x = 6, y = 1},
    cost = 4,
    blueprint_compat = true,
    config = {
        extra = {
            x_mult = 1.5,
            x_chips = 2
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.x_chips,
                card.ability.extra.x_mult
            }
        }
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.play and context.individual then
            if context.other_card:get_id() == 14 then
                return {
                    x_chips = card.ability.extra.x_chips,
                    x_mult = card.ability.extra.x_mult
                }
            end
        end
    end,

    in_pool = function(self, args)
        return false
    end
}
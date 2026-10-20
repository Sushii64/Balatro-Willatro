SMODS.Joker {
    key = "composite_carl",
    rarity = 1,
    atlas = "WillatroEvolved",
    pos = {x = 0, y = 1},
    cost = 0,
    blueprint_compat = true,
    config  = {
        extra = {
            x_mult = 1.6
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.x_mult
            }
        }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card:get_id() <= 10 and Prime(context.other_card:get_id()) == false then
            return {
                x_mult = card.ability.extra.x_mult
            }
        end
    end,

    in_pool = function(self, args)
        return false
    end
}
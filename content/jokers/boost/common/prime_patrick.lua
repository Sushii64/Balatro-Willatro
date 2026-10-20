SMODS.Joker {
    key = "prime_patrick",
    rarity = 1,
    atlas = "WillatroEvolved",
    pos = {x = 1, y = 1},
    cost = 4,
    blueprint_compat = true,
    config  = {
        extra = {
            x_chips = 2
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.x_chips
            }
        }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card:get_id() <= 10 and Prime(context.other_card:get_id()) == true then
            return {
                x_chips = card.ability.extra.x_chips
            }
        end
    end,

    in_pool = function(self, args)
        return false
    end
}
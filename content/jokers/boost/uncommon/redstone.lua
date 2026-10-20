SMODS.Joker {
    key = "redstone",
    rarity = 2,
    atlas = "WillatroEvolved",
    pos = {x = 2, y = 3},
    cost = 7,
    blueprint_compat = true,
    config = {
        extra = {
            x_mult = 2.5
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
        if context.individual and context.cardarea == G.play and context.other_card:is_suit("Hearts") then
            return {
                x_mult = card.ability.extra.x_mult
            }
        end

        if context.debuff_card and not context.blueprint and not context.debuff_card:is_suit("Hearts") and context.debuff_card.playing_card then
            return {
                debuff = true
            }
        end
    end,

    in_pool = function(self, args)
        return false
    end
}
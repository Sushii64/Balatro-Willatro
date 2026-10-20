SMODS.Joker {
    key = "lapis_lazuli",
    rarity = 2,
    atlas = "WillatroEvolved",
    pos = {x = 4, y = 3},
    cost = 7,
    blueprint_compat = true,
    config = {
        extra = {
            mult = 35
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult
            }
        }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card:is_suit("Clubs") then
            return {
                mult = card.ability.extra.mult
            }
        end

        if context.debuff_card and not context.blueprint and not context.debuff_card:is_suit("Clubs") and context.debuff_card.playing_card then
            return {
                debuff = true
            }
        end
    end,

    in_pool = function(self, args)
        return false
    end
}
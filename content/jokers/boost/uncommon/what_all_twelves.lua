SMODS.Joker {
    key = "what_all_twelves",
    rarity = 2,
    atlas = "WillatroEvolved",
    pos = {x = 2, y = 0},
    cost = 4,
    blueprint_compat = false,

    calculate = function(self, card, context)
        if context.mod_probability and not context.blueprint then
            return {
                numerator = context.numerator * 4
            }
        end
    end,

    in_pool = function(self, args)
        return false
    end
}
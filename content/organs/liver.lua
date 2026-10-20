SMODS.Joker {
    key = "liver",
    rarity = "willatro_organ",
    atlas = "WillatroOrgans",
    pos = { x = 5, y = 0 },
    cost = 6,
    blueprint_compat = true,
    pools = {
        ["willatro_organ_set"] = true
    },
    config = {
        extra = {
            odds = 4
        }
    },

    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds)
        return {
            vars = {numerator, denominator}
        }
    end,

    calculate = function(self, card, context)
        if context.pre_discard then
            if SMODS.pseudorandom_probability(card, 'willatro_liver', 1, card.ability.extra.odds) then
                return {
                    ease_discard(1)
                }
            end
        end
    end,

    in_pool = function(self, args)
        return not args or args.source ~= 'sho'
    end
}
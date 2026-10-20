SMODS.Joker
{
    key = "cyan",
    rarity = 1,
    atlas = "WillatroJokers",
    pos = {x = 2, y = 1 },
    cost = 4,
    blueprint_compat = true,
    config = {
        extra = {
            chips = 1,
            mult = 1,
            mega_chips = 500,
            mega_mult = 7,
            odds = 70
        }
    },

    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds)
        return {
            vars = {
                card.ability.extra.chips,
                card.ability.extra.mult,
                card.ability.extra.mega_chips,
                card.ability.extra.mega_mult,
                numerator,
                denominator
            }
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local chance_hit = false
            if SMODS.pseudorandom_probability(card, 'willatro_cyan', 1, card.ability.extra.odds) then
                chance_hit = true
            end
            return {
                chips = card.ability.extra.chips,
                mult = card.ability.extra.mult,
                extra = chance_hit and {
                    chips = card.ability.extra.mega_chips,
                    x_mult = card.ability.extra.mega_mult
                } or nil,
            }
        end
    end
}
SMODS.Joker
{
    key = "jetfish",
    rarity = 2,
    atlas = "WillatroJokers",
    pos = { x = 3, y = 3 },
    cost = 6,
    blueprint_compat = true,
    perishable_compat = false,
    config = {
        extra = {
            mult_gain = 3,
            mult = 0
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult_gain,
                card.ability.extra.mult
            }
        }
    end,

    calculate = function(self, card, context)
        local unscoring = false
        if context.before and context.main_eval and not context.blueprint then
            if #context.full_hand ~= #context.scoring_hand then
                unscoring = true
            end

            if unscoring then
                local last_mult = card.ability.extra.mult
                card.ability.extra.mult = 0
                if last_mult > 0 then
                    return {
                        message = localize('k_reset')
                    }
                end
            else
                card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain
            end
        end
        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end
    end
}
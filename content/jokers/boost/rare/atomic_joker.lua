SMODS.Joker {
    key = "atomic_joker",
    rarity = 3,
    atlas = "WillatroEvolved",
    pos = {x = 3, y = 0},
    cost = 8,
    blueprint_compat = true,
    perishable_compat = false,
    config = {
        extra = {
            chip_gain = 0.25,
            chips = 0,
            cap = 256
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chip_gain,
                card.ability.extra.chips,
                card.ability.extra.cap
            }
        }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card:get_id() == 2 and not context.blueprint then
            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_gain
            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.CHIPS,
                message_card = card
            }
        end

        if context.joker_main then
            return {
                chips = card.ability.extra.chips
            }
        end

        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            if card.ability.extra.chip_gain < card.ability.extra.cap then
                card.ability.extra.chip_gain = card.ability.extra.chip_gain * 2
                return {
                    message = localize('k_upgrade_ex'),
                    colour = G.C.CHIPS,
                    message_card = card
                }
            else
                card.ability.extra.chip_gain = 0.25
                return {
                    message = "Reset!",
                    colour = G.C.CHIPS,
                    message_card = card
                }
            end
        end
    end,

    in_pool = function(self, args)
        return false
    end
}
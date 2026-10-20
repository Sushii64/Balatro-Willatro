SMODS.Joker {
    key = "caviar",
    rarity = 1,
    atlas = "WillatroEvolved",
    pos = {x = 5, y = 0},
    cost = 4,
    blueprint_compat = false,
    config  = {
        extra = {
            sell_value = 3
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.sell_value
            }
        }
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            for _, area in ipairs({ G.jokers, G.consumeables }) do
                for _, other_card in ipairs(area.cards) do
                    if other_card.set_cost then
                        other_card.ability.extra_value = (other_card.ability.extra_value or 0) +
                            card.ability.extra.sell_value
                        other_card:set_cost()
                    end
                end
            end
            return {
                message = localize('k_val_up'),
                colour = G.C.MONEY
            }
        end
    end,

    in_pool = function(self, args)
        return false
    end
}
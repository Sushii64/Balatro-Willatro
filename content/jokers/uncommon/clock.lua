SMODS.Joker
{
    key = "clock",
    rarity = 2,
    atlas = "WillatroJokers",
    pos = { x = 1, y = 2 },
    cost = 7,
    blueprint_compat = true,
    config = {
        extra = {
            xmult_gain = 0.5,
            x_mult = 1
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult_gain,
                card.ability.extra.x_mult + (card.ability.extra.xmult_gain * (G.GAME.round_resets.ante - 1))
            }
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            return {
                x_mult = card.ability.extra.x_mult + (card.ability.extra.xmult_gain * (G.GAME.round_resets.ante - 1))
            }
        end
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            if G.GAME.blind.boss then
                return {
                    message = localize('k_upgrade_ex'),
                    colour = G.C.ATTENTION
                }
            end
        end
    end
}
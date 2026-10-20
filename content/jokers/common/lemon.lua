SMODS.Joker
{
    key = "lemon",
    rarity = 1,
    atlas = "WillatroJokers",
    pos = { x = 2, y = 3 },
    cost = 4,
    blueprint_compat = true,
    eternal_compat = false,
    config = {
        extra = {
            odds = 2,
            dollars = 2,
            bigodds = 1000
        }
    },

    loc_vars  = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds)
        local numerator, denominator2 = SMODS.get_probability_vars(card, 1, card.ability.extra.bigodds)
        return {
            vars = {
                numerator,
                denominator,
                card.ability.extra.dollars,
                denominator2
            }
        }
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and
            SMODS.pseudorandom_probability(card, 'willatro_lemon', 1, card.ability.extra.odds) then
            G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + card.ability.extra.dollars
            return {
                dollars = card.ability.extra.dollars,
                func = function()
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            G.GAME.dollar_buffer = 0
                            return true
                        end
                    }))
                end
            }
        end
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            if SMODS.pseudorandom_probability(card, 'willatro_lemon', 1, card.ability.extra.bigodds) then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound('tarot1')
                        card.T.r = -0.2
                        card:juice_up(0.3, 0.4)
                        card.states.drag.is = true
                        card.children.center.pinch.x = true
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.3,
                            blockable = false,
                            func = function()
                                card:remove()
                                return true
                            end
                        }))
                        return true
                    end
                }))
                return {
                    message = localize('k_extinct_ex')
                }
            else
                return {
                    message = localize('k_safe_ex')
                }
            end
        end
    end,

    in_pool = function(self, args)
        return G.GAME.pool_flags.j_willatro_lime_extinct
    end
}
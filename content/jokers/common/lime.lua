SMODS.Joker
{
    key = "lime",
    rarity = 1,
    atlas = "WillatroJokers",
    pos = { x = 1, y = 3 },
    cost = 5,
    blueprint_compat = false,
    eternal_compat = false,
    config = {
        extra = {
            dollars = 3,
            odds = 6,
            money = true
        }
    },

    loc_vars  = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds)
        return {
            vars = {
                card.ability.extra.dollars,
                numerator,
                denominator
            }
        }
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            if SMODS.pseudorandom_probability(card, 'willatro_lime', 1, card.ability.extra.odds) then
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
                G.GAME.pool_flags.j_willatro_lime_extinct = true
                card.ability.money = false
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

    calc_dollar_bonus = function(self, card)
        if card.ability.extra.money == true then
            return card.ability.extra.dollars
        end
    end,

    in_pool = function(self, args)
        return not G.GAME.pool_flags.j_willatro_lime_extinct
    end
}
SMODS.Joker {
    key = "application",
    rarity = 2,
    atlas = "WillatroJokers",
    pos = { x = 5, y = 4 },
    cost = 5,
    blueprint_compat = false,
    eternal_compat = false,
    config = {
        extra = {
            dollars = 7,
            smallodds = 15,
            dollars_increase = 1,
            bigodds = 100,
            money = true
        }
    },

    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.smallodds)
        local numerator, denominator2 = SMODS.get_probability_vars(card, 1, card.ability.extra.bigodds)
        return {
            vars = {
                card.ability.extra.dollars,
                numerator,
                denominator,
                card.ability.extra.dollars_increase,
                denominator2
            }
        }
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            if SMODS.pseudorandom_probability(card, 'willatro_application', 1, card.ability.extra.bigodds) then
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
                card.ability.extra.money = false
                return {
                    message = "Fired!",
                }
            elseif SMODS.pseudorandom_probability(card, 'willatro_application', 1, card.ability.extra.smallodds) then
                card.ability.extra.dollars = card.ability.extra.dollars + card.ability.extra.dollars_increase
                return {
                    message = "Raise!"
                }
            end
        end
    end,

    calc_dollar_bonus = function(self, card)
        if card.ability.extra.money == true then
            return card.ability.extra.dollars
        end
    end
}
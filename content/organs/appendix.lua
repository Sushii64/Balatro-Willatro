SMODS.Joker{
    key = "appendix",
    rarity = "willatro_organ",
    atlas = "WillatroOrgans",
    pos = { x = 1, y = 2 },
    cost = 6,
    blueprint_compat = false,
    eternal_compat = false,
    pools = {
        ["willatro_organ_set"] = true
    },
    config = {
        extra = {
            slots = 2,
            odds = 20
        }
    },

    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds)
        return {
            vars = {
                card.ability.extra.slots,
                numerator,
                denominator
            }
        }
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            if SMODS.pseudorandom_probability(card, 'willatro_appendix', 1, card.ability.extra.odds) then
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
                    message = "Burst!",
                }
            else
                return {
                    message = localize('k_safe_ex')
                }
            end
        end
    end,

    add_to_deck = function(self, card, from_debuff)
        G.E_MANAGER:add_event(Event({
            func = function()
                if G.jokers then
                    G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra.slots
                end
                return true
            end
        }))
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.E_MANAGER:add_event(Event({
            func = function()
                if G.jokers then
                    G.jokers.config.card_limit = G.jokers.config.card_limit - card.ability.extra.slots
                end
                return true
            end
        }))
    end,

    in_pool = function(self, args)
        return not args or args.source ~= 'sho'
    end
}
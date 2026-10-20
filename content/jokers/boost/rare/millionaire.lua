SMODS.Joker {
    key = "millionaire",
    rarity = 3,
    atlas = "WillatroEvolved",
    pos = {x = 4, y = 2},
    cost = 8,
    blueprint_compat = true,
    config = {
        extra = {
            money = 10,
            limit = 9
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.money,
                card.ability.extra.limit
            }
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            if G.GAME.dollars >= to_big(card.ability.extra.money) then
                if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        func = (function()
                            SMODS.add_card {
                                set = 'Tarot',
                                key_append = 'willatro_millionaire'
                            }
                            G.GAME.consumeable_buffer = 0
                            return true
                        end)
                    }))
                    return {
                        message = localize('k_plus_tarot'),
                    }
                end
            else
                ease_dollars(card.ability.extra.money)
            end
        end
    end,

    in_pool = function(self, args)
        return false
    end
}
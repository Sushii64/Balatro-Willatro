SMODS.Joker {
    key = "candy_cookie_chocolate",
    rarity = "willatro_playlist",
    atlas = "WillatroPlaylist",
    pos = { x = 5, y = 1 },
    cost = 5,
    blueprint_compat = true,
    pools = {
        ["willatro_playlist_set"] = true
    },

    calculate = function(self, card, context)
        if context.setting_blind and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
            G.E_MANAGER:add_event(Event({
                func = (function()
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            SMODS.add_card {
                                set = 'willatro_ccc_set',
                                area = G.consumeables
                            }
                            G.GAME.consumeable_buffer = 0
                            return true
                        end
                    }))
                    SMODS.calculate_effect({ message = "+1 Treat", colour = HEX("282322") },
                        context.blueprint_card or card)
                    return true
                end)
            }))
            return nil, true
        end
    end
}

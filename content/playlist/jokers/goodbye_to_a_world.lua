SMODS.Joker {
    key = "goodbye_to_a_world",
    rarity = "willatro_playlist",
    atlas = "WillatroPlaylist",
    pos = { x = 2, y = 0 },
    cost = 5,
    blueprint_compat = false,
    eternal_compat = false,
    pools = {
        ["willatro_playlist_set"] = true
    },

    calculate = function(self, card, context)

        if context.after and G.GAME.chips / G.GAME.blind.chips >= to_big(0.5) and G.GAME.current_round.hands_left <= 0 and not context.blueprint then

            for i = 1, #G.jokers.cards do
                G.jokers.cards[i].ability.willatro_saved = true
                G.jokers.cards[i]:set_cost()
            end


            ease_discard(G.GAME.round_resets.discards + G.GAME.round_bonus.discards - G.GAME.current_round.discards_left)
            ease_hands_played(G.GAME.round_resets.hands + G.GAME.round_bonus.next_hands - G.GAME.current_round.hands_left)

            G.E_MANAGER:add_event(Event({
                func = function()
                    G.hand_text_area.blind_chips:juice_up()
                    G.hand_text_area.game_chips:juice_up()

                    play_sound('tarot1')
                    card:start_dissolve()

                    return true
                end
            }))

        end
    end,
}
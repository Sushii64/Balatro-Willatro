SMODS.Joker {
    key = "precognition",
    rarity = 2,
    atlas = "WillatroEvolved",
    pos = {x = 1, y = 2},
    cost = 6,
    blueprint_compat = false,
    config = {
        extra = {
            odds = 6
        }
    },

    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds)
        return {
            vars = {
                numerator,
                denominator
            }
        }
    end,

    calculate = function(self, card, context)
        if context.scoring_hand and context.destroy_card and not context.blueprint then
            for i = 1, #context.scoring_hand do
                if context.scoring_hand[i]:get_id() == 6 and context.destroy_card:get_id() == 6 then
                    G.E_MANAGER:add_event(Event({
                        func = (function()
                            SMODS.add_card {
                                set = 'Spectral',
                                key_append = 'willatro_precognition'
                            }
                            G.GAME.consumeable_buffer = 0
                            return true
                        end)
                    }))
                    return {
                        message = localize('k_plus_spectral'),
                        colour = G.C.SECONDARY_SET.Spectral,
                        remove = true
                    }
                end
            end
        end

        if context.first_hand_drawn then
            if SMODS.pseudorandom_probability(card, 'willatro_precognition', 1, card.ability.extra.odds) then
                local _card = SMODS.create_card { set = "Base", seal = SMODS.poll_seal({ guaranteed = false, type_key = 'willatro_precognition' }),
                edition = poll_edition('willatro_precognition', nil, true, false), rank = 6,
                enhancement = SMODS.poll_enhancement({ guaranteed = false, type_key = 'willatro_precognition' }), area = G.discard }
                G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                _card.playing_card = G.playing_card
                table.insert(G.playing_cards, _card)

                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.hand:emplace(_card)
                        _card:start_materialize()
                        G.GAME.blind:debuff_card(_card)
                        G.hand:sort()
                        if context.blueprint_card then
                            context.blueprint_card:juice_up()
                        else
                            card:juice_up()
                        end
                        SMODS.calculate_context({ playing_card_added = true, cards = { _card } })
                        save_run()
                        return true
                    end
                }))

                return nil, true
            end
        end
    end,

    in_pool = function(self, args)
        return false
    end
}
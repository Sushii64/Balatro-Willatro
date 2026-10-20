SMODS.Joker
{
    key = "mitosis",
    rarity = 3,
    atlas = "WillatroEvolved",
    pos = {x = 1, y = 4 },
    cost = 8,
    blueprint_compat = true,
    config = { 
        trigger = true
    },

    calculate = function(self, card, context)
        if context.before and context.main_eval then
            local new_cards = {}
            local message = false
            for i = 1, 2 do
                for k, v in ipairs(context.scoring_hand) do
                    if v.seal or v.edition or next(SMODS.get_enhancements(v)) then
                        message = true
                        G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                        local copy_card = copy_card(v, nil, nil, G.playing_card)
                        copy_card:add_to_deck()
                        G.deck.config.card_limit = G.deck.config.card_limit + 1
                        table.insert(G.playing_cards, copy_card)
                        G.hand:emplace(copy_card)
                        
                        copy_card.states.visible = nil
                        new_cards[#new_cards + 1] = copy_card
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                copy_card:start_materialize()
                                return true
                            end
                        }))
                    end
                end
            end
            SMODS.calculate_context({ playing_card_added = true, cards = new_cards })
            if message == true then
                return {
                    message = localize('k_copied_ex'),
                    colour = G.C.CHIPS
                }
            end
        end
        if context.destroy_card and context.cardarea == G.play and 
        (context.destroy_card.seal or context.destroy_card.edition or next(SMODS.get_enhancements(context.destroy_card))) then
            return {
                remove = true
            }
        end
    end,

    in_pool = function(self, args)
        return false
    end
}
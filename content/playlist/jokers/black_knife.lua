SMODS.Joker {
    key = "black_knife",
    rarity = "willatro_playlist",
    atlas = "WillatroPlaylist",
    pos = { x = 1, y = 1 },
    cost = 5,
    pools = {
        ["willatro_playlist_set"] = true
    },

    calculate = function(self, card, context)
        if context.setting_blind and not context.blueprint then
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card and i < #G.jokers.cards then
                    SMODS.destroy_cards(G.jokers.cards[i+1], nil, nil, true)

                    local _card = SMODS.create_card({
                        set = "Joker",
                        key = "j_willatro_swooned_joker",
                        area = G.jokers
                    })
                    _card:add_to_deck()
                    G.jokers:emplace(_card)
                end
            end
        end
    end
}
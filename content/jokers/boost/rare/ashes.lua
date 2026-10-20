SMODS.Joker {
    key = "ashes",
    rarity = 3,
    atlas = "WillatroEvolved",
    pos = {x = 6, y = 0},
    cost = 8,
    blueprint_compat = false,
    config = {
        extra = {
            scored_hands = {}
        }
    },

    calculate = function(self, card, context)
        if context.before and context.main_eval and not context.blueprint then
            card.ability.extra.scored_hands[#card.ability.extra.scored_hands+1] = context.scoring_name
        end
        if context.end_of_round and context.game_over == false and context.main_eval and card.ability.extra.scored_hands and not context.blueprint then
            local all_hands = {
                'Flush Five', 'Flush House', 'Five of a Kind', 'Straight Flush', 'Four of a Kind',
                'Full House', 'Flush', 'Straight', 'Three of a Kind', 'Two Pair', 'Pair', 'High Card'
            }
            
            local played_hands = {}
            for i = 1, #card.ability.extra.scored_hands do
                played_hands[card.ability.extra.scored_hands[i]] = true
            end
            
            for _, hand in ipairs(all_hands) do
                if not played_hands[hand] then
                    SMODS.smart_level_up_hand(card, hand)
                end
            end
            
            card.ability.extra.scored_hands = {}
        end
    end,

    in_pool = function(self, args)
        return false
    end
}
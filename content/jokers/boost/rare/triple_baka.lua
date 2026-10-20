SMODS.Joker {
    key = "triple_baka",
    rarity = 3,
    atlas = "WillatroEvolved",
    pos = {x = 0, y = 4},
    cost = 8,
    blueprint_compat = true,
    config = {
        extra = {
            hands = {
                "High Card",
                "Pair",
                "Three of a Kind"
            },
            small_upgrade = 1,
            big_upgrade = 2
        }
    },

    loc_vars = function(self, info_queue, card)
        return { 
            vars = {
                card.ability.extra.big_upgrade,
                card.ability.extra.small_upgrade,
            }
        }
    end,

    calculate = function(self, card, context)

        if context.before and context.main_eval then
            local tracked = {}
            for _, hand in ipairs(card.ability.extra.hands) do
                tracked[hand] = true
            end

            if tracked[context.scoring_name] then
                for _, hand in ipairs(card.ability.extra.hands) do
                    local level = hand == context.scoring_name and card.ability.extra.big_upgrade or card.ability.extra.small_upgrade
                    SMODS.upgrade_poker_hands({ hands = {hand}, level_up = level, from = card })
                end
            end
        end
    end,

    in_pool = function(self, args)
        return false
    end
}
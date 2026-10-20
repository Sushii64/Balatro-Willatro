SMODS.Joker
{
    key = "pear",
    rarity = 3,
    atlas = "WillatroJokers",
    pos = { x = 2, y = 4 },
    cost = 8,
    blueprint_compat = true,
    config = {
        extra = {
            levels = 1
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.levels
            }
        }
    end,

    calculate = function(self, card, context)
        if context.before and context.main_eval and (context.scoring_name == "Pair" or context.scoring_name == "Two Pair") then
            SMODS.upgrade_poker_hands({
                hands = {
                    "Pair",
                    "Two Pair"
                },
                level_up = 1,
                from = card
            })
            return {
                message = localize('k_level_up_ex')
            }
        end
    end
}
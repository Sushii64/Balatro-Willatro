SMODS.Joker
{
    key = "unseenexplosion",
    rarity = 4,
    atlas = "WillatroJokers",
    pos = {x = 4, y = 1 },
    soul_pos = { x = 5, y = 1 },
    cost = 20,
    blueprint_compat = true,
    perishable_compat = false,

    calculate = function(self, card, context)
        if context.joker_main then
            return {
                x_mult = G.GAME.hands[context.scoring_name].played
            }
        end
    end
}
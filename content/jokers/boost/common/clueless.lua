SMODS.Joker {
    key = "clueless",
    rarity = 1,
    atlas = "WillatroEvolved",
    pos = {x = 4, y = 0},
    cost = 0,
    blueprint_compat = true,

    calculate = function(self, card, context)
        if context.before and context.main_eval and not context.blueprint then
            SMODS.destroy_cards(card)
            for _, playing_card in ipairs(context.scoring_hand) do
                if playing_card:is_face() and G.GAME.round_resets.ante < 32 and G.GAME.round_resets.blind_ante < 32 then
                    ease_ante(32 - G.GAME.round_resets.ante)
                    G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante or G.GAME.round_resets.ante
                    G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante + (32 - G.GAME.round_resets.ante)
                    break
                end
            end
        end
    end,

    in_pool = function(self, args)
        return false
    end
}
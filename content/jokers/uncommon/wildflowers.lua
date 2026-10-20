SMODS.Joker {
    key = "wildflowers",
    rarity = 2,
    atlas = "WillatroJokers",
    pos = { x = 5, y = 5 },
    cost = 7,
    blueprint_compat = false,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.m_willatro_overgrown
    end,

    calculate = function(self, card, context)
    if context.debuff_card and SMODS.has_enhancement(context.debuff_card, "m_willatro_overgrown") and context.debuff_card:is_suit("Spades") then
        return {debuff = true}
    end
end
}
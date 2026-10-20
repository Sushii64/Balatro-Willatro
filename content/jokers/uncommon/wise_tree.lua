SMODS.Joker
{
    key = "wisetree",
    rarity = 2,
    atlas = "WillatroJokers",
    pos = { x = 6, y = 3 },
    cost = 6,
    blueprint_compat = true,
    config = {
        extra = {
            repetitions = 1
        }
    },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.m_willatro_overgrown
        return {
            vars = {
                card.ability.extra.repetitions
            }
        }
    end,

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play then
            local overgrown = 0
            for k, v in ipairs(context.scoring_hand) do
                if SMODS.has_enhancement(v, "m_willatro_overgrown") then
                    overgrown = overgrown + 1
                end
            end
            if context.repetition and context.cardarea == G.play then
                return {
                    repetitions = card.ability.extra.repetitions * overgrown
                }
            end
        end
    end
}
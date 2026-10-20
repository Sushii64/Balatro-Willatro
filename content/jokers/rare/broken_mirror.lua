SMODS.Joker 
{
    key = "brokenmirror",
    rarity = 3,
    atlas = "WillatroJokers",
    cost = 8,
    pos = { x = 0, y = 3 },
    blueprint_compat = true,
    config = {
        extra = {
            repetitions = 2
        }
    },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.m_glass
        return {
            vars = {
                card.ability.extra.repetitions
            }
        }
    end,

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play and SMODS.has_enhancement(context.other_card, 'm_glass') then
            return {
                repetitions = card.ability.extra.repetitions
            }
        end
        if context.scoring_hand and context.cardarea == G.play and not context.blueprint then
            if context.destroy_card and SMODS.has_enhancement(context.destroy_card, 'm_glass') then
                return {
                    remove = true
                }
            end
        end
    end,

    in_pool = function(self, args)
        return false
    end
}
SMODS.Joker
{
    key = "bill",
    rarity = 4,
    atlas = "WillatroJokers",
    pos = { x = 4, y = 2 },
    soul_pos = { x = 5, y = 2 },
    cost = 20,
    blueprint_compat = true,
    config = {
        extra = {
            x_mult = 1.5,
            repetitions = 3
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.x_mult,
                card.ability.extra.repetitions
            }
        }
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.play then
            if context.repetition and not context.other_card:is_face() then
                return {
                    repetitions = card.ability.extra.repetitions
                }
            end
            if context.individual then
                if context.other_card:get_id() == 3 then
                    return {
                        x_mult = card.ability.extra.x_mult
                    }
                end
            end
        end
    end
}
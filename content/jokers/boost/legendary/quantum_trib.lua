SMODS.Joker {
    key = "quantum_trib",
    rarity = "willatro_superlegend",
    atlas = "TribEvolved",
    pos = {x = 0, y = 0 },
    soul_pos = {x = 0, y = 1 },
    cost = 20,
    blueprint_compat = true,
    config = {
        extra = {
            xmult = 4
        }
    },

    loc_vars = function(self, info_queue, card)
        return { 
            vars = {
                card.ability.extra.xmult
            }
        }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and
            (context.other_card:get_id() >= 12) then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end
}
SMODS.Joker {
    key = "family_photo",
    rarity = 1,
    atlas = "WillatroEvolved",
    pos = {x = 1, y = 0},
    pixel_size = { h = 95 / 1.2 },
    cost = 5,
    blueprint_compat = true,
    config = {
        extra = {
            x_mult = 2
        }
    },

    loc_vars = function(self, info_queue, card)
        return{
            vars = {
                card.ability.extra.x_mult
            }
        }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card:is_face() then
            return {
                xmult = card.ability.extra.x_mult
            }
        end
    end,

    in_pool = function(self, args)
        return false
    end
}
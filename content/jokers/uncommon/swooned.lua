SMODS.Joker {
    key = "swooned_joker",
    rarity = 2,
    atlas = "WillatroPlaylist",
    pos = { x = 2, y = 1 },
    cost = 5,
    blueprint_compat = true,

    config = {
        extra = {
            small_xmult = 1.5,
            big_xmult = 2
        }
    },

    loc_vars = function(slef, info_queue, card)
        return {
            vars = {
                card.ability.extra.small_xmult,
                card.ability.extra.big_xmult
            }
        }
    end,

    calculate = function(self, card, context)
        if context.other_joker then
            if context.other_joker.config.center.key == "j_willatro_swooned_joker" then
                return {
                    x_mult = card.ability.extra.small_xmult
                }
            end
                
            if context.other_joker.config.center.key == "j_willatro_black_knife" then
                return {
                    x_mult = card.ability.extra.big_xmult
                }
            end
        end
    end
}
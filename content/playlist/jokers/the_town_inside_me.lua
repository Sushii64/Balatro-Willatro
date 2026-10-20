SMODS.Joker {
    key = "the_town_inside_me",
    rarity = "willatro_playlist",
    atlas = "WillatroPlaylist",
    pos = { x = 0, y = 1 },
    cost = 5,
    blueprint_compat = true,
    pools = {
        ["willatro_playlist_set"] = true
    },
    config = {
        extra = {
            x_mult = 1.5
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.x_mult
            }
        }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round and context.other_card:get_id() == 12 then
            if context.other_card.debuff then
                return {
                    message = localize('k_debuffed'),
                    colour = G.C.RED
                }
            else
                return {
                    x_mult = card.ability.extra.x_mult
                }
            end
        end
    end
}
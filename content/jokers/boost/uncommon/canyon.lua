SMODS.Joker {
    key = "canyon",
    rarity = 2,
    atlas = "WillatroEvolved",
    pos = {x = 5, y = 2},
    cost = 6,
    blueprint_compat = true,
    config = {
        extra = {
            x_mult = 5
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.x_mult,
                G.GAME.starting_deck_size
            }
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            if #G.playing_cards < (G.GAME.starting_deck_size / 2) then
                return {
                    x_mult = card.ability.extra.x_mult
                }
            end
        end
    end,

    in_pool = function(self, args)
        return false
    end
}
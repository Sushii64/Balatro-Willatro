SMODS.Joker {
    key = "diamond",
    rarity = 2,
    atlas = "WillatroEvolved",
    pos = {x = 1, y = 3},
    cost = 7,
    blueprint_compat = true,
    config = {
        extra = {
            dollars = 4
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.dollars
            }
        }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card:is_suit("Diamonds") then
            G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + card.ability.extra.dollars
            return {
                dollars = card.ability.extra.dollars,
                func = function()
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            G.GAME.dollar_buffer = 0
                            return true
                        end
                    }))
                end
            }
        end

        if context.debuff_card and not context.blueprint and not context.debuff_card:is_suit("Diamonds") and context.debuff_card.playing_card then
            return {
                debuff = true
            }
        end
    end,

    in_pool = function(self, args)
        return false
    end
}
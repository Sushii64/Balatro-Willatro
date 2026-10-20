SMODS.Joker {
    key = "million_dollar_idea",
    rarity = 3,
    atlas = "WillatroEvolved",
    pos = {x = 4, y = 1},
    cost = 10,
    blueprint_compat = true,
    config = {
        extra = {
            money = 6
        }
    },

    loc_vars = function(self, info_queue, card)
        if card.area and card.area == G.jokers then
            local compatible = G.jokers.cards[1] and G.jokers.cards[1] ~= card and
                G.jokers.cards[1].config.center.blueprint_compat
                main_end = {
                    {
                        n = G.UIT.C,
                        config = { align = "bm", minh = 0.4 },
                        nodes = {
                            {
                                n = G.UIT.C,
                                config = { ref_table = card, align = "m", colour = compatible and mix_colours(G.C.GREEN, G.C.JOKER_GREY, 0.8) or mix_colours(G.C.RED, G.C.JOKER_GREY, 0.8), r = 0.05, padding = 0.06 },
                                nodes = {
                                    { n = G.UIT.T, config = { text = ' ' .. localize('k_' .. (compatible and 'compatible' or 'incompatible')) .. ' ', colour = G.C.UI.TEXT_LIGHT, scale = 0.32 * 0.8 } },
                                }
                            }
                        }
                    }
                }
            return { 
                main_end = main_end,
                vars  = {
                    card.ability.extra.money
                }
            }
        end
        return {
            vars = {
                card.ability.extra.money
            }
        }
    end,

    calculate = function(self, card, context)
        local ret = SMODS.blueprint_effect(card, G.jokers.cards[1], context)
        if ret then
            ret.colour = G.C.RED
        end

        if context.post_trigger and context.other_card == G.jokers.cards[1] then
            ease_dollars(card.ability.extra.money)
        end

        return ret
    end,

    in_pool = function(self, args)
        return false
    end
}
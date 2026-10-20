SMODS.Joker {
    key = "string_theory",
    atlas = "WillatroEvolved",
    blueprint_compat = true,
    rarity = 1,
    cost = 4,
    pos = { x = 2, y = 2 },
    config = {
        extra = {
            chips = 30,
            mult = 4
        }
    },

    loc_vars = function(self, info_queue, card)
        card.ability.extra.chips = to_number(G.GAME.hands["Straight"].chips)
        card.ability.extra.mult = to_number(G.GAME.hands["Straight"].mult)

        return {
            vars = {
                card.ability.extra.chips,
                card.ability.extra.mult
            }
        }
    end,

    calculate = function(self, card, context)
        card.ability.extra.chips = to_number(G.GAME.hands["Straight"].chips)
        card.ability.extra.mult = to_number(G.GAME.hands["Straight"].mult)

        if context.individual and context.cardarea == G.play and context.other_card:get_id() == 14 then
            return {
                chips = card.ability.extra.chips,
                mult = card.ability.extra.mult
            }
        end
    end,

    in_pool = function(self, args)
        return false
    end
}
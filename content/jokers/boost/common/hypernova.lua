SMODS.Joker {
    key = "hypernova",
    rarity = 1,
    atlas = "WillatroEvolved",
    pos = {x = 2, y = 1},
    cost = 5,
    blueprint_compat = true,
    config = {
        extra = {
            mult = 0
        }
    },

    calculate = function(self, card, context)
        if context.joker_main then
            card.ability.extra.mult = 0
            for k, v in pairs(G.GAME.hands) do
                if k ~= context.scoring_name then
                    card.ability.extra.mult = card.ability.extra.mult + v.played
                end
            end
            return {
                mult = card.ability.extra.mult
            }
        end
    end,

    in_pool = function(self, args)
        return false
    end
}
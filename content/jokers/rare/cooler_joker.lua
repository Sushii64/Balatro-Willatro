SMODS.Joker
{
    key = "thecoolerjoker",
    rarity = 3,
    atlas = "WillatroJokers",
    pos = {x = 0, y = 0},
    cost = 8,
    blueprint_compat = true,
    config = { 
        x_mult = 4
    },
    
    loc_vars = function(self, info_queue, card)
        return { 
            vars = { 
                card.ability.x_mult
            } 
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            return {
                x_mult = card.ability.x_mult
            }
        end
    end

}
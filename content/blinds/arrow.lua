SMODS.Blind
{
    key = "arrow",
    atlas = "WillatroBlinds",
    pos = { x = 0, y = 2},
    boss = {
        min = 1,
        max = 0
    },
    boss_colour = HEX('279378'),

    loc_vars = function(self)
        local numerator, denominator = SMODS.get_probability_vars(self, 1, 3, 'willatro_arrow')
        return {
            vars = {
                numerator,
                denominator
            }
        }
    end,
    collection_loc_vars = function(self)
        return {
            vars = {
                '1',
                '3'
            }
        }
    end,

    calculate = function(self, blind, context)
        if not blind.disabled then
            if context.destroy_card and context.cardarea == G.play then
                if SMODS.pseudorandom_probability(blind, 'willatro_arrow', 1, 3) then
                    return {
                        remove = true
                    }
                end
            end
        end
    end

}
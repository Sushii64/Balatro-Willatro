SMODS.Blind
{
    key = "lustful",
    atlas = "WillatroBlinds",
    pos = { x = 0, y = 7 },
    boss = {
        min = 4,
        max = 0
    },
    boss_colour = HEX('e47ad0'),

    loc_vars = function(self)
        return {
            vars = {
                G.GAME.willatro_majority_suit or "(most common suit in deck)"
            }
        }
    end,

    collection_loc_vars = function(self)
        return {
            vars = {
                "(most common suit in deck)"
            }
        }
    end,

    calculate = function(self, blind, context)
        if not blind.disabled then
            if context.debuff_hand then
                blind.triggered = false
                for _, card in ipairs(context.scoring_hand) do
                    if card:is_suit(G.GAME.willatro_majority_suit) then
                        blind.triggered = true
                        if not context.check then
                            ease_dollars(-G.GAME.dollars, true)
                            blind:wiggle()
                            return true
                        end
                    end
                end
            end
        end
    end
}
SMODS.Blind
{
    key = "sand",
    atlas = "WillatroBlinds",
    pos = { x = 0, y = 0},
    boss = {
        min = 3,
        max = 0
    },
    boss_colour = HEX('d09552'),

    calculate = function(self, blind, context)
        if not blind.disabled then
            if context.discard then
                for k, v in ipairs(G.hand.cards) do
                    v:flip()
                end
            end
        end
    end

}
SMODS.Blind
{
    key = "violent",
    atlas = "WillatroBlinds",
    pos = { x = 0, y = 6 },
    boss = {
        min = 4,
        max = 0
    },
    boss_colour = HEX('dd6565'),

    calculate = function(self, blind, context)
        if not blind.disabled then
            if context.destroy_card and context.cardarea == G.play then
                if next(SMODS.get_enhancements(context.destroy_card)) then
                    return {
                        remove = true
                    }
                end
            end
        end
    end
}
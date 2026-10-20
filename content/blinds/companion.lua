SMODS.Blind
{
    key = "companion",
    atlas = "WillatroBlinds",
    pos = { x = 0, y = 8 },
    boss = {
        min = 2,
        max = 0
    },
    boss_colour = HEX('36d156'),

    calculate = function(self, blind, context)
        if not blind.disabled then
            if context.end_of_round and context.main_eval then
                if G.GAME.current_round.hands_played == 1 then
                    G.hand:change_size(1)
                else
                    G.hand:change_size(-1)
                end
            end
        end
    end
}
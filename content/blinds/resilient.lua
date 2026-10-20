SMODS.Blind
{
    key = "resilient",
    atlas = "WillatroBlinds",
    pos = { x = 0, y = 10 },
    boss = {
        min = 4,
        max = 0
    },
    boss_colour = HEX('c1c1c1'),

    set_blind = function(self)
        G.GAME.blind.chips = 2 * ( get_blind_amount(G.GAME.round_resets.ante) * G.GAME.starting_params.ante_scaling + ( ( G.jokers.config.card_limit + G.consumeables.config.card_limit ) * get_blind_amount(G.GAME.round_resets.ante) * 0.05 ) )
        G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
    end,

    disable = function(self)
        G.GAME.blind.chips = 2 * ( get_blind_amount(G.GAME.round_resets.ante) * G.GAME.starting_params.ante_scaling )
        G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
    end
}
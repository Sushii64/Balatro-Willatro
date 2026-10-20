SMODS.Blind
{
    key = "glutton",
    atlas = "WillatroBlinds",
    pos = { x = 0, y = 9 },
    boss = {
        min = 4,
        max = 0
    },
    boss_colour = HEX('e5b790'),
    config = {
        extra = {
            consumeable_slots = nil
        }
    },

    set_blind = function(self)
        G.GAME.blind.effect.extra.consumeable_slots = G.consumeables.config.card_limit

        SMODS.destroy_cards(G.consumeables.cards)
        G.consumeables.config.card_limit = 0

    end,

    defeat = function(self)
        G.consumeables.config.card_limit = G.GAME.blind.effect.extra.consumeable_slots

    end,

    disable = function(self)
        G.consumeables.config.card_limit = G.GAME.blind.effect.extra.consumeable_slots

    end
}
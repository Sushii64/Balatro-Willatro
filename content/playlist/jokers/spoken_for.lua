SMODS.Joker {
    key = "spoken_for",
    rarity = "willatro_playlist",
    atlas = "WillatroPlaylist",
    pos = { x = 0, y = 2 },
    cost = 5,
    blueprint_compat = true,
    config = {
        extra = {
            xmult = 4,
            divmult = 0.5
        }
    },
    pools = {
        ["willatro_playlist_set"] = true
    },

    loc_vars = function(self, info_queue, card)
        local spoken_for_card = G.GAME.current_round.willatro_spoken_for_card or { rank = 'Ace', suit = 'Spades' }
        return {
            vars = {
                localize(spoken_for_card.rank, 'ranks'),
                localize(spoken_for_card.suit, 'suits_plural'),
                card.ability.extra.xmult,
                card.ability.extra.divmult,

                colours = { G.C.SUITS[spoken_for_card.suit] }
            }
        }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card:get_id() == G.GAME.current_round.willatro_spoken_for_card.id and context.other_card:is_suit(G.GAME.current_round.willatro_spoken_for_card.suit) then
                return {
                    xmult = card.ability.extra.xmult
                }
            else
                return {
                    xmult = card.ability.extra.divmult
                }
            end
        end
    end
}
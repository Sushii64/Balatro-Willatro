SMODS.Consumable {
    key = "cookie",
    set = 'willatro_treat',
    atlas = 'WillatroTreats',
    pos = { x = 1, y = 0 },
    cost = 3,
    config = {
        extra = {
            chips = 15
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips
            }
        }
    end,

    use = function(self, card, area, copier)
        local _hand, _tally = nil, 0
        for k, v in ipairs(G.handlist) do
            if SMODS.is_poker_hand_visible(v) and G.GAME.hands[v].played > _tally then
                _hand = v
                _tally = G.GAME.hands[v].played
            end
        end

        if _hand then
            SMODS.upgrade_poker_hands({
                hands = _hand,
                parameters = { "chips" },
                func = function(current, base, parameter)
                    return current + card.ability.extra.chips
                end,
                from = card
            })
        end
    end,

    can_use = function(self, card)
        local _tally = 0
        for k, v in ipairs(G.handlist) do
            if SMODS.is_poker_hand_visible(v) and G.GAME.hands[v].played > _tally then
                _tally = G.GAME.hands[v].played
            end
        end

        if _tally > 0 then
            return true
        end
    end

}
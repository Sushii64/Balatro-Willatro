SMODS.Joker
{
    key = "jokeinthebox",
    rarity = 3,
    atlas = "WillatroJokers",
    pos = {x = 2, y = 0},
    cost = 9,
    blueprint_compat = true,
    perishable_compat = false,
    config = { 
        extra = { 
            x_mult = 1, 
            Xmult_gain = 0.5
        } 
    },

    loc_vars = function(self, info_queue, card)
        local suit = (G.GAME.current_round.willatro_jokeinthebox or {}).suit or 'Spades'
        return
        {
            vars = {
                card.ability.extra.x_mult,
                card.ability.extra.Xmult_gain,
                localize(suit, 'suits_singular'), 
                colours = { G.C.SUITS[suit] }
            }
        }
    end,

    calculate = function(self, card, context)
        if context.before and context.main_eval and not context.blueprint then
            local reset = false
            for k, v in ipairs(context.scoring_hand) do
                if v:is_suit(G.GAME.current_round.willatro_jokeinthebox.suit) then
                    reset = true
                    break
                end
            end
            if reset == true then
                card.ability.extra.x_mult = 1
            else
                card.ability.extra.x_mult = card.ability.extra.x_mult + card.ability.extra.Xmult_gain
            end
        end
        if context.joker_main then
            return {
                xmult = card.ability.extra.x_mult
            }
        end
    end


}
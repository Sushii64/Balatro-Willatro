SMODS.Joker
{
    key = "goose",
    rarity = 3,
    atlas = "WillatroJokers",
    pos = { x = 0, y = 4 },
    cost = 9,
    blueprint_compat = false,
    config = {
        extra = {
            rounds = 4,
            current_rounds = 0
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.rounds,
                card.ability.extra.current_rounds
            }
        }
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            card.ability.extra.current_rounds = card.ability.extra.current_rounds + 1
            if card.ability.extra.current_rounds >= card.ability.extra.rounds then
                if #G.jokers.cards <= G.jokers.config.card_limit then
                    local _card = SMODS.create_card({
                        set = "Joker",
                        key = "j_egg",
                        area = G.jokers,
                        edition = "e_negative"
                    })
                    _card:add_to_deck()
                    _card:set_perishable(true)
                    G.jokers:emplace(_card)
                    card.ability.extra.current_rounds = 0
                    return { 
                        message = "Egg!"
                    }
                end
            end
            return {
                message = (card.ability.extra.current_rounds < card.ability.extra.rounds) and
                    (card.ability.extra.current_rounds .. '/' .. card.ability.extra.rounds) or
                    localize('k_active_ex'),
                colour = G.C.FILTER
            }
        end
    end
}
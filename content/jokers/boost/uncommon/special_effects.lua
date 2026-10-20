SMODS.Joker {
    key = "special_effects",
    rarity = 2,
    atlas = "WillatroEvolved",
    pos = {x = 5, y = 3},
    cost = 5,
    blueprint_compat = false,
    config = {
        extra = {
            odds = 3
        }
    },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.e_negative
        local numerator, denominator = SMODS.get_probability_vars(card, 2, card.ability.extra.odds)
        return {
            vars = {
                numerator,
                denominator
            }
        }
    end,

    calculate = function(self, card, context)
        if not context.blueprint and context.buying_card and (context.card.ability.set == "Joker" or context.card.ability.set == "Planet" or context.card.ability.set == "Spectral" or context.card.ability.set == "Tarot") then
            if SMODS.pseudorandom_probability(card, 'willatro_special_effects', 2, card.ability.extra.odds) then
                local _card = copy_card(context.card)
                
                _card:add_to_deck()
                _card:set_edition("e_negative", true)
                G.jokers:emplace(_card)
            end
        end
    end,

    in_pool = function(self, args)
        return false
    end
}
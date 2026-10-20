SMODS.Joker
{
    key = "willow",
    rarity = 4,
    atlas = "WillatroJokers",
    pos = {x = 3, y = 4 },
    soul_pos = { x = 4, y = 4 },
    cost = 20,
    blueprint_compat = true,
    config = {
        extra = {
            odds = 6,
            dollars = 5
        }
    },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.m_willatro_overgrown
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds)
        return {
            vars = {
                numerator,
                denominator,
                card.ability.extra.dollars
            }
        }
    end,

    calculate = function(self, card, context)
        if context.before and context.main_eval and not context.blueprint then
            local unenhanced = 0
            for _, scored_card in ipairs(context.scoring_hand) do
                if not next(SMODS.get_enhancements(scored_card)) then
                    unenhanced = unenhanced + 1
                    scored_card:set_ability('m_willatro_overgrown', nil, true)
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            scored_card:juice_up()
                            return true
                        end
                    }))
                end
            end
            if unenhanced > 0 then
                return {
                    message = "Overgrown",
                    colour = HEX("4e8e53")
                }
            end
        end

        if context.individual and context.cardarea == G.play and
            SMODS.pseudorandom_probability(card, 'willatro_willow', 1, card.ability.extra.odds) then
            G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + card.ability.extra.dollars
            return {
                dollars = card.ability.extra.dollars,
                func = function()
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            G.GAME.dollar_buffer = 0
                            return true
                        end
                    }))
                end
            }
        end
    end
}
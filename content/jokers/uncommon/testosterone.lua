SMODS.Joker {
    key = "testosterone",
    rarity = 2,
    atlas = "WillatroJokers",
    pos = { x = 6, y = 4 },
    cost = 7,
    blueprint_compat = true,
    config = {
        extra = {
            x_mult = 1.5
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.x_mult
            }
        }
    end,

    calculate = function(self, card, context)
        if context.before and context.main_eval and not context.blueprint then
            local faces = 0
            for _, scored_card in ipairs(context.scoring_hand) do
                if scored_card:get_id() == 11 or scored_card:get_id() == 12 then
                    faces = faces + 1
                    SMODS.change_base(scored_card, nil, "King")
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            scored_card:juice_up()
                            return true
                        end
                    }))
                end
            end
            if faces > 0 then
                return {
                    message = "Transition!",
                    colour = HEX("7ed2bf")
                }
            end
        end

        if context.individual and context.cardarea == G.play and context.other_card:get_id() == 13 then
            return {
                x_mult = card.ability.extra.x_mult
            }
        end
    end
}
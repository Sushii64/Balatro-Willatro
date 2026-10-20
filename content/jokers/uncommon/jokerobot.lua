SMODS.Joker 
{
    key = "jokerobot",
    rarity = 2,
    atlas = "WillatroJokers",
    pos = {x = 5, y = 0},
    cost = 7,
    blueprint_compat = false,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.m_steel
    end,

    calculate = function(self, card, context)
        if context.before and context.main_eval and not context.blueprint then
            local faces = 0
            for _, scored_card in ipairs(context.scoring_hand) do
                if scored_card:is_face() then
                    faces = faces + 1
                    scored_card:set_ability("m_steel", nil, true)
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
                    message = 'Steel',
                    colour = G.C.UI.TEXT_DARK
                }
            end
        end
    end
}
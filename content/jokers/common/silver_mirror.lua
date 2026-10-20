SMODS.Joker
{
    key = "silvermirror",
    rarity = 1,
    atlas = "WillatroJokers",
    pos = {x = 6, y = 2 },
    cost = 4,
    blueprint_compat = false,
    eternal_compat = false,
    config = {
        extra = {
            odds = 15,
            vampire = nil
        }
    },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.m_glass
        info_queue[#info_queue+1] = G.P_CENTERS.m_steel
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds)
        return {
            vars = {
                numerator,
                denominator,
            }
        }
    end,

    calculate = function(self, card, context)
        if context.check_enhancement then
            if context.other_card.config.center.key == "m_glass" then
                return { 
                    m_steel = true 
                }
            end
        end

        --debuff vampire if next to mirror
        for i = 1, #G.jokers.cards do
            if G.jokers.cards[i].config.center.key == 'j_vampire' then
                local vampire = G.jokers.cards[i]
                if i > 1 then
                    if G.jokers.cards[i-1] == card then
                        SMODS.debuff_card(vampire, true, "j_willatro_silvermirror")
                    else
                        SMODS.debuff_card(vampire, false, "j_willatro_silvermirror")
                    end
                end
                if i < #G.jokers.cards then
                    if G.jokers.cards[i+1] == card then
                        SMODS.debuff_card(vampire, true, "j_willatro_silvermirror")
                    else
                        SMODS.debuff_card(vampire, false, "j_willatro_silvermirror")
                    end
                end
            end
        end

        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            if SMODS.pseudorandom_probability(card, 'willatro_silvermirror', 1, card.ability.extra.odds) then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound('glass1')
                        card.T.r = -0.2
                        card:juice_up(0.3, 0.4)
                        card.states.drag.is = true
                        card.children.center.pinch.x = true
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.3,
                            blockable = false,
                            func = function()
                                card:remove()
                                SMODS.add_card({ key = 'j_willatro_brokenmirror' })
                                card:juice_up(0.3, 0.5)
                                return true
                            end
                        }))
                        return true
                    end
                }))
                return {
                    message = "Shattered!"
                }
            else
                return {
                    message = localize('k_safe_ex')
                }
            end
        end
    end
}
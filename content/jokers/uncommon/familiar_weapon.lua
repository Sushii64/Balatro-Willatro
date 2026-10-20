SMODS.Joker 
{
    key = "familiarweapon",
    rarity = 2,
    atlas = "WillatroJokers",
    pos = {x = 3, y = 0},
    cost = 6,
    blueprint_compat = true,
    perishable_compat = false,
    config = { 
        extra = { 
            chip_gain = 20, 
            chips = 0, 
            message = false, 
            play = false
        } 
    },

    loc_vars = function(self, info_queue, card)
        return { 
            vars = { 
                card.ability.extra.chip_gain, 
                card.ability.extra.chips,
            } 
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local toDestroy = 0
            for i = 1, #context.scoring_hand do
                if context.scoring_hand[i]:get_id() < 9 then
                    toDestroy = toDestroy + 1
                end
            end
            if toDestroy > 0 and not context.blueprint then
                card.ability.extra.chips = card.ability.extra.chips + (toDestroy * card.ability.extra.chip_gain)
            end
            return {
                chips = card.ability.extra.chips
            }
        end

        if context.destroy_card and context.cardarea == G.play and not context.blueprint then
            if context.destroy_card:get_id() < 9 then
                card.ability.extra.message = true
                return {
                    remove = true
                }
            end
        end
        if not context.after and card.ability.extra.message == true then
            card.ability.extra.play = true
            card.ability.extra.message = false
            return { 
                G.E_MANAGER:add_event(Event({
                    func = function()
                        if card.ability.extra.play == true then
                            card:juice_up(0.8, 0.8)
                            play_sound('slice1', 0.96 + math.random() * 0.08)
                            card.ability.extra.play = false
                        end
                        return true
                    end
                }))
            }
        end
    end
}
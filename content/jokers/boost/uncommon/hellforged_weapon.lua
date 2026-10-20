SMODS.Joker {
    key = "hellforged_weapon",
    rarity = 2,
    atlas = "WillatroEvolved",
    pos = {x = 6, y = 3},
    cost = 6,
    blueprint_compat = true,
    perishable_compat = false,
    config = {
        extra = {
            mult_gain = 20,
            mult = 0,
            message = false,
            play = false
        }
    },

    loc_vars = function(self, info_queue, card)
        return { 
            vars = { 
                card.ability.extra.mult_gain,
                card.ability.extra.mult,
            } 
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local toDestroy = 0
            for i = 1, #context.scoring_hand do
                if context.scoring_hand[i]:get_id() <= 9 then
                    toDestroy = toDestroy + 1
                end
            end
            if toDestroy > 0 and not context.blueprint then
                card.ability.extra.mult = card.ability.extra.mult + (toDestroy * card.ability.extra.mult_gain)
            end
            return {
                mult = card.ability.extra.mult
            }
        end

        if context.destroy_card and context.cardarea == G.play and not context.blueprint then
            if context.destroy_card:get_id() <= 9 then
                card.ability.extra.message = true
                return {
                    remove = true
                }
            end
        end
        if not context.after and card.ability.extra.message == true and not context.blueprint then
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
    end,

    in_pool = function(self, args)
        return false
    end
}
SMODS.Joker
{
    key = "rift",
    rarity = 3,
    atlas = "WillatroJokers",
    pos = {x = 6, y = 0},
    cost = 8,
    blueprint_compat = true,
    config = { 
        extra = { 
            planets = 2 
        } 
    },

    loc_vars = function(self, info_queue, card)
        return { 
            vars = { 
                card.ability.extra.planets 
            } 
        }
    end,

    calculate = function(self, card, context)
        if context.setting_blind then
            for i = 1, math.min(card.ability.extra.planets, G.consumeables.config.card_limit - #G.consumeables.cards) do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    if G.consumeables.config.card_limit > #G.consumeables.cards then
                        play_sound('timpani')
                        SMODS.add_card({ set = 'Planet' })
                        card:juice_up(0.3, 0.5)
                    end
                    return true
                end
            }))
        end
        end
    end
}
SMODS.Joker {
    key = "rage",
    rarity = 3,
    atlas = "WillatroJokers",
    pos = { x = 1, y = 5 },
    cost = 8,
    blueprint_compat = true,
    eternal_compat = false,
    config = {
        extra = {
            money = -40
        }
    },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.e_negative
        return {
            vars = {
                card.ability.extra.money
            }
        }
    end,

    calculate = function(self, card, context)
        if context.selling_self then
            G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('generic1', 0.9 + math.random() * 0.1, 0.8)
                play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
                SMODS.add_card({ set = 'Joker', rarity = 'Legendary', edition = "e_negative" })
                card:juice_up(0.3, 0.5)
                if G.GAME.dollars ~= -40 then
                    ease_dollars(-(G.GAME.dollars + 40), true)
                end
                return true
            end
        }))
        end
    end,
}
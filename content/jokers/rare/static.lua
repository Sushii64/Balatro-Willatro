SMODS.Joker {
    key = "static",
    rarity = 3,
    atlas = "WillatroJokers",
    pos = { x = 3, y = 5 },
    soul_pos = { 
        x = 4, y = 5,
        draw = function(card, scale_mod, rotate_mod)
            card.hover_tilt = card.hover_tilt * 1.5
            card.children.floating_sprite:draw_shader('hologram', nil, card.ARGS.send_to_shader, nil,
                card.children.center, 2 * scale_mod, 2 * rotate_mod)
            card.hover_tilt = card.hover_tilt / 1.5
        end
    },
    cost = 8,
    blueprint_compat = true,
    config = {
        extra = {
            x_mult = 3.9,
            x_chips = 2.7,
            money = 25
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.x_mult,
                card.ability.extra.x_chips,
                card.ability.extra.money
            }
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            return {
                x_mult = card.ability.extra.x_mult,
                x_chips = card.ability.extra.x_chips
            }
        end
    end,

    remove_from_deck = function(self, card, context)
        ease_dollars(-card.ability.extra.money)
    end
}
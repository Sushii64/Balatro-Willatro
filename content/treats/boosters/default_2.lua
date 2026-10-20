SMODS.Booster {
    atlas = "WillatroTreats",
    key = "treat_normal_2",
    weight = 1,
    kind = 'willatro_treat',
    cost = 4,
    pos = { x = 5, y = 1 },
    config = { extra = 3, choose = 1 },
    draw_hand = true,

    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = {
                colours = {
                    HEX("282322")
                },
                cfg.choose,
                cfg.extra
            },
            key = self.key:sub(1, -3)
        }
    end,

    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("615b5a"))
        ease_background_colour({ new_colour = HEX("282322"), special_colour = HEX("615b5a"), contrast = 2 })
    end,

    create_card = function(self, card, i)
        return {
            set = "willatro_treat",
            area = G.pack_cards,
            skip_materialize = true,
            key_append =
            "willatro_treat"
        }
    end
}
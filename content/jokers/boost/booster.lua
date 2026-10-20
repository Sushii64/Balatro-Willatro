SMODS.Booster {
    key = "boostable_pack",
    group_key = "k_willatro_boostable_pack",
    atlas = "WillatroEvolved",
    pos = { x = 5, y = 1 },
    kind = "Boostable",
    draw_hand = false,
    config = {
        extra = 2,
        choose = 1
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.choose,
                card.ability.extra
            }
        }
    end,

    create_card = function(self, card, i)
        return { set = "willatro_Upgradeable" }
    end,

    in_pool = function(self, args)
        return false
    end,

    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX('c2b7b7'))
        ease_background_colour({ new_colour = HEX('6a5050'), special_colour = HEX('c2b7b7'), contrast = 2 })
    end
}
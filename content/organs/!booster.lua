SMODS.Booster
{
    key = "organ_pack",
    group_key = "k_willatro_organ_pack",
    atlas = "WillatroOrgans",
    cost = 4,
    weight = 0.9,
    pos = { x = 2, y = 1 },
    kind = "Organ",
    draw_hand = false,
    config = {
        extra = 3,
        choose = 1
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                colours = { 
                    G.C.RARITY["willatro_organ"] 
                },
                card.ability.choose,
                card.ability.extra
            }
        }
    end,

    create_card = function(self, card, i)
        return { set = "willatro_organ_set" }
    end,

    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, G.C.RARITY["willatro_organ"])
        ease_background_colour({ new_colour = HEX('be4152'), special_colour = G.C.RARITY["willatro_organ"], contrast = 2 })
    end
}
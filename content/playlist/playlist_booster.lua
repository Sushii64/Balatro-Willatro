SMODS.Booster {
    key = "playlist_pack",
    group_key = "k_willatro_playlist_pack",
    atlas = "WillatroPlaylist",
    cost = 5,
    weight = 0.9,
    pos = { x = 4, y = 0 },
    kind = "Playlist",
    draw_hand = false,
    config = {
        extra = 3,
        choose = 1
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                colours = { 
                    G.C.RARITY["willatro_playlist"] 
                },
                card.ability.choose,
                card.ability.extra
            }
        }
    end,

    create_card = function(self, card, i)
        return { set = "willatro_playlist_set" }
    end,

    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, G.C.RARITY["willatro_playlist"])
        ease_background_colour({ new_colour = HEX('00ecfe'), special_colour = G.C.RARITY["willatro_playlist"], contrast = 2 })
    end
}
SMODS.Joker {
    key = "rabbit_hole",
    rarity = "willatro_playlist",
    atlas = "WillatroPlaylist",
    pos = { x = 4, y = 1 },
    cost = 5,
    pools = {
        ["willatro_playlist_set"] = true
    },

    calculate = function(self, card, context)
        if context.before and not context.blueprint then
            for k, v in ipairs(context.scoring_hand) do
                if v:get_id() == 13 then
                    if v.base.suit == "Hearts" then
                        SMODS.destroy_cards(v)
                    else
                        local edition = SMODS.poll_edition { key = "willatro_rabbit_hole", guaranteed = true, no_negative = false }
                        local seal = SMODS.poll_seal {key = "willatro_rabbit_hole", guaranteed = true}

                        v:set_edition(edition)
                        v:set_seal(seal)
                    end
                end
            end
        end
    end
}
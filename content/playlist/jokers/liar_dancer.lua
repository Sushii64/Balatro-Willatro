SMODS.Joker {
    key = "liar_dancer",
    rarity = "willatro_playlist",
    atlas = "WillatroPlaylist",
    pos = { x = 3, y = 0 },
    cost = 5,
    blueprint_compat = true,
    perishable_compat = false,
    pools = {
        ["willatro_playlist_set"] = true
    },
    config = {
        extra = {
            mult_gain = 4,
            mult = 0
        }
    },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = { key = "tag_boss", set = "Tag" }

        return {
            vars = {
                localize { type = 'name_text', set = 'Tag', key = 'tag_boss' },
                card.ability.extra.mult_gain,
                card.ability.extra.mult
            }
        }
    end,

    calculate = function(self, card, context)
        
        if context.setting_blind then
            add_tag(Tag("tag_boss"))

            if not context.blueprint then
                card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain
            end
        end

        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end
    end
}
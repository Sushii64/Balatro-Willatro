SMODS.Joker {
    key = "machine_love",
    rarity = "willatro_playlist",
    atlas = "WillatroPlaylist",
    pos = { x = 3, y = 1 },
    cost = 5,
    pools = {
        ["willatro_playlist_set"] = true
    },

    config = {
        extra = {
            chip_gain = 20
        }
    },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.m_steel
        info_queue[#info_queue+1] = G.P_SEALS["willatro_Love"]

        local love_tally = 0
        if G.playing_cards then
            for k, v in ipairs(G.playing_cards) do
                if v:get_seal() == "willatro_Love" then
                    love_tally = love_tally + 1
                end
            end
        end

        return {
            vars = {
                card.ability.extra.chip_gain,
                card.ability.extra.chip_gain * love_tally
            }
        }
    end,

    calculate = function(self, card, context)
        if context.before and not context.blueprint then
            local steel = 0
            for k, v in ipairs(context.scoring_hand) do
                if SMODS.has_enhancement(v, "m_steel") then
                    steel = steel + 1
                    v:set_seal('willatro_Love', nil, true)
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            v:juice_up()
                            return true
                        end
                    }))
                end
            end
            if steel > 0 then
                return {
                    message = "Love!",
                    colour = HEX("fda2e9")
                }
            end
        end

        if context.joker_main then
            local love_tally = 0
            for k, v in ipairs(G.playing_cards) do
                if v:get_seal() == "willatro_Love" then
                    love_tally = love_tally + 1
                end
            end

            return {
                chips = card.ability.extra.chip_gain * love_tally
            }
        end
    end
}
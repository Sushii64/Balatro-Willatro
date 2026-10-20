SMODS.Joker {
    key = "telepathy",
    rarity = "willatro_playlist",
    atlas = "WillatroPlaylist",
    pos = { x = 0, y = 0 },
    cost = 5,
    blueprint_compat = false,
    pools = {
        ["willatro_playlist_set"] = true
    },
    config = {
        extra = {
            blind1 = "???",
            blind2 = "???",
            blind3 = "???"
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.blind1,
                card.ability.extra.blind2,
                card.ability.extra.blind3
            }
        }
    end,

    calculate = function(self, card, context)
        local predictions = predict_next_bosses(3)
        
        if next(SMODS.find_card("j_willatro_consciousness")) then
            for i, prediction in ipairs(predictions) do
                if prediction.ante % 8 == 0 then
                    prediction.boss = "bl_willatro_virulent_void"
                else
                    prediction.boss = "bl_willatro_hollow"
                end
            end
        end

        card.ability.extra.blind1 = localize({type = 'name_text', key = predictions[1].boss, set = 'Blind'})
        card.ability.extra.blind2 = localize({type = 'name_text', key = predictions[2].boss, set = 'Blind'})
        card.ability.extra.blind3 = localize({type = 'name_text', key = predictions[3].boss, set = 'Blind'})
    end
}
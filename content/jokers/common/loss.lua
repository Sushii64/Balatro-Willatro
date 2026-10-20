SMODS.Joker
{
    key = "loss",
    rarity = 1,
    atlas = "WillatroJokers",
    pos = {x = 1, y = 0},
    cost = 4,
    blueprint_compat = false,
    config = { 
        extra = { 
            created_tag = false 
        } 
    },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_TAGS.tag_ethereal
        return {
            vars = {
                localize { type = "name_text", set = "Tag", key = "tag_ethereal" },
                card.ability.extra.created_tag 
            }
        }
    end,

    calculate = function(self, card, context)
        if context.before then
            local queens = 0
            local twos = 0
            for i = 1, #context.scoring_hand do
                if context.scoring_hand[i]:get_id() == 2 then twos = twos + 1 end
                if context.scoring_hand[i]:get_id() == 12 then queens = queens + 1 end
            end
            if twos > 0 and twos < 2 and queens > 0 and queens < 2 then
                card.ability.extra.created_tag = true
            end
        end

        if context.destroy_card and context.cardarea == G.play and not context.blueprint then
            if card.ability.extra.created_tag == true then

                if context.destroy_card:get_id() == 2 then
                    card.ability.extra.created_tag = false
                    return
                    {
                        func = function()
                            G.E_MANAGER:add_event(Event({
                                func = (function()
                                    add_tag(Tag('tag_ethereal'))
                                    play_sound('generic1', 0.9 + math.random() * 0.1, 0.8)
                                    play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
                                    return true
                                end)
                            }))
                        end,
                        remove = true
                    }
                end
            end
        end
    end
}
SMODS.Consumable {
    key = "boost",
    set = 'Tarot',
    atlas = 'WillatroTarots',
    pos = { x = 1, y = 0 },
    cost = 3,
    config = { 
        extra = { 
            max_highlighted = 1
        } 
    },

    loc_vars = function(self, info_queue, card)
        return { 
            vars = { 
                card.ability.extra.max_highlighted
            } 
        }
    end,

    use = function(self, card, area, copier)
        if G.jokers and G.jokers.highlighted and #G.jokers.highlighted > 0 and #G.jokers.highlighted <= card.ability.extra.max_highlighted then
            for i = 1, #G.jokers.highlighted do
                if willatro.upgrades[G.jokers.highlighted[i].config.center.key] then
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.4,
                        func = function()
                            play_sound('tarot1')
                            card:juice_up(0.3, 0.5)
                            return true
                        end
                    }))
                    delay(0.2)
                    for i = 1, #G.jokers.highlighted do
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.3,
                            blockable = false,
                            func = function()
                                G.jokers.highlighted[i]:juice_up(0.3, 0.5)
                                G.jokers.highlighted[i]:set_ability(willatro.upgrades[G.jokers.highlighted[i].config.center.key].key)
                                return true
                            end
                        }))
                    end
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.2,
                        func = function()
                            G.jokers:unhighlight_all()
                            return true
                        end
                    }))
                end
            end
        else
            SMODS.add_card{key = "c_willatro_boost"}
        end
    end,
    can_use = function(self, card)
        if G.jokers and G.jokers.highlighted and #G.jokers.highlighted > 0 and #G.jokers.highlighted <= card.ability.extra.max_highlighted then
            for i = 1, #G.jokers.highlighted do
                if willatro.upgrades[G.jokers.highlighted[i].config.center.key] then
                    return true
                else
                    return false
                end
            end
        end

        if card.area == G.pack_cards and not (G.jokers and G.jokers.highlighted and #G.jokers.highlighted > 0 and #G.jokers.highlighted <= card.ability.extra.max_highlighted) then
            return true
        end
    end,

    add_to_deck = function(self, card, from_debuff)
        for i = 1, #G.jokers.cards do
            if willatro.upgrades[G.jokers.cards[i].config.center.key] then
                local eval = function(card2)
                    return not card.REMOVED
                end
                juice_card_until(G.jokers.cards[i], eval, true)
                juice_card_until(card, eval, true)
            end
        end
    end
}
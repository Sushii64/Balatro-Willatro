SMODS.Consumable {
    key = "cupcake",
    set = 'willatro_treat',
    atlas = 'WillatroTreats',
    pos = { x = 4, y = 0 },
    cost = 3,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                colours = { HEX("282322") }
            }
        }
    end,

    use = function(self, card, area, copier)

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                if G.consumeables.config.card_limit > #G.consumeables.cards then
                    play_sound('timpani')
                    SMODS.add_card({ set = 'willatro_treat', edition = "e_negative" })
                    card:juice_up(0.3, 0.5)
                end
                return true
            end
        }))
        delay(0.6)
    end,

    can_use = function(self, card)
        return true
    end

}
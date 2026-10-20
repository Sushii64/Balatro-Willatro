SMODS.Consumable {
    key = "chocolate",
    set = 'willatro_treat',
    atlas = 'WillatroTreats',
    pos = { x = 2, y = 0 },
    cost = 3,
    config = {
        extra = {
            dollars = 8
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.dollars
            }
        }
    end,

    use = function(self, card, area, copier)
        ease_dollars(card.ability.extra.dollars, true)
    end,

    can_use = function(self, card)
        return true
    end

}
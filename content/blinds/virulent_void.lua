SMODS.Blind
{
    key = "virulent_void",
    atlas = "WillatroBlinds",
    pos = { x = 0, y = 5 },
    boss = {
        showdown = true
    },
    boss_colour = HEX('030303'),
    mult = 0.1,

    vars = {
        3
    },
    
    loc_vars = function(self)
        return {
            vars = {
                3
            }
        }
    end,

    calculate = function(self, blind, context)
        if not blind.disabled then
            if context.setting_blind then
                ease_hands_played(3)
            end

            if context.debuff_card and context.debuff_card.area == G.jokers then
                return {
                    debuff = true
                }
            end
        end
    end,

    debuff_hand = function(self, cards, hand, handname, check)
        if not self.disabled then
            if handname ~= 'High Card' then
                return true
            end
        end
    end,

    in_pool = function(self, args)
        if next(SMODS.find_card("j_willatro_consciousness")) then
            return true
        end
    end
}
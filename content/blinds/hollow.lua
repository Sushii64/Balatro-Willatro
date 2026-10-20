SMODS.Blind
{
    key = "hollow",
    atlas = "WillatroBlinds",
    pos = { x = 0, y = 4 },
    boss = {
        min = 1,
        max = 0
    },
    boss_colour = HEX('2c2c2c'),

    mult = 0.5,

    vars = {
        1
    },
    
    loc_vars = function(self)
        return {
            vars = {
                1
            }
        }
    end,

    calculate = function(self, blind, context)
        if not blind.disabled then
            if context.setting_blind then
                ease_hands_played(1)
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
SMODS.Blind
{
    key = "golden_gun",
    atlas = "WillatroBlinds",
    pos = { x = 0, y = 3},
    boss = {
        showdown = true
    },
    boss_colour = HEX('ffd081'),

    calculate = function(self, blind, context)
        if not blind.disabled then
            if context.press_play then
                if #G.hand.highlighted > 1 then
                    local marked_card = pseudorandom_element(G.hand.highlighted, "golden_gun")
                    print(marked_card.base.id)
                    ease_dollars(-marked_card.base.id)
                    SMODS.destroy_cards(marked_card)
                end
            end
        end
    end

}
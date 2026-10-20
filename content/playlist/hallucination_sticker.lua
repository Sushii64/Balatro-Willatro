SMODS.Sticker {
    key = "willatro_hallucination_sticker",
    atlas = "PlaylistSticker",
    sets = {
        Joker = true
    },
    badge_colour = HEX('ed6a71'),

    should_apply = function(self, card)
        if next(SMODS.find_card("j_willatro_monitoring")) and card.ability.set == "Joker" and not card.eternal and pseudorandom("hallucination") < 0.3 then
            return true
        end
    end

}
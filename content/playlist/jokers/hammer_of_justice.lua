SMODS.Joker {
    key = "hammer_of_justice",
    rarity = "willatro_playlist",
    atlas = "WillatroPlaylist",
    pos = { x = 1, y = 2 },
    cost = 5,
    pools = {
        ["willatro_playlist_set"] = true
    },

    calculate = function(self, card, context)
        if context.debuff_card and not context.blueprint then
            return {
                prevent_debuff = true
            }
        end

        if context.setting_blind and context.blind.boss and not context.blueprint then
            G.GAME.blind.chips = G.GAME.blind.chips / 2
            G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
        end
    end
}
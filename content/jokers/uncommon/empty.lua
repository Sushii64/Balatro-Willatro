SMODS.Joker
{
    key = "empty",
    rarity = 2,
    atlas = "WillatroJokers",
    pos = { x = 4, y = 3 },
    cost = 6,
    blueprint_compat = false,
    
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.m_stone
    end,

    calculate = function(self, card, context)
        if G.hand and G.jokers then
            local stone = 0
            for i = 1, #G.jokers.cards do
                if context.selling_card and G.jokers.cards[i].config.center.key == 'j_willatro_empty' then
                    for k, v in ipairs(G.hand.highlighted) do
                        if SMODS.has_enhancement(v, "m_stone") then
                            stone = stone + 1
                        end
                    end
                end
            end
            SMODS.change_play_limit(-stone)
            SMODS.change_discard_limit(-stone)
        end
    end,

    remove_from_deck = function(self, card, from_debuff)
        if not G.GAME.before_play_buffer then
			G.hand:unhighlight_all()
		end
	end
}
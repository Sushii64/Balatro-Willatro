SMODS.Joker {
    key = "flood",
    atlas = "WillatroEvolved",
    blueprint_compat = false,
    rarity = 1,
    cost = 3,
    pos = { x = 0, y = 2 },
    config = {
        extra = {
            selection_limit = 5
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.selection_limit
            }
        }
    end,

    calculate = function(self, card, context)
        if context.modify_scoring_hand and not context.blueprint then
            return {
                add_to_hand = true
            }
        end
    end,

    add_to_deck = function(self, card, from_debuff)
		SMODS.change_play_limit(card.ability.extra.selection_limit)
		SMODS.change_discard_limit(card.ability.extra.selection_limit)
	end,

	remove_from_deck = function(self, card, from_debuff)
		SMODS.change_play_limit(-card.ability.extra.selection_limit)
		SMODS.change_discard_limit(-card.ability.extra.selection_limit)
		if not G.GAME.before_play_buffer then
			G.hand:unhighlight_all()
		end
	end,

    in_pool = function(self, args)
        return false
    end
}
SMODS.Joker
{
    key = "tagtree",
    rarity = 3,
    atlas = "WillatroJokers",
    pos = { x = 5, y = 3 },
    cost = 8,
    blueprint_compat = false,
    perishable_compat = false,
    config = {
        extra = {
            tagnumber = 1,
            tags = 2
        }
    },

    loc_vars = function(self, info_queue, card)
        local tag_generated = "???"
        if card.ability.extra.tagnumber > 2 then
			tag_generated = localize({
				type = "name_text",
				set = "Tag",
				key = G.P_CENTER_POOLS["Tag"][card.ability.extra.tagnumber - 1].key,
			})
        end
		return { 
            vars = { 
                card.ability.extra.tags,
                tag_generated
            } 
        }
    end,

    calculate = function(self, card, context)
		if context.setting_blind and not context.blueprint then
            local tags = {}
            for k, v in pairs(G.P_TAGS) do
                table.insert(tags, v.key)
            end
            table.sort(tags, function(a, b) return G.P_TAGS[a].order < G.P_TAGS[b].order end)

			for i = 1, card.ability.extra.tags do

                local tag = Tag(tags[card.ability.extra.tagnumber])
                if tag.name == "Orbital Tag" then
                    local _poker_hands = {}
                    for k, v in pairs(G.GAME.hands) do
                        if v.visible then
                            _poker_hands[#_poker_hands + 1] = k
                        end
                    end
                    tag.ability.orbital_hand = pseudorandom_element(_poker_hands, "seed")
                end
                tag:set_ability()
            
                add_tag(tag)
                card.ability.extra.tagnumber = card.ability.extra.tagnumber + 1
                if card.ability.extra.tagnumber >= 25 then
                    card.ability.extra.tagnumber = 1
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            play_sound('tarot1')
                            card.T.r = -0.2
                            card:juice_up(0.3, 0.4)
                            card.states.drag.is = true
                            card.children.center.pinch.x = true
                            G.E_MANAGER:add_event(Event({
                                trigger = 'after',
                                delay = 0.3,
                                blockable = false,
                                func = function()
                                    card:remove()
                                    return true
                                end
                            }))
                            return true
                        end
                    }))
                    return {
                        message = "Finished!"
                    }
                end
			end
		end
	end
}
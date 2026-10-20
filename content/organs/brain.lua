SMODS.Joker {
    key = "brain",
    rarity = "willatro_organ",
    atlas = "WillatroOrgans",
    pos = { x = 2, y = 0 },
    soul_pos = { x = 3, y = 0 },
    cost = 6,
    blueprint_compat = false,
    pools = {
        ["willatro_organ_set"] = true
    },
    config = {
        extra = {
            repetitions = 1,
            big_repetitions = 2,
            d_remaining = 0,
            improved = false
        }
    },

    loc_vars = function(self, info_queue, card)
        if card.ability.extra.improved == true then
            return {
                vars = {
                    card.ability.extra.repetitions,
                    card.ability.extra.big_repetitions,
                    card.ability.extra.d_remaining
                },
                key = self.key.."_improved"
            }
        else
            return {
                vars = {
                    card.ability.extra.repetitions
                },
                key = "j_willatro_brain"
            }
        end
    end,

    calculate = function(self, card, context)
        if context.first_hand_drawn and not context.blueprint then
            local eval = function()
                return {
                    G.GAME.current_round.hands_played == 0
                }
            end
        end
        
        if G.jokers and not context.blueprint then
            local organs = 0
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i].config.center.rarity == "willatro_organ" then
                    organs = organs + 1

                    if organs >= 4 then
                        card.ability.extra.improved = true
                    else 
                        card.ability.extra.improved = false
                    end
                end
            end
        end

        if context.retrigger_joker_check and not context.retrigger_joker and not context.blueprint then
            if card.ability.extra.improved == true then
                if G.GAME.current_round.hands_left == 0 or G.GAME.current_round.hands_played == 0 then
                    if G.GAME.current_round.discards_left == card.ability.extra.d_remaining then
                        return {
                            repetitions = card.ability.extra.big_repetitions
                        }
                    else
                        return {
                            repetitions = card.ability.extra.repetitions
                        }
                    end
                end
            elseif G.GAME.current_round.hands_left == 0 then
                return {
                    repetitions = card.ability.extra.repetitions
                }
            end
        end
    end,

    in_pool = function(self, args)
        return not args or args.source ~= 'sho'
    end
}
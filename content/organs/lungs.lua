SMODS.Joker {
    key = "lungs",
    rarity = "willatro_organ",
    atlas = "WillatroOrgans",
    pos = { x = 0, y = 1 },
    cost = 6,
    blueprint_compat = true,
    pools = {
        ["willatro_organ_set"] = true
    },
    config = { 
        extra = { 
            chip_gain = 20, 
            lung_rounds = 5,
            rounds = 5,
            chips = 0,
            played_hands = { }
        } 
    },

    loc_vars = function(self, info_queue, card)
        return { 
            vars = { 
                card.ability.extra.chip_gain,
                card.ability.extra.lung_rounds,
                card.ability.extra.rounds,
                card.ability.extra.chips
            } 
        }
    end,

    calculate = function(self, card, context)
        if context.before and next(context.poker_hands['Pair']) and not context.blueprint then
            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_gain
            card.ability.extra.played_hands[#card.ability.extra.played_hands + 1] = 'Pair'
            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.BLUE
            }
        end
        if context.before and not next(context.poker_hands['Pair']) and not context.blueprint then
            card.ability.extra.played_hands[#card.ability.extra.played_hands+1] = 'notPair'
        end

        if context.end_of_round and context.game_over == false and context.main_eval then
            local deduct = false
            for i = 1, #card.ability.extra.played_hands do
                if card.ability.extra.played_hands[i] == 'Pair' then
                    deduct = true
                    break
                end
            end
            if deduct == true then
                card.ability.extra.rounds = card.ability.extra.rounds - 1
                card.ability.extra.played_hands = { }
                deduct = false
                if card.ability.extra.rounds <= 0 then
                    if card.ability.extra.chips > 0 then
                        card.ability.extra.chips = 0
                    end
                    card.ability.extra.rounds = 5
                    return {
                        message = localize('k_reset')
                    }
                end
                return {
                    message = '-1'
                }
            else
                card.ability.extra.rounds = card.ability.extra.lung_rounds
            end

        end

        if context.joker_main then
            return {
                chips = card.ability.extra.chips
            }
        end
    end,

    in_pool = function(self, args)
        return not args or args.source ~= 'sho'
    end
}
SMODS.Joker {
    key = "stomach",
    rarity = "willatro_organ",
    atlas = "WillatroOrgans",
    pos = { x = 1, y = 1 },
    cost = 6,
    blueprint_compat = true,
    pools = {
        ["willatro_organ_set"] = true
    },
    config = {
        extra = {
            xmult_gain = 0.2,
            x_mult = 1,
            chosen_card = nil
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult_gain,
                card.ability.extra.x_mult
            }
        }
    end,

    calculate = function(self, card, context)
        if context.before and not context.blueprint then
            local cards = {}
            for k, v in ipairs(context.scoring_hand) do
                cards[#cards+1] = v
            end
            card.ability.extra.chosen_card = pseudorandom_element(cards, pseudoseed('willatro_stomach' .. G.GAME.round_resets.ante))
            card.ability.extra.x_mult = card.ability.extra.x_mult + card.ability.extra.xmult_gain
            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.FILTER
            }
        end
        
        if context.destroy_card and card.ability.extra.chosen_card and context.cardarea == G.play then
            if context.destroy_card == card.ability.extra.chosen_card then
                return {
                    remove = true
                }
            end
        end

        if context.joker_main then
            return {
                x_mult = card.ability.extra.x_mult
            }
        end
    end,

    in_pool = function(self, args)
        return not args or args.source ~= 'sho'
    end
}
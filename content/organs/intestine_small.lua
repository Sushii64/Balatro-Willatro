SMODS.Joker{
    key = "intestine_small",
    rarity = "willatro_organ",
    atlas = "WillatroOrgans",
    pos = { x = 4, y = 1 },
    cost = 6,
    blueprint_compat = true,
    pools = {
        ["willatro_organ_set"] = true
    },
    config = {
        extra = {
            xmult_gain = 0.1,
            x_mult = 1
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
        local message = false
        if context.individual and context.cardarea == G.play and not context.blueprint then
            card.ability.extra.x_mult = card.ability.extra.x_mult + card.ability.extra.xmult_gain
            message = true
        end
        if message == true then
            message = false
            return {
                message_card = card,
                message = localize('k_upgrade_ex'),
                colour = G.C.MULT
            }
        end

        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            if G.GAME.blind.boss and card.ability.extra.x_mult > 1 then
                card.ability.extra.x_mult = 1
                return {
                    message_card = card,
                    message = localize('k_reset'),
                    colour = G.C.RED
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
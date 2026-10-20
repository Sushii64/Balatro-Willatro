SMODS.Joker{
    key = "tooth",
    rarity = "willatro_organ",
    atlas = "WillatroOrgans",
    pos = { x = 2, y = 2 },
    cost = 6,
    blueprint_compat = true,
    perishable_compat = false,
    pools = {
        ["willatro_organ_set"] = true
    },
    config = {
        extra = {
            mult_gain = 5,
            mult = 0
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult_gain,
                card.ability.extra.mult
            }
        }
    end,

    calculate = function(self, card, context)
        if (context.joker_type_destroyed and context.card.ability.set == "Joker" and context.card ~= card) or (context.selling_card and context.card.ability.set == "Joker" and context.card ~= card)
        and not context.blueprint then            
            card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain
            return {
                message = "Munch!",
                colour = G.C.MULT
            }
        end

        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end
    end,

    in_pool = function(self, args)
        return not args or args.source ~= 'sho'
    end
}
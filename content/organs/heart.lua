SMODS.Joker {
    key = "heart",
    rarity = "willatro_organ",
    atlas = "WillatroOrgans",
    pos = { x = 0, y = 0 },
    cost = 6,
    blueprint_compat = true,
    pools = {
        ["willatro_organ_set"] = true
    },
    config = {
        extra = {
            odds = 2,
            x_mult = 2
        }
    },

    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds)
        return {
            vars = {
                numerator, 
                denominator,
                card.ability.extra.x_mult
            }
        }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round and context.other_card:is_suit('Hearts') then
            if context.other_card.debuff then
                return {
                    message = localize('k_debuffed'),
                    colour = G.C.RED
                }
            elseif SMODS.pseudorandom_probability(card, 'willatro_heart', 1, card.ability.extra.odds) then
                return {
                    x_mult = card.ability.extra.x_mult
                }
            end
        end
    end,

    in_pool = function(self, args)
        return not args or args.source ~= 'sho'
    end

}
SMODS.DrawStep {
    key = 'willatro_heart',
    order = 50,
    func = function(card)
        if card.config.center.key == "j_willatro_heart" and (card.config.center.discovered or card.bypass_discovery_center) then
            local scale_mod = 0.05 + 0.05 * math.sin(1.8 * G.TIMERS.REAL) +
                0.07 * math.sin((G.TIMERS.REAL - math.floor(G.TIMERS.REAL)) * math.pi * 14) *
                (1 - (G.TIMERS.REAL - math.floor(G.TIMERS.REAL))) ^ 3
            local rotate_mod = 0.1 * math.sin(1.219 * G.TIMERS.REAL) +
                0.07 * math.sin((G.TIMERS.REAL) * math.pi * 5) * (1 - (G.TIMERS.REAL - math.floor(G.TIMERS.REAL))) ^ 2

            if not G.willatro_heart_sprite then
                G.willatro_heart_sprite = Sprite(0, 0, 71, 95, G.ASSET_ATLAS["willatro_WillatroOrgans"], {x = 1, y = 0})
            end
            
            G.willatro_heart_sprite.role.draw_major = card
            G.willatro_heart_sprite:draw_shader('dissolve', 0, nil, nil, card.children.center, scale_mod, rotate_mod, nil,
                0.1 + 0.03 * math.sin(1.8 * G.TIMERS.REAL), nil, 0.6)
            G.willatro_heart_sprite:draw_shader('dissolve', nil, nil, nil, card.children.center, scale_mod, rotate_mod)
        end
    end,
    conditions = { vortex = false, facing = 'front' },
}
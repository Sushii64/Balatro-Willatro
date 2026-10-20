SMODS.Joker
{
    key = "ghostly",
    rarity = 2,
    atlas = "WillatroJokers",
    pos = { x = 3, y = 2 },
    cost = 6,
    blueprint_compat = false,

    calculate = function(self, card, context)
        if context.using_consumeable and context.consumeable and context.consumeable.ability.set == 'Spectral' and not (context.consumeable.edition or {}).negative then
            local copied = copy_card(context.consumeable)
            copied:set_edition({negative = true}, true)
            copied:add_to_deck()
            G.consumeables:emplace(copied)
        end
    end,

    draw = function(self, card, layer)
        if (layer == 'card' or layer == 'both') and card.sprite_facing == 'front' then
            card.children.center:draw_shader('booster', nil, card.ARGS.send_to_shader)
        end
    end
}
SMODS.Joker
{
    key = "cadaver",
    rarity = 1,
    atlas = "WillatroJokers",
    pos = { x = 1, y = 4 },
    cost = 6,
    blueprint_compat = true,
    eternal_compat = false,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                colours = { G.C.RARITY["willatro_organ"] }
            }
        }
    end,

    calculate = function(self, card, context)
        if context.selling_self and not context.blueprint then
            card_eval_status_text(
                card,
                "extra",
                nil,
                nil,
                nil,
                { 
                    message = localize("k_plus_joker"), colour = G.C.RARITY["willatro_organ"] 
                }
            )
            local card = create_card("Joker", G.jokers, nil, "willatro_organ", nil, nil, nil, "willatro_cadaver")
            card:add_to_deck()
            G.jokers:emplace(card)
            card:start_materialize()
        end
    end
}
SMODS.Joker {
    key = "butcher_vanity",
    rarity = "willatro_playlist",
    atlas = "WillatroPlaylist",
    pos = { x = 5, y = 0 },
    cost = 5,
    blueprint_compat = true,
    perishable_compat = false,
    pools = {
        ["willatro_playlist_set"] = true
    },
    config = {
        extra = {
            odds = 2,
            mult_gain = 15,
            mult = 0
        }
    },

    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds)

        return {
            vars = {
                numerator,
                denominator,
                card.ability.extra.mult_gain,
                card.ability.extra.mult,
                colours = { G.C.RARITY["willatro_organ"] }
            }
        }
    end,

    calculate = function(self, card, context)

        if context.ending_shop and #G.jokers.cards <= G.jokers.config.card_limit and SMODS.pseudorandom_probability(card, 'willatro_butcher', 1, card.ability.extra.odds) and not context.blueprint then
            local _card = SMODS.create_card({
                set = "Joker",
                key = "j_willatro_cadaver",
                area = G.jokers,
                edition = "e_negative"
            })
            _card:add_to_deck()
            G.jokers:emplace(_card)
        end

        if context.setting_blind and not context.blueprint then
            local destroy = false

            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i]:is_rarity("willatro_organ") or G.jokers.cards[i]:is_rarity("willatro_Organ") or G.jokers.cards[i].config.center.key == "j_willatro_cadaver" then
                    card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain
                    SMODS.destroy_cards(G.jokers.cards[i], nil, nil, true)
                    destroy = true
                end
            end

            if destroy == true then
                return {
                message = localize('k_upgrade_ex'),
                colour = G.C.MULT,
            }
            end
        end

        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end
    end
}
SMODS.Joker {
    key = "cheshire_smile",
    blueprint_compat = true,
    perishable_compat = false,
    atlas = "WillatroEvolved",
    rarity = 1,
    cost = 4,
    pos = { x = 0, y = 3 },
    config = {
        extra = {
            small_xchip_gain = 1,
            xchip_gain = 2,
            x_chips = 1,
            faces = false
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.small_xchip_gain,
                card.ability.extra.xchip_gain,
                card.ability.extra.x_chips
            }
        }
    end,

    calculate = function(self, card, context)

        if context.joker_main then
            local toDestroy = 0
            for i = 1, #context.scoring_hand do
                if context.scoring_hand[i]:is_face() == true then
                    card.ability.extra.faces = true

                    toDestroy = toDestroy + 1
                end
            end

            if toDestroy > 0 and not context.blueprint then
                card.ability.extra.x_chips = card.ability.extra.x_chips + (card.ability.extra.small_xchip_gain * toDestroy)
            end

            return {
                x_chips = card.ability.extra.x_chips
            }
        end

        if context.scoring_hand and context.destroy_card and not context.blueprint then
            for i = 1, #context.scoring_hand do
                if context.scoring_hand[i]:is_face() == true and context.destroy_card:is_face() == true and context.destroy_card == context.scoring_hand[i] then

                    return {
                        remove = true,
                        message = localize('k_upgrade_ex')
                    }
                end
            end
        end

        if context.end_of_round then
            if card.ability.extra.faces == false and context.game_over == false and context.main_eval and not context.blueprint then
                local deletable_jokers = {}
                for _, joker in pairs(G.jokers.cards) do
                    if not SMODS.is_eternal(joker, card) and joker ~= card then
                        deletable_jokers[#deletable_jokers + 1] = joker
                    end
                end

                local chosen_joker = pseudorandom_element(deletable_jokers, 'cheshire_choice')
                local _first_dissolve = nil
                G.E_MANAGER:add_event(Event({
                    trigger = 'before',
                    delay = 0.75,
                    func = function()
                        chosen_joker:start_dissolve(nil, _first_dissolve)
                        _first_dissolve = true
                        return true
                    end
                }))

                card.ability.extra.x_chips = card.ability.extra.x_chips + card.ability.extra.xchip_gain

                return {
                    message = localize('k_upgrade_ex')
                }
            else
                card.ability.extra.faces = false
            end
        end
    end,

    in_pool = function(self, args)
        return false
    end
}
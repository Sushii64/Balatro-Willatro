SMODS.Joker 
{
    key = "portal",
    rarity = 3,
    atlas = "WillatroJokers",
    cost = 8,
    pos = { x = 6, y = 1 },
    blueprint_compat = true,
    config = { 
        extra = {
            xmult = 2,
            xchips = 2,
            round = 0
        }
    },

    loc_vars = function(self, info_queue, card)
        if card.ability.extra.round == 0 then
            return {
                vars = {
                    card.ability.extra.xmult,
                    card.ability.extra.xchips
                },
                key = "j_willatro_portal"
            }
        else
            return {
                vars = {
                    card.ability.extra.xmult,
                    card.ability.extra.xchips
                },
                key = self.key.."_alt"
            }
        end
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            card.ability.extra.round = card.ability.extra.round + 1
            if card.ability.extra.round > 1 then
                card.ability.extra.round = 0
            end
        end
        if card.ability.extra.round == 0 then
            card.children.center:set_sprite_pos({x = 6, y = 1})
            if context.joker_main then
                return {
                    x_mult = card.ability.extra.xmult
                }
            end
        end
        if card.ability.extra.round == 1 then
            card.children.center:set_sprite_pos({x = 2, y = 5})
            if context.joker_main then
                return {
                    x_chips = card.ability.extra.xchips
                }
            end
        end
    end
}
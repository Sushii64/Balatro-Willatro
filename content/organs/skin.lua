SMODS.Joker{
    key = "skin",
    rarity = "willatro_organ",
    atlas = "WillatroOrgans",
    pos = { x = 0, y = 2 },
    cost = 6,
    blueprint_compat = false,
    pools = {
        ["willatro_organ_set"] = true
    },
    config = {
        extra = {
            immune = {}
        }
    },

    calculate = function(self, card, context)
        if context.debuff_card and not context.blueprint then

            if context.debuff_card == card then
                return {
                    prevent_debuff = true
                }
            end

            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then
                    if i > 1 then
                        if context.debuff_card == G.jokers.cards[i-1] then
                            return {
                                prevent_debuff = true
                            }
                        end
                    end
                    if i < #G.jokers.cards then
                       if context.debuff_card == G.jokers.cards[i+1] then
                            return {
                                prevent_debuff = true
                            }
                        end
                    end
                end
            end
        end
    end,

    in_pool = function(self, args)
        return not args or args.source ~= 'sho'
    end
}
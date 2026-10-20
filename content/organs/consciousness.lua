SMODS.Joker{
    key = "consciousness",
    rarity = "willatro_Organ",
    atlas = "WillatroOrgans",
    pos = { x = 3, y = 2 },
    soul_pos = { x = 4, y = 2},
    cost = 6,
    blueprint_compat = false,
    pools = {
        ["willatro_organ_set"] = true
    },

    in_pool = function(self, args)
        return not args or args.source ~= 'sho'
    end
}
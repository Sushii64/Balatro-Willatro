SMODS.Rarity
{
    key = "superlegend",
    loc_txt = {},
    badge_colour = HEX("feff5a")
}

local cryptid = false
if next(SMODS.find_mod('Cryptid')) and 'cryptid.lua' then
    cryptid = true
end

SMODS.ObjectType {
    key = "willatro_Upgradeable",
    default = "j_joker",
    cards = {
        ["j_hanging_chad"] = true,
        ["j_joker"] = true,
        ["j_photograph"] = true,
        ["j_oops"] = true,
        ["j_wee"] = true,
        ["j_willatro_troll"] = true,
        ["j_egg"] = true,
        ["j_burnt"] = true,
        ["j_even_steven"] = true,
        ["j_odd_todd"] = true,
        ["j_supernova"] = true,
        ["j_smeared"] = true,
        ["j_brainstorm"] = true,
        ["j_scholar"] = true,
        ["j_splash"] = true,
        ["j_sixth_sense"] = true,
        ["j_riff_raff"] = true,
        ["j_vagabond"] = true,
        ["j_erosion"] = true,
        ["j_golden"] = true,
        ["j_scary_face"] = true,
        ["j_bloodstone"] = true,
        ["j_rough_gem"] = true,
        ["j_arrowhead"] = true,
        ["j_onyx_agate"] = true,
        ["j_ring_master"] = true,
        ["j_willatro_familiarweapon"] = true,
        ["j_willatro_pear"] = true,
        ["j_superposition"] = true,
        ["j_dna"] = true,
        ["j_willatro_quantum_trib"] = true,
        ["j_willatro_thecoolerjoker"] = cryptid
    }
}

willatro.upgrades = {
    ["j_hanging_chad"] = {
        key = "j_willatro_ballot_box",
        upgradeable = true
    },
    ["j_joker"] = {
        key = "j_willatro_thecoolerjoker",
        upgradeable = true
    },
    ["j_photograph"] = {
        key = "j_willatro_family_photo",
        upgradeable = true
    },
    ["j_oops"] = {
        key = "j_willatro_what_all_twelves",
        upgradeable = true
    },
    ["j_wee"] = {
        key = "j_willatro_atomic_joker",
        upgradeable = true
    },
    ["j_willatro_troll"] = {
        key = "j_willatro_clueless",
        upgradeable = true
    },
    ["j_egg"] = {
        key = "j_willatro_caviar",
        upgradeable = true
    },
    ["j_burnt"] = {
        key = "j_willatro_ashes",
        upgradeable = true
    },
    ["j_even_steven"] = {
        key = "j_willatro_composite_carl",
        upgradeable = true
    },
    ["j_odd_todd"] = {
        key = "j_willatro_prime_patrick",
        upgradeable = true
    },
    ["j_supernova"] = {
        key = "j_willatro_hypernova",
        upgradeable = true
    },
    ["j_smeared"] = {
        key = "j_willatro_messy_joker",
        upgradeable = true
    },
    ["j_brainstorm"] = {
        key = "j_willatro_million_dollar_idea",
        upgradeable = true
    },
    ["j_scholar"] = {
        key = "j_willatro_ivy_league_diploma",
        upgradeable = true
    },
    ["j_splash"] = {
        key = "j_willatro_flood",
        upgradeable = true
    },
    ["j_sixth_sense"] = {
        key = "j_willatro_precognition",
        upgradeable = true
    },
    ["j_riff_raff"] = {
        key = "j_willatro_crowd",
        upgradeable = true
    },
    ["j_vagabond"] = {
        key = "j_willatro_millionaire",
        upgradeable = true
    },
    ["j_erosion"] = {
        key = "j_willatro_canyon",
        upgradeable = true
    },
    ["j_golden"] = {
        key = "j_willatro_platinum",
        upgradeable = true
    },
    ["j_scary_face"] = {
        key = "j_willatro_cheshire_smile",
        upgradeable = true
    },
    ["j_bloodstone"] = {
        key = "j_willatro_redstone",
        upgradeable = true
    },
    ["j_rough_gem"] = {
        key = "j_willatro_diamond",
        upgradeable = true
    },
    ["j_arrowhead"] = {
        key = "j_willatro_obsidian",
        upgradeable = true
    },
    ["j_onyx_agate"] = {
        key = "j_willatro_lapis_lazuli",
        upgradeable = true
    },
    ["j_ring_master"] = {
        key = "j_willatro_special_effects",
        upgradeable = true
    },
    ["j_willatro_familiarweapon"] = {
        key = "j_willatro_hellforged_weapon",
        upgradeable = true
    },
    ["j_willatro_pear"] = {
        key = "j_willatro_triple_baka",
        upgradeable = true
    },
    ["j_superposition"] = {
        key = "j_willatro_string_theory",
        upgradeable = true
    },
    ["j_dna"] = {
        key = "j_willatro_mitosis",
        upgradeable = true
    },
    ["j_triboulet"] = {
        key = "j_willatro_quantum_trib",
        upgradeable = true
    },
}
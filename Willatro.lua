assert(SMODS.load_file("util.lua"))()
assert(SMODS.load_file("content/atlas.lua"))()
assert(SMODS.load_file("content/functions.lua"))()

WLTUTIL.load_folders({
    "content/vouchers",
    "content/decks",
    "content/challenges",
    "content/seals",
    "content/tarots",
    "content/crossmod",
    "content/spectrals",
    "content/enhancements",
    "content/blinds",
    "content/poker_hands",
    "content/treats",
    "content/treats/boosters",
    "content/jokers/common",
    "content/jokers/uncommon",
    "content/jokers/rare",
    "content/jokers/legendary",
    "content/jokers/boost",
    "content/jokers/boost/common",
    "content/jokers/boost/uncommon",
    "content/jokers/boost/rare",
    "content/jokers/boost/legendary",
    "content/organs",
    "content/playlist",
    "content/playlist/jokers"
})

assert(SMODS.load_file("content/deckskins.lua"))()
assert(SMODS.load_file("content/quips.lua"))()

assert(SMODS.load_file("content/jokers.lua"))()
assert(SMODS.load_file("content/boostedjokers.lua"))()
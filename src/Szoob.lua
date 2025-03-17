SMODS.Atlas{
    key = 'SzoobJokers',
    path = 'jokers.png',
    px = 71,
    py = 95,
}

assert(SMODS.load_file("src/Jokers.lua"))()
assert(SMODS.load_file("src/Decks.lua"))()
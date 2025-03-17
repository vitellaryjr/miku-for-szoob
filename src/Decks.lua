SMODS.Back{
    key = "mikudeck",
    loc_txt = {
        name = "Miku Deck",
        text = {
            "Start with a {C:legendary,E:1,T:j_szoob_miku}Miku{}",
        },
    },
    pos = {x = 0, y = 2}, -- default atlas, blue deck
    apply = function(self)
        G.E_MANAGER:add_event(Event({
            func = function()
                if G.jokers then
                    local new = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_szoob_miku")
                    new:add_to_deck()
                    new:start_materialize()
                    G.jokers:emplace(new)
                    return true
                end
            end,
        }))
    end,
}
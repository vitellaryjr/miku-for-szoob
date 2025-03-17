SMODS.Joker{
    key = "miku",
    loc_txt = {
        name = "Miku",
        text = {
            "Creates a {C:green}Leek{} after",
            "each {C:attention}Boss Blind{}",
        },
    },
    config = {},
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS['j_szoob_leek']
        -- info_queue[#info_queue+1] = {key = "j_szoob_leek", set = "Joker", config = {extra = G.P_CENTERS['j_szoob_leek'].config.extra.xmult}}
        return {}
    end,
    atlas = "SzoobJokers",
    pos = {x = 1, y = 0},
    soul_pos = {x = 0, y = 0},
    rarity = 4,
    cost = 20,
    blueprint_compat = true,
    calculate = function(self, card, context)
        if context.end_of_round and context.cardarea == G.jokers and G.GAME.blind.boss then
            local new = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_szoob_leek")
            new:add_to_deck()
            G.jokers:emplace(new)
            return {message = "Polkka!"}
        end
    end,
}

SMODS.Joker{
    key = "leek",
    loc_txt = {
        name = "Leek",
        text = {
            "{X:mult,C:white} X#1# {} Mult",
        },
    },
    config = {extra = {xmult = 3.9}},
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.xmult}}
    end,
    atlas = "SzoobJokers",
    pos = {x = 2, y = 0},
    rarity = 1,
    cost = 3,
    blueprint_compat = true,
    in_pool = function(self, args)
        return next(find_joker("j_szoob_miku")) ~= nil, {override_base_checks = true}
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
            return {xmult = card.ability.extra.xmult}
        end
    end,
}
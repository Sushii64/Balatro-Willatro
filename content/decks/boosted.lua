SMODS.Back {
    key = "boosted",
    atlas = "WillatroBacks",
    pos = { x = 2, y = 0 },
    config = {
        tarot = "c_willatro_boost",
        tag = "tag_willatro_boost_tag"
    },

    loc_vars = function(self, info_queue, back)
        return {
            vars = { localize { type = 'name_text', key = self.config.tarot, set = 'Tarot' },
                localize { type = 'name_text', key = self.config.tag, set = 'Tag' }
            }
        }
    end,

    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                SMODS.add_card({ key = self.config.tarot })
                return true
            end
        }))
        delay(0.4)
        G.E_MANAGER:add_event(Event({
            func = (function()
                add_tag(Tag('tag_willatro_boost_tag'))
                return true
            end)
        }))
    end
}
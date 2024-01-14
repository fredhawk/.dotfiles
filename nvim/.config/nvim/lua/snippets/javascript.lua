local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
-- local fmt = ls.require("extras.fmt").fmt
-- local fmt = require("luasnip.extras.fmt").fmt
-- local rep = require("luasnip.extras").rep

local date = function()
    return { os.date("%Y-%m-%d") }
end

ls.add_snippets("javascript", {
    s({
        trig = "raid",
        name = "Date",
        dscr = "Date in the form of YYYY-MM-DD",
    }, {
        f(date, {}),
    }),
})

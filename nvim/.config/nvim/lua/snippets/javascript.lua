local ls = require("luasnip")
-- some shorthands...
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node

local date = function()
	return { os.date("%Y-%m-%d") }
end

ls.add_snippets("javascript", {
	s({
		trig = "drag",
		namr = "Date",
		dscr = "Date in the form of YYYY-MM-DD",
	}, {
		f(date, {}),
	}),
})

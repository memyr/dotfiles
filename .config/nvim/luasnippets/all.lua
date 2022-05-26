local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local l = require("luasnip.extras").lambda
local rep = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require("luasnip.util.types")
local conds = require("luasnip.extras.expand_conditions")

local snips = {
	s("lorem", {
		t({ "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque ut mauris augue. Etiam laoreet tristique", "" }),
		t({ "orci at laoreet. Morbi eget leo libero. Vestibulum feugiat hendrerit massa ut elementum. Aliquam suscipit", "" }),
		t({ "fermentum ex. Aenean mi arcu, lacinia ornare diam eu, tempus elementum est. Morbi non leo eget arcu interdum", "" }),
		t({ "tincidunt. Curabitur et dolor cursus, tincidunt massa sit amet, porttitor nisl. Vestibulum condimentum dolor", "" }),
		t({ "et lectus lacinia cursus. Sed elementum, lacus sit amet suscipit tincidunt, eros elit tristique ante, ut", "" }),
		t({ "hendrerit quam massa vel orci. Morbi in magna in massa vulputate pretium ut nec sapien. Integer blandit", "" }),
		t({ "tortor elit, ac egestas quam eleifend a. Ut ultrices rutrum malesuada.", "" }),
		i(1),
	}),
}

return snips

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
	s("title", {
		t({ "#+title: " }),
		i(1, "title"),
	}),
	s("subtitle", {
		t({ "#+subtitle: " }),
		i(1, "subtitle"),
	}),
	s("author", {
		t({ "#+author: " }),
		i(1, "subtitle"),
	}),
	s("email", {
		t({ "#+email: " }),
		i(1, "email"),
	}),
	s("date", {
		t({ "#+date: " }),
		i(1, "\\today"),
	}),
	s("options", {
		t({ "#+options: " }),
		i(1, "^:nil H:9"),
	}),
	s("bibliography", {
		t({ "#+bibliography: " }),
		i(1, "~/Zotero/library.bib"),
	}),
	s("printbib", {
		t({ "#+print_bibliography:", "" }),
		i(1),
	}),
	s("csl", {
		t({ "#+csl: " }),
		i(1, "~/Zotero/styles/nature.csl"),
	}),

	s("zotero_library", {
		t({ "#+zotero_library: " }),
		i(1, "~/Zotero/library.bib"),
	}),
	s("zotero_csl", {
		t({ "#+zotero_csl_style: " }),
		i(1, "~/Zotero/styles/nature.csl"),
	}),
	s("abstract", {
		t({ "#+begin_abstract", "" }),
		i(1),
		t({ "", "#+end_abstract" }),
	}),
	s("name", {
		t({ "#+name:" }),
		i(1),
	}),
	s("caption", {
		t({ "#+caption:" }),
		i(1),
	}),
	s("file", {
		t({ "[[file:" }),
		i(1),
		t({ "]]" }),
	}),
	s("equation", {
		t({ "\\begin{equation}", "" }),
		t({ "\\label{" }),
		i(1),
		t({ "}", "" }),
		i(2),
		t({ "", "\\end{equation}" }),
	}),
	s("linebreak", {
		t({ "\\linebreak", "" }),
		i(1),
	}),
	s("newline", {
		t({ "\\linebreak", "" }),
		i(1),
	}),
	s("pagebreak", {
		t({ "#+latex: \\newpage", "" }),
		i(1),
	}),
	s("newpage", {
		t({ "#+latex: \\newpage", "" }),
		i(1),
	}),
	s("noexport", {
		t({ ":noexport:", "" }),
		i(1),
	}),
	s("ignore", {
		t({ ":ignore:", "" }),
		i(1),
	}),
	s("src", {
		t({ "#+begin_src " }),
		i(1, "language"),
		t({ "", "" }),
		i(2),
		t({ "", "#+end_src" }),
	}),
	s("py", {
		t({ "#+begin_src python", "" }),
		i(1),
		t({ "", "#+end_src" }),
	}),
	s("sh", {
		t({ "#+begin_src sh", "" }),
		i(1),
		t({ "", "#+end_src" }),
	}),
	s("jupyter", {
		t({ "#+begin_src jupyter-python", "" }),
		i(1),
		t({ "", "#+end_src" }),
	}),
	s("latex", {
		t({ "#+begin_latex", "" }),
		i(1),
		t({ "", "#+end_latex" }),
	}),
	s("link", {
		t({ "[[" }),
		i(1, "link"),
		t({ "][" }),
		i(2, "description"),
		t({ "]]" }),
	}),

	s("frac", {
		t({ "\\frac{" }),
		i(1),
		t({ "}{" }),
		i(2),
		t({ "}" }),
	}),
	s("pandoc-emph", {
		t({ '#+pandoc-emphasis-post: "_"', "" }),
		i(1),
		t({ "", "#+pandoc-emphasis-post:" }),
	}),
	s("cite", {
		t({ "[cite:@" }),
		i(1, "citekey"),
		t({ "]" }),
	}),
}

return snips

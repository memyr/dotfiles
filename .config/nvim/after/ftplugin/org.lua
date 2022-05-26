-- ORGMODE SPECIFIC SETTINGS

-- fix the fillchars for orgmode, which are overwritten by nvim-orgmode
vim.opt.fillchars:append({
	eob = " ",
	-- Thicker lines between windows (global statusline)
	horiz = "━",
	horizup = "┻",
	horizdown = "┳",
	vert = "┃",
	vertleft = "┫",
	vertright = "┣",
	verthoriz = "╋",
})

vim.keymap.set("v", "<localleader>", ":'<,'>SnipRun<cr>", { desc = "Run snippet", buffer = true })
vim.keymap.set("n", "<localleader>", ":SnipRun<cr>", { desc = "Run snippet", buffer = true })

vim.keymap.set("v", "<D-b>", "<Plug>VSurround*", { desc = "bold", buffer = true })
vim.keymap.set("i", "<D-b>", "**<esc>i", { desc = "bold", buffer = true })
vim.keymap.set("v", "<D-i>", "<Plug>VSurround/", { desc = "italics", buffer = true })
vim.keymap.set("i", "<D-i>", "//<esc>i", { desc = "bold", buffer = true })
vim.keymap.set("v", "<D-u>", "<Plug>VSurround_", { desc = "underline", buffer = true })
vim.keymap.set("i", "<D-u>", "__<esc>i", { desc = "bold", buffer = true })
vim.keymap.set("v", "<D-=>", "<Plug>VSurround=", { desc = "verbatim", buffer = true })
vim.keymap.set("i", "<D-=>", "==<esc>i", { desc = "bold", buffer = true })
vim.keymap.set("v", "<D-`>", "<Plug>VSurround~", { desc = "code", buffer = true })
vim.keymap.set("i", "<D-`>", "~~<esc>i", { desc = "bold", buffer = true })
vim.keymap.set("v", "<D-->", "<Plug>VSurround+", { desc = "strikethrough", buffer = true })
vim.keymap.set("i", "<D-->", "++<esc>i", { desc = "strikethrough", buffer = true })

-- Export to docx and open
vim.keymap.set(
	"n",
	"<localleader>d",
	":! /usr/local/bin/pandoc -f org -t docx -o '%.docx' '%' -L add_metadata.lua -L sxnos.lua -L xnos.lua -L strip_code.lua -L abstract-div-to-meta.lua -L pagebreak.lua -L ox-ignore.lua --citeproc && open '%.docx'<cr>",
	{ desc = "Export to docx and open", buffer = true }
)
vim.keymap.set(
	"n",
	"<localleader>",
	":! /usr/local/bin/pandoc -f org -t docx -o '%.docx' '%' -L add_metadata.lua -L sxnos.lua -L xnos.lua -L strip_code.lua -L abstract-div-to-meta.lua -L pagebreak.lua -L ox-ignore.lua --citeproc && open '%.docx'<cr>",
	{ desc = "Export to docx and open", buffer = true }
)

-- Export to docx with live Zotero citations and open
vim.keymap.set(
	"n",
	"<localleader>z",
	":! /usr/local/bin/pandoc -f org -t docx -o '%.docx' '%' -L add_metadata.lua -L zotero.lua -L sxnos.lua -L xnos.lua -L strip_code.lua -L abstract-div-to-meta.lua -L pagebreak.lua -L ox-ignore.lua && open '%.docx'<cr>",
	{ desc = "Export to docx with Zotero citations and open", buffer = true }
)

-- Export to pptx and open
vim.keymap.set(
	"n",
	"<localleader>p",
	":! /usr/local/bin/pandoc -f org -t pptx -o '%.pptx' '%' -L add_metadata.lua -L xnos.lua -L strip_code.lua -L ox-ignore.lua --citeproc && open '%.pptx'<cr>",
	{ desc = "Export to pptx and open", buffer = true }
)
vim.keymap.set(
	"n",
	"<localleader>",
	":! /usr/local/bin/pandoc -f org -t pptx -o '%.pptx' '%' -L add_metadata.lua -L xnos.lua -L strip_code.lua -L ox-ignore.lua --citeproc && open '%.pptx'<cr>",
	{ desc = "Export to pptx and open", buffer = true }
)

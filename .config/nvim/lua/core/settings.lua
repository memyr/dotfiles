-----------------------------------------------------------
-- Neovim settings
-----------------------------------------------------------
-----------------------------------------------------------
-- General
-----------------------------------------------------------
vim.opt.mouse = "a" -- Use the mouse
vim.opt.clipboard = "unnamedplus" -- Better clipboard management
vim.opt.shortmess = "c"
vim.opt.swapfile = false
vim.opt.hidden = true

-----------------------------------------------------------
-- Colorscheme
-----------------------------------------------------------
vim.opt.termguicolors = true -- Enable 24-bit RGB colors
-- Put your favorite colorscheme here
vim.api.nvim_cmd({ cmd = "colorscheme", args = { "solarized" } }, {})
vim.api.nvim_set_hl(0, "Visual", { bg = "#0a4959" }) -- make visual mode less offensive
-- vim.api.nvim_set_hl(0, "Folded", { bg = "NONE" })

-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
vim.opt.number = true -- Show line numbers
vim.opt.wrap = false -- Disable line wrap
vim.opt.linebreak = true -- Wrap on word boundary
vim.opt.splitbelow = true -- Put new windows below current
vim.opt.splitright = true -- Put new windows right of current
vim.opt.scrolloff = 4 -- Lines of context
vim.opt.sidescrolloff = 8 -- Columns of context
vim.opt.cursorline = true -- Highlight the current line
vim.opt.signcolumn = "yes:1" -- Always show a column to the left of the numbers
vim.opt.pumheight = 10 -- max number of items in the pop-up number
vim.opt.cmdheight = 2 -- command line height
vim.opt.showtabline = 1 -- show tabline
vim.opt.showmode = false -- don't show --insert-- or whatever
vim.opt.updatetime = 200
vim.opt.list = true -- show whitespace
vim.opt.conceallevel = 2
vim.opt.spell = true
vim.opt.fillchars:append({
    eob = " ",
    fold = " ", -- no fold indicators
    -- Thicker lines between windows (global statusline)
    horiz = "━",
    horizup = "┻",
    horizdown = "┳",
    vert = "┃",
    vertleft = "┫",
    vertright = "┣",
    verthoriz = "╋",
})

-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
vim.opt.expandtab = true -- Replace tab with spaces
vim.opt.tabstop = 4 -- Number of spaces tabs count for
vim.opt.softtabstop = 4 -- Edit spaces like tabs
vim.opt.shiftwidth = 4 -- Size of an indent
vim.opt.shiftround = true -- Round indent
vim.opt.smarttab = true
vim.opt.smartindent = true -- Insert indents automatically
vim.opt.autoindent = true -- Good autoindenting

-----------------------------------------------------------
-- Highlighting, searching
-----------------------------------------------------------
vim.opt.hlsearch = true -- Highlight search results
vim.opt.incsearch = true -- Show pattern as typed
vim.opt.showmatch = true -- Show matching brackets
vim.opt.ignorecase = true -- Search ignores case
vim.opt.smartcase = true -- Search matches capitols

-----------------------------------------------------------
-- VimTeX
-----------------------------------------------------------
vim.g.vimtex_fold_enabled = 1

-----------------------------------------------------------
-- GUI (Neovide)
-----------------------------------------------------------
vim.opt.guifont = { "FiraCode Nerd Font Mono:h16" }
vim.g.neovide_input_use_logo = true
vim.g.neovide_remember_window_size = true
vim.g.neovide_transparency = 1.0 -- window transparency
vim.g.neovide_cursor_animation_length = 0.05 -- how long the cursor animation
vim.g.neovide_confirm_quit = true -- turn confirm quit on

-----------------------------------------------------------
-- Python environment
-----------------------------------------------------------
vim.g.python_host_prog = "/usr/local/anaconda3/bin/python"
vim.g.python3_host_prog = "/usr/local/anaconda3/bin/python3"

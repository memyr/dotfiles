vim.g.mapleader = " "
vim.g.maplocalleader = ""

local status_ok, wk = pcall(require, "which-key")
if status_ok then
    wk.register({
        b = { name = "﩯Buffers" },
        c = { name = " Code" },
        e = { name = "✎ Edit" },
        f = { name = " Find" },
        g = { name = " Git" },
        h = { name = " Help" },
        l = { name = " LSP" },
        lc = { name = "code..." },
        lg = { name = "goto..." },
        lw = { name = "workspace folder..." },
        lr = { name = "rename..." },
        m = { name = "⫸ LocalLeader" },
        o = { name = " Open" },
        p = { name = " Packer" },
        s = { name = " Snippets" },
        r = { name = "Run" },
        t = { name = " Toggle" },
        w = { name = " Window" },
    }, { prefix = "<leader>" })
end

-- Leader mappings

-- Buffer
vim.keymap.set("n", "<leader>ba", "<cmd>Alpha<CR>", { desc = "Alpha" })
vim.keymap.set("n", "<leader>bb", "<cmd>lua require('telescope.builtin').buffers()<cr>", { desc = "Buffers" })
vim.keymap.set("n", "<leader>b1", "<cmd>BufferLineGoToBuffer 1<cr>", { desc = "Buffer 1" })
vim.keymap.set("n", "<leader>b2", "<cmd>BufferLineGoToBuffer 2<cr>", { desc = "Buffer 2" })
vim.keymap.set("n", "<leader>b3", "<cmd>BufferLineGoToBuffer 3<cr>", { desc = "Buffer 3" })
vim.keymap.set("n", "<leader>b4", "<cmd>BufferLineGoToBuffer 4<cr>", { desc = "Buffer 4" })
vim.keymap.set("n", "<leader>b5", "<cmd>BufferLineGoToBuffer 5<cr>", { desc = "Buffer 5" })
vim.keymap.set("n", "<leader>b6", "<cmd>BufferLineGoToBuffer 6<cr>", { desc = "Buffer 6" })
vim.keymap.set("n", "<leader>b7", "<cmd>BufferLineGoToBuffer 7<cr>", { desc = "Buffer 7" })
vim.keymap.set("n", "<leader>b8", "<cmd>BufferLineGoToBuffer 8<cr>", { desc = "Buffer 8" })
vim.keymap.set("n", "<leader>b9", "<cmd>BufferLineGoToBuffer 9<cr>", { desc = "Buffer 9" })
vim.keymap.set("n", "<leader>bn", "<cmd>BufferLineCycleNext<cr>", { desc = "Next" })
vim.keymap.set("n", "<leader>b]", "<cmd>BufferLineCycleNext<cr>", { desc = "Next" })
vim.keymap.set("n", "<leader>]", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
vim.keymap.set("n", "<C-n>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bp", "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous" })
vim.keymap.set("n", "<leader>b[", "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous" })
vim.keymap.set("n", "<leader>[", "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous buffer" })
vim.keymap.set("n", "<C-p>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>bd", "<cmd>Bdelete<cr>", { desc = "Delete" })
vim.keymap.set("n", "<leader>bD", "<cmd>Bwipeout<cr>", { desc = "Close all" })
-- Code
vim.keymap.set("n", "<leader>cr", "<cmd>SnipRun<cr>", { desc = "Run code snippet" })
vim.keymap.set("n", "<leader>cd", ":cd %:p:h<cr>", { desc = "Change directory to current file" })
-- Edit
vim.keymap.set("n", "<leader>ek", "<cmd>e ~/.config/nvim/lua/core/keymaps.lua<cr>", { desc = "Keybindings" })
vim.keymap.set("n", "<leader>ec", "<cmd>cd ~/.config/nvim | e $MYVIMRC<cr>", { desc = "Config" })
-- Find
vim.keymap.set("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", { desc = "Buffers" })
vim.keymap.set("n", "<leader>fc", "<cmd>lua require('telescope.builtin').colorscheme()<cr>", { desc = "Colorschemes" })
vim.keymap.set("n", "<leader>ff", "<cmd>lua require('telescope').extensions.file_browser.file_browser()<cr>", { desc = "File browser" })
-- vim.keymap.set("n", "<leader>fh", "<cmd>lua require('telescope').extensions.file_browser.heading()<cr>", { desc = "Heading" })
vim.keymap.set("n", "<leader>fh", "<cmd>lua require('telescope.builtin').highlights()<cr>", { desc = "Heading" })
vim.keymap.set("n", "<leader>fi", "<cmd>lua require('telescope.builtin').find_files()<cr>", { desc = "Files" })
vim.keymap.set("n", "<leader>fl", "<cmd>lua require('telescope.builtin').live_grep()<cr>", { desc = "Live grep" })
vim.keymap.set("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", { desc = "Live grep" })
vim.keymap.set("n", "<leader>fq", "<cmd>lua require('telescope.builtin').quickfix()<cr>", { desc = "Quickfix" })
vim.keymap.set("n", "<leader>fr", "<cmd>lua require('telescope.builtin').oldfiles()<cr>", { desc = "Recent files" })
vim.keymap.set("n", "<leader>fs", "<cmd>lua require('telescope.builtin').spell_suggest()<cr>", { desc = "Spelling" })
-- Git
vim.keymap.set("n", "<leader>ga", ":! git add .<cr>", { desc = "Add all" })
vim.keymap.set("n", "<leader>gs", "<cmd>lua require('telescope.builtin').git_status()<cr>", { desc = "Status" })
vim.keymap.set("n", "<leader>gc", "<cmd>Neogit commit<cr>", { desc = "Commit" })
vim.keymap.set("n", "<leader>gn", "<cmd>Neogit<cr>", { desc = "Neogit" })
-- Help
vim.keymap.set("n", "<leader>hc", "<cmd>Cheatsheet<cr>", { desc = "Cheatsheet" })
vim.keymap.set("n", "<leader>hk", "<cmd>lua require('telescope.builtin').keymaps()<cr>", { desc = "Keymaps" })
vim.keymap.set("n", "<leader>hm", "<cmd>lua require('telescope.builtin').man_pages()<cr>", { desc = "Manpages" })
vim.keymap.set("n", "<leader>ho", "<cmd>lua require('telescope.builtin').vim_options()<cr>", { desc = "Vim options" })
-- LSP (other lsp keymaps set in ../plugins/lsp/lsp-installer.lua)
vim.keymap.set("n", "<leader>li", "<cmd>LspInfo<cr>", { desc = "Connected Language Servers" })
-- LocalLeader
vim.keymap.set("n", "<leader>m", "<localleader>", { desc = "LocalLeader" })
-- Open
vim.keymap.set("n", "<leader>of", "gx", { desc = "At point" })
vim.keymap.set("n", "<leader>oa", "<cmd>lua require('orgmode').action('agenda.prompt')<cr>", { desc = "Org agenda" })
vim.keymap.set("n", "<leader>oc", "<cmd>lua require('orgmode').action('capture.prompt')<cr>", { desc = "Org agenda" })
vim.keymap.set("n", "<leader>oo", "<cmd>lcd %:p:h | !open .<cr>", { desc = "Open system file browser" })
-- Packer
vim.keymap.set("n", "<leader>ps", "<cmd>PackerSync<cr>", { desc = "Sync" })
vim.keymap.set("n", "<leader>pc", "<cmd>PackerCompile<cr>", { desc = "Compile" })
vim.keymap.set("n", "<leader>pu", "<cmd>PackerUpdate<cr>", { desc = "Update" })
-- Snippets
vim.keymap.set("n", "<leader>sl", "<cmd>LuaSnipListAvailable<cr>", { desc = "List" })
-- Run
vim.keymap.set("n", "<leader>rl", ":SnipRun<cr>", { desc = "Line" })
vim.keymap.set("v", "<leader>rb", ":'<,'>SnipRun<cr>", { desc = "Block" })
-- Toggle
vim.keymap.set("n", "<leader>tc", ":execute 'set colorcolumn=' . (&colorcolumn == '' ? '80' : '')<cr>", { desc = "Colorcolumn" })
vim.keymap.set("n", "<leader>te", "<cmd>NvimTreeToggle<cr>", { desc = "NvimTree" })
vim.keymap.set("n", "<leader>tf", "<cmd>FocusToggle<cr>", { desc = "Focus" })
vim.keymap.set("n", "<leader>ti", "<cmd>Twilight<cr>", { desc = "Twilight" })
vim.keymap.set("n", "<leader>tm", "<cmd>MinimapToggle<cr>", { desc = "Minimap" })
vim.keymap.set("n", "<leader>tp", "<cmd>TSPlaygroundToggle<cr>", { desc = "Treesitter playground" })
vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm<cr>", { desc = "Term below" })
vim.keymap.set("n", "<D-enter>", "<cmd>ToggleTerm<cr>", { desc = "Term below" })
vim.keymap.set("n", "<leader>tw", ":set wrap! linebreak<cr>", { desc = "Wrap" })
vim.keymap.set("n", "<leader>tf", ":set textwidth=80<cr> ggVGgq", { desc = "Format textwidth" })
vim.keymap.set("n", "<leader>tz", "<cmd>ZenMode<cr>", { desc = "ZenMode" })
vim.keymap.set("n", "<leader>ts", "<cmd>ScrollViewDisable<cr>", { desc = "ZenMode" })
vim.keymap.set("n", "<leader>tS", "<cmd>ScrollViewEnable<cr>", { desc = "ZenMode" })

-- Non-leader mappings

-- Movement
vim.keymap.set("n", "k", "gk", { desc = "Up" })
vim.keymap.set("n", "j", "gj", { desc = "Down" })
-- Folding with tab
vim.keymap.set("n", "<TAB>", "za", { desc = "Toggle folds" })
vim.keymap.set("n", "<S-TAB>", "zA", { desc = "Toggle all folds" })
-- Keep visual mode on indent/un-indent
vim.keymap.set("v", ">", ">gv", { desc = "Indent" })
vim.keymap.set("v", "<", "<gv", { desc = "Un-indent" })
vim.keymap.set("v", "y", "ygv<esc>", { desc = "Yank" })
-- Window hopping
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Up" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Down" })
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Left" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Right" })
vim.keymap.set("n", "<leader>wk", "<C-w>k", { desc = "Up" })
vim.keymap.set("n", "<leader>wj", "<C-w>j", { desc = "Down" })
vim.keymap.set("n", "<leader>wh", "<C-w>h", { desc = "Left" })
vim.keymap.set("n", "<leader>wl", "<C-w>l", { desc = "Right" })
-- Window splitting
vim.keymap.set("n", "<leader>ws", ":split<cr>", { desc = "Split" })
vim.keymap.set("n", "<leader>wv", ":vs<cr>", { desc = "vSplit" })
vim.keymap.set("n", "<leader>wd", "<C-w>c", { desc = "Delete" })
vim.keymap.set("n", "gf", "<C-w>vgf", { desc = "Go to file in vsplit" })
-- Some emacs bindings in insert mode
vim.keymap.set("i", "<C-p>", "<up>", { desc = "Up" })
vim.keymap.set("i", "<C-n>", "<down>", { desc = "Down" })
vim.keymap.set("i", "<C-b>", "<left>", { desc = "Left" })
vim.keymap.set("i", "<C-f>", "<right>", { desc = "Right" })
vim.keymap.set("i", "<C-a>", "<ESC>I", { desc = "Append" })
vim.keymap.set("i", "<C-e>", "<ESC>A", { desc = "End" })
vim.keymap.set("i", "<C-d>", "<ESC>lxi", { desc = "Delete forward" })
-- Using macOS CMD for Neovide
vim.keymap.set({ "i", "n", "v" }, "<D-q>", "<esc>:q!", { desc = "Quit" })
vim.keymap.set({ "i", "n", "v" }, "<D-w>", "<esc><C-w>q", { desc = "Close window" })
vim.keymap.set({ "i", "n", "v" }, "<D-a>", "<esc>ggVG", { desc = "Select all" })
vim.keymap.set({ "i", "n", "v" }, "<D-z>", "u", { desc = "Undo" })
vim.keymap.set({ "i", "n", "v" }, "<D-s>", "<esc><cmd>w<cr>", { desc = "save" })
vim.keymap.set("i", "<D-v>", '<esc>"+p==a', { desc = "Paste" })
vim.keymap.set("n", "<D-v>", '"+p==', { desc = "Paste" })
vim.keymap.set("t", "<D-v>", "pa ", { desc = "Paste" })
-- Move lines
vim.keymap.set("i", "<D-k>", "<esc>:m .-2<cr>==gi", { desc = "Move line up" })
vim.keymap.set("n", "<D-k>", "<esc>:m .-2<cr>==", { desc = "Move line up" })
vim.keymap.set("i", "<D-j>", "<esc>:m .+1<cr>==gi", { desc = "Move line down" })
vim.keymap.set("n", "<D-j>", "<esc>:m .+1<cr>==", { desc = "Move line down" })
-- Move blocks
vim.keymap.set("v", "<D-k>", ":m '<-2<cr>gv=gv", { desc = "Move block up" })
vim.keymap.set("v", "<D-j>", ":m '>+1<cr>gv=gv", { desc = "Move block down" })
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv", { desc = "Move block up" })
vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv", { desc = "Move block down" })
-- Move visual blocks
vim.keymap.set("x", "<D-k>", ":m '<-2<cr>gv=gv", { desc = "Move block up" })
vim.keymap.set("x", "K", ":m '<-2<cr>gv=gv", { desc = "Move block up" })
vim.keymap.set("x", "<D-j>", ":m '>+1<cr>gv=gv", { desc = "Move block down" })
vim.keymap.set("x", "J", ":m '>+1<cr>gv=gv", { desc = "Move block down" })

-- SearchBox
vim.keymap.set("n", "/", "<cmd>SearchBoxMatchAll clear_matches=true<CR>", { desc = "SearchBox" })
vim.keymap.set("n", "<leader>r", "<cmd>SearchBoxReplace<CR>", { desc = "SearchBox Replace" })

-- Telescope
vim.keymap.set("n", "z=", "<cmd>lua require('telescope.builtin').spell_suggest()<cr>", { desc = "Spelling suggestions" })

-- Terminal
-- Use esc to close the terminal (no normal mode)
vim.keymap.set("t", "<esc>", "<cmd>close<cr>", { desc = "Close terminal" })
-- use <c-k> to jump above the terminal
vim.keymap.set("t", "<c-k>", [[<c-\><c-n><c-w>k]], { desc = "Up" })

-- Copilot
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.keymap.set("i", "<D-]>", "<Plug>(copilot-next)", { desc = "Next copilot suggestion" })
vim.keymap.set("i", "<D-[>", "<Plug>(copilot-previous)", { desc = "Prev copilot suggestion" })
vim.keymap.set("i", "<C-/>", 'copilot#Accept("<CR>")', { silent = true, expr = true, desc = "Copilog accept" })

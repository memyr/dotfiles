-- NVIM.LUA

-- Load this first
pcall(require, "impatient")

-- Load the packer init file
require("packer_init")

-- Load the core
require("core.settings")
require("core.keymaps")
require("core.autocommands")

-- Load the plugins
require("plugins.lsp") -- Completion, snippets, lsp
require("plugins.treesitter") -- syntax highlighting
require("plugins.telescope") -- telescope
require("plugins.autopairs") -- autopairs
require("plugins.alpha") -- dashboard
require("plugins.bufferline") -- buffer tabline
require("plugins.lualine") -- statusline

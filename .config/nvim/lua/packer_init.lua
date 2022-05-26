-- Automatically install packer
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = vim.fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer, close and reopen Neovim...")
	vim.api.nvim_cmd({ cmd = "packadd", args = { "packer.nvim" } }, {})
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	max_jobs = 12,
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	use("lewis6991/impatient.nvim") -- Faster startup time
	use("nathom/filetype.nvim") -- Faster startup time

	-- LSP, completion, and snippets
	use("neovim/nvim-lspconfig")
	use({ "williamboman/nvim-lsp-installer", requires = "neovim/nvim-lspconfig" })
	use({ "jose-elias-alvarez/null-ls.nvim", requires = "neovim/nvim-lspconfig" }) -- format code
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-omni",
			"hrsh7th/cmp-emoji",
			"kdheepak/cmp-latex-symbols",
			"quangnguyen30192/cmp-nvim-tags",
			"f3fora/cmp-spell",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lua",
			"L3MON4D3/LuaSnip", -- snippet engine
			"rafamadriz/friendly-snippets", -- a bunch of snippets to use
		},
	})
	use({
		"stevearc/aerial.nvim",
		requires = "neovim/nvim-lspconfig",
		config = function()
			require("aerial").setup({
				on_attach = function(bufnr)
					vim.keymap.set("n", "<leader>ta", "<cmd>AerialToggle!<CR>", { buffer = bufnr, desc = "Toggle Aerial" })
				end,
			})
		end,
	}) -- code outline
	-- UI
	use({ "goolord/alpha-nvim", requires = "kyazdani42/nvim-web-devicons" }) -- fancy dashboard on startup
	use({ "hoob3rt/lualine.nvim", requires = "kyazdani42/nvim-web-devicons" }) -- modeline
	use({ "akinsho/bufferline.nvim", requires = "kyazdani42/nvim-web-devicons" }) -- buffer tabline
	-- Telescope
	use({ "nvim-telescope/telescope.nvim", requires = "nvim-lua/plenary.nvim" })
	use({ "nvim-telescope/telescope-packer.nvim", requires = "nvim-telescope/telescope.nvim" })
	use({ "nvim-telescope/telescope-file-browser.nvim", requires = "nvim-telescope/telescope.nvim" })
	use({ "crispgm/telescope-heading.nvim", requires = "nvim-telescope/telescope.nvim" })
	use({ "nvim-telescope/telescope-bibtex.nvim", requires = "nvim-telescope/telescope.nvim" })
	-- Treesitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use({ "nvim-treesitter/nvim-treesitter-textobjects", requires = "nvim-treesitter/nvim-treesitter" })
	use({ "windwp/nvim-ts-autotag", requires = "nvim-treesitter/nvim-treesitter" }) -- highlight tags (html)
	use({ "p00f/nvim-ts-rainbow", requires = "nvim-treesitter/nvim-treesitter" }) -- easier to see bracket pairs
	use({ "nvim-treesitter/playground", requires = "nvim-treesitter/nvim-treesitter" }) -- easier to see bracket pairs
	use("windwp/nvim-autopairs") -- autopair enclosures
	-- indent guides
	use({
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("indent_blankline").setup({
				buftype_exclude = { "terminal" },
				filetype_exclude = { "help", "dashboard", "NvimTree", "packer", "lspinfo", "lsp-installer" },
				bufname_exclude = { "LICENSE", "README.md", "README.org", "README.MD", "README" },
				space_char_blankline = " ",
				show_current_context = true,
				show_current_context_start = true,
			})
		end,
	})
	-- LSP signatures
	use({
		"ray-x/lsp_signature.nvim",
		config = function()
			require("lsp_signature").setup({ zindex = 1 }) -- set to be below completion menu
		end,
	})
	-- trouble
	use({
		"folke/trouble.nvim",
		config = function()
			require("trouble").setup()
		end,
	})
	-- file browser
	use({
		"kyazdani42/nvim-tree.lua",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("nvim-tree").setup({
				update_cwd = true,
				renderer = {
					indent_markers = {
						enable = true,
					},
				},
			})
		end,
	})
	-- see keybindings
	use({
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup({
				icons = { group = " " },
				window = { border = "single" },
			})
		end,
	})
	-- See keybindings
	use({
		"mrjones2014/legendary.nvim",
		config = function()
			require("legendary").setup()
		end,
	})

	-- highlight lines in ex commands :1,10
	use({
		"winston0410/range-highlight.nvim",
		requires = "winston0410/cmd-parser.nvim",
		config = function()
			require("range-highlight").setup()
		end,
	})
	-- display colors in the terminal
	use({
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	})
	-- dims inactive portions of code
	use({
		"folke/twilight.nvim",
		config = function()
			require("twilight").setup()
		end,
	})
	-- zEnMoDe
	use({
		"folke/zen-mode.nvim",
		config = function()
			require("zen-mode").setup()
		end,
	})
	-- make use of extensible core ui hooks
	use({
		"stevearc/dressing.nvim",
		config = function()
			require("dressing").setup()
		end,
	})
	-- notifications
	use({
		"rcarriga/nvim-notify",
		config = function()
			require("notify").setup()
		end,
	})
	-- fancy searching
	use({
		"VonHeikemen/searchbox.nvim",
		requires = "MunifTanjim/nui.nvim",
		config = function()
			require("searchbox").setup()
		end,
	})
	-- display a minimap
	use({
		"wfxr/minimap.vim",
		run = ":!brew install code-minimap",
		config = function()
			vim.g.minimap_width = 20
		end,
	})
	-- highlight and search comments with to do marks
	use({
		"folke/todo-comments.nvim",
		config = function()
			require("todo-comments").setup()
		end,
	})
	-- don't open files in side windows
	use({
		"stevearc/stickybuf.nvim",
		config = function()
			require("stickybuf").setup()
		end,
	})
	use("dstein64/nvim-scrollview") -- add scrollbar

	-- spell checker
	use({
		"lewis6991/spellsitter.nvim",
		config = function()
			require("spellsitter").setup()
		end,
	})
	-- orgmode
	use({
		-- "nvim-orgmode/orgmode",
		"nvim-orgmode/orgmode",
		requires = "nvim-treesitter/nvim-treesitter",
		config = function()
			require("orgmode").setup({
				org_agenda_files = { "~/Dropbox/org/*" },
				org_indent_mode = "noindent",
				org_ellipsis = " ▾ ",
				org_highlight_latex_and_related = "entities",
			})
			vim.api.nvim_set_hl(0, "OrgTSLatex", { bg = "#073642" })
			vim.api.nvim_set_hl(0, "OrgTSBlock", { bg = "#073642" })
		end,
	})
	-- org bullets
	use({
		"akinsho/org-bullets.nvim",
		config = function()
			require("org-bullets").setup({
				symbols = { "◉", "○", "✸", "✿" },
			})
		end,
	})
	-- markdown preview
	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
		config = function()
			-- vim.g.mkdp_auto_start = 1
			vim.g.mkpd_filetypes = { "markdown", "org" }
		end,
	})
	-- run code snippets
	use({
		"michaelb/sniprun",
		run = "bash ./install.sh",
		config = function()
			require("sniprun").setup({
				selected_interpreters = { "Python3_original" },
				interpreter_options = {
					Python3_original = {
						interpreter = "/usr/local/anaconda3/bin/python",
					},
				},
			})
		end,
	})
	-- cheatsheet for commands
	use({
		"sudormrfbin/cheatsheet.nvim",
		requires = {
			{ "nvim-telescope/telescope.nvim" },
			{ "nvim-lua/popup.nvim" },
			{ "nvim-lua/plenary.nvim" },
		},
		config = function()
			require("cheatsheet").setup()
		end,
	})
	-- easy commenting
	use({
		"terrortylor/nvim-comment",
		config = function()
			require("nvim_comment").setup({
				comment_empty = false,
			})
		end,
	})
	-- git plugin
	use({
		"TimUntersberger/neogit",
		cmd = "Neogit",
		config = function()
			require("neogit").setup()
		end,
	})
	-- git signs
	use({
		"lewis6991/gitsigns.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	})
	-- autofocus
	-- use({
	-- 	"beauwilliams/focus.nvim",
	-- 	config = function()
	-- 		require("focus").setup({
	-- 			signcolumn = true,
	-- 			exclude_filetypes = { "fterm", "term", "toggleterm", "NvimTree" },
	-- 		})
	-- 	end,
	-- })
	-- stabilize windows
	use({
		"luukvbaal/stabilize.nvim",
		config = function()
			require("stabilize").setup()
		end,
	})
	-- terminal
	use({
		"akinsho/toggleterm.nvim",
		config = function()
			require("toggleterm").setup({
				open_mapping = [[<D-enter>]],
			})
		end,
	})
	-- LaTeX compiler
	use({
		"lervag/vimtex",
		config = function()
			vim.g.vimtex_view_method = "skim"
		end,
	})
	-- auto generate documentation for functions
	use({
		"danymat/neogen",
		requires = "nvim-treesitter/nvim-treesitter",
		config = function()
			require("neogen").setup()
		end,
	})
	-- automatically makes directory
	use({
		"jghauser/mkdir.nvim",
		config = function()
			require("mkdir")
		end,
	})
	-- highlight arguments
	use({
		"m-demare/hlargs.nvim",
		requires = "nvim-treesitter/nvim-treesitter",
		config = function()
			require("hlargs").setup({
				color = "#d33682",
			})
		end,
	})

	use("antoinemadec/FixCursorHold.nvim") -- Fixes some performance bugs
	use("chrisbra/csv.vim") -- csv files
	use("tpope/vim-repeat") -- repeat things like surround
	use("tpope/vim-surround") -- surround with S
	use("ggandor/lightspeed.nvim") -- motion plugin
	use("famiu/bufdelete.nvim") -- easily delete buffers without messing up layouts
	-- use("skywind3000/asyncrun.vim") -- asyncrun commands
	use({
		"CRAG666/code_runner.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("code_runner").setup({
				focus = false,
				mode = "toggleterm",
				filetype = {
					python = "cd $dir && /usr/local/anaconda3/bin/python -u $file",
				},
			})
		end,
	})

	-- Colorschemes
	use("ishan9299/nvim-solarized-lua")
	use("rose-pine/neovim")
	use("sainnhe/everforest")
	use("folke/tokyonight.nvim")

	-- Experimental
	use("github/copilot.vim")

	-- Packer bootstrap
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)

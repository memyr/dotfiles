local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

local actions = require("telescope.actions")

telescope.setup({
	defaults = {
		sorting_strategy = "ascending",
		dynamic_preview_title = true,
		layout_config = { prompt_position = "top" },
		layout_strategy = "horizontal",
		mappings = {
			i = {
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				["<C-y>"] = actions.results_scrolling_up,
				["<C-e>"] = actions.results_scrolling_down,
				["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
				["<ESC>"] = actions.close,
			},
		},
	},
	pickers = {
		file_browser = {
			previewer = false,
			hidden = true,
		},
		find_files = {
			find_command = { "fd", "--type", "f", "--strip-cwd-prefix" },
			previewer = false,
			hidden = true,
		},
		oldfiles = {
			previewer = false,
			hidden = true,
		},
	},
	extensions = {
		packer = {},
		heading = {},
		file_browser = {
			previewer = false,
			hidden = true,
		},
		bibtex = {
			custom_formats = {
				{ id = "orgcite", cite_marker = "[cite:%s]" },
			},
			format = "orgcite",
			global_files = { vim.fn.expand("~/Zotero/library.bib") },
		},
	},
})

telescope.load_extension("packer")
telescope.load_extension("file_browser")
telescope.load_extension("heading")
telescope.load_extension("bibtex")
telescope.load_extension("notify")

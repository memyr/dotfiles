local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

lualine.setup({
	options = {
		section_separators = { left = "", right = "" },
		component_separators = { left = "", right = "" },
		disabled_filetypes = { "alpha" },
		globalstatus = true,
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "filename" },
		lualine_c = { "diff", "diagnostics" },
		lualine_x = { { "fileformat", symbols = { unix = "" } }, "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	extensions = { "nvim-tree", "toggleterm", "quickfix" },
})

-- Hide statusline when disabled
vim.api.nvim_set_hl(0, "StatusLine", { fg = "#002b36" })
vim.api.nvim_set_hl(0, "StatusLineNC", { fg = "#002b36", bg = "#002b36" })

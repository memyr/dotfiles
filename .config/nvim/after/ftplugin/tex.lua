-- LaTeX SPECIFIC SETTINGS

-- vim.wo.wrap = true -- Enable line wrap
-- vim.wo.linebreak = true -- Enable line breaking
-- vim.wo.foldmethod = "expr"
-- vim.wo.foldexpr = "nvim_treesitter#foldexpr()"

vim.keymap.set("n", "<localleader>i", "<plug>(vimtex-info)", { desc = "Info", buffer = true })
vim.keymap.set("n", "<localleader>I", "<plug>(vimtex-info-full)", { desc = "Info full", buffer = true })
vim.keymap.set("n", "<localleader>t", "<plug>(vimtex-toc-open)", { desc = "ToC open", buffer = true })
vim.keymap.set("n", "<localleader>T", "<plug>(vimtex-toc-toggle)", { desc = "ToC toggle", buffer = true })
vim.keymap.set("n", "<localleader>q", "<plug>(vimtex-log)", { desc = "Log", buffer = true })
vim.keymap.set("n", "<localleader>v", "<plug>(vimtex-view)", { desc = "View", buffer = true })
vim.keymap.set("n", "<localleader>r", "<plug>(vimtex-reverse-search)", { desc = "Reverse search", buffer = true })
vim.keymap.set("n", "<localleader>l", "<plug>(vimtex-compile)", { desc = "Compile", buffer = true })
vim.keymap.set("n", "<localleader><localleader>", "<plug>(vimtex-compile)", { desc = "Compile", buffer = true })
vim.keymap.set("n", "<localleader>k", "<plug>(vimtex-compile-selected)", { desc = "Compile selected", buffer = true })
vim.keymap.set("n", "<localleader>K", "<plug>(vimtex-stop)", { desc = "Stop", buffer = true })
vim.keymap.set("n", "<localleader>L", "<plug>(vimtex-stop-all)", { desc = "Stop all", buffer = true })
vim.keymap.set("n", "<localleader>e", "<plug>(vimtex-errors)", { desc = "Errors", buffer = true })
vim.keymap.set("n", "<localleader>o", "<plug>(vimtex-compile-output)", { desc = "Compile output", buffer = true })
vim.keymap.set("n", "<localleader>g", "<plug>(vimtex-status)", { desc = "Status", buffer = true })
vim.keymap.set("n", "<localleader>G", "<plug>(vimtex-status-all)", { desc = "Status all", buffer = true })
vim.keymap.set("n", "<localleader>c", "<plug>(vimtex-clean)", { desc = "Clean", buffer = true })
vim.keymap.set("n", "<localleader>C", "<plug>(vimtex-clean-full)", { desc = "Clean full", buffer = true })
vim.keymap.set("n", "<localleader>m", "<plug>(vimtex-imaps-list)", { desc = "Imaps List", buffer = true })
vim.keymap.set("n", "<localleader>x", "<plug>(vimtex-reload)", { desc = "Reload", buffer = true })
vim.keymap.set("n", "<localleader>X", "<plug>(vimtex-reload-state)", { desc = "Reload state", buffer = true })
vim.keymap.set("n", "<localleader>s", "<plug>(vimtex-toggle-main)", { desc = "Toggle main", buffer = true })
vim.keymap.set("n", "<localleader>a", "<plug>(vimtex-context-menu)", { desc = "Context menu", buffer = true })

vim.keymap.set("v", "<D-b>", "<Plug>VSurround}i\\textbf<esc>", { desc = "bold", buffer = true })
vim.keymap.set("i", "<D-b>", "\\textbf{}<esc>i", { desc = "bold", buffer = true })
vim.keymap.set("v", "<D-i>", "<Plug>VSurround}i\\textit<esc>", { desc = "italics", buffer = true })
vim.keymap.set("i", "<D-i>", "\\textit{}<esc>i", { desc = "italics", buffer = true })
vim.keymap.set("v", "<D-u>", "<Plug>VSurround}i\\underline<esc>", { desc = "underline", buffer = true })
vim.keymap.set("i", "<D-u>", "\\underline{}<esc>i", { desc = "italics", buffer = true })

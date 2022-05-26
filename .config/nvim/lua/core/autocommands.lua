-- highlight a yanked line
vim.api.nvim_create_augroup("hi_yank", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank({ higroup = "Visual", on_visual = false })
    end,
    group = "hi_yank",
    desc = "Highlight the yanked region",
})

vim.api.nvim_create_augroup("general_settings", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "help", "qf", "man", "lspinfo", "checkhealth" },
    callback = function()
        vim.keymap.set("n", "q", ":close<cr>", { silent = true, buffer = true })
        vim.keymap.set("n", "<esc>", ":close<cr>", { silent = true, buffer = true })
    end,
    group = "general_settings",
    desc = "Use <esc> and q to exit these buffers",
})
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "qf", "checkhealth", "alpha" },
    callback = function()
        vim.bo.buflisted = false
    end,
    group = "general_settings",
    desc = "Don't show these buffers in the bufferlist",
})
vim.api.nvim_create_autocmd("BufEnter", {
    desc = "Close all if NvimTree is the last window open",
    group = "general_settings",
    command = "if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif",
    nested = true,
})
vim.api.nvim_create_autocmd("TermOpen", {
    command = "setlocal nospell",
    group = "general_settings",
    desc = "Turn off spellchecking in terminal buffers",
})

vim.api.nvim_create_augroup("cursor_off", { clear = true })
vim.api.nvim_create_autocmd("WinLeave", {
    desc = "No cursorline",
    group = "cursor_off",
    callback = function()
        vim.wo.cursorline = false
    end,
})
vim.api.nvim_create_autocmd("WinEnter", {
    desc = "No cursorline",
    group = "cursor_off",
    callback = function()
        vim.wo.cursorline = true
    end,
})

local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
    return
end

bufferline.setup({
    options = {
        -- tab_size = 10,
        -- max_name_length = 10,
        -- max_prefix_length = 0,
        offsets = { { filetype = "NvimTree", text = "File Explorer", highlight = "Directory", padding = 0 } },
        show_close_icon = false,
        show_buffer_close_icons = false,
        separator_style = { "", "" },
        indicator_icon = "",
    },
})
vim.api.nvim_set_hl(0, "BufferLineFill", { bg = "#002b36" })

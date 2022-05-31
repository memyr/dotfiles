local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
    return
end

local dashboard = require("alpha.themes.dashboard")

alpha.setup(require("alpha.themes.startify").opts)

-- Set header
dashboard.section.header.val = {
    "                                                     ",
    "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
    "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
    "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
    "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
    "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
    "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
    "                                                     ",
}

-- Set menu
dashboard.section.buttons.val = {
    dashboard.button("f", "  > Find file", "<cmd>lua require 'telescope'.extensions.file_browser.file_browser()<cr>"),
    dashboard.button("r", "  > Recent", "<cmd>lua require('telescope.builtin').oldfiles()<cr>"),
    dashboard.button("s", "  > Settings", "<cmd>cd ~/.config/nvim | e $MYVIMRC<cr>"),
    dashboard.button("q", "  > Quit NVIM", ":qa<cr>"),
}

-- Send config to alpha
alpha.setup(dashboard.opts)

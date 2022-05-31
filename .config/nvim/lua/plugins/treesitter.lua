local solarainbow = { "#859900", "#2aa198", "#268bd2", "#6c71c4", "#d33682", "#dc322f", "#cb4b16", "#b58900" }

require("orgmode").setup_ts_grammar()

require("nvim-treesitter.configs").setup({
    ensure_installed = {
        "html",
        "python",
        "lua",
        "vim",
        "bash",
        "toml",
        "regex",
        "latex",
        "comment",
        "query",
        "markdown",
        "org",
    },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = { "org" },
    },
    autotag = { enable = true },
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
        colors = solarainbow,
        termcolors = solarainbow,
    },
    textobjects = { select = { enable = true } },
})

for i, c in ipairs(solarainbow) do
    vim.api.nvim_set_hl(0, "rainbowcol" .. i, { fg = c })
end

-- Don't use treesitter folding until the following are fixed:
-- https://github.com/nvim-treesitter/nvim-treesitter/issues/1424 and
-- https://github.com/neovim/neovim/issues/14977

-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- local py_folds_query = [[
-- [
-- (function_definition)
-- (class_definition)
-- ] @fold
-- ]]
-- vim.treesitter.query.set_query("python", "folds", py_folds_query)

-- local org_folds_query = [[
-- (block) @fold
-- (section) @fold
-- (latex_env) @fold
-- ]]
-- vim.treesitter.query.set_query("org", "folds", org_folds_query)

-- local org_spell_query = [[
-- (paragraph) @spell
-- ]]
-- vim.treesitter.query.set_query("org", "spell", org_spell_query)

-- local tex_folds_query = [[
-- (section) @fold
-- (subsection) @fold
-- (general_environment) @fold
-- ]]
-- vim.treesitter.query.set_query("tex", "folds", tex_folds_query)

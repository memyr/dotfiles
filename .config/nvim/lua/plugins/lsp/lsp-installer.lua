local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
    return
end

local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
    return
end

local servers = { "bashls", "sumneko_lua", "texlab", "grammarly", "pyright" }
lsp_installer.setup({
    ensure_installed = servers,
    automatic_installation = true,
})

for _, server in ipairs(servers) do
    if server == "sumneko_lua" then
        lspconfig[server].setup({
            on_attach = require("plugins.lsp.handlers").on_attach,
            capabilities = require("plugins.lsp.handlers").capabilities,
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" },
                    },
                },
            },
        })
    elseif server == "pyright" then
        lspconfig[server].setup({
            on_attach = require("plugins.lsp.handlers").on_attach,
            capabilities = require("plugins.lsp.handlers").capabilities,
            settings = {
                python = {
                    pythonPath = "/usr/local/anaconda3/bin/python",
                    -- too many issues with stubs (e.g., matplotlib)
                    analysis = {
                        typeCheckingMode = "off",
                    },
                },
            },
        })
    elseif server == "texlab" then
        lspconfig[server].setup({
            on_attach = require("plugins.lsp.handlers").on_attach,
            capabilities = require("plugins.lsp.handlers").capabilities,
            settings = {
                texlab = {
                    latexindent = {
                        modifyLineBreaks = true,
                    },
                },
            },
        })
    else
        lspconfig[server].setup({
            on_attach = require("plugins.lsp.handlers").on_attach,
            capabilities = require("plugins.lsp.handlers").capabilities,
        })
    end
end

local M = {}

local capabilities = vim.lsp.protocol.make_client_capabilities()
local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if status_ok then
    M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)
else
    M.capabilities = {}
end

local diagnostic_augroup = vim.api.nvim_create_augroup("Diagnostics", { clear = true })

M.on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    -- Mappings.
    vim.keymap.set("n", "gL", "<cmd>lua vim.lsp.buf.declaration()<CR>", { buffer = bufnr, desc = "Go to declaration" })
    vim.keymap.set("n", "<leader>lgL", "<cmd>lua vim.lsp.buf.declaration()<CR>", { buffer = bufnr, desc = "Go to declaration" })
    vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { buffer = bufnr, desc = "Go to definition" })
    vim.keymap.set("n", "gD", "<c-w>v<cmd>lua vim.lsp.buf.definition()<CR>", { buffer = bufnr, desc = "Go to definition in other window" })
    vim.keymap.set("n", "<leader>lgd", "<cmd>lua vim.lsp.buf.definition()<CR>", { buffer = bufnr, desc = "Go to definition" })
    vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { buffer = bufnr, desc = "Hover" })
    vim.keymap.set("n", "<leader>lK", "<cmd>lua vim.lsp.buf.hover()<CR>", { buffer = bufnr, desc = "Hover" })
    vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { buffer = bufnr, desc = "Go to implementation" })
    vim.keymap.set("n", "<leader>lgi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { buffer = bufnr, desc = "Go to implementation" })
    vim.keymap.set("n", "<leader>lh", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { buffer = bufnr, desc = "Signature help" })
    vim.keymap.set("n", "<leader>lwa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", { buffer = bufnr, desc = "Add workspace folder" })
    vim.keymap.set("n", "<leader>lwr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", { buffer = bufnr, desc = "Remove workspace folder" })
    vim.keymap.set("n", "<leader>lwp", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", { buffer = bufnr, desc = "List workspace folder" })
    vim.keymap.set("n", "<leader>lD", "<cmd>lua vim.lsp.buf.type_definition()<CR>", { buffer = bufnr, desc = "Type definition" })
    vim.keymap.set("n", "<leader>lrn", "<cmd>lua vim.lsp.buf.rename()<CR>", { buffer = bufnr, desc = "Rename" })
    vim.keymap.set("n", "<leader>lca", "<cmd>lua vim.lsp.buf.code_action()<CR>", { buffer = bufnr, desc = "Code action" })
    vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { buffer = bufnr, desc = "Go to references" })
    vim.keymap.set("n", "<leader>lgr", "<cmd>lua vim.lsp.buf.references()<CR>", { buffer = bufnr, desc = "Go to references" })
    vim.keymap.set("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format()<CR>", { buffer = bufnr, desc = "Formatting" })

    vim.api.nvim_create_autocmd("CursorHold", {
        callback = function()
            vim.diagnostic.open_float({ border = "rounded" })
        end,
        group = diagnostic_augroup,
        desc = "Float window diagnostics upon cursor hold",
        buffer = bufnr,
    })

    local aerial_status_ok, aerial = pcall(require, "aerial")
    if aerial_status_ok then
        aerial.on_attach(client, bufnr)
    end
end

return M

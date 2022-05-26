local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
	return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
	return
end

require("luasnip/loaders/from_vscode").lazy_load()
require("luasnip.loaders.from_lua").lazy_load()

require("plugins.lsp.cmp.highlights")
local kind_icons = require("plugins.lsp.cmp.settings").kind_icons
local mappings = require("plugins.lsp.cmp.settings").mappings
local sources = require("plugins.lsp.cmp.settings").sources

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	mapping = mappings,
	formatting = {
		format = function(entry, vim_item)
			vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)
            vim_item.menu = ({
                nvim_lsp = "[LSP]",
                nvim_lua = "[Lua]",
                luasnip = "[Snip]",
                buffer = "[Buf]",
                path = "[Path]",
                latex_symbols = "[TeX]",
                spell = "[Spell]",
                tags = "[Tags]",
                emoji = "[Emoji]",
                orgmode = "[Org]",
                omni = "[Omni]",
            })[entry.source.name]
			return vim_item
		end,
	},
	sources = sources,
	window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
	},
	completion = { completeopt = "menu,menuone,noinsert" },
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won"t work anymore).
cmp.setup.cmdline("/", {
    mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer", keyword_length = 2 },
	},
})
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "path", keyword_length = 2 },
		{ name = "cmdline", keyword_length = 2 },
	},
})

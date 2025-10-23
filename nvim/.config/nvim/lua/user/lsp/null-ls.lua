local null_ls_status_ok, null_ls = pcall(require, "none-ls")
if not null_ls_status_ok then
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

local gitsigns = null_ls.builtins.code_actions.gitsigns.with({
    config = {
        filter_actions = function(title)
            return title:lower():match("blame") == nil -- filter out blame actions
        end,
    },
})

null_ls.setup({
	debug = true,
	sources = {
    require("none-ls.diagnostics.eslint_d"),
		formatting.black.with({ extra_args = { "--fast" } }),
    formatting.prettierd,
		diagnostics.codespell,
		diagnostics.clangd,
    gitsigns,
	},
})

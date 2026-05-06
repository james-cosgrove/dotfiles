local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

-- Load none-ls-extras for eslint_d
local eslint_diagnostics = require("none-ls.diagnostics.eslint_d")
local eslint_formatting = require("none-ls.formatting.eslint_d")

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

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
    formatting.black.with({ extra_args = { "--fast" } }),
    formatting.prettier.with({
      prefer_local = "node_modules/.bin",
    }),
    diagnostics.codespell,
    eslint_diagnostics,
    gitsigns,
  },
})

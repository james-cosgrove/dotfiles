local status_ok, lsp_config = pcall(require, "lspconfig")
if not status_ok then
  return
end

local clangd_settings = require("user.lsp.settings.clangd")
local lua_ls_settings = require("user.lsp.settings.lua_ls")
local jsonls_settings = require("user.lsp.settings.jsonls")
local pyright_settings = require("user.lsp.settings.pyright")
local sourcekit_settings = require("user.lsp.settings.sourcekit")

lsp_config.clangd.setup(clangd_settings)
lsp_config.lua_ls.setup(lua_ls_settings)
lsp_config.jsonls.setup(jsonls_settings)
lsp_config.pyright.setup(pyright_settings)
lsp_config.sourcekit.setup(sourcekit_settings)

require("lsp-colors").setup({
  Error = "#db4b4b",
  Warning = "#e0af68",
  Information = "#0db9d7",
  Hint = "#10B981",
  Ok = '#10B981'
})
require("user.lsp.mason")
require("user.lsp.null-ls")
require("user.lsp.trouble")
require("user.lsp.handlers").setup()

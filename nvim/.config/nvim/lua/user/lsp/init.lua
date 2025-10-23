local lsp_config = vim.lsp.config

local ts_ls_settings = require("user.lsp.settings.ts_ls")
local clangd_settings = require("user.lsp.settings.clangd")
local lua_ls_settings = require("user.lsp.settings.lua_ls")
local jsonls_settings = require("user.lsp.settings.jsonls")
local pyright_settings = require("user.lsp.settings.pyright")
local sourcekit_settings = require("user.lsp.settings.sourcekit")
local kotlin_language_server_settings = require("user.lsp.settings.kotlin_language_server")

lsp_config("ts_ls", ts_ls_settings)
lsp_config("clangd", clangd_settings)
lsp_config("lua_ls", lua_ls_settings)
lsp_config("jsonls", jsonls_settings)
lsp_config("pyright", pyright_settings)
lsp_config("sourcekit", sourcekit_settings)
lsp_config("kotlin_language_server", kotlin_language_server_settings)

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

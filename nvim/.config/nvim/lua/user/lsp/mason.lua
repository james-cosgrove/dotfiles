local status, mason_lspconfig = pcall(require, "mason-lspconfig")
local mason_status, mason = pcall(require, "mason")

if not status or not mason_status then
    return
end

mason.setup({
  ui = {
    border = "none",
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    },
  },
  log_level = vim.log.levels.INFO,
  max_concurrent_installers = 4,
  automatic_installation = true,
  automatic_enable = true,
})

mason_lspconfig.setup({
  automatic_installation = true,
  ensure_installed = {
    "ts_ls",
    "lua_ls",
    "clangd",
    "jdtls",
    "typos_lsp",
    "eslint",
    "kotlin_language_server",
    "jsonls",
  },
})

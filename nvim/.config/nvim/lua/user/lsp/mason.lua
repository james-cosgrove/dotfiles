local settings = {
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
}

require("mason").setup(settings)
require("mason-lspconfig").setup()

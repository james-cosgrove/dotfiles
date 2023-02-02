local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require("lsp-colors").setup({
  Error = "#db4b4b",
  Warning = "#e0af68",
  Information = "#0db9d7",
  Hint = "#10B981",
  Ok = '#10B981'
})
require "user.lsp.mason"
require("user.lsp.handlers").setup()
require "user.lsp.null-ls"

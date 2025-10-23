local status_ok, hover = pcall(require, "hover")
if not status_ok then
	return
end

hover.setup {
  init = function()
    -- Require providers
    require("hover.providers.lsp")
    require("hover.providers.diagnostic")
    -- require('hover.providers.gh')
    -- require('hover.providers.gh_user')
    -- require('hover.providers.jira')
    require('hover.providers.man')
    -- require('hover.providers.dictionary')
  end,
  preview_opts = {
    border = 'double',
  },
  -- Whether the contents of a currently open hover window should be moved
  -- to a :h preview-window when pressing the hover keymap.
  preview_window = false,
  title = true
}

-- Setup keymaps
vim.keymap.set("n", "K",function()  require("hover").open() end, {desc = "hover.nvim"})
vim.keymap.set("n", "gK", function() require("hover").enter() end, {desc = "hover.nvim (enter)"})
vim.keymap.set("n", "Hb", function() require("hover").switch("previous") end, {desc = "hover.nvim (previous source)"})
vim.keymap.set("n", "Hn", function() require("hover").switch("next") end, {desc = "hover.nvim (next source)"})

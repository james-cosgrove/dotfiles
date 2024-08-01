local trouble_status_ok, trouble = pcall(require, "trouble.nvim")
if not trouble_status_ok then
	return
end

trouble.setup({
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
})

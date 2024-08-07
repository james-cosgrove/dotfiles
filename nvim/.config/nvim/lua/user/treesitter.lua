local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({
	ensure_installed = {
		"vim",
		"bash",
		"javascript",
		"json",
		"lua",
		"python",
		"typescript",
		"tsx",
		"css",
		"rust",
		"java",
		"yaml",
		"markdown",
		"markdown_inline",
    "kotlin",
    "swift",
    "objc",
    "java"
	},
	highlight = {
		enable = true,
	},
	autopairs = {
		enable = true,
	},
	indent = { enable = true },
	context_commentstring = { enable = true },
})

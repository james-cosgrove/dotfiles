local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

local hide_in_width = function()
	return vim.fn.winwidth(0) > 120
end

-- local diagnostics = {
-- 	"diagnostics",
-- 	sources = { "nvim_diagnostic" },
-- 	sections = { "error", "warn" },
-- 	symbols = { error = " ", warn = " " },
-- 	colored = false,
-- 	update_in_insert = false,
-- 	always_visible = true,
-- }

local diff = {
	"diff",
	symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
	cond = hide_in_width,
}

local branch = {
	"branch",
	icons_enabled = true,
	icon = "",
	cond = hide_in_width,
}

local filetype = {
  "filetype",
  icons_enabled = false,
  icon = nil,
}

local filename = {
	"filename",
	path = 1,
	shorting_target = 100,
}

local function location()
	local file_length = vim.fn.line("$")
	local line = vim.fn.line(".")
	local col = vim.fn.virtcol(".")
	return string.format("%3d/%-2d: %-2d", line, file_length, col)
end

local tabs = {
	"tabs",
	mode = 1,
}

-- local spaces = function()
-- 	return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
-- end

lualine.setup({
	options = {
		theme = "auto",
		component_separators = { left = "", right = "" },
		disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { diff, branch },
		lualine_c = { filename },
		lualine_x = { filetype },
		lualine_y = { "encoding" },
		lualine_z = { "progress", location },
	},
	tabline = {
		lualine_a = { tabs },
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
	extensions = {},
})

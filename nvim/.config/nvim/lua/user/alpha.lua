local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end

local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {
	[[                 __                ]],
	[[  ___     ___   /\_\    ___ ___    ]],
	[[ / _ `\ /\ \/\ \\/\ \  / __` __`\  ]],
	[[/\ \/\ \\ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
	[[\ \_\ \_\\ \___/  \ \_\ \_\ \_\ \_\]],
	[[ \/_/\/_/ \/__/    \/_/\/_/\/_/\/_/]],
}
dashboard.section.buttons.val = {
	dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
	dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("p", "  Find project", ":Telescope projects <CR>"),
	dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
	dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
	dashboard.button("c", "  Configuration", ":e $MYVIMRC <CR>"),
	dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
}

-- local function footerText1()
--   local handle = io.popen("curl -o- https://insult.mattbas.org/api/en/insult.txt?who=You&plural=on")
--   if handle then
--     local result = handle:read("*a")
--     handle:close()
--     return result
--   end
-- end

-- local function footerText2()
--   local handle = io.popen("curl -o- https://evilinsult.com/generate_insult.php?lang=en&type=json")
--   if handle then
--     local result = handle:read("*a")
--     handle:close()
--     return result
--   end
-- end

-- dashboard.section.footer.val = footerText1() .. '\n' .. footerText2()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
-- vim.cmd([[autocmd User AlphaReady echo 'ready']])
alpha.setup(dashboard.opts)

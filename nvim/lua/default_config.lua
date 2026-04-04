-- More config options
vim.g.airline_powerline_fonts = 1
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	pattern = { "*" },
	command = [[%s/\s\+$//e]],
})

vim.opt.wrap = true

-- Keybinds

-- default colorscheme configs for some configs

local cyberdream_setup = function()
	require("cyberdream").setup({
		transparent = true,
		colors = {
			bg = "#0a1c3f",
		},
	})
end

-- colorscheme
require("colorscheme_helper").set_colorscheme("cyberdream", cyberdream_setup)

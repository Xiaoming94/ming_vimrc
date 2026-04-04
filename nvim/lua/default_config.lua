-- Default Configuration file for my neovim setup
-- AUTHOR: Xiaoming

-- Very importantly, a configuration file for my setup have to return the following:
-- {
--      use_meson : boolean          <- This one is setting if meson is supposed to be used.
--      provided_lsp : boolean   <- This one sets whether to use the configurations included for jdtls,
--                                      rust-analyzer and clangd
--      post_settings : function     <- A function that is executed at the end of the settings.
--                                      Any additional configs should go into a function that is
--                                      used here
-- }

-- More config options
local postsetup = function()
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
end

-- return settings
return {
	use_meson = true,
	provided_lsp = true,
	post_settings = postsetup,
}

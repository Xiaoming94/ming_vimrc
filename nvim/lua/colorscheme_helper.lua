local CH = {}

function CH.set_colorscheme(colorscheme, setup_fn)
	if setup_fn then
		setup_fn()
	end
	vim.cmd.colorscheme(colorscheme)
end

return CH

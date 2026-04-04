local CH = {}

function CH.set_colorscheme(colorscheme)
	vim.cmd.colorscheme(colorscheme)
end

return CH

require("scrollview").setup({
	exclude_filetype = { "NvimTree" },
	current_only = true,
	base = "right",
	column = 1,
	signs_on_startup = { "all" },
	diagnostic_severities = { vim.diagnostic.severity.ERROR },
})

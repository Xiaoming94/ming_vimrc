require("mason").setup()

require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"pyright",
		"rubocop",
		"texlab",
		"ts_ls",
	},
})

local registry = require("mason-registry")

registry.refresh(function()
	for _, tool in ipairs({ "stylua", "vale" }) do
		local pkg = registry.get_package(tool)
		if not pkg:is_installed() then
			pkg:install()
		end
	end
end)

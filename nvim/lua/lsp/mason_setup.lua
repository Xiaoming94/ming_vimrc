require("mason").setup()

require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"pyright",
		"jdtls",
		"kotlin_lsp",
		"rubocop",
		"texlab",
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

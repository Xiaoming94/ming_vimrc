local vim = vim

local user_config_defined, settings = pcall(require, "user_config")
if not user_config_defined then
	settings = require("default_config")
end

require("vimplug_init").execute(settings.use_meson)

-- Source vanilla vimrc
vim.cmd("source ~/.vimrc.d/common.vim")
-- LSP stuff

if settings.use_meson or (settings.use_meson == nil) then
	require("lsp.mason_setup")
end

require("lsp.common_functions")
require("lsp.formatter")
require("lsp.lint_conf")

if settings.provided_lsp or (settings.provided_lsp == nil) then
	require("lsp.clangd_conf")
	require("lsp.rust_analyzer_conf")
	require("lsp.javalsp_conf")
end

-- import plugin configurations
require("init_nvim_tree")
require("colorizer_init")
require("auto_session_init")
require("minimap_init")
require("telescope_keys")
require("nvim_cmp_init")
require("markdown_render_init")
require("gitsigns_init")
require("blame_lines")
require("scrollview_nvim")
require("load_vimtex")

if settings.post_settings then
	settings.post_settings()
else
	require("default_config").post_settings()
end

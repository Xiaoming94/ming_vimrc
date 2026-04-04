-- Source vanilla vimrc
local vim = vim
local settings = require("default_config")
require("vimplug_init").execute(settings.use_meson)

vim.cmd("source ~/.vimrc.d/common.vim")
-- LSP stuff

if settings.use_meson then
	require("lsp.mason_setup")
end

require("lsp.common_functions")
require("lsp.formatter")
require("lsp.lint_conf")

if settings.provided_lsp then
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
require("treesitter_init")
require("blame_lines")
require("scrollview_nvim")
require("load_vimtex")

if settings.post_settings then
	settings.post_settings()
end

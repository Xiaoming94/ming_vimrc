-- Source vanilla vimrc
local vim = vim
require("vimplug_init").execute(true)

vim.cmd("source ~/.vimrc.d/common.vim")
-- LSP stuff
require("lsp.mason_setup")
require("lsp.common_functions")
require("lsp.clangd_conf")
require("lsp.rust_analyzer_conf")
require("lsp.formatter")
require("lsp.lint_conf")
require("lsp.javalsp_conf")

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

local custom_lua = vim.fn.stdpath("config") .. "/user_config.lua"
if vim.uv.fs_stat(custom_lua) then
	vim.cmd("luafile " .. custom_lua)
else
	require("default_config")
end

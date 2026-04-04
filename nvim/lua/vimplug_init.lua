local VPInit = {}

function VPInit.execute(use_mason)
	local config_dir = vim.fn.stdpath("config")

	local nvimplugs_file = config_dir .. "/nvimplugs.vimrc"
	-- Initiating vimplugs
	vim.cmd([[
    call plug#begin()
        source ~/.vimrc.d/common.plugs.vimrc
    ]])

	-- Sourcing neovim plugins:
	vim.cmd("source " .. nvimplugs_file)

	if use_mason then
		vim.cmd([[
            " Mason
            Plug 'mason-org/mason.nvim'
            Plug 'mason-org/mason-lspconfig.nvim'
        ]])
	end

	local local_plugs = config_dir .. "/local.nvimplugs.vimrc"

	-- Sourcing local plugins
	if vim.fn.filereadable(local_plugs) == 1 then
		vim.cmd("source " .. local_plugs)
	end

	vim.cmd([[call plug#end()]])
end

return VPInit

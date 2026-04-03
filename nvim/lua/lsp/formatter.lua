require("conform").setup({
    formatter_by_ft = {
        lua = { "stylua" },
        rust = { "rustfmt", lsp_format = "fallback" },
    },

    format_on_save = {},
})

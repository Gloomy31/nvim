return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "saghen/blink.cmp",
            "j-hui/fidget.nvim",
            "mason-org/mason.nvim",
            "mason-org/mason-lspconfig.nvim",
        },

        opts = {
            vim.lsp.enable('lua_ls')
        },

        config = function()
            require("fidget").setup()
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    -- "lua_ls",
                    "clangd",
                    "html",
                    "cssls",
                    "ts_ls",
                    "jsonls",
                    "yamlls",
                    "pylsp",
                    "rust_analyzer",
                    "cmake",
                    "bashls",
                },
            })
        end,
    },

    {
        'mfussenegger/nvim-jdtls',
        config = function()
            vim.lsp.enable('jdtls')
        end
    },
}

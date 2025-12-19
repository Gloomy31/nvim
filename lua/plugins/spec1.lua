return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },

    { 'mbbill/undotree' },

    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },

    { 'nvim-mini/mini.nvim', version = '*' },

    {
        'nvim-neo-tree/neo-tree.nvim',
        dependencies = {
            'MunifTanjim/nui.nvim',
            'nvim-lua/plenary.nvim',
            'nvim-tree/nvim-web-devicons',
            's1n7ax/nvim-window-picker'
        },
        opts = {
            filesystem = {
                hijack_netrw_behavior = "disabled",
            },
        },
    },

    {
        'brianhuster/live-preview.nvim',
        dependencies = {
            -- You can choose one of the following pickers
            'nvim-telescope/telescope.nvim',
            -- 'ibhagwan/fzf-lua',
            -- 'echasnovski/mini.pick',
            -- 'folke/snacks.nvim',
        },
    },

    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        ---@module "ibl"
        ---@type ibl.config
        opts = {},
    },

    { "ThePrimeagen/vim-be-good" },
}

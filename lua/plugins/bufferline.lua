return {
    'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons',
    keys = {
        { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle Pin" },
        { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete Non-Pinned Buffers" },
        { "<leader>bl", "<Cmd>BufferLineCloseRight<CR>", desc = "Delete Buffers to the Right" },
        { "<leader>bh", "<Cmd>BufferLineCloseLeft<CR>", desc = "Delete Buffers to the Left" },
        { "H", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
        { "L", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
        { "<leader>h", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer prev" },
        { "<leader>l", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer next" },
    },
}

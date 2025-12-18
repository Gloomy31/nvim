return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        preset = "helix",
        --- You can add any mappings here, or use `require('which-key').add()` later
        ---@type wk.Spec
        spec = {
            {
                mode = { "n", "x" },
                { "s", group = "surround" },
            },
        },
        -- show a warning when issues were detected with your mappings
        notify = true,
    },
    keys = {
        {
            "<leader>?",
            function()
                require("which-key").show({ global = false })
            end,
            desc = "Buffer Local Keymaps (which-key)",
        },
    },
}

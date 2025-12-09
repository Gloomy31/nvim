-- Colorscheme
vim.cmd[[colorscheme tokyonight-moon]]


-- Treesitter
require('nvim-treesitter.configs').setup {
    -- A list of parser names, or "all" (the listed parsers MUST always be installed)
    ensure_installed = { "javascript", "typescript", "c", "cpp", "c_sharp", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "html", "css" },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,

    -- List of parsers to ignore installing (or "all")
    --ignore_install = { "javascript" },

    ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
    -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

    highlight = {
        enable = true,

        -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
        -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
        -- the name of the parser)
        -- list of language that will be disabled
        --disable = { "c", "rust" },
        -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
        --[[disable = function(lang, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
                return true
            end
        end,]]--

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },
}

require('treesitter-context').setup{
    enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
    multiwindow = false, -- Enable multiwindow support.
    max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
    min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
    line_numbers = true,
    multiline_threshold = 20, -- Maximum number of lines to show for a single context
    trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
    mode = 'cursor',  -- Line used to calculate context. Choices: 'cursor', 'topline'
    -- Separator between context and content. Should be a single character string, like '-'.
    -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
    separator = nil,
    zindex = 20, -- The Z-index of the context window
    on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
}


-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Telescope git files' })
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)


-- Undotree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)


-- Lualine
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    always_show_tabline = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
      refresh_time = 16, -- ~60fps
      events = {
        'WinEnter',
        'BufEnter',
        'BufWritePost',
        'SessionLoadPost',
        'FileChangedShellPost',
        'VimResized',
        'Filetype',
        'CursorMoved',
        'CursorMovedI',
        'ModeChanged',
      },
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}


-- neo-tree
require("neo-tree").setup({
    event_handlers = {
        {
            event = "neo_tree_buffer_enter",
            handler = function(arg)
                vim.cmd [[
                setlocal nu rnu
                ]]
            end,
        }
    },
})
vim.keymap.set("n", "<F3>", ":Neotree toggle=true<CR>")


-- mini.nvim
    -- Text editing
-- require('mini.ai').setup()
-- require('mini.keymap').setup()
require('mini.operators').setup()
require('mini.pairs').setup()
require('mini.surround').setup()

    -- General workflow
require('mini.basics').setup()
require('mini.bracketed').setup()
require('mini.pick').setup()

    -- Apperance
require('mini.cursorword').setup()
require('mini.icons').setup()
require('mini.statusline').setup()

    -- Other
require('mini.doc').setup()


-- Indent Blanklines
require("ibl").setup {}


-- Bufferline
require("bufferline").setup{}


-- live-preview
require('livepreview.config').set({
    port = 5500,
    browser = 'default',
    dynamic_root = false,
    sync_scroll = true,
    picker = "telescope",
})
vim.keymap.set("n", "<F6>", ":LivePreview start<CR>")
vim.keymap.set("n", "<F7>", ":LivePreview close<CR>")


-- suda.vim
vim.cmd([[
    let g:suda_smart_edit = 1
]])

vim.keymap.set("n", "<leader>W", vim.cmd.SudaWrite)

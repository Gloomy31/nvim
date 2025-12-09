return {
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        -- or                              , branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' },

        config = function()
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Telescope find files' })
            vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Telescope git files' })
            vim.keymap.set('n', '<leader>ps', function()
                builtin.grep_string({ search = vim.fn.input("Grep > ") })
            end)

            -- set up image previewing
            local previewers = require("telescope.previewers")
            local image_cache = {}

            local function render_image(filepath, max_width, callback)
                local key = filepath .. "|w" .. max_width

                if image_cache[key] then
                    callback(image_cache[key])
                    return
                end

                vim.fn.jobstart({
                    "chafa",
                    "--size", tostring(max_width) .. "x", -- x lets chafa pick height automatically
                    filepath
                }, {
                    stdout_buffered = true,
                    on_stdout = function(_, data, _)
                        if not data then return end
                        local output = table.concat(data, "\r\n")
                        image_cache[key] = output
                        callback(output)
                    end
                })
            end

            local function image_preview(filepath, bufnr, opts)
                local ext = vim.fn.fnamemodify(filepath, ":e"):lower()
                local is_image = vim.tbl_contains({ "png", "jpg", "jpeg", "webp", "svg" }, ext)

                if is_image then
                    local term = vim.api.nvim_open_term(bufnr, {})

                    -- Schedule to wait until buffer is displayed
                    vim.schedule(function()
                        local winid = vim.fn.bufwinid(bufnr)
                        if winid == -1 then
                            -- fallback to default width if window not ready yet
                            winid = 0
                        end

                        local width = vim.api.nvim_win_get_width(winid) - 2
                        if width < 10 then width = 40 end -- sanity min width

                        render_image(filepath, width, function(output)
                            vim.api.nvim_chan_send(term, output)
                        end)
                    end)
                else
                    previewers.buffer_previewer_maker(filepath, bufnr, opts)
                end
            end


            require("telescope").setup({
                defaults = {
                    buffer_previewer_maker = image_preview,
                }
            })
        end,
    }
}

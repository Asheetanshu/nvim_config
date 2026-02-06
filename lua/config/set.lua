-- 1. Global diagnostic style
vim.diagnostic.config({
    virtual_text = true,          -- no inline « red squiggles »
    float = {
        border = 'rounded',          -- same border style you like for cmp
        max_width = 80,
        header = '',
        source = 'if_many',          -- show the LSP source if >1 servers
    },
    severity_sort = true,          -- most severe first
})


-- 2. Auto‑show diagnostics float immediately on cursor move
local diag_float_grp = vim.api.nvim_create_augroup('LspDiagFloat', { clear = true })
local diag_float_win = nil

vim.api.nvim_create_autocmd('CursorMoved', {
    group = diag_float_grp,
    callback = function()
        -- Close previous float if it exists
        if diag_float_win and vim.api.nvim_win_is_valid(diag_float_win) then
            vim.api.nvim_win_close(diag_float_win, true)
            diag_float_win = nil
        end

        -- Only open if the current line actually has diagnostics
        local cur_line = vim.api.nvim_win_get_cursor(0)[1] - 1
        if vim.tbl_isempty(vim.diagnostic.get(0, { lnum = cur_line })) then
            return
        end

        -- Open a fresh float and remember its window ID
        diag_float_win = vim.diagnostic.open_float({
            focusable = false,
            border = 'rounded',
            source = 'if_many',
            close_events = { 'CursorMoved', 'BufLeave', 'InsertEnter', 'FocusLost' },
        })
    end,
})


vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 20
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.wrap = true
vim.opt.signcolumn = 'yes'



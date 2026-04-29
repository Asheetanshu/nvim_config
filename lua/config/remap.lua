vim.g.mapleader = " ";
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>p", '"+p')
vim.keymap.set('n' , '<leader><leader>' , vim.cmd.Ex)
vim.keymap.set({'n' , 'i' , 'v'} , "<C-a>" , function()
    vim.cmd('stopinsert')
    vim.cmd('normal! ggVG$')
end, {noremap = true , silent = true}
)

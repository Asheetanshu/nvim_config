return {
    -- lsp-zero setup 

    {
        'VonHeikemen/lsp-zero.nvim',
        dependencies = {
            'neovim/nvim-lspconfig' ,
            'williamboman/mason.nvim' ,
            'williamboman/mason-lspconfig.nvim' ,
            'hrsh7th/nvim-cmp' ,
            'hrsh7th/cmp-nvim-lua' ,
            'hrsh7th/cmp-nvim-lsp' ,
            'hrsh7th/cmp-path' ,
            'hrsh7th/cmp-buffer' ,
            'saadparwaiz1/cmp_luasnip' ,
            'L3MON4D3/LuaSnip' ,
            'rafamadriz/friendly-snippets' ,
        },


        config = function()

            ----------------------
            -- lsp-zero keymaping
            ----------------------

            local lsp = require('lsp-zero')
            lsp.on_attach(function(_, bufnr)
                local opts = {buffer = bufnr, remap = false}
                local map = vim.keymap.set

                map("n", "gd", vim.lsp.buf.definition, opts)
                map("n", "K", vim.lsp.buf.hover, opts)
                map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
            end)

            ----------------------
            -- mason and lspconfig
            ----------------------

            require('mason').setup({})
            require('mason-lspconfig').setup({
                ensure_installed = { 'clangd', 'rust_analyzer' },
                handlers = {
                    function(server_name)
                        require('lspconfig')[server_name].setup({})
                    end,
                },
            })

            ----------------------
            -- nvim-cmp config
            ----------------------

            local cmp = require('cmp')
            local cmp_action = lsp.cmp_action()

            cmp.setup({
                window = {
                    completion = cmp.config.window.bordered({
                        border = "rounded", -- or use your own border chars
                        winhighlight = "Normal:CmpPmenu,FloatBorder:CmpBorder,CursorLine:PmenuSel,Search:None",
                    }),
                    documentation = cmp.config.window.bordered({
                        border = "rounded",
                        winhighlight = "Normal:CmpDoc,FloatBorder:CmpDocBorder",
                    }),
                },


                mapping = {
                    ['<CR>'] = cmp.mapping.confirm({select = true}),
                    ['<Tab>'] = cmp.mapping.select_next_item({behaviour = cmp.SelectBehavior.Insert}),
                    ['<S-Tab>'] = cmp.mapping.select_prev_item({behaviour = cmp.SelectBehavior.Insert}),
                    ['<C-Space>'] = cmp.mapping.complete(),
                },

                sources = {
                    { name = 'nvim_lsp'},
                    { name = 'luasnip'},
                    { name = 'buffer'},
                    { name = 'path'},
                },
            })
        end ,
    },
}

return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      require('mason').setup({})
      require('mason-lspconfig').setup({
        ensure_installed = { 'clangd', 'rust_analyzer' },
        handlers = {
          function(server_name)
            require('lspconfig')[server_name].setup({})
          end,
        },
      })

      vim.lsp.config("clangd", {
        cmd = {
          "D:/programming/c_files/clang_gcc/mingw64/bin/clangd.exe",
        },
      })
      vim.lsp.enable('clangd')
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(event)
          local opts = { buffer = event.buf }
          vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "<leader>gh", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, opts)
          vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, opts)
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        end,
      })
      local cmp = require('cmp')
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
    -- 3. CMP BORDER CONFIG
  },
}

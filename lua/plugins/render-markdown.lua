return {
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    opts = {
      heading = {
        width = 'inline',
      },
      latex = { enabled = true },
    },
    config = function(_, opts)
      -- Call the default setup function
      require('render-markdown').setup(opts)
      -- Force the background of all heading levels to be transparent (NONE)
      local headings = {
        "RenderMarkdownH1Bg", "RenderMarkdownH2Bg", "RenderMarkdownH3Bg",
        "RenderMarkdownH4Bg", "RenderMarkdownH5Bg", "RenderMarkdownH6Bg"
      }
      for _, hl in ipairs(headings) do
        vim.api.nvim_set_hl(0, hl, { bg = 'NONE' })
      end
    end,

  }
}

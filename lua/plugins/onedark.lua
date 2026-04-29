return {
  -- color_scheme onedark
  {
    'navarasu/onedark.nvim' ,
    priority = 1000,

    config = function()
      local onedark = require('onedark');
      onedark.setup{
        style = 'darker',
        transparent = true,
        term_colors = true,
        toggle_style_key = '<leader>cs', -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
        toggle_style_list = {'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' }, -- List of styles to toggle between
        diagnostics = {
          darker = true, -- darker colors for diagnostic
          undercurl = true,   -- use undercurl instead of underline for diagnostics
          background = true,    -- use background color for virtual text
        },
      };
      onedark.load();
    end,
  },
}

return {
    -- lualine 
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            local lualine = require("lualine")
            lualine.setup({
                options = {
                    theme = 'auto',
                    section_separators = { left = '', right = '' },
                    component_separators = { left = '', right = '' },
                },
                sections = {
                    lualine_a = { 'mode' },
                    lualine_b = { 'diagnostics' },
                    lualine_c = { 'filename' },
                    lualine_x = { 'encoding',
                    function()
                        local os = vim.loop.os_uname().sysname
                        local os_icon = ""
                        if os == "Linux" then 
                            os_icon = "🐧"
                        elseif os == "Windows_NT" then
                            os_icon = "🪟"
                        end
                        return os_icon
                    end,
                    'filetype' },
                    lualine_y = { 'progress' },
                    lualine_z = {
                        function()
                            return os.date("🕰️ %I:%M %p")  -- e.g.  07:45 PM
                        end
                    },
                }
            })
        end
    } , 
}

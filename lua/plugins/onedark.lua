return {
    -- color_scheme onedark
    { 
        'navarasu/onedark.nvim' , 

        config = function()
            local onedark = require('onedark');
            onedark.setup{
                style = 'darker',
                options = {
                    transparency = false
                },
            };
            onedark.load();
        end,
    },
}

return {

    -- autopairs (bracket auto closing )
    {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup({
                check_ts = true,
                map_cr = true,
            })
        end,
    },
}

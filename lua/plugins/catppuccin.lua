return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
        --require("catppuccin").setup() - If config property is set, .setup() is called automatically
        vim.cmd.colorscheme "catppuccin"
    end
}

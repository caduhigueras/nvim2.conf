vim.cmd.hi("Comment gui=none")
return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				color_overrides = {
					mocha = {
						-- lavender = "#f6f931"
						-- blue = "#eeff00",
					},
				},
			})

			-- require("catppuccin").setup() - If config property is set, .setup() is called automatically
			vim.cmd.colorscheme("catppuccin-mocha")
			local function_and_method_color = "#ffcf7a"
			local custom_property_color = "#bac2de"
			-- For functions and Method
			vim.api.nvim_set_hl(0, "Function", { fg = function_and_method_color })
			vim.api.nvim_set_hl(0, "Method", { fg = function_and_method_color })
			-- HTML and JSX properties
			vim.api.nvim_set_hl(0, "htmlArg", { fg = custom_property_color })
			vim.api.nvim_set_hl(0, "htmlTagN", { fg = custom_property_color })
			vim.api.nvim_set_hl(0, "jsxTagName", { fg = custom_property_color })

			-- For Treesitter
			vim.api.nvim_set_hl(0, "@property", { fg = custom_property_color })
			vim.api.nvim_set_hl(0, "@tag.attribute", { fg = custom_property_color })
		end,
	},
	{
		"xiantang/darcula-dark.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			-- vim.cmd.colorscheme("darcula-dark")
			-- vim.cmd.hi("Comment gui=none")
		end,
	},
	{
		"folke/tokyonight.nvim",
		priority = 1000, -- Make sure to load this before all the other start plugins.
		init = function()
			-- Load the colorscheme here.
			-- Like many other themes, this one has different styles, and you could load
			-- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
			-- vim.cmd.colorscheme("tokyonight-storm")

			-- You can configure highlights by doing something like:
			-- vim.cmd.hi("Comment gui=none")
		end,
	},
	{
		"doums/darcula",
		priority = 1000,
		init = function()
			-- vim.cmd.colorscheme("darcula")

			-- You can configure highlights by doing something like:
			-- vim.cmd.hi("Comment gui=none")
		end,
	},
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		config = function()
			-- vim.cmd.hi("Comment gui=none")
			-- vim.cmd.colorscheme("gruvbox")
		end,
	},
	{
		"rebelot/kanagawa.nvim",
		priority = 1000,
		config = function()
			-- vim.cmd.hi("Comment gui=none")
			-- vim.cmd.colorscheme("gruvbox")
		end,
	},
}

return {
	-- Basic commenting
	{
		"numToStr/Comment.nvim",
		opts = {},
	},

	-- Better context-aware comments (JSX, TS, Svelte, Vue, etc.)
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		opts = {
			enable_autocmd = false,
		},
	},

	-- Docblock generation (Neogen)
	{
		"danymat/neogen",
		dependencies = "nvim-treesitter/nvim-treesitter",
		config = function()
			require("neogen").setup({ enabled = true })
		end,
		keys = {
			{ "<leader>dg", ":Neogen<CR>", desc = "Generate docblock" },
		},
	},
}

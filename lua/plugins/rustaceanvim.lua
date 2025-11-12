-- ~/.config/nvim/lua/plugins/rustaceanvim.lua
return {
	"mrcjkb/rustaceanvim",
	version = "^5", -- keep within major version
	ft = { "rust" },
	dependencies = {
		"neovim/nvim-lspconfig",
		"williamboman/mason.nvim",
		"mfussenegger/nvim-dap",
		"jay-babu/mason-nvim-dap.nvim",
	},
	config = function()
		-- Optional: ensure codelldb via mason-nvim-dap
		require("mason-nvim-dap").setup({
			ensure_installed = { "codelldb" },
			automatic_installation = true,
		})

		-- Simple setup; rustaceanvim auto-discovers rust-analyzer and codelldb from Mason
		vim.g.rustaceanvim = {
			server = {
				default_settings = {
					["rust-analyzer"] = {
						checkOnSave = { command = "clippy" },
					},
				},
			},
			dap = {
				-- usually autodetected; leave empty unless you want to override paths
			},
		}
	end,
}

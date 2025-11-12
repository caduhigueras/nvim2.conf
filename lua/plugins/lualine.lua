return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },

	config = function()
		-- Adding custom alias to bottom bar file names
		local function aliased_path()
			local full_path = vim.fn.expand("%:p") --abosulte path of current file

			local aliases = {
				["/var/www/m2.one/"] = "@m2.one",
				-- [vim.fn.expand("~") .. "/app/hubspot/private_apps/prod"] = "@hs_prod",
				[vim.fn.expand("~") .. "/app/hubspot/private_apps/prod/hs-ui-extensions/deal_matrix/src"] = "@deal_matrix_prod",
				[vim.fn.expand("~") .. "/app/hubspot/private_apps/preprod/hs-ui-extensions/deal_matrix/src"] = "@deal_matrix_preprod",
				-- [vim.fn.expand("~") .. "/app/hubspot/private_apps/preprod"] = "@hs_preprod",
				[vim.fn.expand("~") .. "/app/hubspot/new_quote"] = "@hs_quotes_preprod",
				[vim.fn.expand("~") .. "/app/hubspot/new_quote_prod"] = "@hs_quotes_prod",
			}

			-- Replace matching prefixes
			for dir, alias in pairs(aliases) do
				if full_path:find(dir, 1, true) == 1 then
					return alias .. full_path:sub(#dir + 1)
				end
			end

			-- Default fallback: use ~ for home
			return full_path:gsub(vim.fn.expand("~"), "~")
		end

		require("lualine").setup({
			options = {
				theme = "tokyonight",
			},
			sections = {
				lualine_c = {
					{ aliased_path },

					-- Default way of settings for file name in the bottom:
					-- {
					-- 	"filename",
					-- 	path = 3, -- Options: 0 = just filename, 1 = relative path, 2 = absolute path, 3 = absolute path with ~ for home
					-- },
				},
			},
		})
	end,
}

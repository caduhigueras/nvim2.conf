local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("vim-options")
require("lazy").setup("plugins")

vim.api.nvim_create_user_command("ShowMochaPalette", function()
	local mocha = require("catppuccin.palettes").get_palette("mocha")
	vim.cmd("new") -- Open a new split
	vim.cmd("setlocal buftype=nofile") -- Set buffer type to nofile
	vim.cmd("setlocal bufhidden=wipe") -- Automatically wipe buffer when abandoned
	vim.cmd("setlocal noswapfile") -- No swap file for this buffer
	local output = vim.inspect(mocha)
	vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(output, "\n"))
end, {})

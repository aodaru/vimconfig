-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- local function augroup(name)
-- 	return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
-- end

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
	pattern = "*",
	command = "set nopaste",
})

-- Disable the concealing in some file formats
-- The default conceallevel is 3 in LazyVim
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "json", "jsonc" },
	callback = function()
		vim.opt.conceallevel = 0
	end,
})

-- Set color to dashboard
vim.cmd([[hi DashboardHeader guifg=#d79921]])
vim.cmd([[hi DashboardDesc guifg=#ebdbb2]])
vim.cmd([[hi DashboardKey guifg=#458588]])
vim.cmd([[hi DashboardIcon guifg=#8ec07c]])
vim.cmd([[hi DashboardShorCut guifg=#d79921]])
vim.cmd([[hi DashboardFooter guifg=#cc241d]])

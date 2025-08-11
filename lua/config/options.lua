-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
-- Setup clipboard X11 with xclip provider
vim.opt.clipboard = "unnamedplus"

vim.g.maplocalleader = "\\"

vim.opt.title = true
vim.opt.autoindent = true
vim.opt.backup = false
vim.opt.expandtab = true
vim.opt.scrolloff = 10
vim.opt.shell = "zsh"
-- vim.opt.inccommand = "split" default nosplit
vim.opt.smarttab = true
vim.opt.breakindent = true
-- vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
-- vim.opt.wrap = false -- No Wrap lines
vim.opt.backspace = { "start", "eol", "indent" }
vim.opt.path:append({ "**" }) -- Finding files - Search down into subfolders
vim.opt.wildignore:append({ "*/node_modules/*" })
vim.opt.splitbelow = true -- Put new windows below current
vim.opt.splitright = true -- Put new windows right of current
vim.opt.splitkeep = "cursor"
-- vim.opt.mouse = ""

vim.g.lazyvim_php_lsp = "intelephense"

-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymaps = vim.keymap
local opts = { noremap = true, silent = true }

-- Increment/decrement
keymaps.set("n", "+", "<C-a>")
keymaps.set("n", "-", "<C-x>")

-- Delete a word backwards
keymaps.set("n", "dw", "vb_d")

-- Select all
keymaps.set("n", "<C-a>", "gg<S-v>G")

-- Jumplist
keymaps.set("n", "<C-m>", "<C-i>", opts)

-- New tab
keymaps.set("n", "te", ":tabedit<Return>", opts)
keymaps.set("n", "<tab>", ":tabnext<Return>", opts)
keymaps.set("n", "<s-tab>", ":tabprev<Return>", opts)

-- Split window
keymaps.set("n", "ss", ":split<Return>", opts)
keymaps.set("n", "sv", ":vsplit<Return>", opts)
-- Move between window
keymaps.set("n", "sh", "<C-w>h")
keymaps.set("n", "sk", "<C-w>k")
keymaps.set("n", "sj", "<C-w>j")
keymaps.set("n", "sl", "<C-w>l")

-- Resize window
keymaps.set("n", "<C-w><left>", "<C-w><")
keymaps.set("n", "<C-w><right>", "<C-w>>")
keymaps.set("n", "<C-w><up>", "<C-w>+")
keymaps.set("n", "<C-w><down>", "<C-w>-")

-- Diagnostic
keymaps.set("n", "<C-j>", function()
	vim.diagnostic.jump({ 1 })
end, opts)

-- FzF-lua
-- keymaps.set("n", "sf", require("fzf-lua").files, { desc = "Fzf Files" })
-- keymaps.set("n", ";r", require("fzf-lua").live_grep, { desc = "Fzf Grep" })
-- keymaps.set("n", ";m", require("fzf-lua").marks, { desc = "Fzf Marks" })
-- keymaps.set("n", ";t", require("fzf-lua").tags, { desc = "Fzf Tags" })
-- keymaps.set("n", ";;", require("fzf-lua").resume, { desc = "Fzf Resume" })
-- keymaps.set("n", "\\\\", require("fzf-lua").buffers, { desc = "Fzf Recent" })
-- keymaps.set("n", ";q", require("fzf-lua").buffers, { desc = "Fzf QuickFix" })
keymaps.set(
	"n",
	"<leader>s",
	":lua require'fzf-lua'.spell_suggest({ winopts = {relative='cursor',row=1.01,col=0, height=0.2, width=0.2}}) <cr>",
	{ desc = "Spell Suggest" }
)
-- keymaps.set(
-- 	"n",
-- 	"<leader>ca",
-- 	":lua require'fzf-lua'.lsp_code_actions({ winopts = {relative='cursor',row=1.01,col=0, height=0.2, width=0.4}}) <cr>",
-- 	{ desc = "Code Action" }
-- )

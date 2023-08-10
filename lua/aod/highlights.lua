vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.winblend = 0
vim.opt.wildoptions = "pum"
vim.opt.pumblend = 5
vim.opt.background = "dark"

-- highlight yanked text for 200ms using the "Visual" highlight group
vim.cmd([[
  augroup highlight_yank
  autocmd!
  au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=100})
  augroup END
]])

local material = require("material")
local colors = require("material.colors")

material.setup({
	custom_highlights = {
		LineNr = { bg = "#FF0000" },
		CursorLine = { fg = colors.editor.constrast, underline = true },

		-- This is a list of possible values
		YourHighlightGroup = {
			fg = "#SOME_COLOR", -- foreground color
			bg = "#SOME_COLOR", -- background color
			sp = "#SOME_COLOR", -- special color (for colored underlines, undercurls...)
			bold = false, -- make group bold
			italic = false, -- make group italic
			underline = false, -- make group underlined
			undercurl = false, -- make group undercurled
			underdot = false, -- make group underdotted
			underdash = false, -- make group underslashed
			striketrough = false, -- make group striked trough
			reverse = false, -- reverse the fg and bg colors
			link = "SomeOtherGroup", -- link to some other highlight group
		},
	},

	-- Custom colors must be a function that takes in the default colors table as
	-- a paramter, and then modifies them.
	-- To see the available colors, see lua/material/colors/init.lua
	custom_colors = function(colors)
		colors.editor.bg = "#SOME_COLOR"
		colors.main.purple = "#SOME_COLOR"
		colors.lsp.error = "#SOME_COLOR"
	end,
})

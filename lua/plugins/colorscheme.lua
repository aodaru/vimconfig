return {
	-- add gruvbox
	{ "ellisonleao/gruvbox.nvim" },

	-- Configure LazyVim to load gruvbox
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "gruvbox",
			transparent_mode = true,
			transparent = true,
			undercurl = true,
			underline = true,
			bold = true,
			italic = {
				strings = true,
				emphasis = true,
				sidebarscomments = true,
				operators = false,
				folds = true,
			},
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
			strikethrough = true,
			overrides = {
				SignColumn = {
					-- underline = true,
					undercurl = true,
					underdouble = true,
					underdotted = true,
					underdashed = true,
					strikethrough = true,
				},
			},
		},
	},
}

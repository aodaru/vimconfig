return {
	-- add gruvbox
	{ "ellisonleao/gruvbox.nvim" },

	-- Configure LazyVim to load gruvbox
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "gruvbox",
			transparent_mode = true,
			undercurl = true,
			underline = true,
			bold = true,
			italic = {
				strings = true,
				emphasis = true,
				comments = true,
				operators = false,
				folds = true,
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

-- return {
-- 	-- add gruvbox
-- 	{
-- 		"ellisonleao/gruvbox.nvim",
-- 		priority = 1000,
-- 		config = true,
-- 		opts = {
-- 			require("gruvbox").setup({
-- 				transparent_mode = true,
-- 				undercurl = true,
-- 				underline = true,
-- 				bold = true,
-- 				italic = {
-- 					strings = true,
-- 					emphasis = true,
-- 					comments = true,
-- 					operators = false,
-- 					folds = true,
-- 				},
-- 				strikethrough = true,
-- 				overrides = {
-- 					-- DashboardHeader = { bg = "#1d2021", fg = "#574893" },
-- 					SignColumn = {
-- 						-- underline = true,
-- 						undercurl = true,
-- 						underdouble = true,
-- 						underdotted = true,
-- 						underdashed = true,
-- 						strikethrough = true,
-- 						-- DashboardDesc = { guibg = "#1d2021", guifg = "#282" },
-- 						-- DashboardKey = { guibg = "#1d2021", guifg = "#282" },
-- 						-- DashboardIcon = { guibg = "#1d2021", guifg = "#282" },
-- 						-- DashboardShortCut = { guibg = "#1d2021", guifg = "#282" },
-- 						-- DashboardFooter = { guibg = "#1d2021", guifg = "#282" },
-- 					},
-- 				},
-- 			}),
-- 			vim.cmd("colorscheme gruvbox"),
-- 		},
-- 	},
--
-- 	-- Configure LazyVim to load gruvbox
-- 	-- {
-- 	-- 	"LazyVim/LazyVim",
-- 	-- 	opts = {
-- 	-- 		colorscheme = "gruvbox",
-- 	-- 	},
-- 	-- },
-- }

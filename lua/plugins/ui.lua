return {
	-- messages, cmdline and the popupmenu
	{
		"folke/noice.nvim",
		opts = function(_, opts)
			table.insert(opts.routes, {
				filter = {
					event = "notify",
					find = "No information available",
				},
				opts = { skip = true },
			})
			local focused = true
			vim.api.nvim_create_autocmd("FocusGained", {
				callback = function()
					focused = true
				end,
			})
			vim.api.nvim_create_autocmd("FocusLost", {
				callback = function()
					focused = false
				end,
			})
			table.insert(opts.routes, 1, {
				filter = {
					cond = function()
						return not focused
					end,
				},
				view = "notify_send",
				opts = { stop = false },
			})

			opts.commands = {
				all = {
					-- options for the message history that you get with `:Noice`
					view = "split",
					opts = { enter = true, format = "details" },
					filter = {},
				},
			}

			opts.presets.lsp_doc_border = true
		end,
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
	},

	{
		"tribela/transparent.nvim",
		event = "VimEnter",
		config = true,
	},

	{
		"rcarriga/nvim-notify",
		opts = {
			timeout = 5000,
		},
	},

	-- animations
	{
		"echasnovski/mini.animate",
		event = "VeryLazy",
		opts = function(_, opts)
			opts.scroll = {
				enable = false,
			}
		end,
	},

	-- buffer line
	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		keys = {
			{ "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
			{ "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
		},
		opts = {
			options = {
				mode = "tabs",
				separator_style = "slant",
				show_buffer_close_icons = false,
				show_close_icon = false,
			},
		},
	},

	-- battery usage
	{
		"justinhj/battery.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons", "nvim-lua/plenary.nvim" },
		config = function()
			local nvimbattery = require("battery")
			nvimbattery.setup({
				update_rate_seconds = 30, -- Number of seconds between checking battery status
				show_status_when_no_battery = true, -- Don't show any icon or text when no battery found (desktop for example)
				show_plugged_icon = true, -- If true show a cable icon alongside the battery icon when plugged in
				show_unplugged_icon = false, -- When true show a diconnected cable icon when not plugged in
				show_percent = true, -- Whether or not to show the percent charge remaining in digits
				vertical_icons = true, -- When true icons are vertical, otherwise shows horizontal battery icon
				multiple_battery_selection = 1, -- Which battery to choose when multiple found. "max" or "maximum", "min" or "minimum" or a number to pick the nth battery found (currently linux acpi only)
			})
		end,
	},
	-- statusline
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		opts = {
			options = {
				globalstatus = false,
				theme = "gruvbox_dark",
				disabled_filetypes = { statusline = { "dashboard", "snacks_dashboard" } },
				section_separators = { left = "", right = "" },
			},
			sections = {
				lualine_z = {
					{
						function()
							return " " .. os.date("%R")
						end,
					},
					{
						function()
							return require("battery").get_status_line()
						end,
						color = { fg = "#fe8019", bg = "#3c383" },
					},
				},
			},
		},
	},

	{
		"nvim-tree/nvim-web-devicons",
		lazy = true,
		config = function()
			local devicons = require("nvim-web-devicons")
			devicons.setup({
				override = {
					cmp_bootstrap = {
						icon = "[﯄]",
						color = "#428850",
						name = "cmp_bootstrap",
					},
				},
			})
		end,
	},

	-- filename
	{
		"b0o/incline.nvim",
		dependencies = { "ellisonleao/gruvbox.nvim" },
		event = "BufReadPre",
		priority = 1200,
		config = function()
			require("incline").setup({
				highlight = {
					groups = {
						InclineNormal = { guibg = "#1d2021", guifg = "#f9f5d7" },
						InclineNormalNC = { guifg = "#fbf1c7", guibg = "#282828" },
					},
				},
				window = { margin = { vertical = 0, horizontal = 1 } },
				hide = {
					cursorline = true,
				},
				render = function(props)
					local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
					if vim.bo[props.buf].modified then
						filename = "[+] " .. filename
					end

					local icon, color = require("nvim-web-devicons").get_icon_color(filename)
					return { { icon, guifg = color }, { " " }, { filename } }
				end,
			})
		end,
	},

	{
		"folke/zen-mode.nvim",
		cmd = "ZenMode",
		opts = {
			plugins = {
				gitsigns = true,
				tmux = true,
				kitty = { enabled = false, font = "+2" },
			},
		},
		keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
	},

	-- {
	-- 	"nvimdev/dashboard-nvim",
	-- 	lazy = false,
	-- 	event = "VimEnter",
	-- 	opts = function(_, opts)
	-- 		local logo = [[
	--     ████████╗███████╗ █████╗ ██████╗  █████╗ ██████╗ ████████╗██╗   ██╗██████╗ ███████╗██╗   ██╗
	--        ██╔══╝██╔════╝██╔══██╗██╔══██╗██╔══██╗██╔══██╗   ██╔══╝╚██╗ ██╔╝██╔══██╗██╔════╝██║   ██║
	--        ██║   █████╗  ███████║██████╔╝███████║██████╔╝   ██║    ╚████╔╝ ██║  ██║█████╗  ██║   ██║
	--        ██║   ██╔══╝  ██╔══██║██╔═══╝ ██╔══██║██╔═██║    ██║      ██╔╝  ██║  ██║██╔══╝  ╚██╗ ██╔╝
	--        ██║   ███████╗██║  ██║██║     ██║  ██║██║  ██╗   ██║      ██║   ██████╔╝███████╗ ╚████╔╝
	--        ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝      ╚═╝   ╚═════╝ ╚══════╝  ╚═══╝
	--      ]]
	--
	-- 		logo = string.rep("\n", 3) .. logo .. "\n\n"
	-- 		opts.config.header = vim.split(logo, "\n")
	-- 	end,
	-- },

	{
		"nvimdev/dashboard-nvim",
		lazy = true,
		event = "VimEnter",
		opts = function()
			local logo = [[
     ████████╗███████╗ █████╗ ██████╗  █████╗ ██████╗ ████████╗██╗   ██╗██████╗ ███████╗██╗   ██╗
        ██╔══╝██╔════╝██╔══██╗██╔══██╗██╔══██╗██╔══██╗   ██╔══╝╚██╗ ██╔╝██╔══██╗██╔════╝██║   ██║
        ██║   █████╗  ███████║██████╔╝███████║██████╔╝   ██║    ╚████╔╝ ██║  ██║█████╗  ██║   ██║
        ██║   ██╔══╝  ██╔══██║██╔═══╝ ██╔══██║██╔═██║    ██║      ██╔╝  ██║  ██║██╔══╝  ╚██╗ ██╔╝
        ██║   ███████╗██║  ██║██║     ██║  ██║██║  ██╗   ██║      ██║   ██████╔╝███████╗ ╚████╔╝ 
        ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝      ╚═╝   ╚═════╝ ╚══════╝  ╚═══╝  
    ]]

			logo = string.rep("\n", 3) .. logo .. "\n\n\n"

			local opts = {
				theme = "doom",
				hide = {
					-- this is taken care of by lualine
					-- enabling this messes up the actual laststatus setting after loading a file
					statusline = false,
				},
				config = {
					header = vim.split(logo, "\n"),
        -- stylua: ignore
					center = {
						{
							action = "lua LazyVim.pick()()",
							desc = " Find File",
							icon = " ",
							key = "f",
						},
						{
							action = "ene | startinsert",
							desc = " New File",
							icon = " ",
							key = "n",
						},
						{
							action = 'lua LazyVim.pick("oldfiles")()',
							desc = " Recent Files",
							icon = " ",
							key = "r",
						},
						{
							action = 'lua LazyVim.pick("live_grep")()',
							desc = " Find Text",
							icon = " ",
							key = "g",
						},
						{
							action = "lua LazyVim.pick.config_files()()",
							desc = " Config",
							icon = " ",
							key = "c",
						},
						{
							action = 'lua require("persistence").load()',
							desc = " Restore Session",
							icon = " ",
							key = "s",
						},
						{
							action = "LazyExtras",
							desc = " Lazy Extras",
							icon = " ",
							key = "x",
						},
						{
							action = "Lazy",
							desc = " Lazy",
							icon = "󰒲 ",
							key = "l",
						},
						{
							action = function()
								vim.api.nvim_input("<cmd>qa<cr>")
							end,
							desc = " Quit",
							icon = " ",
							key = "q",
						},
					},
					footer = function()
						local stats = require("lazy").stats()
						local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
						return {
							"🎉 ⚡ Neovim loaded "
								.. stats.loaded
								.. "/"
								.. stats.count
								.. " plugins in "
								.. ms
								.. "ms",
						}
					end,
				},
			}

			for _, button in ipairs(opts.config.center) do
				button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
				button.key_format = "  %s"
			end

			-- open dashboard after closing lazy
			if vim.o.filetype == "lazy" then
				vim.api.nvim_create_autocmd("WinClosed", {
					pattern = tostring(vim.api.nvim_get_current_win()),
					once = true,
					callback = function()
						vim.schedule(function()
							vim.api.nvim_exec_autocmds("UIEnter", { group = "dashboard" })
						end)
					end,
				})
			end

			return opts
		end,
	},
}

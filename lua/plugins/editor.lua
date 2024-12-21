return {
	{
		enabled = true,
		"folke/flash.nvim",
		-- @type Flash.Config
		opts = {
			search = {
				forward = true,
				multi_window = false,
				wrap = false,
				incremental = true,
			},
		},
	},

	{
		"echasnovski/mini.hipatterns",
		event = "BufReadPre",
		opts = {
			highlighters = {
				hsl_color = {
					pattern = "hsl%(%d+,? %d+,? %d+%)",
					group = function(_, match)
						local utils = require("craftzdog.utils")
						local h, s, l = match:match("hsl%((%d+),? (%d+),? (%d+)%)")
						h, s, l = tonumber(h), tonumber(s), tonumber(l)
						local hex_color = utils.hslToHex(h, s, l)
						return MiniHipatterns.compute_hex_color_group(hex_color, "bg")
					end,
				},
			},
		},
	},

	{
		"dinhhuy258/git.nvim",
		event = "BufReadPre",
		opts = {
			keymaps = {
				-- Open blame window
				blame = "<Leader>gb",
				-- Open file/folder in git repository
				browse = "<Leader>go",
			},
		},
	},

	-- {
	-- 	"nvim-telescope/telescope.nvim",
	-- 	tag = "0.1.8",
	-- 	dependencies = {
	-- 		{ "nvim-lua/plenary.nvim" },
	-- 		{
	-- 			"nvim-telescope/telescope-fzf-native.nvim",
	-- 			build = "make",
	-- 		},
	-- 		"nvim-telescope/telescope-file-browser.nvim",
	-- 	},
	-- 	keys = {
	-- 		{
	-- 			"<leader>fP",
	-- 			function()
	-- 				require("telescope.builtin").find_files({
	-- 					cwd = require("lazy.core.config").options.root,
	-- 				})
	-- 			end,
	-- 			desc = "Find Plugin File",
	-- 		},
	-- 		{
	-- 			";f",
	-- 			function()
	-- 				local builtin = require("telescope.builtin")
	-- 				builtin.find_files({
	-- 					no_ignore = false,
	-- 					hidden = true,
	-- 				})
	-- 			end,
	-- 			desc = "Lists files in your current working directory, respects .gitignore",
	-- 		},
	-- 		{
	-- 			";r",
	-- 			function()
	-- 				local builtin = require("telescope.builtin")
	-- 				builtin.live_grep()
	-- 			end,
	-- 			desc = "Search for a string in your current working directory and get results live as you type, respects .gitignore",
	-- 		},
	-- 		{
	-- 			"\\\\",
	-- 			function()
	-- 				local builtin = require("telescope.builtin")
	-- 				builtin.buffers()
	-- 			end,
	-- 			desc = "Lists open buffers",
	-- 		},
	-- 		{
	-- 			";t",
	-- 			function()
	-- 				local builtin = require("telescope.builtin")
	-- 				builtin.help_tags()
	-- 			end,
	-- 			desc = "Lists available help tags and opens a new window with the relevant help info on <cr>",
	-- 		},
	-- 		{
	-- 			";;",
	-- 			function()
	-- 				local builtin = require("telescope.builtin")
	-- 				builtin.resume()
	-- 			end,
	-- 			desc = "Resume the previous telescope picker",
	-- 		},
	-- 		{
	-- 			";e",
	-- 			function()
	-- 				local builtin = require("telescope.builtin")
	-- 				builtin.diagnostics()
	-- 			end,
	-- 			desc = "Lists Diagnostics for all open buffers or a specific buffer",
	-- 		},
	-- 		{
	-- 			";s",
	-- 			function()
	-- 				local builtin = require("telescope.builtin")
	-- 				builtin.treesitter()
	-- 			end,
	-- 			desc = "Lists Function names, variables, from Treesitter",
	-- 		},
	-- 		{
	-- 			"sf",
	-- 			function()
	-- 				local telescope = require("telescope")
	--
	-- 				local function telescope_buffer_dir()
	-- 					return vim.fn.expand("%:p:h")
	-- 				end
	--
	-- 				telescope.extensions.file_browser.file_browser({
	-- 					path = "%:p:h",
	-- 					cwd = telescope_buffer_dir(),
	-- 					respect_gitignore = false,
	-- 					hidden = true,
	-- 					grouped = true,
	-- 					previewer = false,
	-- 					theme = "ivy",
	-- 					initial_mode = "normal",
	-- 					layout_config = { height = 20 },
	-- 				})
	-- 			end,
	-- 			desc = "Open File Browser with the path of the current buffer",
	-- 		},
	-- 	},
	-- 	config = function(_, opts)
	-- 		local telescope = require("telescope")
	-- 		local actions = require("telescope.actions")
	-- 		local fb_actions = require("telescope").extensions.file_browser.actions
	--
	-- 		opts.defaults = {
	-- 			wrap_results = true,
	-- 			layout_strategy = "horizontal",
	-- 			layout_config = { prompt_position = "top" },
	-- 			sorting_strategy = "ascending",
	-- 			winblend = 0,
	-- 			mappings = {
	-- 				n = {},
	-- 			},
	-- 		}
	-- 		opts.pickers = {
	-- 			diagnostics = {
	-- 				theme = "ivy",
	-- 				initial_mode = "normal",
	-- 				layout_config = {
	-- 					preview_cutoff = 9999,
	-- 				},
	-- 			},
	-- 		}
	-- 		opts.extensions = {
	-- 			file_browser = {
	-- 				theme = "ivy",
	-- 				-- disables netrw and use telescope-file-browser in its place
	-- 				hijack_netrw = true,
	-- 				mappings = {
	-- 					-- your custom insert mode mappings
	-- 					["n"] = {
	-- 						-- your custom normal mode mappings
	-- 						["N"] = fb_actions.create,
	-- 						["D"] = fb_actions.remove,
	-- 						["R"] = fb_actions.rename,
	-- 						["h"] = fb_actions.goto_parent_dir,
	-- 						["/"] = function()
	-- 							vim.cmd("startinsert")
	-- 						end,
	-- 						["<C-u>"] = function(prompt_bufnr)
	-- 							for i = 1, 10 do
	-- 								actions.move_selection_previous(prompt_bufnr)
	-- 							end
	-- 						end,
	-- 						["<C-d>"] = function(prompt_bufnr)
	-- 							for i = 1, 10 do
	-- 								actions.move_selection_next(prompt_bufnr)
	-- 							end
	-- 						end,
	-- 						["<PageUp>"] = actions.preview_scrolling_up,
	-- 						["<PageDown>"] = actions.preview_scrolling_down,
	-- 					},
	-- 				},
	-- 			},
	-- 		}
	-- 		telescope.setup(opts)
	-- 		require("telescope").load_extension("fzf")
	-- 		require("telescope").load_extension("file_browser")
	-- 	end,
	-- },
	--

	-- Primera configuracion
	-- {
	-- 	"ibhagwan/fzf-lua",
	-- 	-- optional for icon support
	-- 	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- 	config = function()
	-- 		-- calling `setup` is optional for customization
	-- 		require("fzf-lua").setup({
	-- 			"default-title",
	-- 			fzf_color = true,
	-- 			prompt = " ",
	-- 			default = {
	-- 				git_icons = false,
	-- 				file_icons = false,
	-- 				color_icons = false,
	-- 			},
	-- 		})
	-- 	end,
	-- },
	--
	{
		"ibhagwan/fzf-lua",
		cmd = "FzfLua",
		opts = function(_, opts)
			local config = require("fzf-lua.config")
			local actions = require("fzf-lua.actions")

			-- Quickfix
			config.defaults.keymap.fzf["ctrl-q"] = "select-all+accept"
			config.defaults.keymap.fzf["ctrl-u"] = "half-page-up"
			config.defaults.keymap.fzf["ctrl-d"] = "half-page-down"
			config.defaults.keymap.fzf["ctrl-x"] = "jump"
			config.defaults.keymap.fzf["ctrl-f"] = "preview-page-down"
			config.defaults.keymap.fzf["ctrl-b"] = "preview-page-up"
			config.defaults.keymap.builtin["<c-f>"] = "preview-page-down"
			config.defaults.keymap.builtin["<c-b>"] = "preview-page-up"

			-- Trouble
			if LazyVim.has("trouble.nvim") then
				config.defaults.actions.files["ctrl-t"] = require("trouble.sources.fzf").actions.open
			end

			-- Toggle root dir / cwd
			config.defaults.actions.files["ctrl-r"] = function(_, ctx)
				local o = vim.deepcopy(ctx.__call_opts)
				o.root = o.root == false
				o.cwd = nil
				o.buf = ctx.__CTX.bufnr
				LazyVim.pick.open(ctx.__INFO.cmd, o)
			end
			config.defaults.actions.files["alt-c"] = config.defaults.actions.files["ctrl-r"]
			config.set_action_helpstr(config.defaults.actions.files["ctrl-r"], "toggle-root-dir")

			local img_previewer ---@type string[]?
			for _, v in ipairs({
				{ cmd = "ueberzug", args = {} },
				{ cmd = "chafa", args = { "{file}", "--format=symbols" } },
				{ cmd = "viu", args = { "-b" } },
			}) do
				if vim.fn.executable(v.cmd) == 1 then
					img_previewer = vim.list_extend({ v.cmd }, v.args)
					break
				end
			end

			return {
				"default-title",
				fzf_colors = true,
				fzf_opts = {
					["--no-scrollbar"] = true,
				},
				defaults = {
					-- formatter = "path.filename_first",
					formatter = "path.dirname_first",
				},
				previewers = {
					builtin = {
						extensions = {
							["png"] = img_previewer,
							["jpg"] = img_previewer,
							["jpeg"] = img_previewer,
							["gif"] = img_previewer,
							["webp"] = img_previewer,
						},
						ueberzug_scaler = "fit_contain",
					},
				},
				-- Custom LazyVim option to configure vim.ui.select
				ui_select = function(fzf_opts, items)
					return vim.tbl_deep_extend("force", fzf_opts, {
						prompt = " ",
						winopts = {
							title = " " .. vim.trim((fzf_opts.prompt or "Select"):gsub("%s*:%s*$", "")) .. " ",
							title_pos = "center",
						},
					}, fzf_opts.kind == "codeaction" and {
						winopts = {
							layout = "vertical",
							-- height is number of items minus 15 lines for the preview, with a max of 80% screen height
							height = math.floor(math.min(vim.o.lines * 0.8 - 16, #items + 2) + 0.5) + 16,
							width = 0.5,
							preview = not vim.tbl_isempty(LazyVim.lsp.get_clients({ bufnr = 0, name = "vtsls" })) and {
								layout = "vertical",
								vertical = "down:15,border-top",
								hidden = "hidden",
							} or {
								layout = "vertical",
								vertical = "down:15,border-top",
							},
						},
					} or {
						winopts = {
							width = 0.5,
							-- height is number of items, with a max of 80% screen height
							height = math.floor(math.min(vim.o.lines * 0.8, #items + 2) + 0.5),
						},
					})
				end,
				winopts = {
					width = 0.8,
					height = 0.8,
					row = 0.5,
					col = 0.5,
					preview = {
						scrollchars = { "┃", "" },
					},
				},
				files = {
					cwd_prompt = false,
					actions = {
						["alt-i"] = { actions.toggle_ignore },
						["alt-h"] = { actions.toggle_hidden },
					},
				},
				grep = {
					actions = {
						["alt-i"] = { actions.toggle_ignore },
						["alt-h"] = { actions.toggle_hidden },
					},
				},
				lsp = {
					symbols = {
						symbol_hl = function(s)
							return "TroubleIcon" .. s
						end,
						symbol_fmt = function(s)
							return s:lower() .. "\t"
						end,
						child_prefix = false,
					},
					code_actions = {
						previewer = vim.fn.executable("delta") == 1 and "codeaction_native" or nil,
					},
				},
			}
		end,
		config = function(_, opts)
			if opts[1] == "default-title" then
				-- use the same prompt for all pickers for profile `default-title` and
				-- profiles that use `default-title` as base profile
				local function fix(t)
					t.prompt = t.prompt ~= nil and " " or nil
					for _, v in pairs(t) do
						if type(v) == "table" then
							fix(v)
						end
					end
					return t
				end
				opts = vim.tbl_deep_extend("force", fix(require("fzf-lua.profiles.default-title")), opts)
				opts[1] = nil
			end
			require("fzf-lua").setup(opts)
		end,
		init = function()
			LazyVim.on_very_lazy(function()
				vim.ui.select = function(...)
					require("lazy").load({ plugins = { "fzf-lua" } })
					local opts = LazyVim.opts("fzf-lua") or {}
					require("fzf-lua").register_ui_select(opts.ui_select or nil)
					return vim.ui.select(...)
				end
			end)
		end,
		keys = {
			{ "<c-j>", "<c-j>", ft = "fzf", mode = "t", nowait = true },
			{ "<c-k>", "<c-k>", ft = "fzf", mode = "t", nowait = true },
			{
				"<leader>,",
				"<cmd>FzfLua buffers sort_mru=true sort_lastused=true<cr>",
				desc = "Switch Buffer",
			},
			{ "<leader>/", LazyVim.pick("live_grep"), desc = "Grep (Root Dir)" },
			{ "<leader>:", "<cmd>FzfLua command_history<cr>", desc = "Command History" },
			{ "<leader><space>", LazyVim.pick("files"), desc = "Find Files (Root Dir)" },
			-- find
			{ "<leader>fb", "<cmd>FzfLua buffers sort_mru=true sort_lastused=true<cr>", desc = "Buffers" },
			{ "<leader>fc", LazyVim.pick.config_files(), desc = "Find Config File" },
			{ "<leader>ff", LazyVim.pick("files"), desc = "Find Files (Root Dir)" },
			{ "<leader>fF", LazyVim.pick("files", { root = false }), desc = "Find Files (cwd)" },
			{ "<leader>fg", "<cmd>FzfLua git_files<cr>", desc = "Find Files (git-files)" },
			{ "<leader>fr", "<cmd>FzfLua oldfiles<cr>", desc = "Recent" },
			{ "<leader>fR", LazyVim.pick("oldfiles", { cwd = vim.uv.cwd() }), desc = "Recent (cwd)" },
			-- git
			{ "<leader>gc", "<cmd>FzfLua git_commits<CR>", desc = "Commits" },
			{ "<leader>gs", "<cmd>FzfLua git_status<CR>", desc = "Status" },
			-- search
			{ '<leader>s"', "<cmd>FzfLua registers<cr>", desc = "Registers" },
			{ "<leader>sa", "<cmd>FzfLua autocmds<cr>", desc = "Auto Commands" },
			{ "<leader>sb", "<cmd>FzfLua grep_curbuf<cr>", desc = "Buffer" },
			{ "<leader>sc", "<cmd>FzfLua command_history<cr>", desc = "Command History" },
			{ "<leader>sC", "<cmd>FzfLua commands<cr>", desc = "Commands" },
			{ "<leader>sd", "<cmd>FzfLua diagnostics_document<cr>", desc = "Document Diagnostics" },
			{ "<leader>sD", "<cmd>FzfLua diagnostics_workspace<cr>", desc = "Workspace Diagnostics" },
			{ "<leader>sg", LazyVim.pick("live_grep"), desc = "Grep (Root Dir)" },
			{ "<leader>sG", LazyVim.pick("live_grep", { root = false }), desc = "Grep (cwd)" },
			{ "<leader>sh", "<cmd>FzfLua help_tags<cr>", desc = "Help Pages" },
			{ "<leader>sH", "<cmd>FzfLua highlights<cr>", desc = "Search Highlight Groups" },
			{ "<leader>sj", "<cmd>FzfLua jumps<cr>", desc = "Jumplist" },
			{ "<leader>sk", "<cmd>FzfLua keymaps<cr>", desc = "Key Maps" },
			{ "<leader>sl", "<cmd>FzfLua loclist<cr>", desc = "Location List" },
			{ "<leader>sM", "<cmd>FzfLua man_pages<cr>", desc = "Man Pages" },
			{ "<leader>sm", "<cmd>FzfLua marks<cr>", desc = "Jump to Mark" },
			{ "<leader>sR", "<cmd>FzfLua resume<cr>", desc = "Resume" },
			{ "<leader>sq", "<cmd>FzfLua quickfix<cr>", desc = "Quickfix List" },
			{ "<leader>sw", LazyVim.pick("grep_cword"), desc = "Word (Root Dir)" },
			{ "<leader>sW", LazyVim.pick("grep_cword", { root = false }), desc = "Word (cwd)" },
			{ "<leader>sw", LazyVim.pick("grep_visual"), mode = "v", desc = "Selection (Root Dir)" },
			{ "<leader>sW", LazyVim.pick("grep_visual", { root = false }), mode = "v", desc = "Selection (cwd)" },
			{ "<leader>uC", LazyVim.pick("colorschemes"), desc = "Colorscheme with Preview" },
			{
				"<leader>ss",
				function()
					require("fzf-lua").lsp_document_symbols({
						regex_filter = symbols_filter,
					})
				end,
				desc = "Goto Symbol",
			},
			{
				"<leader>sS",
				function()
					require("fzf-lua").lsp_live_workspace_symbols({
						regex_filter = symbols_filter,
					})
				end,
				desc = "Goto Symbol (Workspace)",
			},
		},
	},
}

return {
	"nvimdev/lspsaga.nvim",
	event = "LspAttach", -- Carga lspsaga cuando se adjunta un LSP
	dependencies = {
		"nvim-treesitter/nvim-treesitter", -- Necesario para algunas funcionalidades
		"nvim-tree/nvim-web-devicons", -- Para iconos
	},
	config = function()
		require("lspsaga").setup({
			-- Aquí puedes poner tus opciones de configuración de lspsaga
			-- Por ejemplo:
			ui = {
				border = "rounded",
				winblend = 0,
				title_align = "center",
			},
			lightbulb = {
				enable = true,
				sign = true,
				sign_priority = 20,
				virtual_text = false,
			},
			callhierarchy = {
				show_icon = true,
			},
			finder = {
				methods = { "definition", "typeDefinition", "implementation", "references" },
				default_action = "open",
			},
			codeaction = {
				num_select = true,
				show_label = true,
				extend_gitsigns = false,
			},

			-- Configuración de Keymaps directamente en setup
			-- lspsaga tiene una forma integrada de manejar esto
			-- Puedes usar 'bind_keymaps = false' si quieres mapearlos manualmente con vim.keymap.set
			-- Pero lo más fácil es dejar que lspsaga los maneje
			-- Puedes personalizar los keymaps aquí
			-- Por ejemplo, si quieres usar 'K' para show_doc:
			-- keymaps = {
			--   show_doc = "K",
			--   definition = "gd",
			--   peek_definition = "gp",
			--   type_definition = "gt",
			--   implementation = "gi",
			--   references = "gr",
			--   signature_help = "gs",
			--   rename = "<leader>rn",
			--   code_action = "<leader>ca",
			--   show_diagnostic_ui = "<leader>D",
			--   show_outline = "<leader>o",
			--   callhierarchy_peek = "<leader>gh",
			--   diagnostic_jump_prev = "[d",
			--   diagnostic_jump_next = "]d",
			--   show_line_diagnostics = "gl",
			-- },
		})

		-- Si prefieres mapear manualmente con which-key,
		-- puedes usar las funciones directamente de lspsaga (no del módulo lspsaga.keymap)
		local wk = require("which-key")
		local saga = require("lspsaga") -- Requiere el módulo principal de lspsaga

		wk.add({
			K = { saga.show_doc, "LSP: Show Doc" },
			["gd"] = { saga.goto_definition, "LSP: Goto Definition" },
			-- Ten en cuenta que lspsaga.peek_definition no existe directamente en el módulo principal.
			-- Para peek_definition, lspsaga espera que uses 'gd' y luego 'p' para hacer peek.
			-- O puedes usar una función que combine ir a definición y luego peek.
			-- Para simplificar, si quieres un peek_definition directo, a veces se usa un mapeo combinado
			-- o se confía en la funcionalidad de 'gd' y luego navegar.
			-- Por ahora, eliminamos los que no son directamente accesibles o son redundantes.

			-- Los siguientes son los que lspsaga expone directamente en el módulo principal
			["gt"] = { saga.goto_type_definition, "LSP: Goto Type Definition" },
			["gi"] = { saga.goto_implementation, "LSP: Goto Implementation" },
			["gr"] = { saga.references, "LSP: References" },
			["gs"] = { saga.signature_help, "LSP: Signature Help" },
			["<leader>rn"] = { saga.rename, "LSP: Rename" },
			["<leader>ca"] = { saga.code_action, "LSP: Code Action" },
			["<leader>DD"] = { [2] = "LSP: Show Diagnostic UI" },
			["<leader>o"] = { saga.show_outline, "LSP: Show Outline" },
			["<leader>gh"] = { saga.callhierarchy_peek, "LSP: Call Hierarchy Peek" },
			["[d"] = { saga.diagnostic_jump_prev, "LSP: Prev Diagnostic" },
			["]d"] = { saga.diagnostic_jump_next, "LSP: Next Diagnostic" },
			["gl"] = { saga.show_line_diagnostics, "LSP: Line Diagnostics" },
		}, { prefix = "<leader>" })
	end,
}

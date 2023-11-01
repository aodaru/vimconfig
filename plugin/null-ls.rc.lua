local status, null_ls = pcall(require, "null-ls")
local utils = require("null-ls.utils")
local methods = require("null-ls.methods")
if not status then
	return
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local FORMATTING = methods.internal.FORMATTING
local RANGE_FORMATTING = methods.internal.RANGE_FORMATTING

local lsp_formatting = function(bufnr)
	vim.lsp.buf.format({
		filter = function(client)
			return client.name == "null-ls"
		end,
		bufnr = bufnr,
	})
end

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.prettierd,
		null_ls.builtins.diagnostics.zsh,
		null_ls.builtins.completion.spell, -- You still need to execute `:set spell`
		null_ls.builtins.formatting.stylua, -- You need to install stylua first: `brew install stylua`

		null_ls.builtins.formatting.prettierd.with({
			method = { FORMATTING, RANGE_FORMATTING },
			filetypes = {
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
				"vue",
				"css",
				"scss",
				"less",
				"html",
				"json",
				"jsonc",
				"yaml",
				"markdown",
				"markdown.mdx",
				"graphql",
				"handlebars",
				"twig",
			},
		}),
	},
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					lsp_formatting(bufnr)
				end,
			})
		end
	end,
})

vim.api.nvim_create_user_command("DisableLspFormatting", function()
	vim.api.nvim_clear_autocmds({ group = augroup, buffer = 0 })
end, { nargs = 0 })

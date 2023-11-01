--vim.lsp.set_log_level("debug")

local status, nvim_lsp = pcall(require, "lspconfig")
if not status then
	return
end

local protocol = require("vim.lsp.protocol")

local augroup_format = vim.api.nvim_create_augroup("Format", { clear = true })
local enable_format_on_save = function(_, bufnr)
	vim.api.nvim_clear_autocmds({ group = augroup_format, buffer = bufnr })
	vim.api.nvim_create_autocmd("BufWritePre", {
		group = augroup_format,
		buffer = bufnr,
		callback = function()
			vim.lsp.buf.format({ bufnr = bufnr })
		end,
	})
end

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end

	--Enable completion triggered by <c-x><c-o>
	--local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
	--buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- Mappings.
	local opts = { noremap = true, silent = true }

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	--buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
	buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
	buf_set_keymap("n", "F", "<Cmd>lua vim.lsp.buf.format { async = true }<CR>", opts)
end

protocol.CompletionItemKind = {
	"", -- Text
	"", -- Method
	"", -- Function
	"", -- Constructor
	"", -- Field
	"", -- Variable
	"", -- Class
	"ﰮ", -- Interface
	"", -- Module
	"", -- Property
	"", -- Unit
	"", -- Value
	"", -- Enum
	"", -- Keyword
	"﬌", -- Snippet
	"", -- Color
	"", -- File
	"", -- Reference
	"", -- Folder
	"", -- EnumMember
	"", -- Constant
	"", -- Struct
	"", -- Event
	"ﬦ", -- Operator
	"", -- TypeParameter
}

-- Add capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
-- Set up completion using nvim_cmp with LSP source
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

nvim_lsp.intelephense.setup({
	cmd = { "intelephense", "--stdio" },
	filetypes = { "php", "twig" },
	-- Add wordpress to the list of stubs
	stubs = {
		"apache",
		"bcmath",
		"bz2",
		"calendar",
		"com_dotnet",
		"Core",
		"ctype",
		"curl",
		"date",
		"dba",
		"dom",
		"enchant",
		"exif",
		"FFI",
		"fileinfo",
		"filter",
		"fpm",
		"ftp",
		"gd",
		"gettext",
		"laravel",
		"gmp",
		"hash",
		"iconv",
		"imap",
		"intl",
		"json",
		"ldap",
		"libxml",
		"mbstring",
		"meta",
		"mysqli",
		"oci8",
		"odbc",
		"openssl",
		"pcntl",
		"pcre",
		"PDO",
		"pdo_ibm",
		"pdo_mysql",
		"pdo_pgsql",
		"pdo_sqlite",
		"pgsql",
		"Phar",
		"posix",
		"pspell",
		"readline",
		"Reflection",
		"session",
		"shmop",
		"SimpleXML",
		"snmp",
		"soap",
		"sockets",
		"sodium",
		"SPL",
		"sqlite3",
		"standard",
		"superglobals",
		"sysvmsg",
		"sysvsem",
		"sysvshm",
		"tidy",
		"twig",
		"tokenizer",
		"xml",
		"xmlreader",
		"xmlrpc",
		"xmlwriter",
		"xsl",
		"Zend OPcache",
		"zip",
		"zlib",
		"wordpress",
		"phpunit",
	},
	diagnostics = {
		enable = true,
	},
})

nvim_lsp.flow.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

nvim_lsp.tsserver.setup({
	on_attach = on_attach,
	filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
	cmd = { "typescript-language-server", "--stdio" },
	capabilities = capabilities,
})

nvim_lsp.sourcekit.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

nvim_lsp.lua_ls.setup({
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		on_attach(client, bufnr)
		enable_format_on_save(client, bufnr)
	end,
	settings = {
		Lua = {
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},

			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
		},
	},
})

nvim_lsp.tailwindcss.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = {
		"css",
		"eruby",
		"html",
		"less",
		"sass",
		"scss",
		"svelte",
		"pug",
		"typescriptreact",
		"vue",
		"php",
		"twig",
		"astro",
	},
})

nvim_lsp.cssls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

nvim_lsp.html.setup({
	cmd = { "vscode-html-language-server", "--stdio" },
	filetypes = {
		"html",
		"javascript",
		"javascriptreact",
		"svelte",
		"pug",
		"typescriptreact",
		"vue",
		"astro",
	},
	init_options = {
		provideFormatter = true,
		embeddedLanguages = { css = true, javascript = true },
		configurationSection = { "html", "css", "javascript" },
	},
})

nvim_lsp.emmet_ls.setup({
	on_attach = function(client, bufnr)
		on_attach(client, bufnr)
		enable_format_on_save(client, bufnr)
	end,
	capabilities = capabilities,
	filetypes = {
		"css",
		"eruby",
		"html",
		"javascript",
		"javascriptreact",
		"less",
		"sass",
		"scss",
		"svelte",
		"pug",
		"typescriptreact",
		"vue",
		"astro",
	},
	init_options = {
		html = {
			options = {
				-- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
				["bem.enabled"] = true,
				["output.format"] = true,
			},
		},
	},
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	underline = true,
	update_in_insert = false,
	virtual_text = { spacing = 4, prefix = "●" },
	severity_sort = true,
})

-- Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.diagnostic.config({
	virtual_text = {
		prefix = "●",
	},
	update_in_insert = true,
	float = {
		source = "always", -- Or "if_many"
	},
})

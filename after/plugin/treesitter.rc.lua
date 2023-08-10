local status, ts = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

ts.setup({
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = { "php", "twig" },
		disable = {},
	},
	indent = {
		-- enable = true,
		enable = false,
		disable = {},
	},
	ensure_installed = {
		"markdown",
		"markdown_inline",
		"tsx",
		"typescript",
		"toml",
		"php",
		"twig",
		"json",
		"yaml",
		"swift",
		"css",
		"html",
		"lua",
		"astro",
		"javascript",
	},
	autotag = {
		enable = true,
	},
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
})

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }

-- Configuración para TypeScript
parser_config.typescript = {
	enabled = true,
	parser = "typescript",
	filetype = "typescript",
}

-- Configuración para JavaScript
parser_config.javascript = {
	enabled = true,
	parser = "typescript",
	filetype = "javascript",
}

-- Configuración para PHP
parser_config.php = {
	enabled = true,
	parser = { "php", "twig" },
	filetype = { "php", "twig" },
}

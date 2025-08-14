-- bootstrap lazy.nvim, LazyVim and your plugins
if vim.loader then
  vim.loader.enable()
end

_G.dd = function(...)
  require("utils.debug").dump(...)
end
vim.print = _G.dd

local tools = require("utils.tools")
-- Crea un comando personalizado que puedes llamar directamente desde Neovim
vim.api.nvim_create_user_command("YankMatches", function(opts)
  -- 'opts.fargs' contiene los argumentos pasados al comando
  local pattern = opts.fargs[1]
  local reg_name = opts.fargs[2]

  if pattern then
    tools.yank_matches(pattern, reg_name)
  else
    print("Error: El comando necesita un patrón de búsqueda.")
  end
end, { nargs = "*", complete = "customlist,vim.fn.getcmdline" })

require("config.lazy")

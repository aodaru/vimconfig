local M = {}

-- Función para copiar todas las coincidencias de un patrón regex a un registro.
-- @param pattern: El patrón de expresión regular a buscar.
-- @param reg_name: (Opcional) El nombre del registro de destino (por defecto 'a').
function M.yank_matches(pattern, reg_name)
  -- Usa 'a' como registro por defecto si no se especifica.
  reg_name = reg_name or "a"
  -- Limpia el registro de destino.
  vim.fn.setreg(reg_name, "")
  -- Usa 'vim.fn.substitute' para buscar coincidencias y añadirlas al registro.
  -- La bandera 'n' evita modificar el buffer.
  -- La bandera 'g' asegura que se busquen todas las coincidencias en la línea.
  local command =
    string.format("%%s/\\v(%s)/\\=setreg('%s', submatch(1) .. \"\\n\")/gn", pattern, string.upper(reg_name))
  vim.cmd(command)
  -- Desactiva el resaltado de la última búsqueda y muestra un mensaje.
  local content = vim.fn.getreg(reg_name)
  vim.fn.setreg("+", content)

  vim.cmd("noh")
  print(string.format("Copied all matches to register '%s'.", reg_name))
end

return M

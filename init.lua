require('aod.base')
require('aod.highlights')
require('aod.maps')
require('aod.plugins')

local has = vim.fn.has
local is_mac = has "macunix"
local is_win = has "win32"
local is_wsl = has "wsl"

if is_mac == 1 then
  require('aod.macos')
end
if is_win == 1 then
  require('aod.windows')
end
if is_wsl == 1 then
  require('aod.wsl')
end

local has = vim.fn.has
local is_linux = has "linux"
local is_mac = has "macunix"
local is_win = has "win32"
local is_wsl = has "wsl"

if is_linux then
    require('abboodash.system.linux')
elseif is_mac then
    require('abboodash.system.macos')
elseif is_win then
    require('abboodash.system.windows')
elseif is_wsl then
    require('abboodash.system.wsl')
end

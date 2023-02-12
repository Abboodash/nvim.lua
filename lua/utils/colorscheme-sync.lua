local profile_file_path = vim.fn.stdpath("config") .. "/.profile/profile.json"
local default_colorscheme = "github_dark_default"

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    local json_file = io.open(profile_file_path, "r")        
    local json_object = vim.fn.json_decode(json_file:read())
    json_object.current_colorscheme = vim.g.colors_name
    json_object = vim.fn.json_encode(json_object)
    json_file:close()
    
    json_file = io.open(profile_file_path, "w")
    json_file:write(json_object)
    json_file:close()    
    end,
})

local colorscheme_file = io.open(profile_file_path, "r")
local current_colorscheme = vim.fn.json_decode(colorscheme_file:read()).current_colorscheme
colorscheme_file:close()

local ok, _ = pcall(vim.cmd.colorscheme, current_colorscheme)

if not ok then
    vim.cmd.colorscheme(default_colorscheme)
end

local ls = require("luasnip")

local group = vim.api.nvim_create_augroup("Lua Snippets", { clear = true })
local file_pattern = "*.cpp"

return group, file_pattern

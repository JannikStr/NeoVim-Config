local api = vim.api

api.nvim_create_user_command("SourceConfig", function()
	vim.cmd("source ~/.config/nvim/init.lua")
end, {
	nargs = 0,
})

api.nvim_create_user_command("ToggleAutoFormatting", function()
	vim.g.disable_formatting = not vim.g.disable_formatting
end, {
	nargs = 0,
})

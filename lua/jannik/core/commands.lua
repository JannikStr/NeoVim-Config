local api = vim.api

api.nvim_create_user_command("SourceConfig", function()
	vim.cmd("source ~/.config/nvim/init.lua")
end, {
	nargs = 0,
})

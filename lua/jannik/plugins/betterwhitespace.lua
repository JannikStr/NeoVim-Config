local api = vim.api

local stripWhitespaceGroup = api.nvim_create_augroup("StripWhitespaceGroup", { clear = true })

api.nvim_create_autocmd("FileType", {
	pattern = { "python", "javascript", "js", "html", "css" },
	command = ":EnableStripWhitespaceOnSave",
	group = stripWhitespaceGroup,
})

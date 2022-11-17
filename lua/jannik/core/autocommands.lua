local api = vim.api

local doubleIdentationGroup = api.nvim_create_augroup("DoubleIdentationGroup", {
	clear = true,
})

api.nvim_create_autocmd("FileType", {
	pattern = { "python", "java", "cpp", "javascript", "rust", "lua" },
	command = "set tabstop=4 shiftwidth=4",
	group = doubleIdentationGroup,
})

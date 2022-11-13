local api = vim.api

api.nvim_create_autocmd(
	"FileType",
	{ pattern = { "py", "python", "javascript", "js", "html", "css" }, command = ":EnableStripWhitespaceOnSave" }
)

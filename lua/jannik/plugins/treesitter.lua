local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

treesitter.setup({
	highlight = {
		enable = true,
	},
	indent = { enable = true },
	autotag = { enable = true },
	ensure_installed = {
		"json",
		"javascript",
		"typescript",
		"tsx",
		"yaml",
		"html",
		"css",
		"markdown",
		"bash",
		"lua",
		"vim",
		"rust",
		"python",
		"dockerfile",
		"gitignore",
		"c",
		"cpp",
		"cmake",
		"diff",
		"go",
		"gomod",
		"java",
		"latex",
		"make",
		"markdown",
		"regex",
	},
	auto_install = true,
})

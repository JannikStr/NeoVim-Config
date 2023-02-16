local setup, null_ls = pcall(require, "null-ls")
if not setup then
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
	sources = {
		formatting.prettier,
		formatting.stylua,
        formatting.fprettify,
        formatting.fixjson,
        formatting.clang_format,
		diagnostics.eslint_d,
        diagnostics.mypy.with({
            extra_args={"--ignore-missing-imports"}
        }),
        diagnostics.flake8.with({
            extra_args={"--max-line-length", "119"}
        }),
        diagnostics.cppcheck,
        diagnostics.cpplint,
	},
	-- configure format on save
	on_attach = function(current_client, bufnr)
		if current_client.supports_method("textDocument/formatting") and not vim.g.disable_formatting then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						filter = function(client)
							return client.name == "null-ls"
						end,
						bufnr = bufnr,
					})
				end,
			})
		end
	end,
})

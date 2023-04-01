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
        -- formatting.clang_format,
		diagnostics.eslint_d,
        diagnostics.mypy.with({
            extra_args={"--ignore-missing-imports"}
        }),
        diagnostics.flake8.with({
            extra_args={"--max-line-length", "119"}
        }),
        diagnostics.pycodestyle.with({
            extra_args={"--ignore", "E402,E501,W504,W601"}
        }),
        -- diagnostics.pylint.with({
        --     extra_args={
        --         "--score", "no",
        --         "--disable=R0401,R0801,R0902,R0903,R0911,R0912,R0913,R0914,R0915,R0916,R1702,R1704,R1705,R1711,R1720,R1721,R1723,R1724,R1730,R1731,C0103,C0112,C0114,C0115,C0116,C0123,C0301,C0302,C0413,C0415,W0212,W0511,W1202,W0603,W0613,W0621,W0622,W0703,W0707,E1101,E0213",
        --     }
        -- }),
        diagnostics.cppcheck,
        -- diagnostics.cpplint,
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

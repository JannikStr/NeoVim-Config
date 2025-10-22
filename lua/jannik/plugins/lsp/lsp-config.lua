local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
	return
end

local typescript_setup, typescript = pcall(require, "typescript-tools")
if not typescript_setup then
	return
end

local keymap = vim.keymap

-- enable keybindings for available lsp server
local on_attach = function(client, bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }

	-- set keybinds
    keymap.set("n", "<Leader>o", "<cmd>Lspsaga outline<CR>", opts)
	keymap.set("n", "gr", "<cmd>Lspsaga finder<CR>", opts)
	keymap.set("n", "gD", "<cmd>Lspsaga goto_definition<CR>", opts)
	keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts)
	keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	keymap.set("n", "<Leader>mq", "<cmd>Lspsaga code_action<CR>", opts)
	keymap.set("n", "<Leader>mr", "<cmd>Lspsaga rename<CR>", opts)
	keymap.set("n", "<Leader>d", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
	keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
	keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
	keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)

	if client.name == "ts_ls" then
		keymap.set("n", "<Leader>rf", ":TypescriptRenameFile<CR>", opts)
	end
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.lsp.config('html', {
	capabilities = capabilities,
	on_attach = on_attach,
    filetypes = { 'html', 'htmldjango' },
})

typescript.setup({
	server = {
		capabilities = capabilities,
		on_attach = on_attach,
	},
})

vim.lsp.config('cssls', {
	capabilities = capabilities,
	on_attach = on_attach,
})

vim.lsp.config("lua_ls", {
	capabilities = capabilities,
	on_attach = on_attach,
	settings = { -- custom settings for lua
		Lua = {
			-- make the language server recognize "vim" global
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				-- make language server aware of runtime files
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
})

vim.lsp.config("rust_analyzer", {
	capabilities = capabilities,
	on_attach = on_attach,
})

vim.lsp.config("bashls", {
	capabilities = capabilities,
	on_attach = on_attach,
})

vim.lsp.config("clangd", {
	capabilities = capabilities,
	on_attach = on_attach,
})

vim.lsp.config("cmake", {
	capabilities = capabilities,
	on_attach = on_attach,
})

vim.lsp.config("dockerls", {
	capabilities = capabilities,
	on_attach = on_attach,
})

vim.lsp.config("jsonls", {
	capabilities = capabilities,
	on_attach = on_attach,
})

vim.lsp.config("jdtls", {
	capabilities = capabilities,
	on_attach = on_attach,
})

vim.lsp.config("julials", {
	capabilities = capabilities,
	on_attach = on_attach,
})

vim.lsp.config("marksman", {
	capabilities = capabilities,
	on_attach = on_attach,
})

vim.lsp.config("jedi_language_server", {
	capabilities = capabilities,
	on_attach = on_attach,
})


vim.lsp.config("fortls", {
	-- capabilities = capabilities,
	-- on_attach = on_attach,
    cmd = {
        'fortls',
        '--lowercase_intrinsics',
        '--notify_init',
        '--hover_signature',
        '--hover_language=fortran',
        '--use_signature_help',
    },
})

vim.lsp.config("texlab", {
    capabilities = capabilities,
    on_attach = on_attach,
})

vim.lsp.config("intelephense", {
    on_attach = on_attach,
    capabilities = capabilities
})

vim.lsp.config("ltex", {
    on_attach = on_attach,
    cmd = { "ltex-ls" },
    filetypes = {"markdown", "text", "latex", "tex"},
    flags = { debounce_text_changes = 300 },
    settings = {
        ltex = {
            language = "de-DE"
        }
    }
})

vim.lsp.config("gopls", {
    on_attach = on_attach,
    capabilities = capabilities
})

lspconfig["tailwindcss"].setup({
    on_attach = on_attach,
    capabilities = capabilities
})


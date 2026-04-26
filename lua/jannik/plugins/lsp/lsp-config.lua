local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
	return
end

local typescript_setup, typescript = pcall(require, "typescript-tools")
if not typescript_setup then
	return
end


typescript.setup {
  on_attach = function()  end,
  handlers = {  },
  settings = {
    -- spawn additional tsserver instance to calculate diagnostics on it
    separate_diagnostic_server = true,
    -- "change"|"insert_leave" determine when the client asks the server about diagnostic
    publish_diagnostic_on = "insert_leave",
    -- array of strings("fix_all"|"add_missing_imports"|"remove_unused"|
    -- "remove_unused_imports"|"organize_imports") -- or string "all"
    -- to include all supported code actions
    -- specify commands exposed as code_actions
    expose_as_code_action = {},
    -- string|nil - specify a custom path to `tsserver.js` file, if this is nil or file under path
    -- not exists then standard path resolution strategy is applied
    tsserver_path = nil,
    -- specify a list of plugins to load by tsserver, e.g., for support `styled-components`
    -- (see 💅 `styled-components` support section)
    tsserver_plugins = {},
    -- this value is passed to: https://nodejs.org/api/cli.html#--max-old-space-sizesize-in-megabytes
    -- memory limit in megabytes or "auto"(basically no limit)
    tsserver_max_memory = "auto",
    -- described below
    tsserver_format_options = {},
    tsserver_file_preferences = {},
    -- locale of all tsserver messages, supported locales you can find here:
    -- https://github.com/microsoft/TypeScript/blob/3c221fc086be52b19801f6e8d82596d04607ede6/src/compiler/utilitiesPublic.ts#L620
    tsserver_locale = "en",
    -- mirror of VSCode's `typescript.suggest.completeFunctionCalls`
    complete_function_calls = false,
    include_completions_with_insert_text = true,
    -- CodeLens
    -- WARNING: Experimental feature also in VSCode, because it might hit performance of server.
    -- possible values: ("off"|"all"|"implementations_only"|"references_only")
    code_lens = "off",
    -- by default code lenses are displayed on all referencable values and for some of you it can
    -- be too much this option reduce count of them by removing member references from lenses
    disable_member_code_lens = true,
    -- JSXCloseTag
    -- WARNING: it is disabled by default (maybe you configuration or distro already uses nvim-ts-autotag,
    -- that maybe have a conflict if enable this feature. )
    jsx_close_tag = {
        enable = false,
        filetypes = { "javascriptreact", "typescriptreact" },
    }
  },
}

-- local angularls_config = require("jannik.plugins.lsp.languages.angularls")

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
	keymap.set("n", "<Leader>dl", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
	keymap.set("n", "<Leader>dc", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)
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

vim.lsp.config("basedpyright", {
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

vim.lsp.config("ltex_plus", {
    on_attach = on_attach,
    cmd = { "ltex-ls-plus" },
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

vim.lsp.config("tailwindcss", {
    on_attach = on_attach,
    capabilities = capabilities
})

vim.lsp.config("zls", {
    on_attach = on_attach,
    capabilities = capabilities
})

vim.lsp.config("angularls", {
    on_attach = on_attach,
    capabilities = capabilities,
    -- cmd = angularls_config.cmd
})

vim.lsp.config("nil_ls", {
    on_attach = on_attach,
    capabilities = capabilities,
})

vim.lsp.config("omnisharp", {
    on_attach = on_attach,
    capabilities = capabilities,
})

vim.lsp.config("protols", {
    on_attach = on_attach,
    capabilities = capabilities,
})

vim.api.nvim_exec_autocmds("FileType", {})

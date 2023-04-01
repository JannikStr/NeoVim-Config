require("jannik.plugins-setup")
require("jannik.core.options")
require("jannik.core.colorscheme")
require("jannik.core.keymaps")
require("jannik.core.commands")
require("jannik.core.autocommands")

-- Plugin configurations
require("jannik.plugins.autopairs")
require("jannik.plugins.betterwhitespace")
require("jannik.plugins.comment")
require("jannik.plugins.glow")
require("jannik.plugins.lualine")
require("jannik.plugins.nvim-cmp")
require("jannik.plugins.nvim-transparent")
require("jannik.plugins.nvim-tree")
require("jannik.plugins.telescope")
require("jannik.plugins.treesitter")
require("jannik.plugins.vimtex")
require("jannik.plugins.barbar")

--  lsp
require("jannik.plugins.lsp.lspsaga")
require("jannik.plugins.lsp.lsp-config")
require("jannik.plugins.lsp.mason")
require("jannik.plugins.lsp.null-ls")
require("jannik.plugins.lsp.phpactor")

-- dap
require("jannik.plugins.dap.keymaps")

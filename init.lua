require("jannik.plugins-setup")
require("jannik.core.options")
require("jannik.core.colorscheme")
require("jannik.core.keymaps")
require("jannik.core.commands")
require("jannik.core.autocommands")

-- Plugin configurations
require("jannik.plugins.comment")
require("jannik.plugins.nvim-tree")
require("jannik.plugins.lualine")
require("jannik.plugins.telescope")
require("jannik.plugins.nvim-cmp")
require("jannik.plugins.autopairs")
require("jannik.plugins.treesitter")
require("jannik.plugins.barbar")
require("jannik.plugins.betterwhitespace")

--  lsp
require("jannik.plugins.lsp.mason")
require("jannik.plugins.lsp.lspsaga")
require("jannik.plugins.lsp.lsp-config")
require("jannik.plugins.lsp.null-ls")

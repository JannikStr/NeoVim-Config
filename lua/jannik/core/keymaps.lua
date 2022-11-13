local checks = require("jannik.utils.checks")

vim.g.mapleader = " "

local keymap = vim.keymap

-- general keymaps
keymap.set({ "v", "n" }, "Y", "y$")
keymap.set("i", "ii", "<ESC>")

keymap.set("v", "<Leader>y", '"*y')
keymap.set({ "n", "v" }, "<Leader>p", '"*p')

keymap.set("n", "<Leader>+", "<C-a>")
keymap.set("n", "<Leader>-", "<C-x>")

keymap.set("n", "<Leader>nh", ":nohl<CR>")

keymap.set("n", "<Up>", "<Nop>")
keymap.set("n", "<Left>", "<Nop>")
keymap.set("n", "<Down>", "<Nop>")
keymap.set("n", "<Right>", "<Nop>")

--   Saving and exiting
keymap.set("n", "qx", ":bp|bd #<CR>")
keymap.set("n", "qs", ":x<CR>")
keymap.set("n", "qq", ":w<CR>")
keymap.set("n", "qa", ":wa<CR>")

--   Split views
keymap.set("n", "<Leader>sv", "<C-w>v")
keymap.set("n", "<Leader>sh", "<C-w>s")
keymap.set("n", "<Leader>se", "<C-w>=")

--   Tab controlling
keymap.set("n", "<Leader>to", ":tabnew<CR>")
keymap.set("n", "<Leader>tx", ":tabclose<CR>")
keymap.set("n", "<Leader>tn", ":tabn<CR>")
keymap.set("n", "<Leader>tp", ":tabp<CR>")

-- Plugin keymaps
--   vim-maximizer
keymap.set("n", "<Leader>sm", ":MaximizerToggle<CR>")

--   nvim-tree
keymap.set("n", "<Leader>q", ":NvimTreeToggle<CR>")

--   telescope
keymap.set("n", "<C-e>", "<cmd>Telescope buffers<CR>")
keymap.set("n", "<C-l>", "<cmd>Telescope live_grep<CR>")
keymap.set("n", "<C-e>", "<cmd>Telescope buffers<CR>")
keymap.set("n", "<C-c>", "<cmd>Telescope git_commits<CR>")
if checks.is_git_available() then
	keymap.set("n", "<Leader>i", "<cmd>Telescope git_files<CR>")
else
	keymap.set("n", "<Leader>i", "<cmd>Telescope find_files<CR>")
end

--   fugitive
keymap.set("n", "<C-x>", ":Git<CR>")
keymap.set("n", "<Leader>gc", ":Git checkout ")
keymap.set("n", "<Leader>gf", ":Git checkout feature/")
keymap.set("n", "<Leader>gx", ":Git checkout fix/")
keymap.set("n", "<Leader>gn", ":Git checkout -b ")
keymap.set("n", "<Leader>gb", ":Git rebase ")
keymap.set("n", "<Leader>gu", ":Git rebase upstream/develop<CR>")
keymap.set("n", "<Leader>gsp", ":Git push<CR>")
keymap.set("n", "<Leader>gsf", ":Git push -f<CR>")

keymap.set("n", "<Leader>gdo", ":GitGutterDiffOrig<CR>")

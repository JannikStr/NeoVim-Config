local opt = vim.opt

-- line numbers
opt.relativenumber = true
opt.number = true

-- tabs & itendation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

opt.colorcolumn = "120"

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = false

-- cursor line
opt.cursorline = true
opt.scrolloff = 8

-- appearence
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- split windows
opt.splitright = true
opt.splitbelow = true

-- disable mouse interaction
opt.mouse = nil

opt.iskeyword:append("-")

vim.g.disable_formatting = true
vim.g.python3_host_prog = os.getenv("HOME") .. "/.nvim_venv/bin/python3"

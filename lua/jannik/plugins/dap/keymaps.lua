local keymap = vim.keymap

-- Normal mode
keymap.set("n", "<Leader>dR", "<cmd> lua require('dap').run_to_cursor()<CR>")
keymap.set("n", "<Leader>dE", "<cmd> lua require('dapui').eval(vim.fn.input('[Expression] > '))<CR>")
keymap.set("n", "<Leader>dC", "<cmd> lua require('dap').set_breakpoint(vim.fn.input('[Condition] > '))<CR>")
keymap.set("n", "<Leader>dU", "<cmd> lua require('dapui').toggle()<CR>")
keymap.set("n", "<Leader>db", "<cmd> lua require('dap').step_back()<CR>")
keymap.set("n", "<Leader>dc", "<cmd> lua require('dap').continue()<CR>")
keymap.set("n", "<Leader>dd", "<cmd> lua require('dap').disconnect()<CR>")
keymap.set("n", "<Leader>de", "<cmd> lua require('dapui').eval()<CR>")
keymap.set("n", "<Leader>dg", "<cmd> lua require('dap').session()<CR>")
keymap.set("n", "<Leader>dh", "<cmd> lua require('dap.ui.widgets').hover()<CR>")
keymap.set("n", "<Leader>dS", "<cmd> lua require('dap.ui.widgets').scopes()<CR>")
keymap.set("n", "<Leader>di", "<cmd> lua require('dap').step_into()<CR>")
keymap.set("n", "<Leader>do", "<cmd> lua require('dap').step_over()<CR>")
keymap.set("n", "<Leader>dp", "<cmd> lua require('dap').pause.toggle()<CR>")
keymap.set("n", "<Leader>dq", "<cmd> lua require('dap').close()<CR>")
keymap.set("n", "<Leader>dr", "<cmd> lua require('dap').repl.toggle()<CR>")
keymap.set("n", "<Leader>ds", "<cmd> lua require('dap').continue()<CR>")
keymap.set("n", "<Leader>dt", "<cmd> lua require('dap').toggle_breakpoint()<CR>")
keymap.set("n", "<Leader>dx", "<cmd> lua require('dap').terminate()<CR>")
keymap.set("n", "<Leader>du", "<cmd> lua require('dap').step_out()<CR>")

-- Virtual mode

keymap.set("v", "<Leader>e", "<cmd> lua require('dapui').eval()<CR>")

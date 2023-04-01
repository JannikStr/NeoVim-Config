local M = {}

function M.setup()
    local dap = require("dap")
    dap.adapters.php = {
        type = "executable",
        command = "node",
        args = { "/Users/streitberg/.local/install/vscode-php-debug/out" }
    }
    dap.configurations.php = {
        {
            type = "php",
            request = "launch",
            name = "Listen for Xdebug",
            port = 9000
        }
    }
end

return M

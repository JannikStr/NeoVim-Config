local checks = {}

checks.is_git_available = function()
    vim.fn.system("git rev-parse --is-inside-work-tree")
    return vim.v.shell_error == 0
end

return checks

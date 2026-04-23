local status, _ = pcall(vim.cmd, "colorscheme token")
if not status then
    print("Colorscheme not found!")
end


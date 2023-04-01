local phpactor_status, phpactor = pcall(require, "phpactor")
if not phpactor_status then
    return
end

phpactor.setup({
    install = {
        bin = os.getenv("HOME") .. "/.local/bin/phpactor",
        php_bin = "php",
        composer_bin = os.getenv("HOME") .. "/.local/bin/composer"
    },
    lspconfig = {
        enabled = true,
        options = {},
    }
})

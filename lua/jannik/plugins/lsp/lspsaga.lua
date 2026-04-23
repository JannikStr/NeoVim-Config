local saga_status, saga = pcall(require, "lspsaga")
if not saga_status then
    return
end

saga.setup({
    move_in_saga = { prev = "<C-k>", next = "<C-j>" },
    finder_action_keys = {
        open = "<CR>",
    },
    definition_action_keys = {
        edit = "<CR>",
    },
    code_action_prompt = {
        enable = true,
    },
    lightbulb = {
        enable = false,
    },
    symbol_in_winbar = {
        enable = true,
        hide_keyword = true,
    },
})

vim.diagnostic.config({
    virtual_text = true,
})

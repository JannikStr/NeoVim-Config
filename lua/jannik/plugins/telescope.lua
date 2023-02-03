local telescope_setup, telescope = pcall(require, "telescope")

if not telescope_setup then
    return
end

local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then
    return
end

local previewer_setup, previewers = pcall(require, "telescope.previewers")
if not previewer_setup then
    return
end

local _bad_files = { '.*%.csv' }

local bad_files = function (filepath)
    for _, v in ipairs(_bad_files) do
        if filepath:match(v) then
            return false
        end
    end
    return true
end

local new_maker = function (filepath, bufnr, opts)
    opts = opts or {}
    if opts.use_ft_detect == nil then opts.use_ft_detect = true end
    opts.use_ft_detect = opts.use_ft_detect == false and false or bad_files(filepath)
    filepath = vim.fn.expand(filepath)
    vim.loop.fs_stat(filepath, function (_, stat)
        if not stat then return end
        if stat.size > 100000 then
            return
        else
            previewers.buffer_previewer_maker(filepath, bufnr, opts)
        end
    end)
end

telescope.setup({
    defaults = {
        buffer_previewer_maker = new_maker,
        mappings = {
            i = {
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-j>"] = actions.move_selection_next,
                ["C-q"] = actions.send_selected_to_qflist + actions.open_qflist,
            }
        }
    }
})

telescope.load_extension("fzf")

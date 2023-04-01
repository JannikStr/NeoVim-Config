local telescope_setup, telescope = pcall(require, "telescope")

if not telescope_setup then
    return
end

local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then
    return
end

local action_state_setup, action_state = pcall(require, "telescope.actions.state")
if not action_state_setup then
    return
end

local previewer_setup, previewers = pcall(require, "telescope.previewers")
if not previewer_setup then
    return
end

local simulators_setup, simulators = pcall(require, "simulators")
if not simulators_setup then
    return
end

local todo_comments_setup, todo_comments = pcall(require, "todo-comments")
if not todo_comments_setup then
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
        },
        pickers = {
            git_commits = {
                mappings = {
                    i = {
                        ["<C-s>"] = function ()
                            local selected_entry = action_state.get_selected_entry()

                            vim.api.nvim_win_close(0, true)
                            vim.cmd("stopinsert")
                            vim.schedule_wrap(function ()
                                vim.cmd(("DiffviewOpen %s^!"):format(selected_entry.value))
                            end)
                        end,
                    }
                }
            }
        }
    }
})

simulators.setup({
    android_emulator = false,
    apple_simulator = true,
})

todo_comments.setup({})

telescope.load_extension("fzf")
telescope.load_extension("simulators")

vim.g.gutentags_ctags_tagfile = '.tags'
vim.g.gutentags_generate_on_empty_buffer = 1
vim.g.gutentags_ctags_exclude = {
    '*.egg-info',
    '.mypy-cache',
    '.pytest_cache',
    '.tox',
    '_minted-*',
    '__pycache__',
    'build',
    'dist',
    'env',
    'test_env',
    'venv'
}

vim.g.gutentags_ctags_exra_args = { '--fields=+l' }
vim.g.gutentags_file_list_command = 'fd --type file'

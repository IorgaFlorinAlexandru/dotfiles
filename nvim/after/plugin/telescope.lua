local telescope = require('telescope')

telescope.setup{
    defaults = {
        file_ignore_patterns = {"node_modules","dist","__pycache__","assets"}
    }
}

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {} )

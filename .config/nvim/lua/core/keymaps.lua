local keymap = vim.api.nvim_set_keymap


vim.g.mapleader= " "

keymap('n', '<leader>F', ':Telescope find_files find_command=rg,--ignore,--hidden,--files<CR>', {})
keymap('n', '<leader>f', ':Telescope git_files<CR>', {})
keymap('n', '<leader>g', ':Telescope live_grep<CR>', {})
vim.keymap.set('n', '<Tab>', ':bnext!<CR>', { remap = false })
vim.keymap.set('n', '<ESC>', ':noh<return><ESC>', { remap = false })
vim.keymap.set('n', '<S-Tab>', ':bprev!<CR>', { remap = false })

-- neotree
keymap('n', '<leader>e', ':Neotree toggle<CR>', {})
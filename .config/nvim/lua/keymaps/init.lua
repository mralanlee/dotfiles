local keymap = vim.api.nvim_set_keymap
vim.g.mapleader= " "

keymap('n', 'F', ':Telescope find_files find_command=rg,--ignore,--hidden,--files<CR>', {})
keymap('n', 'f', ':Telescope git_files<CR>', {})
keymap('n', 'b', ':Buffers<CR>', {})
keymap('n', 'g', ':Telescope live_grep<CR>', {})
vim.keymap.set('n', '<Tab>', ':bnext!<CR>', { remap = false })
vim.keymap.set('n', '<S-Tab>', ':bprev!<CR>', { remap = false })

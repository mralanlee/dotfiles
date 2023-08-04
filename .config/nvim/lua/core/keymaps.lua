local keymap = vim.api.nvim_set_keymap

vim.g.mapleader= " "
vim.g.maplocalleader = " "

keymap('n', '<leader>F', ':Telescope find_files find_command=rg,--ignore,--hidden,--files<CR>', {})
keymap('n', '<leader>ff', ':Telescope git_files<CR>', {})
keymap('n', '<leader>fw', ':Telescope live_grep<CR>', {})
vim.keymap.set("n", "<leader>gg", '<cmd>lua _LAZYGIT_TOGGLE()<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Tab>', ':bnext!<CR>', { remap = false })
vim.keymap.set('n', '<ESC>', ':noh<return><ESC>', { remap = false })
vim.keymap.set('n', '<S-Tab>', ':bprev!<CR>', { remap = false })

-- neotree
keymap('n', '<leader>e', ':Neotree toggle<CR>', {})
keymap('n', '<leader>E', '<cmd>lua _OPEN_CWD()<CR>', { noremap = true, silent = true })

-- nvim-tree
-- keymap('n', '<leader>e', '<cmd>NvimTreeToggle<CR>', {})

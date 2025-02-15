local opt = vim.opt
local o = vim.o

opt.pumheight = 10
opt.syntax = 'enable'
opt.hidden = true
opt.backup = false
opt.modeline = false
opt.writebackup = false
opt.errorbells = false
opt.joinspaces = false
opt.swapfile = false
opt.foldenable = false
opt.termguicolors = true
opt.mouse = 'r'
opt.wrap = false
opt.secure = true
opt.autoread = true
opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.wildmenu = true
opt.showcmd = true
opt.showmatch = true
opt.showmode = true opt.ruler = true
opt.relativenumber = true
opt.number = true
opt.cursorline = true
opt.cursorline=number
opt.scrolloff = 1
opt.sidescrolloff = 5
opt.formatoptions =o
opt.linespace = 0
opt.display = 'lastline'
opt.updatetime = 250
opt.timeoutlen = 500
opt.shiftwidth = 2
opt.expandtab = true
opt.tabstop = 2
opt.wildignore = {
  '*/tmp/*',
  '*.so',
  '*.swp',
  '*.zip',
  '*/node_modules/*',
  '*/dist/*',
}

opt.conceallevel = 0
opt.undolevels = 100
opt.updatetime = 300

-- Maintain undo history between sessions
opt.undofile = true
opt.undodir = vim.fn.stdpath('config') .. '/undodir'
o.background = 'dark'
o.clipboard = 'unnamedplus'
o.backspace = 'indent,eol,start'
o.encoding = 'utf-8'
-- o.colorcolumn = 1
o.splitbelow = true
o.splitright = true

-- global
-- netrw
vim.g.netrw_liststyle = 3
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 15
vim.g.loaded_netrw = true
vim.g.loaded_netrwPlugin = true

vim.g.indentLine_char = "•"
vim.g.indentLine_color_term = 239
vim.g.indentLine_enabled = 1

-- vista
vim.g.vista_sidebar_width = 50

-- go
vim.g.go_bin_path = "$HOME/go/bin"
vim.g.go_diagnostics_enabled = 1
vim.g.go_metalinter_enabled = {}
vim.g.go_jump_to_error = 0
vim.g.go_auto_sameids = 0
vim.g.go_fmt_command = "goimports"
vim.g.go_term_mode = "split"
vim.g.go_list_height = 0
vim.g.go_term_mode = "split"
vim.g.go_term_height = 10
vim.g.go_term_width = 10
vim.g.delve_new_command = "enew"
vim.g.go_autodetect_gopath = 1
vim.g.go_def_mode = 'gopls'
vim.g.go_info_mode = 'gopls'

-- rust
vim.g.rustfmt_autosave = 1

-- Terraform
vim.g.terraform_align = 1
vim.g.hcl_align = 1
-- vim.g.terraform_fmt_on_save = 1

vim.api.nvim_create_autocmd("VimResized", {
  pattern = '*',
  callback = function()
    vim.cmd("wincmd =")
  end
})

vim.api.nvim_create_autocmd({"BufWritePre"}, {
  pattern = {"*.tf", "*.tfvars", "*.hcl"},
  callback = function()
    vim.lsp.buf.format()
  end,
})

-- treesitter
vim.api.nvim_command('set foldmethod=expr')
vim.api.nvim_command('set foldexpr=nvim_treesitter#foldexpr()')

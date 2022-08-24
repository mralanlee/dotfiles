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
opt.showmode = true
opt.ruler = true
opt.number = true
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
opt.undodir = 'undodir'
o.background = 'dark'
o.clipboard = 'unnamedplus'
o.backspace = 'indent,eol,start'
o.encoding = 'utf-8'
o.colorcolumn = 1
o.splitbelow = true
o.splitright = true

vim.cmd('colorscheme nordic')

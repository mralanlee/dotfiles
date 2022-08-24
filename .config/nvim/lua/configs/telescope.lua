local telescope = require('telescope')
local config = require('telescope.config')


telescope.setup{
  pickers = {
    find_files = {
      theme = "dropdown",
      find_command = { "rg", "--files", "--hidden", "--glob", "!.git/*" },
    }
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "ignore_case",
    }
  },
}

telescope.load_extension('fzf')
